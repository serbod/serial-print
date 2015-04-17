unit PageAdjustFrame;

interface

uses
  Windows, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActnList, ComCtrls, ExtCtrls, ToolWin, ItemsDef, Math, IniFiles, Core;

type
  TfrmPageAdjust = class(TFrame)
    toolbarPageAdjust: TToolBar;
    pan1: TPanel;
    imgPageAdjust: TImage;
    btnPrintPage: TToolButton;
    btnPrevPage: TToolButton;
    btnNextPage: TToolButton;
    actlstPageAdjust: TActionList;
    actPrintPage: TAction;
    actNextPage: TAction;
    actPrevPage: TAction;
    actCalibrate: TAction;
    btnCalibrate: TToolButton;
    actSetBase: TAction;
    btnSetBase: TToolButton;
    actHelp: TAction;
    btnHelp: TToolButton;
    procedure ChangeLanguage;
    procedure FrameResize(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure imgPageAdjustMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgPageAdjustMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure actCalibrateExecute(Sender: TObject);
    procedure actSetBaseExecute(Sender: TObject);
    procedure actHelpExecute(Sender: TObject);
  private
    { Private declarations }
    CalibrationMode: Boolean;
    AdjustPoint: TPoint;
    procedure UpdatePreview();
    procedure SetAdjustPoint(X, Y: integer);

  public
    { Public declarations }
    Form: TForm;
    NumProject: TNumProject;
    CurNumPage: TNumPage;
    Ppi: PPaperInfo;
    //CalibrationX: real;
    //CalibrationY: real;
    //AdjustPointMm: TPoint; // Adjustment point in mm
    //BaseAdjustPointMm: TPoint; // Base adjustment point in mm
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Start();
  end;

var
  frmPageAdjust: TfrmPageAdjust;
  PageBgOffset: Integer = 16;
  AdjPointOverhang: Integer = 8;
  AdjLabelXOffset: Integer = 50;
  AdjLabelYOffset: Integer = 50;
  AdjLabelULineLen: Integer = 50;
  AdjLabelSOffs: Integer = 8;
  frmCreated: Boolean = False;

implementation
uses MainForm;
{$R *.dfm}

constructor TfrmPageAdjust.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  CalibrationMode:=False;
  Ppi:=@MainForm.PaperInfo;
  AdjustPoint.X:=Round(Ppi.AdjustPointMm.X*Ppi.CalibrationX)+PageBgOffset;
  AdjustPoint.Y:=Round(Ppi.AdjustPointMm.Y*Ppi.CalibrationY)+PageBgOffset;
  //CalibrationX:=1;
  //CalibrationY:=1;
  //StopUpdate:=False;
  //PreviewBgImage:=nil;

  frmCreated:= True;

  ChangeLanguage;
end;

destructor TfrmPageAdjust.Destroy;
begin
  //if Assigned(PreviewBgImage) then FreeAndNil(PreviewBgImage);
  //StopUpdate:=True;
  frmCreated:= False ;
  inherited Destroy();
end;

procedure TfrmPageAdjust.ChangeLanguage();
var
  Part: string;
begin
  if not Assigned(LangFile) then Exit;
  if frmCreated then
  begin
    Part:= 'PageAdjust';

    //(frmPageAdjust.Parent as TForm).Caption:= LangFile.ReadString(Part, 'sPageAdjust', sPageAdjust);
    Self.btnPrintPage.Caption:= LangFile.ReadString(Part, 'sbtnPrintPage', Self.btnPrintPage.Caption);
    Self.btnPrintPage.Hint:= LangFile.ReadString(Part, 'hbtnPrintPage', Self.btnPrintPage.Hint);
    Self.btnPrevPage.Caption:= LangFile.ReadString(Part, 'sbtnPrevPage', Self.btnPrevPage.Caption);
    Self.btnPrevPage.Hint:= LangFile.ReadString(Part, 'hbtnPrevPage', Self.btnPrevPage.Hint);
    Self.btnNextPage.Caption:= LangFile.ReadString(Part, 'sbtnNextPage', Self.btnNextPage.Caption);
    Self.btnNextPage.Hint:= LangFile. ReadString(Part, 'hbtnNextPage', Self.btnNextPage.Hint);
    Self.btnCalibrate.Caption:= LangFile.ReadString(Part, 'sbtnCalibrate', Self.btnCalibrate.Caption);
    Self.btnCalibrate.Hint:= LangFile.ReadString(Part, 'hbtnCalibrate', Self.btnCalibrate.Hint);
    Self.btnSetBase.Caption:= LangFile.ReadString(Part, 'sbtnSetBase', Self.btnSetBase.Caption);
    Self.btnSetBase.Hint:= LangFile.ReadString(Part, 'hbtnSetBase', Self.btnSetBase.Hint);
    Self.btnHelp.Caption:= LangFile.ReadString(Part, 'sbtnHelp', Self.btnHelp.Caption);
    Self.btnHelp.Hint:= LangFile.ReadString(Part, 'hbtnHelp', Self.btnHelp.Hint);
  end;
end;

procedure DrawArrowsLine(Canvas: TCanvas; PointA, PointB: TPoint);
var
  AP: TPoint;
  Angle: Real;
  SideLen: integer;
begin
  SideLen:=8;
  // Line
  Canvas.MoveTo(PointA.X, PointA.Y);
  Canvas.LineTo(PointB.X, PointB.Y);
  // Arrow A
  Angle:=180*ArcTan2(PointA.Y-PointB.Y, PointA.X-PointB.X)/Pi;
  AP:=Point(PointA.X+Round(SideLen*cos(pi*(Angle+150)/180)), PointA.Y+Round(SideLen*sin(pi*(Angle+150)/180)));
  Canvas.MoveTo(PointA.X, PointA.Y);
  Canvas.LineTo(AP.X, AP.y);

  AP:=Point(PointA.X+Round(SideLen*cos(pi*(Angle-150)/180)), PointA.Y+Round(SideLen*sin(pi*(Angle-150)/180)));
  Canvas.MoveTo(PointA.X, PointA.Y);
  Canvas.LineTo(AP.X, AP.Y);

  // Arrow B
  Angle:=180*ArcTan2(PointB.Y-PointA.Y, PointB.X-PointA.X)/Pi;
  AP:=Point(PointB.X+Round(SideLen*cos(pi*(Angle+150)/180)), PointB.Y+Round(SideLen*sin(pi*(Angle+150)/180)));
  Canvas.MoveTo(PointB.X, PointB.Y);
  Canvas.LineTo(AP.X,AP.y);

  AP:=Point(PointB.X+Round(SideLen*cos(pi*(Angle-150)/180)), PointB.Y+Round(SideLen*sin(pi*(Angle-150)/180)));
  Canvas.MoveTo(PointB.X, PointB.Y);
  Canvas.LineTo(AP.X,AP.y);
end;

procedure TfrmPageAdjust.UpdatePreview();
var
  PageSize: TPoint; // Page size in mm
  CanvasSize: TPoint; // canvas size
  AP: TPoint; // Adjustment point in pixels
  PA, PB, PC: TPoint;

  //PageMargin: TPoint; // printable area margin in points
  kx, ky, k: Real;
  rPage, r: TRect;
  x,y, sx,sy, i, n, m: Integer;
  NumPageTpl: TNumPageTpl;
  Canvas: TCanvas;
  s: string;
  LogFont: TLogFont;
begin
  //if not Assigned(CurNumPage) then Exit;
  //NumPageTpl:=CurNumPage.NumPageTpl;
  //if not Assigned(NumPageTpl) then Exit;

  Canvas:=imgPageAdjust.Canvas;

  if (imgPageAdjust.Picture.Bitmap.Height <> imgPageAdjust.Height)
  or (imgPageAdjust.Picture.Bitmap.Width <> imgPageAdjust.Width)
  then
  begin
    imgPageAdjust.Picture.Bitmap.Height:=imgPageAdjust.Height;
    imgPageAdjust.Picture.Bitmap.Width:=imgPageAdjust.Width;
  end;

  // Compute page preview size in pixels
  // Page size in mm
  //PageSize.X:=NumPageTpl.Size.X;
  //PageSize.Y:=NumPageTpl.Size.Y;
  //if (PageSize.X=0) or (PageSize.Y=0) then Exit;

  // Page size in points
  CanvasSize.X:=imgPageAdjust.Width;
  CanvasSize.Y:=imgPageAdjust.Height;

  //PageMargin:=pinf.PageRect.TopLeft;
  //rPage:=pinf.PageRect;

  // Size coefficient
  //kx:=CanvasSize.X / PageSize.X;
  //ky:=CanvasSize.Y / PageSize.Y;
  //kx:=1; ky:=1;
  kx:=Ppi.CalibrationX;
  ky:=Ppi.CalibrationY;

  //AdjustPoint.X:=Round(AdjustPointMm.X*kx);
  //AdjustPoint.Y:=Round(AdjustPointMm.Y*ky);

  //kx:=StrToFloatDef(edPpmX.Text, 0);
  //ky:=StrToFloatDef(edPpmY.Text, 0);

  // Clear canvas
  rPage:=Rect(0, 0, CanvasSize.X, CanvasSize.Y);

  Canvas.Brush.Color:=clBackground;
  //Canvas.Brush.Style:=bsBDiagonal;
  Canvas.Brush.Style:=bsSolid;
  Canvas.FillRect(rPage);

  // Draw page frame
  rPage:=Rect(PageBgOffset, PageBgOffset, CanvasSize.X, CanvasSize.Y);
  Canvas.Brush.Color:=clWhite;
  Canvas.Brush.Style:=bsSolid;
  Canvas.Pen.Color:=clBlack;
  Canvas.Pen.Width:=1;
  //Canvas.Brush.Color:=clInfoBk; //clYellow;
  //Canvas.FillRect(rPage);
  Canvas.Rectangle(rPage);

  // Draw base adjustment point lines
  AP.X:=Round(Ppi.BaseAdjustPointMm.X*kx)+PageBgOffset;
  AP.Y:=Round(Ppi.BaseAdjustPointMm.Y*ky)+PageBgOffset;
  Canvas.Pen.Color:=clGray;
  Canvas.Pen.Width:=1;
  // Line X
  Canvas.MoveTo(AP.X-AdjPointOverhang, AP.Y);
  Canvas.LineTo(CanvasSize.X, AP.Y);
  // Line Y
  Canvas.MoveTo(AP.X, AP.Y-AdjPointOverhang);
  Canvas.LineTo(AP.X, CanvasSize.Y);

  // Draw adjustment point lines
  //AP.X:=BaseAdjustPointMm.X*CalibrationX;
  //AP.Y:=BaseAdjustPointMm.Y*CalibrationY;
  Canvas.Pen.Color:=clBlack;
  Canvas.Pen.Width:=1;
  // Line X
  Canvas.MoveTo(AdjustPoint.X-AdjPointOverhang, AdjustPoint.Y);
  Canvas.LineTo(CanvasSize.X, AdjustPoint.Y);
  // Line Y
  Canvas.MoveTo(AdjustPoint.X, AdjustPoint.Y-AdjPointOverhang);
  Canvas.LineTo(AdjustPoint.X, CanvasSize.Y);

  // Draw adjustment point labels
  // Arrow X
  PA:=Point(PageBgOffset, AdjustPoint.Y+AdjLabelYOffset);
  PB:=Point(AdjustPoint.X, AdjustPoint.Y+AdjLabelYOffset);
  DrawArrowsLine(Canvas, PA, PB);
  // Label X Line
  PC:=Point(PB.X+AdjLabelULineLen, PB.Y);
  Canvas.MoveTo(PB.X, PB.Y);
  Canvas.LineTo(PC.X, PC.Y);
  // Label X
  //s:=IntToStr(Round((AdjustPoint.X-PageBgOffset)*kx))+' mm';
  s:=IntToStr(Ppi.AdjustPointMm.X)+' mm';
  PA:=Point(PB.X+AdjLabelSOffs, PB.Y-(-Canvas.Font.Height)-2);
  Canvas.TextOut(PA.X, PA.Y, s);

  // Arrow Y
  PA:=Point(AdjustPoint.X+AdjLabelXOffset, PageBgOffset);
  PB:=Point(AdjustPoint.X+AdjLabelXOffset, AdjustPoint.Y);
  DrawArrowsLine(Canvas, PA, PB);
  // Line Y1
  PC:=Point(PB.X+AdjLabelULineLen, PB.Y+AdjLabelULineLen);
  Canvas.MoveTo(PB.X, PB.Y);
  Canvas.LineTo(PC.X, PC.Y);
  // Label Y Line
  PA:=Point(PC.X+AdjLabelULineLen, PC.Y);
  Canvas.MoveTo(PC.X, PC.Y);
  Canvas.LineTo(PA.X, PA.Y);

  // Label Y
  //s:=IntToStr(Round((AdjustPoint.Y-PageBgOffset)*ky))+' mm';
  s:=IntToStr(Ppi.AdjustPointMm.Y)+' mm';
  PA:=Point(PC.X+AdjLabelSOffs, PC.Y-(-Canvas.Font.Height)-2);
  Canvas.TextOut(PA.X, PA.Y, s);

  if CalibrationMode then
  begin
    s:='Укажите точку в 100 мм от верхнего и 100 мм от нижнего края листа';
    Canvas.TextOut((PageBgOffset + 8), CanvasSize.Y-(-Canvas.Font.Height)-8, s);
  end;
end;

procedure TfrmPageAdjust.FrameResize(Sender: TObject);
begin
  UpdatePreview();
end;

procedure TfrmPageAdjust.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Assigned(Form) then Form.Release();
end;

procedure TfrmPageAdjust.SetAdjustPoint(X, Y: integer);
begin
  AdjustPoint.X:=X;
  AdjustPoint.Y:=Y;
  if Ppi.CalibrationX=0 then Ppi.CalibrationX:=1;
  if Ppi.CalibrationY=0 then Ppi.CalibrationY:=1;
  Ppi.AdjustPointMm.X:=Round((AdjustPoint.X-PageBgOffset)/Ppi.CalibrationX);
  Ppi.AdjustPointMm.Y:=Round((AdjustPoint.Y-PageBgOffset)/Ppi.CalibrationY);
end;

procedure TfrmPageAdjust.Start();
begin
  //CalibrationX:=MainForm.PaperInfo.CalibrationX;
  //CalibrationY:=MainForm.PaperInfo.CalibrationY;
  //AdjustPointMm:=MainForm.PaperInfo.AdjustPointMm;
  //BaseAdjustPointMm:=MainForm.PaperInfo.BaseAdjustPointMm;
  AdjustPoint.X:=Round(Ppi.AdjustPointMm.X*Ppi.CalibrationX)+PageBgOffset;
  AdjustPoint.Y:=Round(Ppi.AdjustPointMm.Y*Ppi.CalibrationY)+PageBgOffset;
  UpdatePreview();
end;

procedure TfrmPageAdjust.imgPageAdjustMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  SetAdjustPoint(X, Y);
  UpdatePreview();
end;

procedure TfrmPageAdjust.imgPageAdjustMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if (ssLeft in Shift) then
  begin
    SetAdjustPoint(X, Y);
    UpdatePreview();
  end;
end;

procedure TfrmPageAdjust.actCalibrateExecute(Sender: TObject);
var
  AP: TPoint;
begin
  if not CalibrationMode then
  begin
    if Application.MessageBox(PAnsiChar('Калибровать?'), PAnsiChar('Вопрос'), MB_OKCANCEL or MB_ICONQUESTION	) = IDCANCEL then Exit;
    CalibrationMode := True;
    UpdatePreview();
  end
  else
  begin
    CalibrationMode := False;
    AP.X:=AdjustPoint.X-PageBgOffset;
    AP.Y:=AdjustPoint.Y-PageBgOffset;
    if AP.X=0 then AP.X:=100;
    if AP.Y=0 then AP.Y:=100;
    Ppi.CalibrationX:=AP.X/100;
    Ppi.CalibrationY:=AP.Y/100;
    UpdatePreview();
  end;
  btnCalibrate.Down:=CalibrationMode;
end;

procedure TfrmPageAdjust.actSetBaseExecute(Sender: TObject);
begin
  if Ppi.CalibrationX=0 then Ppi.CalibrationX:=1;
  if Ppi.CalibrationY=0 then Ppi.CalibrationY:=1;
  Ppi.BaseAdjustPointMm.X:=Round((AdjustPoint.X-PageBgOffset)/Ppi.CalibrationX);
  Ppi.BaseAdjustPointMm.Y:=Round((AdjustPoint.Y-PageBgOffset)/Ppi.CalibrationY);
  UpdatePreview();
end;

procedure TfrmPageAdjust.actHelpExecute(Sender: TObject);
begin
  Application.HelpCommand(HELP_CONTEXT, 13);
end;

end.
