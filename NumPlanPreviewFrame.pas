unit NumPlanPreviewFrame;

interface

uses
  Types, Windows, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, NxColumns, NxColumnClasses, NxScrollControl,
  NxCustomGridControl, NxCustomGrid, NxGrid, ComCtrls, StdCtrls, ItemsDef,
  Contnrs, Core, ActnList, ToolWin, DateUtils, Math;

type
  TfrmNumPlanPreview = class(TFrame)
    pan2: TPanel;
    pbPreview: TPaintBox;
    tlbNumPlanPreview: TToolBar;
    actlstNumPlanPreview: TActionList;
    actModeNames: TAction;
    actModeValues: TAction;
    actModeActions: TAction;
    actPageFirst: TAction;
    actPagePrev: TAction;
    actPageNext: TAction;
    actPageLast: TAction;
    actEditPageTpl: TAction;
    actEditTicketTpl: TAction;
    actZoomFit: TAction;
    actZoomPlus: TAction;
    actZoomMinus: TAction;
    actClose: TAction;
    actDummy: TAction;
    btnModeValues: TToolButton;
    btnModeNames: TToolButton;
    btnModeActions: TToolButton;
    btn1: TToolButton;
    btnEditPageTpl: TToolButton;
    btnEditTicketTpl: TToolButton;
    btn2: TToolButton;
    btnPageFirst: TToolButton;
    btnPagePrev: TToolButton;
    btnPageNext: TToolButton;
    btnPageLast: TToolButton;
    btn3: TToolButton;
    btnZoomFit: TToolButton;
    btnZoomPlus: TToolButton;
    btnZoomMinus: TToolButton;
    btn4: TToolButton;
    btnClose: TToolButton;
    pan1: TPanel;
    ngPagesList: TNextGrid;
    spl1: TSplitter;
    ntcOrder: TNxNumberColumn;
    ncbNumPageTpl: TNxListColumn;
    actHelp: TAction;
    btnHelp: TToolButton;
    procedure rgViewModeClick(Sender: TObject);
    procedure imgPreviewMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pan2Resize(Sender: TObject);
    procedure actDummyExecute(Sender: TObject);
    procedure actlstNumPlanPreviewExecute(Action: TBasicAction;
      var Handled: Boolean);
    procedure ngPagesListSelectCell(Sender: TObject; ACol, ARow: Integer);
  private
    { Private declarations }
    ViewMode: AnsiChar;
    CurNumPlanItem: TNumPlanItem;
    NumPage: TNumPage;
    NumPageTpl: TNumPageTpl;
    NpiList: TObjectList;
    PreviewParams: TPreviewParams;
    slPageTpl: TStringList;
    LockPagesList: Boolean;
    Scale: Real;
    function GetCurItems(): boolean;
    procedure SetPreviewParams();
    procedure FillPagesList();
    procedure UpdatePreview();
    procedure ActivatePageByOrder(AOrder: Integer);
    function GetItemAtXY(X, Y: Integer): TNumPlanItem;
  public
    { Public declarations }
    NumProject: TNumProject;
    PageID: Integer;
    Form: TForm;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy(); override;
    function Start(): boolean;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Refresh();
    procedure ChangeLanguage();
  end;

var
  PlanPrevCreated: Boolean = False;
  sColNumPageTpl: string = 'Макет листа';
  sColOrder: string = '№';

const
  ciPosOrder = 0;
  ciPosNumPageTpl = 1;

implementation
uses MainForm;

{$R *.dfm}

constructor TfrmNumPlanPreview.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  NpiList:=TObjectList.Create(false);
  slPageTpl:=TStringList.Create();

  LockPagesList:=False;
  Scale:=1;
  pan2.DoubleBuffered:=True;
  //
  PlanPrevCreated:= True;
  ChangeLanguage();
end;

destructor TfrmNumPlanPreview.Destroy();
begin
  FreeAndNil(slPageTpl);
  FreeAndNil(NpiList);
  PlanPrevCreated:= False;
  inherited Destroy();
end;

procedure TfrmNumPlanPreview.ChangeLanguage();
var
  Part: string;
begin
  if not Assigned(LangFile) then Exit;
  if PlanPrevCreated then
  begin
    Part:= 'NumPlanPreview';
    Self.btnClose.Caption:= LangFile.ReadString(Part, 'sbtnClose', Self.btnClose.Caption);
    Self.btnClose.Hint:= LangFile.ReadString(Part, 'hbtnClose', Self.btnClose.Hint);
    Self.btnEditPageTpl.Caption:= LangFile.ReadString(Part, 'sbtnEditPageTpl', Self.btnEditPageTpl.Caption);
    Self.btnEditPageTpl.Hint:= LangFile.ReadString(Part, 'hbtnEditPageTpl', Self.btnEditPageTpl.Hint);
    Self.btnEditTicketTpl.Caption:= LangFile.ReadString(Part, 'sbtnEditTicketTpl', Self.btnEditTicketTpl.Caption);
    Self.btnEditTicketTpl.Hint:= LangFile.ReadString(Part, 'hbtnEditTicketTpl', Self.btnEditTicketTpl.Hint);
    Self.btnModeActions.Caption:= LangFile.ReadString(Part, 'sbtnModeActions', Self.btnModeActions.Caption);
    Self.btnModeActions.Hint:= LangFile.ReadString(Part, 'hbtnModeActions', Self.btnModeActions.Hint);
    Self.btnModeNames.Caption:= LangFile.ReadString(Part, 'sbtnModeNames', Self.btnModeNames.Caption);
    Self.btnModeNames.Hint:= LangFile.ReadString(Part, 'hbtnModeNames', Self.btnModeNames.Hint);
    Self.btnModeValues.Caption:= LangFile.ReadString(Part, 'sbtnModeValues', Self.btnModeValues.Caption);
    Self.btnModeValues.Hint:= LangFile.ReadString(Part, 'hbtnModeValues', Self.btnModeValues.Hint);
    Self.btnPageFirst.Caption:= LangFile.ReadString(Part, 'sbtnPageFirst', Self.btnPageFirst.Caption);
    Self.btnPageFirst.Hint:= LangFile.ReadString(Part, 'hbtnPageFirst', Self.btnPageFirst.Hint);
    Self.btnPageLast.Caption:= LangFile.ReadString(Part, 'sbtnPageLast', Self.btnPageLast.Caption);
    Self.btnPageLast.Hint:= LangFile.ReadString(Part, 'hbtnPageLast', Self.btnPageLast.Hint);
    Self.btnPageNext.Caption:= LangFile.ReadString(Part, 'sbtnPageNext', Self.btnPageNext.Caption);
    Self.btnPageNext.Hint:= LangFile.ReadString(Part, 'hbtnPageNext', Self.btnPageNext.Hint);
    Self.btnPagePrev.Caption:= LangFile.ReadString(Part, 'sbtnPagePrev', Self.btnPagePrev.Caption);
    Self.btnPagePrev.Hint:= LangFile.ReadString(Part, 'hbtnPagePrev', Self.btnPagePrev.Hint);
    Self.btnZoomFit.Caption:= LangFile.ReadString(Part, 'sbtnZoomFit', Self.btnZoomFit.Caption);
    Self.btnZoomFit.Hint:= LangFile.ReadString(Part, 'hbtnZoomFit', Self.btnZoomFit.Hint);
    Self.btnZoomMinus.Caption:= LangFile.ReadString(Part, 'sbtnZoomMinus', Self.btnZoomMinus.Caption);
    Self.btnZoomMinus.Hint:= LangFile.ReadString(Part, 'hbtnZoomMinus', Self.btnZoomMinus.Hint);
    Self.btnZoomPlus.Caption:= LangFile.ReadString(Part, 'sbtnZoomPlus', Self.btnZoomPlus.Caption);
    Self.btnZoomPlus.Hint:= LangFile.ReadString(Part, 'hbtnZoomPlus', Self.btnZoomPlus.Hint);
    Self.btnHelp.Caption:= LangFile.ReadString(Part, 'sbtnHelp', Self.btnHelp.Caption);
    Self.btnHelp.Hint:= LangFile.ReadString(Part, 'hbtnHelp', Self.btnHelp.Hint);
  end;
end;

function TfrmNumPlanPreview.GetCurItems(): boolean;
var
  i, n: Integer;
  TmpNumPage: TNumPage;
begin
  Result:=False;
  if not Assigned(NumProject) then Exit;

  CurNumPlanItem:=NumProject.CurNumPlanItem;
  try
    if not Assigned(CurNumPlanItem) then Exit;
    //CurNumPlanItem.Read(true);
    if not Assigned(CurNumPlanItem.NumPage) then Exit;
    if not Assigned(CurNumPlanItem.Ticket) then Exit;
    if not Assigned(CurNumPlanItem.Ticket.NumPageTpl) then Exit;
    NumPage:=CurNumPlanItem.NumPage;
    NumPageTpl:=CurNumPlanItem.Ticket.NumPageTpl;
  except
    //Core.ShowWarning('Ошибка в элементе '+IntToStr(CurNumPlanItem.ID),'!');
    DebugMsg('Error in CurNumPlanItem, ID='+IntToStr(CurNumPlanItem.ID), 'NUMPLAN');
    Exit;
  end;
  // Change page from pages list
  for i:=0 to ngPagesList.RowCount-1 do
  begin
    if ngPagesList.Cell[ciPosOrder, i].ObjectReference = NumPage then
    begin
      //if ngPagesList.SelectedRow <> i then
      if not ngPagesList.Selected[i] then
      begin
        LockPagesList:=True;
        //Core.AddCmd('STATUS i='+IntToStr(i)+'  selected_row='+IntToStr(ngPagesList.SelectedRow)+'  addr1='+IntToStr(Integer(NumPage))+'  addr2='+IntToStr(Integer(TmpNumPage))+'  npi='+IntToStr(CurNumPlanItem.ID));
        //ngPagesList.SelectCell(ciPosOrder, i);
        //Core.AddCmd('STATUS row='+IntToStr(i)+'  selected_row='+IntToStr(ngPagesList.SelectedRow)+'  addr1='+IntToStr(Integer(NumPage))+'  addr2='+IntToStr(Integer(ngPagesList.Cell[ciPosOrder, i].ObjectReference)));
        ngPagesList.SelectedRow:=i;
        ngPagesList.ScrollToRow(i);
        LockPagesList:=False;
        Break;
      end;
    end;
  end;

  // Get NumPlanItems for current NumPage
  NpiList.Clear();
  n:=NumProject.NumPlanItems.Count-1;
  for i:=0 to n do
  begin
    if NumProject.NumPlanItems[i].NumPage = NumPage then
    begin
      NpiList.Add(NumProject.NumPlanItems[i]);
    end;
  end;
  Result:=True;
end;

procedure TfrmNumPlanPreview.SetPreviewParams();
var
  //Canvas: TCanvas;
  kx, ky: Real;
  PreviewSize: TSize;
begin
//  imgPreview.Picture.Bitmap.Height:=imgPreview.Height;
//  imgPreview.Picture.Bitmap.Width:=imgPreview.Width;
//  Canvas:=imgPreview.Canvas;
//  Canvas:=pbPreview.Canvas;

  // Compute preview size in pixels
  with PreviewParams do
  begin
    SizeMm.cx:=NumPageTpl.Size.X;
    SizeMm.cy:=NumPageTpl.Size.Y;
    //CanvasSize.cx:=Canvas.ClipRect.Right-Canvas.ClipRect.Left;
    //CanvasSize.cy:=Canvas.ClipRect.Bottom-Canvas.ClipRect.Top;
    CanvasSize.cx:=pbPreview.Width;
    CanvasSize.cy:=pbPreview.Height;
    PreviewSize.cx:=CanvasSize.cx-8;
    PreviewSize.cy:=CanvasSize.cy-8;

    kx:=0; if SizeMm.cx<>0 then kx:=PreviewSize.cx/SizeMm.cx;
    ky:=0; if SizeMm.cy<>0 then ky:=PreviewSize.cy/SizeMm.cy;

    if kx<ky then
    begin
      k:=kx*Scale;
      PreviewSize.cy:=Round(SizeMm.cy*k);
    end
    else
    begin
      k:=ky*Scale;
      PreviewSize.cx:=Round(SizeMm.cx*k);
    end;

    BordersRect.Left:=(CanvasSize.cx-PreviewSize.cx) div 2;
    BordersRect.Top:=(CanvasSize.cy-PreviewSize.cy) div 2;
    BordersRect.Right:=BordersRect.Left+PreviewSize.cx;
    BordersRect.Bottom:=BordersRect.Top+PreviewSize.cy;
  end;
end;

procedure TfrmNumPlanPreview.UpdatePreview();
var
  r: TRect;
  x,y,sx,sy, i, ic, n, nc, m: Integer;
  Ticket: TTicket;
  NumLabel: TNumLabel;
  NumLabelData: TNumLabelData;
  TicketTpl: TTicketTpl;
  Canvas: TCanvas;
  s: string;
  TempNpi, Npi2: TNumPlanItem;
  LogFont: TLogFont;
  bmp: TBitmap;
begin
  if not GetCurItems() then Exit;
  SetPreviewParams();

  bmp:=TBitmap.Create();
  bmp.Width:=pbPreview.Width;
  bmp.Height:=pbPreview.Height;
  //Canvas:=imgPreview.Canvas;
  //Canvas:=pbPreview.Canvas;
  Canvas:=bmp.Canvas;
  Canvas.Lock();

  // Clear canvas
  Canvas.Brush.Color:=clWhite;
  Canvas.FillRect(Canvas.ClipRect);

  with PreviewParams do
  begin
    Canvas.Pen.Color:=clBlack;
    Canvas.Pen.Width:=1;
    Canvas.Brush.Style:=bsSolid;
    //Canvas.Brush.Color:=clInfoBk; //clYellow;
    //Canvas.FillRect(tr);
    Canvas.Rectangle(PreviewParams.BordersRect);

    // Draw tickets
    ic:=NumPageTpl.Tickets.Count-1;
    for i:=0 to ic do
    begin
      Ticket:=NumPageTpl.Tickets[i];
      TicketTpl:=Ticket.Tpl;
      if not Assigned(TicketTpl) then Continue;

      TempNpi:=nil;
      for m:=0 to NpiList.Count-1 do
      begin
        TempNpi:=TNumPlanItem(NpiList[m]);
        if TempNpi.Ticket.ID=Ticket.ID then Break;
      end;
      if not Assigned (TempNpi) then Continue;

      x:=BordersRect.Left+Round(Ticket.Position.X*k);
      y:=BordersRect.Top+Round(Ticket.Position.Y*k);
      sx:=Round(TicketTpl.Size.X*k);
      sy:=Round(TicketTpl.Size.Y*k);
      r:=Bounds(x, y, sx, sy);
      Canvas.Pen.Color:=clBlack;
      Canvas.Pen.Width:=1;
      if CurNumPlanItem.Ticket.ID = Ticket.ID then
      begin
        Canvas.Pen.Width:=3;
      end;

      Canvas.Brush.Color:=clInfoBk; //clYellow;
      Canvas.Brush.Style:=bsSolid;
      //Canvas.FillRect(r);
      Canvas.Rectangle(r);

      // Draw numlabels
      Canvas.Brush.Style:=bsClear;
      nc:=TicketTpl.NumLabels.Count-1;
      for n:=0 to nc do
      begin
        NumLabel:=TicketTpl.NumLabels[n];
        if not Assigned(NumLabel.Font) then Continue;

        x:=r.Left+Round(NumLabel.Position.X*k);
        y:=r.Top+Round(NumLabel.Position.Y*k);
        s:='';
        if ViewMode = 'n' then s:=NumLabel.Name
        else
        begin
          NumLabelData:=nil;
          for m:=0 to TempNpi.NumLabelDataList.Count-1 do
          begin
            NumLabelData:=TempNpi.NumLabelDataList[m];
            if NumLabelData.NumLabelTpl.ID = NumLabel.NumLabelTpl.ID then Break;
          end;
          if Assigned(NumLabelData) then
          begin
            if ViewMode = 'v' then s:=NumLabelData.Value;
            if ViewMode = 'a' then s:=NumLabelData.Action;
          end;
        end;
        Canvas.Pen.Color:=clBlack;
        Canvas.Font.Assign(NumLabel.Font);
        // Пересчет размера шрифта
        Canvas.Font.Height:=-Round(NumLabel.Size * k);
        GetObject(Canvas.Font.Handle, SizeOf(TLogFont), @LogFont);
        { Вывести текст 1/10 градуса против часовой стрелки }
        LogFont.lfEscapement := NumLabel.Angle*10;
        Canvas.Font.Handle := CreateFontIndirect(LogFont);
        Canvas.TextOut(x, y, s);
      end;

    end;

    // Draw arrows
    for m:=0 to NpiList.Count-1 do
    begin
      TempNpi:=TNumPlanItem(NpiList[m]);
      if not Assigned(TempNpi.Ticket) then Continue;
      if not Assigned(TempNpi.Ticket.Tpl) then Continue;
      for n:=0 to NpiList.Count-1 do
      begin
        if NpiList[n]=TempNpi then Continue;
        Npi2:=(NpiList[n] as TNumPlanItem);
        if not Assigned(Npi2.Ticket) then Continue;
        if not Assigned(Npi2.Ticket.Tpl) then Continue;
        if Npi2.Order = TempNpi.Order+1 then
        begin
          x:=BordersRect.Left+Round((TempNpi.Ticket.Position.X+(TempNpi.Ticket.Tpl.Size.X/2))*k);
          y:=BordersRect.Top+Round((TempNpi.Ticket.Position.Y+(TempNpi.Ticket.Tpl.Size.Y/2))*k);
          sx:=BordersRect.Left+Round((Npi2.Ticket.Position.X+(Npi2.Ticket.Tpl.Size.X/2))*k);
          sy:=BordersRect.Top+Round((Npi2.Ticket.Position.Y+(Npi2.Ticket.Tpl.Size.Y/2))*k);
          DrawArrowLine(Canvas, Point(x, y), Point(sx, sy), k);
        end;
      end;
    end;

  end;
  Canvas.Unlock();
  BitBlt(pbPreview.Canvas.Handle, 0, 0, bmp.Width, bmp.Height, bmp.Canvas.Handle, 0, 0, SRCCOPY );
  FreeAndNil(bmp);
end;

function TfrmNumPlanPreview.Start(): boolean;
begin
  Result:=False;
  if not Assigned(NumProject) then Exit;

  // Set view mode
  ViewMode:='v';

  // Fill pages list
  FillPagesList();
  
  // Update preview
  UpdatePreview();
  Result:=True;
end;

procedure TfrmNumPlanPreview.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Assigned(Form) then Form.Release();
end;

procedure TfrmNumPlanPreview.pan2Resize(Sender: TObject);
begin
  UpdatePreview();
end;

procedure TfrmNumPlanPreview.rgViewModeClick(Sender: TObject);
begin
  UpdatePreview();
end;

procedure TfrmNumPlanPreview.Refresh();
begin
  UpdatePreview();
end;  


function TfrmNumPlanPreview.GetItemAtXY(X, Y: Integer): TNumPlanItem;
var
  i, nx, ny, sx, sy: integer;
  LocPoint: TPoint;
  r: TRect;
  NpiTicket: TTicket;
begin
  Result:=nil;
  with PreviewParams do
  begin
    if k = 0 then Exit;
    LocPoint.X:=X;
    LocPoint.Y:=Y;
    for i:=0 to NpiList.Count-1 do
    begin
      NpiTicket:=(NpiList[i] as TNumPlanItem).Ticket;
      nx:=Round(BordersRect.Left + (NpiTicket.Position.X * k));
      ny:=Round(BordersRect.Top + (NpiTicket.Position.Y * k));
      sx:=Round(NpiTicket.Tpl.Size.X * k);
      sy:=Round(NpiTicket.Tpl.Size.Y * k);
      r:=Bounds(nx, ny, sx, sy);
      if PtInRect(r, LocPoint) then
      begin
        Result:=(NpiList[i] as TNumPlanItem);
        Break;
      end;
    end;
  end;
end;

procedure TfrmNumPlanPreview.imgPreviewMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  Npi: TNumPlanItem;
begin
  Npi:=GetItemAtXY(X, Y);
  if not Assigned(Npi) then Exit;
  if Npi = CurNumPlanItem then Exit;
  Core.AddCmd('NUMPLAN_ITEM_SEL '+IntToStr(npi.ID));
end;

procedure TfrmNumPlanPreview.actDummyExecute(Sender: TObject);
begin
  //
end;

procedure TfrmNumPlanPreview.actlstNumPlanPreviewExecute(
  Action: TBasicAction; var Handled: Boolean);
begin
  if Action = actClose then
  begin
    if (Parent is TSomePage) then
    begin
      Core.AddCmd('CLOSE '+IntToStr((Parent as TSomePage).PageID));
    end;
    Exit;
  end

  else if Action = actModeNames then
  begin
    ViewMode:='n';
  end

  else if Action = actModeValues then
  begin
    ViewMode:='v';
  end  

  else if Action = actHelp then
  begin
    Application.HelpCommand(HELP_CONTEXT, 12);
  end

  else if Action = actModeActions then
  begin
    ViewMode:='a';
  end

  else if Action = actPageFirst then
  begin
    ActivatePageByOrder(1);
  end

  else if Action = actPagePrev then
  begin
    ActivatePageByOrder(NumPage.Order-1);
  end

  else if Action = actPageNext then
  begin
    ActivatePageByOrder(NumPage.Order+1);
  end

  else if Action = actPageLast then
  begin
    ActivatePageByOrder(MaxInt);
  end

  else if Action = actEditPageTpl then
  begin
    if not Assigned(CurNumPlanItem) then Exit;
    Core.ShowNumPageTplEdit(CurNumPlanItem.NumPage.NumPageTpl);
  end

  else if Action = actEditTicketTpl then
  begin
    if not Assigned(CurNumPlanItem) then Exit;
    Core.ShowTicketTplEdit(CurNumPlanItem.Ticket.Tpl);
  end

  else if Action = actZoomFit then
  begin
    Scale:=1;
  end

  else if Action = actZoomPlus then
  begin
    Scale:=Scale+0.2;
  end

  else if Action = actZoomMinus then
  begin
    Scale:=Scale-0.2;
  end

  else if Action = actClose then
  begin

  end;
  UpdatePreview();
end;

// === Pages list ===
procedure TfrmNumPlanPreview.FillPagesList();
var
  i, n: Integer;
  TmpPage: TNumPage;
  TmpPageTpl: TNumPageTpl;
begin
  if not Assigned(NumProject) then Exit;
  {#IFDEF DEBUG}
  DebugMsg('Preprocessing '+IntToStr(MilliSecondsBetween(DT, Now))+' ms', 'NumPlanPreview');
  {#ENDIF}

  // PageTpl combo box items
  slPageTpl.Clear();
  for i:=0 to NumProject.PagesTpl.Count-1 do
  begin
    TmpPageTpl:=NumProject.PagesTpl[i];
    slPageTpl.AddObject(TmpPageTpl.Name, TmpPageTpl);
  end;

  ngPagesList.BeginUpdate();
  ngPagesList.ClearRows();

  // NumPageTpl column settings
  ngPagesList.Columns.Item[ciPosNumPageTpl].Header.Caption:=sColNumPageTpl;
  ngPagesList.Columns.Item[ciPosNumPageTpl].Options:=ngPagesList.Columns.Item[ciPosNumPageTpl].Options+[coEditing];
  ngPagesList.Columns.Item[ciPosNumPageTpl].Options:=ngPagesList.Columns.Item[ciPosNumPageTpl].Options-[coCanSort];
  (ngPagesList.Columns.Item[ciPosNumPageTpl] as TNxListColumn).Items:=slPageTpl;

  n:=NumProject.Pages.Count;
  ngPagesList.AddRow(n);
  NumProject.Pages.SortByOrder();
  for i:=0 to n-1 do
  begin
    TmpPage:=NumProject.Pages[i];
    ngPagesList.Cell[ciPosOrder, i].ObjectReference:=TmpPage;
    //ngPagesList.Cell[ciPosOrder, i].AsString:=IntToStr(TmpPage.Order);
    ngPagesList.Cell[ciPosOrder, i].AsInteger:=TmpPage.Order;

    ngPagesList.Cell[ciPosNumPageTpl, i].ObjectReference:=nil;
    //ngPagesList.Cell[ciPosNumPageTpl, i].AsString:=TmpPage.NumPageTpl.Name;
    ngPagesList.Cell[ciPosNumPageTpl, i].AsInteger:=slPageTpl.IndexOf(TmpPage.NumPageTpl.Name);
  end;
  ngPagesList.EndUpdate();
  {#IFDEF DEBUG}
  DebugMsg('Created '+IntToStr(ngPagesList.RowCount)+' rows in '+IntToStr(MilliSecondsBetween(DT, Now))+' ms', 'NumPlanPreview');
  {#ENDIF}
end;

procedure TfrmNumPlanPreview.ActivatePageByOrder(AOrder: Integer);
var
  i: Integer;
  TmpNumPlanItems: TNumPlan;
  TmpNumPageList: TNumPageList;
  npi: TNumPlanItem;
begin
  if not Assigned(NumProject) then Exit;

  // Check order range
  TmpNumPageList:=NumProject.Pages;
  if AOrder < 1 then AOrder:=1;
  if AOrder > TmpNumPageList.Count then AOrder:=TmpNumPageList.Count;
  if AOrder = 0 then Exit;

  // Find first ticket from selected page
  TmpNumPlanItems:=NumProject.NumPlanItems;
  for i:=0 to TmpNumPlanItems.Count-1 do
  begin
    npi:=TmpNumPlanItems[i];
    if npi.NumPage.Order = AOrder then
    begin
      Core.AddCmd('NUMPLAN_ITEM_SEL '+IntToStr(npi.ID));
      Break;
    end;
  end;
end;

procedure TfrmNumPlanPreview.ngPagesListSelectCell(Sender: TObject; ACol,
  ARow: Integer);
var
  TmpPage: TNumPage;
begin
  if LockPagesList then Exit;
  if not Assigned(ngPagesList.Cell[ciPosOrder, ARow].ObjectReference) then Exit;
  TmpPage:=(ngPagesList.Cell[ciPosOrder, ARow].ObjectReference as TNumPage);
  //if not Assigned(TmpPage) then Exit;
  //Core.AddCmd('STATUS Page='+IntToStr(TmpPage.Order)+'  row='+IntToStr(ngPagesList.SelectedRow));
  ActivatePageByOrder(TmpPage.Order);
end;

end.
