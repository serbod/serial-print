unit PrintPreviewFrame;

interface

uses
  SysUtils, Forms, ExtCtrls, ToolWin, Preview, Controls, ComCtrls, Classes,
  Windows, ActnList, Graphics, ItemsDef, Types, Contnrs, Printers, StdCtrls, Core;

type
  TfrmPrintPreview = class(TFrame)
    tlbPrintPreview: TToolBar;
    panPrintPreview: TPanel;
    btnPrint: TToolButton;
    btnPrintOnePage: TToolButton;
    alPrintPreview: TActionList;
    actPrint: TAction;
    actPrintOnePage: TAction;
    btn1: TToolButton;
    btnZoomFit: TToolButton;
    btnZoomPlus: TToolButton;
    btnZoomMinus: TToolButton;
    btn2: TToolButton;
    btnPageFirst: TToolButton;
    btnPagePrev: TToolButton;
    btnPageNext: TToolButton;
    btnPageLast: TToolButton;
    actZoomFit: TAction;
    actZoomPlus: TAction;
    actZoomMinus: TAction;
    actPageFirst: TAction;
    actPagePrev: TAction;
    actPageNext: TAction;
    actPageLast: TAction;
    cbbPageNum: TComboBox;
    btn3: TToolButton;
    btnPageAdjust: TToolButton;
    actPageAdjust: TAction;
    btnShowTickets: TToolButton;
    actShowTickets: TAction;
    actClose: TAction;
    btnClose: TToolButton;
    actSavePDF: TAction;
    btnSavePDF: TToolButton;
    procedure actPrintOnePageExecute(Sender: TObject);
    procedure alPrintPreviewExecute(Action: TBasicAction;
      var Handled: Boolean);
    procedure DummyAction(Sender: TObject);
    procedure cbbPageNumSelect(Sender: TObject);
  private
    { Private declarations }
    //PreviewParams: TPreviewParams;
    PageAdjustForm: TForm;
    procedure SavePDF();
  public
    { Public declarations }
    GridMode: Boolean;
    PreviewMode: Boolean;
    Preview: TPrintPreview;
    NumProject: TNumProject;
    function Start(): Boolean;
    procedure DrawPreviewPage(c: TCanvas; pinf: TPrnInfo; NumPage: TNumPage);
    procedure DrawPreview(iStartPage, iEndPage: integer);
    procedure DrawGrid(c: TCanvas; pinf: TPrnInfo; AUnits: Integer = 0);
    procedure DrawGridPreview();
    procedure ChangeLanguage();
    destructor Destroy; override;
  end;

  var
    PrintPrevCreated: Boolean = False;
    sPrintPreview: string = 'Предпросмотр печати';

implementation
uses MainForm, PageAdjustFrame, CopyProtection, IniFiles;

{$R *.dfm}

destructor TfrmPrintPreview.Destroy;
begin
  PrintPrevCreated:=False;
  inherited Destroy();
end;


function TfrmPrintPreview.Start(): boolean;
var
  i: integer;
  s: string;
begin
  if not Assigned(Preview) then
  begin
    Preview:=TPrintPreview.Create(self);
    Preview.Parent:=panPrintPreview;
  end;
  NumProject:=Core.CurProject;

  // Fill pages list
  cbbPageNum.Items.BeginUpdate();
  cbbPageNum.Clear();
  if not GridMode then
  begin
    NumProject.Pages.SortByOrder();
    for i:=0 to NumProject.Pages.Count-1 do
    begin
      //s:=IntToStr(i+1)+' / '+IntToStr(NumProject.Pages.Count);
      s:=IntToStr(i+1);
      cbbPageNum.AddItem(s, NumProject.Pages[i]);
    end;
    if cbbPageNum.Items.Count > 0 then cbbPageNum.ItemIndex:=0;
  end;
  cbbPageNum.Items.EndUpdate();

  PreviewMode:=True;
  if CopyProtection.CheckProtectionKey(ProtectionKey) then PreviewMode:=False;
  if GridMode then DrawGridPreview() else DrawPreview(1, 0);
  Result:=True;

  //
  PrintPrevCreated:= True;
  ChangeLanguage();
end;

procedure TfrmPrintPreview.ChangeLanguage();
var
  Part: string;
begin
  if not Assigned(LangFile) then Exit;
  if PrintPrevCreated then
  begin
    Part:='PrintPreview';
    Self.btnClose.Caption:= LangFile.ReadString(Part, 'sbtnClose', Self.btnClose.Caption);
    Self.btnClose.Hint:= LangFile.ReadString(Part, 'hbtnClose', Self.btnClose.Hint);
    Self.btnPageAdjust.Caption:= LangFile.ReadString(Part, 'sbtnPageAdjust', Self.btnPageAdjust.Caption);
    Self.btnPageAdjust.Hint:= LangFile.ReadString(Part, 'hbtnPageAdjust', Self.btnPageAdjust.Hint);
    Self.btnPageFirst.Caption:= LangFile.ReadString(Part, 'sbtnPageFirst', Self.btnPageFirst.Caption);
    Self.btnPageFirst.Hint:= LangFile.ReadString(Part, 'hbtnPageFirst', Self.btnPageFirst.Hint);
    Self.btnPageLast.Caption:= LangFile.ReadString(Part, 'sbtnPageLast', Self.btnPageLast.Caption);
    Self.btnPageLast.Hint:= LangFile.ReadString(Part, 'hbtnPageLast', Self.btnPageLast.Hint);
    Self.btnPageNext.Caption:= LangFile.ReadString(Part, 'sbtnPageNext', Self.btnPageNext.Caption);
    Self.btnPageNext.Hint:= LangFile.ReadString(Part, 'hbtnPageNext', Self.btnPageNext.Hint);
    Self.btnPagePrev.Caption:= LangFile.ReadString(Part, 'sbtnPagePrev', Self.btnPagePrev.Caption);
    Self.btnPagePrev.Hint:= LangFile.ReadString(Part, 'hbtnPagePrev', Self.btnPagePrev.Hint);
    Self.btnPrint.Caption:= LangFile.ReadString(Part, 'sbtnPrint', Self.btnPrint.Caption);
    Self.btnPrint.Hint:= LangFile.ReadString(Part, 'hbtnPrint', Self.btnPrint.Hint);
    Self.btnPrintOnePage.Caption:= LangFile.ReadString(Part, 'sbtnPrintOnePage', Self.btnPrintOnePage.Caption);
    Self.btnPrintOnePage.Hint:= LangFile.ReadString(Part, 'hbtnPrintOnePage', Self.btnPrintOnePage.Hint);
    Self.btnZoomFit.Caption:= LangFile.ReadString(Part, 'sbtnZoomFit', Self.btnZoomFit.Caption);
    Self.btnZoomFit.Hint:= LangFile.ReadString(Part, 'hbtnZoomFit', Self.btnZoomFit.Hint);
    Self.btnZoomPlus.Caption:= LangFile.ReadString(Part, 'sbtnZoomPlus', Self.btnZoomPlus.Caption);
    Self.btnZoomPlus.Hint:= LangFile.ReadString(Part, 'hbtnZoomPlus', Self.btnZoomPlus.Hint);
    Self.btnZoomMinus.Caption:= LangFile.ReadString(Part, 'sbtnZoomMinus', Self.btnZoomMinus.Caption);
    Self.btnZoomMinus.Hint:= LangFile.ReadString(Part, 'hbtnZoomMinus', Self.btnZoomMinus.Hint);
  end;


end;

procedure TfrmPrintPreview.DrawGrid(c: TCanvas; pinf: TPrnInfo; AUnits: Integer = 0);
var
  ix, iy, nx, ny, ih, iw: Integer;
  x, y, mx, my, x0, y0: Integer;
  step1, step2, step3: Integer;
  s: string;
  ppmx, ppmy: Real;
  Margins: TRect;

function ToPageX(n: integer): Integer;
begin
  result:=n;
  if AUnits = 1 then result:=Round(n*ppmx);
end;

function ToPageY(n: integer): Integer;
begin
  result:=n;
  if AUnits = 1 then result:=Round(n*ppmy);
end;

begin
  step1:=StrToIntDef(frmMain.edStep1.Text, 100);
  step2:=StrToIntDef(frmMain.edStep2.Text, 500);
  step3:=StrToIntDef(frmMain.edStep3.Text, 500);
  if frmMain.rbGridInMm.Checked then AUnits:=1;

  mx:=pinf.PageSizePP.X; // maximum X in units
  my:=pinf.PageSizePP.Y; // maximum Y in units
  if AUnits = 1 then
  begin
    //ppmx:=StrToFloatDef(edPpmX.Text, 0);
    //ppmy:=StrToFloatDef(edPpmY.Text, 0);
    ppmx:=pinf.PageSizePP.X/pinf.PaperSizeMM.X;
    ppmy:=pinf.PageSizePP.Y/pinf.PaperSizeMM.Y;
    if ppmx = 0 then Exit;
    if ppmy = 0 then Exit;
    mx:=Round(pinf.PageSizePP.X/ppmx);
    my:=Round(pinf.PageSizePP.Y/ppmy);
  end;
  //mx:=ToPageX(pinf.PageResX); // maximum X in points
  //my:=ToPageY(pinf.PageResY); // maximum Y in points
  Margins.Left:=ToPageX(pinf.Margins.Left);
  Margins.Right:=ToPageX(pinf.Margins.Right);
  Margins.Top:=ToPageY(pinf.Margins.Top);
  Margins.Bottom:=ToPageY(pinf.Margins.Bottom);

  // Линейки по вертикали
  ix:=0; iy:=0; nx:=0; ny:=0;
  while ix < mx do
  begin
    if (nx >= step2) or (ix=0) then
    begin
      nx:=0;
      //s:=IntToStr(ix)+':'+IntToStr(iy);
//      s:=IntToStr(ix);
//      iw:=c.TextWidth(s);
//      ih:=c.TextHeight(s);
//      c.TextOut(ix-(iw div 2), 0, s);
//      c.TextOut(ix-(iw div 2), my-ih, s);
      c.Pen.Style:=psSolid;
      c.Pen.Width:=3;
    end
    else
    begin
      //c.Pen.Style:=psDash;
      //c.Pen.Style:=psDot;
      c.Pen.Style:=psSolid;
      c.Pen.Width:=1;
    end;
    c.MoveTo(ToPageX(ix), 0);
    c.LineTo(ToPageX(ix), ToPageY(my));
    Inc(ix, step1);
    Inc(nx, step1);
  end;

  // Линейки по горизонтали
  ix:=0; iy:=0; nx:=0; ny:=0;
  while iy < my do
  begin
    Inc(iy, step1);
    Inc(ny, step1);
    if (ny >= step2) or (iy=0) then
    begin
      ny:=0;
      //s:=IntToStr(ix)+':'+IntToStr(iy);
//      s:=IntToStr(iy);
//      ih:=c.TextHeight(s);
//      c.TextOut(0, iy-(ih div 2), s);
//      c.TextOut(mx-iw, iy-(ih div 2), s);
      c.Pen.Style:=psSolid;
      c.Pen.Width:=2;
    end
    else
    begin
      //c.Pen.Style:=psDash;
      c.Pen.Style:=psSolid;
      c.Pen.Width:=1;
    end;
    c.MoveTo(0, ToPageY(iy));
    c.LineTo(ToPageX(mx), ToPageY(iy));
  end;

  // Цифры вертикалей
  ix:=0; iy:=0; nx:=0; ny:=0;
  y0:=Margins.Top;
  while ix < mx do
  begin
    Inc(ix, step1);
    Inc(nx, step1);
    if (nx >= step3) then
    begin
      nx:=0;
      //s:=IntToStr(ix)+':'+IntToStr(iy);
      s:=IntToStr(ix);
      iw:=c.TextWidth(s);
      ih:=c.TextHeight(s);
      x:=ToPageX(ix)-(iw div 2);
      y:=ToPageY(my)-ih-Margins.Bottom;
      c.FillRect(Rect(x, y0, x+iw, y0+ih));
      c.FillRect(Rect(x, y,  x+iw, y+ih));
      c.TextOut(x, y0, s);
      c.TextOut(x, y,  s);
    end;
  end;

  // Цифры горизонталей
  ix:=0; iy:=0; nx:=0; ny:=0;
  x0:=Margins.Left;
  while iy < my do
  begin
    Inc(iy, step1);
    Inc(ny, step1);
    if (ny >= step3) then
    begin
      ny:=0;
      //s:=IntToStr(ix)+':'+IntToStr(iy);
      s:=IntToStr(iy);
      iw:=c.TextWidth(s);
      ih:=c.TextHeight(s);
      x:=ToPageX(mx)-iw-3-Margins.Right;
      y:=ToPageY(iy)-(ih div 2);
      c.FillRect(Rect(x0, y, x0+iw, y+ih));
      c.FillRect(Rect(x,  y, x+iw,  y+ih));
      c.TextOut(x0, y, s);
      c.TextOut(x,  y, s);
    end;
  end;

end;

procedure TfrmPrintPreview.DrawPreviewPage(c: TCanvas; pinf: TPrnInfo; NumPage: TNumPage);
var
  tx, ty: Integer; // ticket size in mm
  cx, cy: Integer; // canvas size in points
  tpx, tpy: Integer; // ticket preview size in pixels
  PageSize: TPoint; // Page size in mm
  CanvasSize, PreviewSize: TPoint; // whole canvas and printable area sizes
  PageMargin: TPoint; // printable area margin in points
  PageOffset: TPoint; // printable area offset in points
  kx, ky, k: Real;
  rPage, r: TRect;
  x,y, sx,sy, i, n, m: Integer;
  Ticket: TTicket;
  NumLabel: TNumLabel;
  NumLabelData: TNumLabelData;
  NumPageTpl: TNumPageTpl;
  TicketTpl: TTicketTpl;
  Canvas: TCanvas;
  s: string;
  TempNpiList: TObjectList;
  TempNpi: TNumPlanItem;
  LogFont: TLogFont;
  ViewMode: Integer;
begin
  ViewMode:=1;
  if not Assigned(NumPage) then Exit;
  NumPageTpl:=NumPage.NumPageTpl;
  if not Assigned(NumPageTpl) then Exit;

  // Get NumPlanItems for current NumPage
  TempNpiList:=TObjectList.Create(False);
  for i:=0 to NumProject.NumPlanItems.Count-1 do
  begin
    //NumProject.NumPlanItems[i].Read(true);
    if NumProject.NumPlanItems[i].NumPage = NumPage then
    begin
      TempNpiList.Add(NumProject.NumPlanItems[i]);
    end;
  end;

  Canvas:=c;
  // Clear canvas
  //Canvas.Brush.Color:=clWhite;
  //Canvas.FillRect(Canvas.ClipRect);

  // Compute page preview size in pixels
  // Page size in mm
  PageSize.X:=NumPageTpl.Size.X;
  PageSize.Y:=NumPageTpl.Size.Y;
  if (PageSize.X=0) or (PageSize.Y=0) then Exit;

  // Page size in points
  CanvasSize.X:=pinf.PaperSizePP.X;
  CanvasSize.Y:=pinf.PaperSizePP.Y;

  PreviewSize.X:=pinf.PageRect.Right-pinf.PageRect.Left;
  PreviewSize.Y:=pinf.PageRect.Bottom-pinf.PageRect.Top;

  //PageMargin:=pinf.PageRect.TopLeft;
  rPage:=pinf.PageRect;

  // Size coefficient
  kx:=PreviewSize.X / PageSize.X;
  ky:=PreviewSize.Y / PageSize.Y;

  // Set offset
  PageOffset.X:=Round((PaperInfo.AdjustPointMm.X-PaperInfo.BaseAdjustPointMm.X)*kx);
  PageOffset.Y:=Round((PaperInfo.AdjustPointMm.Y-PaperInfo.BaseAdjustPointMm.Y)*kx);
  OffsetRect(rPage, PageOffset.X, PageOffset.Y);

  //kx:=StrToFloatDef(edPpmX.Text, 0);
  //ky:=StrToFloatDef(edPpmY.Text, 0);

  if PreviewMode then
  begin
    // Draw page frame
    Canvas.Pen.Color:=clBlack;
    Canvas.Pen.Width:=1;
    Canvas.Brush.Style:=bsSolid;
    //Canvas.Brush.Color:=clInfoBk; //clYellow;
    //Canvas.FillRect(rPage);
    Canvas.Rectangle(rPage);
  end;

  // Draw tickets
  for i:=0 to NumPageTpl.Tickets.Count-1 do
  begin
    Ticket:=NumPageTpl.Tickets[i];
    TicketTpl:=Ticket.Tpl;
    if not Assigned(TicketTpl) then Continue;

    TempNpi:=nil;
    for m:=0 to TempNpiList.Count-1 do
    begin
      if TNumPlanItem(TempNpiList[m]).Ticket.ID=Ticket.ID then
      begin
        TempNpi:=TNumPlanItem(TempNpiList[m]);
        Break;
      end;
    end;
    if not Assigned(TempNpi) then Continue;

    r.Left:=rPage.Left+Round(Ticket.Position.X*kx);
    r.Top:=rPage.Top+Round(Ticket.Position.Y*ky);
    r.Right:=r.Left+Round(TicketTpl.Size.X*kx);
    r.Bottom:=r.Top+Round(TicketTpl.Size.Y*ky);

    if PreviewMode then
    begin
      Canvas.Pen.Color:=clBlack;
      Canvas.Pen.Width:=1;

      Canvas.Brush.Color:=clInfoBk; //clYellow;
      Canvas.Brush.Style:=bsSolid;
      //Canvas.FillRect(r);
      Canvas.Rectangle(r);
    end;

    // Draw numlabels
    Canvas.Brush.Style:=bsClear;
    for n:=0 to TicketTpl.NumLabels.Count-1 do
    begin
      NumLabel:=TicketTpl.NumLabels[n];
      if not Assigned(NumLabel.Font) then Continue;

      x:=r.Left+Round(NumLabel.Position.X*kx);
      y:=r.Top+Round(NumLabel.Position.Y*ky);
      Canvas.Pen.Color:=clBlack;
      Canvas.Font.Assign(NumLabel.Font);
      s:='';
      if ViewMode = 0 then s:=NumLabel.Name
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
          if ViewMode = 1 then
          begin
            s:=Trim(NumLabelData.NumLabelTpl.Prefix)+NumLabelData.Value+Trim(NumLabelData.NumLabelTpl.Suffix);
          end;
          if ViewMode = 2 then s:=NumLabelData.Action;
        end;
      end;
      // Пересчет размера шрифта
      Canvas.Font.Height:=-Round(NumLabel.Size * ky);
      if NumLabel.Angle <> 0 then
      begin
        // Поворот надписи
        GetObject(Canvas.Font.Handle, SizeOf(TLogFont), @LogFont);
        LogFont.lfEscapement := NumLabel.Angle*10;
        Canvas.Font.Handle := CreateFontIndirect(LogFont);
      end;
      Canvas.TextOut(x, y, s);
    end;

  end;
end;

procedure TfrmPrintPreview.DrawPreview(iStartPage, iEndPage: integer);
var
  frm: TForm;
  img: TImage;
  i, im: integer;
  PrnInf: TPrnInfo;
  PageTpl: TNumPageTpl;
  R: TRect;
begin
  //Preview:=TPrintPreview.Create(self);
  //Preview.Parent:=panPrintPreview;
  Preview.Clear();
  //Preview.Canvas.Assign(Printer.Canvas);
  Preview.UsePrinterOptions:=True;
  //Preview.GetPrinterOptions();
  Preview.Units:=mmLoMetric;
  //Preview.Units:=mmPixel;
  //Preview.Units:=mmPoints;
  PrnInf:=frmMain.GetPrinterInfo('');
  //PrnInf.PageRect:=Preview.GetPageSetupParameters(dlgPageSetup);

  im:=NumProject.Pages.Count;
  if (iEndPage>0) and (iEndPage<im) then im:=iEndPage;
  for i:=0 to im-1 do
  begin
    PageTpl:=NumProject.Pages[i].NumPageTpl;
    frmMain.dlgPageSetup.PageWidth:=PageTpl.Size.X*100;
    frmMain.dlgPageSetup.PageHeight:=PageTpl.Size.Y*100;
    if PageTpl.Size.X < PageTpl.Size.Y then
      Printer.Orientation:=poPortrait
    else
      Printer.Orientation:=poLandscape;
    PrnInf.PageRect:=Preview.GetPageSetupParameters(frmMain.dlgPageSetup);

    if i=0 then Preview.BeginDoc() else Preview.NewPage();
    //Preview.PaperWidth:=PageTpl.Size.X;
    //Preview.PaperWidth:=PageTpl.Size.Y;
    DrawPreviewPage(Preview.Canvas, PrnInf, NumProject.Pages[i]);
    Core.Cmd('STATUS '+sPrintPreview+' '+IntToStr(i)+'/'+IntToStr(im));
    Application.ProcessMessages();
  end;
  Preview.EndDoc();

  Core.Cmd('STATUS ОК');
  Exit;

  Printer.BeginDoc();
  //DrawGrid(Printer.Canvas, GetPrinterInfo(''));
  frm:=TForm.Create(self);
  img:=TImage.Create(frm);
  img.Parent:=frm;
  img.Align:=alClient;
  //img.Canvas.Assign(Printer.Canvas);
  //img.Canvas.StretchDraw(img.Canvas.ClipRect, Printer.Canvas);
  img.Canvas.CopyRect(img.Canvas.ClipRect, Printer.Canvas, Printer.Canvas.ClipRect);
  frm.FreeOnRelease();
  frm.Show();
  Printer.Abort();
end;

procedure TfrmPrintPreview.DrawGridPreview();
var
  PrnInf: TPrnInfo;
begin
  // Disable unused buttons
  actPageAdjust.Enabled:=False;
  actPageFirst.Enabled:=False;
  actPagePrev.Enabled:=False;
  actPageNext.Enabled:=False;
  actPageLast.Enabled:=False;
  actShowTickets.Enabled:=False;
  cbbPageNum.Enabled:=False;

  // Prepare preview
  Preview.Clear();
  Preview.UsePrinterOptions:=True;
  Preview.Units:=mmLoMetric;
  PrnInf:=frmMain.GetPrinterInfo('');

  PrnInf.PageRect:=Preview.GetPageSetupParameters(frmMain.dlgPageSetup);
  //PrnInf.PageRes.X:=PrnInf.PageRect.Right-PrnInf.PageRect.Left;
  //PrnInf.PageRes.Y:=PrnInf.PageRect.Bottom-PrnInf.PageRect.Top;
  PrnInf.PageSizePP.X:=Preview.PaperWidth;
  PrnInf.PageSizePP.Y:=Preview.PaperHeight;
  Preview.BeginDoc();
  DrawGrid(Preview.Canvas, PrnInf);
  Preview.EndDoc();
end;

procedure TfrmPrintPreview.actPrintOnePageExecute(Sender: TObject);
begin
  if CopyProtection.CheckProtectionKey(ProtectionKey) then
  begin
    Preview.PrintPages(Preview.CurrentPage, Preview.CurrentPage);
  end
  else
  begin
    Preview.PrintPages(1, 1);
  end;
end;

procedure TfrmPrintPreview.DummyAction(Sender: TObject);
begin
  //
end;

procedure TfrmPrintPreview.SavePDF();
var
  FileName: string;
begin
  FileName:=CurProject.Name+'.pdf';
  if not Core.GetSaveFileName(FileName, 'pdf') then Exit;
  try
    Preview.SaveAsPDF(FileName);
  except
    Exit;
  end;
end;

procedure TfrmPrintPreview.alPrintPreviewExecute(Action: TBasicAction;
  var Handled: Boolean);
begin
  //
  if Action = actZoomFit then
  begin
    //Preview.Zoom:=100;
    Preview.ZoomState:=zsZoomToFit;
  end

  else if Action = actZoomPlus then
  begin
    Preview.Zoom:=Preview.Zoom+10;
  end

  else if Action = actZoomMinus then
  begin
    Preview.Zoom:=Preview.Zoom-10;
  end

  else if Action = actPageFirst then
  begin
    Preview.CurrentPage:=1;
    cbbPageNum.ItemIndex:=Preview.CurrentPage-1;
  end

  else if Action = actPageLast then
  begin
    Preview.CurrentPage:=Preview.TotalPages;
    cbbPageNum.ItemIndex:=Preview.CurrentPage-1;
  end

  else if Action = actPagePrev then
  begin
    Preview.CurrentPage:=Preview.CurrentPage-1;
    cbbPageNum.ItemIndex:=Preview.CurrentPage-1;
  end

  else if Action = actPageNext then
  begin
    Preview.CurrentPage:=Preview.CurrentPage+1;
    cbbPageNum.ItemIndex:=Preview.CurrentPage-1;
  end

  else if Action = actShowTickets then
  begin
    PreviewMode:=not actShowTickets.Checked;
    if not CopyProtection.CheckProtectionKey(ProtectionKey) then PreviewMode:=True;
    actShowTickets.Checked:=PreviewMode;
    DrawPreview(1, 0);
  end

  else if Action = actPageAdjust then
  begin
    frmMain.actPageAdjust.Execute();
  end

  else if Action = actClose then
  begin
    Core.AddCmd('CLOSE '+IntToStr((Parent as TSomePage).PageID));
  end

  else if Action = actSavePDF then
  begin
    SavePDF();
  end;
end;

procedure TfrmPrintPreview.cbbPageNumSelect(Sender: TObject);
begin
  if Preview.CurrentPage <> (cbbPageNum.ItemIndex+1) then
  begin
    Preview.CurrentPage := cbbPageNum.ItemIndex+1;
  end;
end;

end.
