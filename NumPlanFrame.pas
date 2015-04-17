unit NumPlanFrame;
{#DEFINE DEBUG}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, NxColumns, NxColumnClasses, NxScrollControl,
  NxCustomGridControl, NxCustomGrid, NxGrid, StdCtrls, ItemsDef, ComCtrls,
  ToolWin, ActnList, Core;

type
  TfrmNumPlan = class(TFrame)
    grpNumPlan: TGroupBox;
    ngNumPlan: TNextGrid;
    nxIncColNumber: TNxIncrementColumn;
    tlbNumPlan: TToolBar;
    btnActions: TToolButton;
    btnValues: TToolButton;
    actlstNumPlan: TActionList;
    actClose: TAction;
    btnClose: TToolButton;
    actActions: TAction;
    actValues: TAction;
    btn1: TToolButton;
    actHelp: TAction;
    btnHelp: TToolButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ngNumPlanAfterEdit(Sender: TObject; ACol, ARow: Integer;
      Value: WideString);
    procedure actlstNumPlanExecute(Action: TBasicAction;
      var Handled: Boolean);
    procedure DummyAction(Sender: TObject);
  private
    { Private declarations }
    slTicketTpl: TStringList;
    slPageTpl: TStringList;
    procedure CreateGrid();
    procedure UpdateGrid();
    procedure SaveGrid();
  public
    { Public declarations }
    NumProject: TNumProject;
    Form: TForm;
    PageID: Integer;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure GridTest();
    procedure Start();
    procedure Refresh();
  end;

const
  iFixedCols = 3;
  iFixedRows = 0;

{#IFDEF DEBUG}
var
  DT: TDateTime;
{#ENDIF}

implementation
uses DateUtils, MainForm;

{$R *.dfm}

constructor TfrmNumPlan.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  slTicketTpl:=TStringList.Create();
  slPageTpl:=TStringList.Create();
end;

destructor TfrmNumPlan.Destroy();
begin
  FreeAndNil(slPageTpl);
  FreeAndNil(slTicketTpl);
  inherited Destroy();
end;

procedure TfrmNumPlan.GridTest();
var
  i, n: Integer;
  s: string;
  nl: TNumLabel;
  nlt: TNumLabelTpl;
begin
  if not NumProject.NumLabelsTpl.LoadFromBase() then Exit;

  ngNumPlan.BeginUpdate();
  for i:=0 to NumProject.NumLabelsTpl.Count-1 do
  begin
    nlt:=NumProject.NumLabelsTpl[i];
    ngNumPlan.Columns.Add(TNxTextColumn, nlt.Name);
    ngNumPlan.Columns.Item[i+iFixedCols].Options:=ngNumPlan.Columns.Item[i+iFixedCols].Options+[coEditing];
  end;

  ngNumPlan.AddRow(1000);
  for i:=0 to NumProject.NumLabelsTpl.Count-1 do
  begin
    for n:=0 to ngNumPlan.RowCount-1 do
    begin
      s:='+1';
      if i=4 then s:='=';
      ngNumPlan.Cells[i+iFixedCols, n]:=s;
    end;
  end;
  ngNumPlan.EndUpdate();
end;

procedure TfrmNumPlan.CreateGrid();
var
  i, n, m: Integer;
  sv, sa: string;
  nl: TNumLabel;
  nlt: TNumLabelTpl;
  NumPlanItem: TNumPlanItem;
  NumLabelData: TNumLabelData;
begin
  {#IFDEF DEBUG}
  DT:=Now();
  {#ENDIF}
  //if not NumProject.NumLabelsTpl.LoadFromBase() then Exit;
  //if not NumProject.NumPlanItems.LoadFromBase() then Exit;

  // TicketTpl combo box items
  slTicketTpl.Clear();
  for i:=0 to NumProject.TicketTplList.Count-1 do
  begin
    slTicketTpl.AddObject(NumProject.TicketTplList[i].Name, NumProject.TicketTplList[i]);
  end;

  // PageTpl combo box items
  slPageTpl.Clear();
  for i:=0 to NumProject.PagesTpl.Count-1 do
  begin
    slPageTpl.AddObject(NumProject.PagesTpl[i].Name, NumProject.PagesTpl[i]);
  end;
  {#IFDEF DEBUG}
  DebugMsg('Preprocessing '+IntToStr(MilliSecondsBetween(DT, Now))+' ms', 'NumPlanFrm');
  {#ENDIF}

  ngNumPlan.BeginUpdate();
  // Add columns
  // Шаблон билета и шаблон листа
  ngNumPlan.Columns.AddColumns(TNxComboBoxColumn, iFixedCols-1);

  ngNumPlan.Columns.Item[iFixedCols-2].Header.Caption:='Шабл.билета';
  ngNumPlan.Columns.Item[iFixedCols-2].Options:=ngNumPlan.Columns.Item[iFixedCols-2].Options+[coEditing];
  ngNumPlan.Columns.Item[iFixedCols-2].Options:=ngNumPlan.Columns.Item[iFixedCols-2].Options-[coCanSort];
  (ngNumPlan.Columns.Item[iFixedCols-2] as TNxComboBoxColumn).Items:=slTicketTpl;

  ngNumPlan.Columns.Item[iFixedCols-1].Header.Caption:='Шабл.листа';
  ngNumPlan.Columns.Item[iFixedCols-1].Options:=ngNumPlan.Columns.Item[iFixedCols-1].Options+[coEditing];
  ngNumPlan.Columns.Item[iFixedCols-1].Options:=ngNumPlan.Columns.Item[iFixedCols-1].Options-[coCanSort];
  (ngNumPlan.Columns.Item[iFixedCols-1] as TNxComboBoxColumn).Items:=slPageTpl;

  // Нумераторы
  if (ngNumPlan.Columns.Count-iFixedCols) < NumProject.NumLabelsTpl.Count then
  begin
    ngNumPlan.Columns.AddColumns(TNxTextColumn, NumProject.NumLabelsTpl.Count-ngNumPlan.Columns.Count+iFixedCols);
  end;

  for i:=0 to NumProject.NumLabelsTpl.Count-1 do
  begin
    nlt:=NumProject.NumLabelsTpl[i];
    ngNumPlan.Columns.Item[i+iFixedCols].Header.Caption:=nlt.Name;
    ngNumPlan.Columns.Item[i+iFixedCols].Options:=ngNumPlan.Columns.Item[i+iFixedCols].Options+[coEditing];
    ngNumPlan.Columns.Item[i+iFixedCols].Options:=ngNumPlan.Columns.Item[i+iFixedCols].Options-[coCanSort];
  end;

  // Add rows
  if (ngNumPlan.RowCount-iFixedRows) < NumProject.NumPlanItems.Count then
  begin
    ngNumPlan.AddRow(NumProject.NumPlanItems.Count - ngNumPlan.RowCount + iFixedRows);
  end;
  ngNumPlan.EndUpdate();

  {#IFDEF DEBUG}
  DebugMsg('Created '+IntToStr(ngNumPlan.RowCount)+' rows in '+IntToStr(MilliSecondsBetween(DT, Now))+' ms', 'NumPlanFrm');
  {#ENDIF}

  UpdateGrid();
end;

procedure TfrmNumPlan.UpdateGrid();
var
  i, n, m: Integer;
  t1, t2, t3, t4: Integer;
  dt1, dt2, dt3, dt4: TDateTime;
  sv, sa, sPrevAction: string;
  nlt: TNumLabelTpl;
  NumPlanItem: TNumPlanItem;
  NumLabelData: TNumLabelData;
begin
  {#IFDEF DEBUG}
  DT:=Now();
  t1:=0; t2:=0; t3:=0; t4:=0;
  {#ENDIF}
  ngNumPlan.BeginUpdate();
  StartTransaction();

  // Fill NumPlan items
  NumProject.NumPlanItems.SortByOrder();
  for n:=0 to NumProject.NumPlanItems.Count-1 do
  begin
    {#IFDEF DEBUG}
    dt1:=Now();
    {#ENDIF}
    NumPlanItem:=NumProject.NumPlanItems[n];
    if NumPlanItem.NumLabelDataList.Count < 0 then Continue;
    if not Assigned(NumPlanItem.NumPage) then Continue;
    if not Assigned(NumPlanItem.NumPage.NumPageTpl) then Continue;
    if not Assigned(NumPlanItem.Ticket) then Continue;
    if not Assigned(NumPlanItem.Ticket.Tpl) then Continue;
    {#IFDEF DEBUG}
    t4:=t4+MilliSecondsBetween(dt1, Now);
    {#ENDIF}

    ngNumPlan.Cell[iFixedCols-1, n].ObjectReference:=nil;
    ngNumPlan.Cell[iFixedCols-1, n].AsString:=NumPlanItem.NumPage.NumPageTpl.Name;

    ngNumPlan.Cell[iFixedCols-2, n].ObjectReference:=nil;
    ngNumPlan.Cell[iFixedCols-2, n].AsString:=NumPlanItem.Ticket.Tpl.Name;

    // Read NumLabels
    for i:=0 to NumProject.NumLabelsTpl.Count-1 do
    begin
      {#IFDEF DEBUG}
      dt2:=Now();
      {#ENDIF}
      nlt:=NumProject.NumLabelsTpl[i];
      sv:='';
      sa:='';
      sPrevAction:='';
      NumLabelData:=nil;
      for m:=0 to NumPlanItem.NumLabelDataList.Count-1 do
      begin
        {#IFDEF DEBUG}
        dt3:=Now();
        {#ENDIF}
        NumLabelData:=NumPlanItem.NumLabelDataList[m];
        if NumLabelData.NumLabelTpl.ID = nlt.ID then
        begin
          sv:=NumLabelData.Value;
          sa:=NumLabelData.Action;
          Break;
        end;
        {#IFDEF DEBUG}
        t3:=t3+MilliSecondsBetween(dt3, Now);
        {#ENDIF}
      end;

      ngNumPlan.Cell[i+iFixedCols, n].ObjectReference:=NumLabelData;
      if btnActions.Down then
      begin
        ngNumPlan.Cell[i+iFixedCols, n].AsString:=sa;
        ngNumPlan.Cell[i+iFixedCols, n].Hint:=sv;
        if n>0 then sPrevAction:=ngNumPlan.Cell[i+iFixedCols, n-1].AsString;
      end;
      if btnValues.Down then
      begin
        ngNumPlan.Cell[i+iFixedCols, n].AsString:=sv;
        ngNumPlan.Cell[i+iFixedCols, n].Hint:=sa;
        if n>0 then sPrevAction:=ngNumPlan.Cell[i+iFixedCols, n-1].Hint;
      end;
      // Выделение цветом изменения действия
      if sa<>sPrevAction then ngNumPlan.Cell[i+iFixedCols, n].Color:=clSkyBlue
      else ngNumPlan.Cell[i+iFixedCols, n].Color:=clWindow;
      //ngNumPlan.Cells[i+iFixedCols, n]:=sv;
      //ngNumPlan.Cell[i+iFixedCols, n].Hint:=sa;
      {#IFDEF DEBUG}
      t2:=t2+MilliSecondsBetween(dt2, Now);
      {#ENDIF}
    end;
    {#IFDEF DEBUG}
    t1:=t1+MilliSecondsBetween(dt1, Now);
    {#ENDIF}
  end;
  CloseTransaction();
  ngNumPlan.EndUpdate();
  {#IFDEF DEBUG}
  DebugMsg('Updated '+IntToStr(ngNumPlan.RowCount)+' rows in '+IntToStr(MilliSecondsBetween(DT, Now))+' ms', 'NumPlanFrm');
  DebugMsg('t1='+IntToStr(t1)+'  t2='+IntToStr(t2)+'  t3='+IntToStr(t3)+'  t4='+IntToStr(t4)+' ms', 'NumPlanFrm');
  {#ENDIF}
end;

procedure TfrmNumPlan.SaveGrid();
var
  n, i: Integer;
  nld: TNumLabelData;
begin
  StartTransaction();
  //ngNumPlan.BeginUpdate();

{  // Save NumPlan items
  for n:=0 to ngNumPlan.RowCount-1 do
  begin
    for i:=0 to ngNumPlan.Columns.Count-1 do
    begin
      // Save item values
      nld:=TNumLabelData(ngNumPlan.Cell[n, i].ObjectReference);
      if Assigned(nld) then
      begin
        if (nld.Value <> sVal) and (nld.Action <> sAct) then
        begin
          nld.Value:=sVal;
          if sAct<>'' then nld.Action:=sAct;
          nld.Write();
        end;
      end;
    end;
  end;
}  CloseTransaction();
end;

procedure TfrmNumPlan.Start();
begin
  btnValues.Down:=True;
  CreateGrid();
end;

procedure TfrmNumPlan.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Assigned(Form) then Form.Release();
end;

procedure TfrmNumPlan.ngNumPlanAfterEdit(Sender: TObject; ACol,
  ARow: Integer; Value: WideString);
var
  i, n: Integer;
  sAct, sVal, sText: string;
  sPrevValue, sPrevAction: string;
  nld: TNumLabelData;
  ActMode: Boolean;
begin
  if ACol < iFixedCols then Exit;
  ActMode:=btnActions.Down;
  n:=0;
  // Проверка изменения значения
  nld:=TNumLabelData(ngNumPlan.Cell[ACol, ARow].ObjectReference);
  if Assigned(nld) then
  begin
    if ActMode
    then sText:=nld.Action
    else sText:=nld.Value;
  end;
  if sText = Trim(Value) then Exit;

  // Поиск предыдущего значения
  i:=ARow-1;
  if i<0 then i:=0;
  sPrevValue:='';
  sPrevAction:='';
  nld:=TNumLabelData(ngNumPlan.Cell[ACol, i].ObjectReference);
  if Assigned(nld) then
  begin
    sPrevValue:=nld.Value;
    sPrevAction:=nld.Action;
  end;

  StartTransaction();
  for i:=ARow to ngNumPlan.RowCount-1 do
  begin
    sAct:='';
    sVal:='';
    if ActMode then
    begin
      sAct:=ngNumPlan.Cell[ACol, i].AsString;
    end
    else
    begin
      sVal:=ngNumPlan.Cell[ACol, i].AsString;
      if i = ARow then sAct:='='+sVal
      else sAct:=ngNumPlan.Cell[ACol, i].Hint;
    end;
    if sAct<>'' then sVal:=ApplyAction(sPrevValue, sAct);
    //sPrevValue:=sVal;

    // Выделение цветом изменения действия
    if sAct<>sPrevAction then ngNumPlan.Cell[ACol, i].Color:=clSkyBlue
    else ngNumPlan.Cell[ACol, i].Color:=clWindow;

    // Save item values
    nld:=TNumLabelData(ngNumPlan.Cell[ACol, i].ObjectReference);
    if Assigned(nld) then
    begin
      if (nld.Value <> sVal) or (nld.Action <> sAct) then
      begin
        nld.Value:=sVal;
        if sAct<>'' then nld.Action:=sAct;
        nld.Write();
      end;
      sPrevValue:=nld.Value;
      sPrevAction:=nld.Action;
    end;

    if ActMode then
    begin
      ngNumPlan.Cell[ACol, i].AsString:=sAct;
      ngNumPlan.Cell[ACol, i].Hint:=sVal;
    end
    else
    begin
      ngNumPlan.Cell[ACol, i].AsString:=sVal;
      ngNumPlan.Cell[ACol, i].Hint:=sAct;
    end;

  end;
  CloseTransaction();
end;

procedure TfrmNumPlan.Refresh();
begin
  UpdateGrid();
end;

procedure TfrmNumPlan.DummyAction(Sender: TObject);
begin
  //
end;

procedure TfrmNumPlan.actlstNumPlanExecute(Action: TBasicAction;
  var Handled: Boolean);
begin
  if Action = actClose then
  begin
    Core.AddCmd('CLOSE '+IntToStr(PageID));
  end

  else if Action = actActions then
  begin
    if actActions.Checked then Exit;
    actActions.Checked:=True;
    actValues.Checked:=False;
    UpdateGrid();
  end

  else if Action = actValues then
  begin
    if actValues.Checked then Exit;
    actActions.Checked:=False;
    actValues.Checked:=True;
    UpdateGrid();
  end

  else if Action = actHelp then
  begin
    Application.HelpCommand(HELP_CONTEXT, 9)
  end;
end;

end.
