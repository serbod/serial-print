unit NumPlanMasterFrame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Buttons, NxColumnClasses, NxColumns, NxScrollControl,
  NxCustomGridControl, NxCustomGrid, NxGrid, ItemsDef, ComCtrls, Core,
  NxEdit;

type
  TfrmNumPlanMaster = class(TFrame)
    grp1: TGroupBox;
    lbl1: TLabel;
    lbl2: TLabel;
    edTicketsCount: TEdit;
    edPagesCount: TEdit;
    grp2: TGroupBox;
    lbl3: TLabel;
    cbbOddPages: TComboBox;
    lbl4: TLabel;
    cbbEvenPages: TComboBox;
    grp3: TGroupBox;
    ngLabels: TNextGrid;
    nxTextCol1: TNxTextColumn;
    nxTextCol2: TNxTextColumn;
    nxCBox1: TNxComboBoxColumn;
    nxCBox2: TNxComboBoxColumn;
    btnOK: TBitBtn;
    pbProgress: TProgressBar;
    grpRows: TGroupBox;
    ngRows: TNextGrid;
    nncRowNumber: TNxNumberColumn;
    nncRowPlaces: TNxNumberColumn;
    nseRowCount: TNxSpinEdit;
    lbRowCount: TLabel;
    nsePlacesInRow: TNxSpinEdit;
    lbPlacesInRow: TLabel;
    cbbRow: TComboBox;
    cbbPlace: TComboBox;
    lbRow: TLabel;
    lbPlace: TLabel;
    btnCreateRowList: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOKClick(Sender: TObject);
    procedure edTicketsCountChange(Sender: TObject);
    procedure btnCreateRowListClick(Sender: TObject);
    procedure ngRowsAfterEdit(Sender: TObject; ACol, ARow: Integer;
      Value: WideString);
  private
    { Private declarations }
    function GetNewPage(var iPagesCount: Integer; PageTpl: TNumPageTpl): TNumPage;
    function GetActionStr(LabelName: string; First: Boolean = false): string;
    procedure UpdatePlacesCount();
  public
    { Public declarations }
    NumProject: TNumProject;
    Form: TForm;
    function Start(): boolean;
    procedure DoError(msg: string);
    destructor Destroy; override;
    procedure CngLanguageNPM();
  end;

var
  sAskRewriteRowList: string = 'Перезаписать таблицу рядов?';
  sGrpRowsCaption: string = 'Список рядов';
  sWrongTicketCount: string = 'Неправильно задано количество билетов!';
  sEmptyBaseValueForNumerator: string = 'Не задано начальное значение для нумератора';
  PlanMastCreated: Boolean = False;

const
  ciRowListRowId = 0;
  ciRowListPlacesId = 1;

implementation
uses MainForm, IniFiles;
{$R *.dfm}

destructor TfrmNumPlanMaster.Destroy;
var
  i: Integer;
begin
  PlanMastCreated:= False;
  //NumProject.Options.Params['row_count']:=IntToStr(nseRowCount.AsInteger);
  NumProject.Options.Params['row_count']:=IntToStr(ngRows.RowCount);
  NumProject.Options.Params['places_in_row']:=nsePlacesInRow.AsString;
  for i:=0 to ngRows.RowCount-1 do
  begin
    NumProject.Options.Params['row_'+IntToStr(i+1)]:=ngRows.Cell[ciRowListPlacesId, i].AsString;
  end;
  NumProject.Options.SaveToBase();

  inherited Destroy();
end;

function TfrmNumPlanMaster.Start(): Boolean;
var
  i, n: Integer;
  nlt: TNumLabelTpl;
begin
  Result:=false;
  if not Assigned(NumProject) then
  begin
    DoError('Не выбран проект!');
    if Assigned(Form) then Form.Close();
    Exit;
  end;

  if NumProject.PagesTpl.Count=0 then
  begin
    DoError('Не заполнены шаблоны листов!');
    if Assigned(Form) then Form.Close();
    Exit;
  end;

  if NumProject.NumLabelsTpl.Count=0 then
  begin
    DoError('Не заполнены шаблоны нумераторов!');
    if Assigned(Form) then Form.Close();
    Exit;
  end;

  edTicketsCount.Text:=IntToStr(NumProject.NumPlanItems.Count);
  edPagesCount.Text:='';

  // PagesTpl lists
  cbbOddPages.Clear();
  for i:=0 to NumProject.PagesTpl.Count-1 do
  begin
    cbbOddPages.AddItem(NumProject.PagesTpl[i].Name, NumProject.PagesTpl[i]);
  end;
  cbbOddPages.ItemIndex:=0;

  cbbEvenPages.Clear();
  for i:=0 to NumProject.PagesTpl.Count-1 do
  begin
    cbbEvenPages.AddItem(NumProject.PagesTpl[i].Name, NumProject.PagesTpl[i]);
  end;
  cbbEvenPages.ItemIndex:=0;

  // Numerators
  ngLabels.BeginUpdate();

  nxCBox1.Items.Clear();
  nxCBox1.Items.Add('+1');
  nxCBox1.Items.Add('-1');
  nxCBox1.Items.Add('=');

  nxCBox2.Items.Clear();
  nxCBox2.Items.Add('+1');
  nxCBox2.Items.Add('-1');
  nxCBox2.Items.Add('=');

  for i:=0 to NumProject.NumLabelsTpl.Count-1 do
  begin
    nlt:=NumProject.NumLabelsTpl[i];
    ngLabels.AddRow();
    ngLabels.Cell[0, i].ObjectReference:=nlt;
    ngLabels.Cells[0, i]:=nlt.Name;
    ngLabels.Cells[1, i]:=nlt.BaseValue;
    ngLabels.Cells[2, i]:='=';
    ngLabels.Cells[3, i]:=nlt.Action;
  end;
  ngLabels.EndUpdate();
  Result:=true;

  // Row and Place numerators
  cbbRow.Clear();
  cbbPlace.Clear();
  for i:=0 to NumProject.NumLabelsTpl.Count-1 do
  begin
    nlt:=NumProject.NumLabelsTpl[i];
    cbbRow.AddItem(nlt.Name, nlt);
    cbbPlace.AddItem(nlt.Name, nlt);
  end;
  // Default Row numerator
  i:=cbbRow.Items.IndexOf(csRow);
  if i <> -1 then cbbRow.ItemIndex := i;
  // Default Place numerator
  i:=cbbPlace.Items.IndexOf(csPlace);
  if i <> -1 then cbbPlace.ItemIndex := i;

  // Row count
  nseRowCount.AsInteger:=StrToIntDef(NumProject.Options.Params['row_count'], 0);
  nsePlacesInRow.AsInteger:=StrToIntDef(NumProject.Options.Params['places_in_row'], 0);

  // === Row list
  ngRows.RowCount:=nseRowCount.AsInteger;
  for i:=0 to ngRows.RowCount-1 do
  begin
    ngRows.Cell[ciRowListRowId, i].AsInteger:=i+1;
    ngRows.Cell[ciRowListPlacesId, i].AsInteger:=StrToIntDef(NumProject.Options.Params['row_'+IntToStr(i+1)] , nsePlacesInRow.AsInteger);
  end;

  //
  PlanMastCreated:= True;
  CngLanguageNPM();
end;

procedure TfrmNumPlanMaster.CngLanguageNPM();
var
  Part:string;
begin
  if not Assigned(LangFile) then Exit;
  if PlanMastCreated then
  begin
    Part:= 'NumPlanMaster';
    Self.btnOK.Caption:= LangFile.ReadString(Part, 'sbtnOk', Self.btnOK.Caption);
    Self.grp1.Caption:= LangFile.ReadString(Part, 'sgrp1', Self.grp1.Caption);
    Self.lbl1.Caption:= LangFile.ReadString(Part, 'slbl1', Self.lbl1.Caption);
    Self.lbl2.Caption:= LangFile.ReadString(Part,'slbl2', Self.lbl2.Caption);
    Self.grp2.Caption:= LangFile.ReadString(Part, 'sgrp2', Self.grp2.Caption);
    Self.lbl3.Caption:= LangFile.ReadString(Part, 'slbl3', Self.lbl3.Caption);
    Self.lbl4.Caption:= LangFile.ReadString(Part, 'slbl4', Self.lbl4.Caption);
    Self.grp3.Caption:= LangFile.ReadString(Part, 'sgrp3', Self.grp3.Caption);
    Self.nxCBox1.Header.Caption:= LangFile.ReadString(Part, 'snxCBox1', Self.nxCBox1.Header.Caption);
    Self.nxCBox2.Header.Caption:= LangFile.ReadString(Part, 'snxCBox2', Self.nxCBox2.Header.Caption);
    Self.nxTextCol1.Header.Caption:= LangFile.ReadString(Part, 'snxTextCol1', Self.nxTextCol1.Header.Caption);
    Self.nxTextCol2.Header.Caption:= LangFile.ReadString(Part, 'snxTextCol2', Self.nxTextCol2.Header.Caption);
  end;
end;  

procedure TfrmNumPlanMaster.DoError(msg: string);
begin
  ShowMessage(msg);
  Exit;
end;

procedure TfrmNumPlanMaster.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Assigned(Form) then Form.Release();
end;

function TfrmNumPlanMaster.GetNewPage(var iPagesCount: Integer; PageTpl: TNumPageTpl): TNumPage;
begin
  Inc(iPagesCount);
  Result:=TNumPage.Create(NumProject);
  Result.Order:=iPagesCount;
  Result.NumPageTpl:=PageTpl;
  Result.Write();
  NumProject.Pages.Add(Result);
end;

function TfrmNumPlanMaster.GetActionStr(LabelName: string; First: Boolean = false): string;
var
  i: Integer;
begin
  for i:=0 to ngLabels.RowCount-1 do
  begin
    if LabelName = ngLabels.Cells[0, i] then
    begin
      if First then Result:=ngLabels.Cells[2, i] else Result:=ngLabels.Cells[3, i];
      Exit;
    end;
  end;
  Result:='';
end;

procedure TfrmNumPlanMaster.btnOKClick(Sender: TObject);
var
  i, m, n, n1, n2: integer;
  iTicketsCount, iPagesCount: integer;
  iCurRow, iCurPlace, iCurMaxPlace: integer;
  npi: TNumPlanItem;
  nld, LastNld: TNumLabelData;
  nlt: TNumLabelTpl;
  nldl: TNumLabelDataList;
  CurTicket: TTicket;
  CurNumPage: TNumPage;
  PageTpl1, PageTpl2: TNumPageTpl;
  Page1TicketCount, Page2TicketCount: Integer;
  slLastValues: TStringList;
  slLastActions: TStringList;
  sName, sValue, sAction: string;
  Duplicated: Boolean;
begin
  iTicketsCount:=StrToIntDef(edTicketsCount.Text, 0);
  // Check tickets count
  if iTicketsCount <= 0 then
  begin
    DoError(sWrongTicketCount);
    Exit;
  end;

  // Check numerators
  for i:=0 to NumProject.NumLabelsTpl.Count-1 do
  begin
    if Length(Trim(ngLabels.Cells[1, i]))=0 then
    begin
      DoError(sEmptyBaseValueForNumerator+' '+ngLabels.Cells[0, i]);
      Exit;
    end;
  end;

  StartTransaction();

  // Delete NumPlanItems
  NumProject.NumPlanItems.DeleteFromBase(true);
  NumProject.Pages.DeleteFromBase();
  // Delete NumLabelData for whole project
  nldl:=TNumLabelDataList.Create(true);
  nldl.NumProject:=CurProject;
  nldl.DeleteFromBase();
  nldl.Free();

  // Create NumPlanItems
  PageTpl1:=TNumPageTpl(cbbOddPages.Items.Objects[cbbOddPages.ItemIndex]);
  PageTpl2:=TNumPageTpl(cbbEvenPages.Items.Objects[cbbEvenPages.ItemIndex]);
  PageTpl1.Read(true);
  if PageTpl2<>PageTpl1 then PageTpl2.Read(true);
  Page1TicketCount:=PageTpl1.Tickets.Count;
  Page2TicketCount:=PageTpl2.Tickets.Count;

  pbProgress.Min:=1;
  pbProgress.Max:=iTicketsCount;
  pbProgress.Visible:=True;

  iPagesCount:=0;
  slLastValues:=TStringList.Create();
  slLastActions:=TStringList.Create();
  for i:=0 to NumProject.NumLabelsTpl.Count-1 do
  begin
    sName:=NumProject.NumLabelsTpl[i].Name;
    slLastValues.Values[sName]:='';
    slLastActions.Values[sName]:='=';
  end;

  iCurRow:=1; iCurPlace:=1; iCurMaxPlace:=0;
  if ngRows.RowCount>0 then iCurMaxPlace:=ngRows.Cell[ciRowListPlacesId, 0].AsInteger;

  n1:=Page1TicketCount; n2:=0;
  CurTicket:=nil;
  CurNumPage:=nil;
  for n:=1 to iTicketsCount do
  begin
    pbProgress.Position:=n;
    if (n mod 10)=0 then Application.ProcessMessages();
    if n1 = Page1TicketCount then CurNumPage:=GetNewPage(iPagesCount, PageTpl1);
    if n2 = Page2TicketCount then CurNumPage:=GetNewPage(iPagesCount, PageTpl2);

    if n1>0 then
    begin
      CurTicket:=PageTpl1.Tickets[Page1TicketCount-n1];
      Dec(n1);
      if n1=0 then
      begin
        n2:=Page2TicketCount;
      end;
    end
    else if n2>0 then
    begin
      CurTicket:=PageTpl2.Tickets[Page2TicketCount-n2];
      Dec(n2);
      if n2=0 then
      begin
        n1:=Page1TicketCount;
      end;
    end;
    npi:=TNumPlanItem.Create(NumProject);
    npi.Order:=n;
    npi.State:='';
    npi.Ticket:=CurTicket;
    npi.NumPage:=CurNumPage;
    NumProject.NumPlanItems.Add(npi);

    if not Assigned(CurTicket.Tpl) then
    begin
      Core.AddCmd('WARNING '+sTicketTplErr+' '+CurTicket.Name);
      Continue;
    end;

    // Calculate current values/actions
    for i:=0 to NumProject.NumLabelsTpl.Count-1 do
    begin
      sName:=NumProject.NumLabelsTpl[i].Name;
      sValue:=slLastValues.Values[sName];
      sAction:=slLastActions.Values[sName];

      if sName = cbbRow.Text then
      begin
        sValue:=IntToStr(iCurRow);
        sAction:='=';
        if iCurPlace=1 then
        begin
          sAction:='+';
          if iCurRow=1 then sAction:='=1';
        end;
      end

      else if sName = cbbPlace.Text then
      begin
        sValue:=IntToStr(iCurPlace);
        sAction:='+';
        if iCurPlace=1 then
        begin
          sAction:='=1';
        end;

        // next place/row
        if iCurPlace = iCurMaxPlace then
        begin
          Inc(iCurRow);
          iCurPlace:=1;
          iCurMaxPlace:=0;
          if iCurRow <= ngRows.RowCount then iCurMaxPlace:=ngRows.Cell[ciRowListPlacesId, iCurRow-1].AsInteger;
        end
        else Inc(iCurPlace);
      end

      else
      begin
        if n=1 then
        begin
          sAction:=GetActionStr(sName, true);
          sValue:=NumProject.NumLabelsTpl[i].BaseValue;
        end
        else
        begin
          sAction:=GetActionStr(sName, false);
          sValue:=ApplyAction(sValue, sAction);
        end;
      end;

      slLastValues.Values[sName]:=sValue;
      slLastActions.Values[sName]:=sAction;
    end;

    for i:=0 to CurTicket.Tpl.NumLabels.Count-1 do
    begin
      nlt:=CurTicket.Tpl.NumLabels[i].NumLabelTpl;
      if not Assigned(nlt) then
      begin
        Core.AddCmd('WARNING '+sNumLabelTplErr);
        Continue;
      end;
      // Check for duplicates
      Duplicated:=False;
      for m:=0 to npi.NumLabelDataList.Count-1 do
      begin
        if npi.NumLabelDataList[m].NumLabelTpl = nlt then
        begin
          Duplicated:=True;
          Break;
        end;
      end;
      if Duplicated then Continue;

      nld:=TNumLabelData.Create(NumProject);
      nld.NumPlanItem:=npi;
      nld.NumLabelTpl:=nlt;

      sName:=nlt.Name;
      nld.Action:=slLastActions.Values[sName];
      nld.Value:=slLastValues.Values[sName];

      npi.NumLabelDataList.Add(nld);
      //nld.Write();
    end;
    npi.Write(true);
  end;
  slLastActions.Free();
  slLastValues.Free();

  CloseTransaction();
  //NumProject.NumPlanItems.SaveToBase();
  pbProgress.Visible:=False;

  Core.CmdQueue.AddCmd('REFRESH NUM_PLAN');
  Core.CmdQueue.AddCmd('REFRESH TICKETS_LIST');
end;

procedure TfrmNumPlanMaster.edTicketsCountChange(Sender: TObject);
var
  i, n, n1, n2: integer;
  iTicketsCount, iPagesCount: integer;
  PageTpl1, PageTpl2: TNumPageTpl;
  Page1TicketCount, Page2TicketCount: Integer;
  bOdd: Boolean;
begin
  iTicketsCount:=StrToIntDef(edTicketsCount.Text, 0);
  if iTicketsCount=0 then Exit;
  if cbbOddPages.Items.Count=0 then Exit;
  if cbbEvenPages.Items.Count=0 then Exit;
  // Create NumPlanItems
  PageTpl1:=TNumPageTpl(cbbOddPages.Items.Objects[cbbOddPages.ItemIndex]);
  PageTpl2:=TNumPageTpl(cbbEvenPages.Items.Objects[cbbEvenPages.ItemIndex]);
  Page1TicketCount:=PageTpl1.Tickets.Count;
  Page2TicketCount:=PageTpl2.Tickets.Count;
  if (Page1TicketCount+Page2TicketCount)=0 then Exit;

  i:=0; bOdd:=True;
  iPagesCount:=0;
  while i < iTicketsCount do
  begin
    if bOdd then Inc(i, Page1TicketCount) else Inc(i, Page2TicketCount);
    Inc(iPagesCount);
    bOdd:=not bOdd;
  end;
  edPagesCount.Text:=IntToStr(iPagesCount);
end;

procedure TfrmNumPlanMaster.btnCreateRowListClick(Sender: TObject);
var
  i: integer;
begin
  if ngRows.RowCount > 0 then
  begin
    // Are you sure?
    if Application.MessageBox(PAnsiChar(sAskRewriteRowList), PAnsiChar(sAskDeleteCaption), MB_OKCANCEL) <> IDOK then Exit;
  end;
  ngRows.RowCount:=nseRowCount.AsInteger;
  for i:=0 to nseRowCount.AsInteger-1 do
  begin
    ngRows.Cell[ciRowListRowId, i].AsInteger := i+1;
    ngRows.Cell[ciRowListPlacesId, i].AsInteger := nsePlacesInRow.AsInteger;
  end;
  UpdatePlacesCount();
end;

procedure TfrmNumPlanMaster.UpdatePlacesCount();
var
  i, n: Integer;
begin
  n:=0;
  for i:=0 to ngRows.RowCount-1 do
  begin
    n:=n+ngRows.Cell[ciRowListPlacesId, i].AsInteger;
  end;
  grpRows.Caption:=sGrpRowsCaption+' ('+IntToStr(n)+')';
end;

procedure TfrmNumPlanMaster.ngRowsAfterEdit(Sender: TObject; ACol,
  ARow: Integer; Value: WideString);
begin
  UpdatePlacesCount();
end;



end.
