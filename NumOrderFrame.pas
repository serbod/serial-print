unit NumOrderFrame;

interface

uses
  Windows, SysUtils, Classes, Graphics, Controls, Forms, ItemsDef, StdCtrls,
  ExtCtrls, ActnList, ToolWin, ComCtrls, Core, Types, Contnrs, Buttons,
  NxEdit;

type

  TVisNumPage = class;
  TLayoutDirection = (ldUpDown, ldLeftRight);

  // Визуальный билет на листе
  TVisTicket = class
  public
    Pos: TPoint;
    Size: TPoint;
    DrawRect: TRect;
    Ticket: TTicket;
    NumPlanItem: TNumPlanItem;
    Order: integer;
    VisNumPage: TVisNumPage;
    Ordered: Boolean;
    constructor Create(ANumPlanItem: TNumPlanItem);
    procedure Save();
    procedure Draw(c: TCanvas);
  end;

  // Список визуальных билетов
  TVisTicketList = class (TObjectList)
  public
    function GetItem(Index: Integer): TVisTicket;
    function GetItemByOrder(AOrder: Integer): TVisTicket;
    procedure SortByOrder();
  end;

  // Визуальный лист
  TVisNumPage = class
  public
    NumPage: TNumPage;
    Size: TPoint;
    DrawRect: TRect;
    Name: string;
    Order: integer;
    Visible: Boolean;
    VisTicketList: TObjectList;
    constructor Create(ANumPlanItem: TNumPlanItem);
    destructor Destroy; override;
    procedure Save();
    function GetTicket(Index: Integer): TVisTicket;
    function GetTicketFromPos(Pos: TPoint): TVisTicket;
    function AddTicket(ANumPlanItem: TNumPlanItem): TVisTicket;
  end;

  // Список визуальных листов
  TVisPagesList = class (TObjectList)
  public
    function GetItem(Index: Integer): TVisNumPage;
    function AddNumPlanItem(ANumPlanItem: TNumPlanItem): TVisTicket;
    procedure SortByOrder();
  end;

  /// Двухмерный массив листов (страниц)
  /// Заполняется сверху вниз слева направо
  /// Также содержит размеры (в мм) колонок и рядов
  TPagesArray = class(TObject)
  private
    FSizesActual: Boolean;
    FSizesX: array of integer;  // Максимумы размера листа по колонкам расклада
    FSizesY: array of integer;  // Максимумы размера листа по строкам расклада
    FItems: array of array of TVisNumPage; // расклад листов
    FLayout: TPoint;            // параметры расклада
    FItemsCount: Integer;       // число листов в раскладе
    FLayoutDirection: TLayoutDirection;
    function FGetItem(X, Y: integer): TVisNumPage;
    function FGetSizeX(Index: Integer): Integer;
    function FGetSizeY(Index: Integer): Integer;
    procedure SetLayout(Layout: TPoint);
    procedure SetLayoutDirection(ld: TLayoutDirection);
    procedure CalculateSizes();
  public
    MinItemSizeMM: TPoint;      // Минимальный размер листа (для базового масштаба)
    VisPagesList: TVisPagesList;
    constructor Create();
    destructor Destroy(); override;
    procedure Clear();
    procedure AddItem(Item: TVisNumPage);
    procedure Save();
    property Layout: TPoint read FLayout write SetLayout;     // Параметры расклада
    property LayoutDirection: TLayoutDirection read FLayoutDirection write SetLayoutDirection;
    property Items[X, Y: Integer]: TVisNumPage read FGetItem; default;  // расклад листок
    property SizeX[Index: Integer]: Integer read FGetSizeX;   // Максисмум ширины листа по колонке
    property SizeY[Index: Integer]: Integer read FGetSizeY;   // Максимум высоты листа по строке
  end;

type
  TframeNumOrder = class(TFrame)
    tlbNumOrder: TToolBar;
    actlstNumOrder: TActionList;
    panImage: TPanel;
    pbPreview: TPaintBox;
    cbbCurNum: TComboBox;
    sbPreview: TScrollBox;
    actOK: TAction;
    actClose: TAction;
    actHelp: TAction;
    actZoomPlus: TAction;
    actZoomMinus: TAction;
    actZoomFit: TAction;
    actOptions: TAction;
    btn1: TToolButton;
    btnOptions: TToolButton;
    lbCurOrder: TLabel;
    btnZoomPlus: TToolButton;
    btnZoomMinus: TToolButton;
    btnZoomFit: TToolButton;
    btn2: TToolButton;
    btnOK: TToolButton;
    btnClose: TToolButton;
    btnHelp: TToolButton;
    grpOptions: TGroupBox;
    nsePagesInLine: TNxSpinEdit;
    rgLayout: TRadioGroup;
    lbPagesInDirection: TLabel;
    nseMinPageSizeX: TNxSpinEdit;
    nseMinPageSizeY: TNxSpinEdit;
    nseBetweenPages: TNxSpinEdit;
    lbMinPageSize: TLabel;
    lbMPSX: TLabel;
    lbBetweenPages: TLabel;
    btnOptionsOK: TBitBtn;
    btnOptionsCancel: TBitBtn;
    actOptionsOK: TAction;
    actOptionsCancel: TAction;
    panOptions: TPanel;
    actShowArrows: TAction;
    btnShowArrows: TToolButton;
    actInvalidate: TAction;
    actUndo1: TAction;
    btnInvalidate: TToolButton;
    btn3: TToolButton;
    btnUndo1: TToolButton;
    procedure pbPreviewPaint(Sender: TObject);
    procedure pbPreviewMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure DummyAction(Sender: TObject);
    procedure actlstNumOrderExecute(Action: TBasicAction;
      var Handled: Boolean);
    procedure sbPreviewMouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
  private
    { Private declarations }
    PreviewParams: TPreviewParams;
    Scale: Real;
    CurOrder: Integer;
    ViewMode: AnsiChar;
    PagesArray: TPagesArray;
    VisTicketList: TVisTicketList;
    UndoList: TVisTicketList;
    // Options
    ShowPageTplName: Boolean;
    MinPageSize: TPoint;
    BetweenPages: Integer;
    PagesInLine: Integer;
    LayoutDirection: TLayoutDirection;
    procedure SetPreviewParams();
    procedure UpdatePreview();
    procedure DrawTicket(Canvas: TCanvas; BasePoint: TPoint; VisTicket: TVisTicket; Text: string);
    function GetPageFromPos(Pos: TPoint): TVisNumPage;
    function GetTicketFromPos(Pos: TPoint): TVisTicket;
    procedure OptionsMod(Action: string);
  public
    { Public declarations }
    NumProject: TNumProject;
    PageID: Integer;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy(); override;
    function Start(): boolean;
  end;

const
  BETWEEN_PAGES = 20;   // Промежуток между листами
  MIN_PAGE_X_PP = 100;  // Мин. ширина страницы
  MIN_PAGE_Y_PP = 100;  // Мин. высота страницы

implementation
uses MainForm;
{$R *.dfm}

// === TTicketVisual ===
constructor TVisTicket.Create(ANumPlanItem: TNumPlanItem);
begin
  if not Assigned(ANumPlanItem) then Exit;
  NumPlanItem:=ANumPlanItem;
  Order:=NumPlanItem.Order;
  if not Assigned(ANumPlanItem.Ticket) then Exit;
  Ticket:=NumPlanItem.Ticket;
  Pos:=Ticket.Position;
  if not Assigned(Ticket.Tpl) then Exit;
  Size:=Ticket.Tpl.Size;
  Ordered:=False;
end;

procedure TVisTicket.Save();
var
  tmpNumPage: TNumPage;
  NumProject: TNumProject;
begin
  //tmpNumPage:=NumPlanItem.NumPage;
  NumProject:=NumPlanItem.Project;
  NumPlanItem:=NumProject.NumPlanItems.GetItemByOrder(Order);
  if not Assigned(NumPlanItem) then Exit;

  NumPlanItem.Ticket:=Ticket;
  NumPlanItem.NumPage:=VisNumPage.NumPage;

  //NumPlanItem.Order:=Order;
  NumPlanItem.Write();
end;

procedure TVisTicket.Draw(c: TCanvas);
begin

end;

// === TVisTicketList ===
function TVisTicketList.GetItem(Index: Integer): TVisTicket;
begin
  Result:=(Items[Index] as TVisTicket);
end;

function TVisTicketList.GetItemByOrder(AOrder: Integer): TVisTicket;
var
  i: Integer;
begin
  Result:=nil;
  for i:=0 to Count-1 do
  begin
    if GetItem(i).Order=AOrder then
    begin
      Result:=GetItem(i);
      Break;
    end;
  end;
end;

function VisTicketListSort(Item1, Item2: Pointer): Integer;
begin
  Result:=TVisTicket(Item2).Order-TVisTicket(Item1).Order;
end;

procedure TVisTicketList.SortByOrder();
begin
  Self.Sort(@VisTicketListSort);
end;

// === TVisNumPage ===
constructor TVisNumPage.Create(ANumPlanItem: TNumPlanItem);
begin
  if not Assigned(ANumPlanItem) then Exit;
  if not Assigned(ANumPlanItem.NumPage) then Exit;
  NumPage:=ANumPlanItem.NumPage;
  Order:=NumPage.Order;
  if not Assigned(NumPage.NumPageTpl) then Exit;
  Size:=NumPage.NumPageTpl.Size;
  Name:=NumPage.NumPageTpl.Name;

  // Items
  VisTicketList:=TObjectList.Create(true);
end;

destructor TVisNumPage.Destroy();
begin
  FreeAndNil(VisTicketList);
end;

procedure TVisNumPage.Save();
begin
  NumPage.Order:=Order;
  NumPage.Write();
end;

function TVisNumPage.GetTicket(Index: Integer): TVisTicket;
begin
  Result:=nil;
  if Index >= VisTicketList.Count then Exit;
  Result:=(VisTicketList.Items[Index] as TVisTicket);
end;

function TVisNumPage.GetTicketFromPos(Pos: TPoint): TVisTicket;
var
  i: Integer;
  VisTicket: TVisTicket;
  r: TRect;
begin
  Result:=nil;
  for i:=0 to VisTicketList.Count-1 do
  begin
    VisTicket:=(VisTicketList[i] as TVisTicket);
    r:=Bounds(VisTicket.Pos.X, VisTicket.Pos.Y, VisTicket.Size.X, VisTicket.Size.Y);
    if PtInRect(r, Pos) then
    begin
      Result:=VisTicket;
      Exit;
    end;
  end;
end;

function TVisNumPage.AddTicket(ANumPlanItem: TNumPlanItem): TVisTicket;
var
  i: Integer;
begin
  for i:=0 to VisTicketList.Count-1 do
  begin
    if (VisTicketList.Items[i] as TVisTicket).NumPlanItem = ANumPlanItem then
    begin
      Result:=(VisTicketList.Items[i] as TVisTicket);
      Exit;
    end;
  end;
  Result:=TVisTicket.Create(ANumPlanItem);
  Result.VisNumPage:=Self;
  VisTicketList.Add(Result);
end;

// === TVisPagesList ===
function TVisPagesList.GetItem(Index: Integer): TVisNumPage;
begin
  Result:=(Self.Items[Index] as TVisNumPage);
end;

function TVisPagesList.AddNumPlanItem(ANumPlanItem: TNumPlanItem): TVisTicket;
var
  i: Integer;
  NumPage: TNumPage;
  VisNumPage: TVisNumPage;
begin
  Result:=nil;
  NumPage:=ANumPlanItem.NumPage;
  for i:=0 to self.Count-1 do
  begin
    VisNumPage:=(Self.Items[i] as TVisNumPage);
    if VisNumPage.NumPage = NumPage then
    begin
      Result:=VisNumPage.AddTicket(ANumPlanItem);
      Exit;
    end;
  end;
  VisNumPage:=TVisNumPage.Create(ANumPlanItem);
  Self.Add(VisNumPage);
  Result:=VisNumPage.AddTicket(ANumPlanItem);
end;

function VisPagesListSort(Item1, Item2: Pointer): Integer;
begin
  Result:=TVisNumPage(Item1).Order-TVisNumPage(Item2).Order;
end;

procedure TVisPagesList.SortByOrder();
begin
  Self.Sort(@VisPagesListSort);
end;

// === TPagesArray ===
constructor TPagesArray.Create();
begin
  FSizesActual:=False;
  SetLength(FSizesX, 0);
  SetLength(FSizesY, 0);
  SetLength(FItems, 0);
  FItemsCount:=0;
  MinItemSizeMM:=Point(MaxInt, MaxInt);
  VisPagesList:=TVisPagesList.Create(True);
end;

destructor TPagesArray.Destroy();
begin
  FreeAndNil(VisPagesList);
  SetLength(FItems, 0);
  SetLength(FSizesY, 0);
  SetLength(FSizesX, 0);
  inherited Destroy();
end;

procedure TPagesArray.Clear();
var
  x, y: Integer;
begin
  FItemsCount:=0;
  for x:=Low(FItems) to High(FItems) do
  begin
    for y:=Low(FItems[x]) to High(FItems[x]) do
    begin
      FItems[x, y]:=nil;
    end;
  end;
end;

procedure TPagesArray.AddItem(Item: TVisNumPage);
var
  x, y: Integer;
  NumPageTpl: TNumPageTpl;
begin
  // вычислим номер следующей вободной колонки и ряда
  if FLayoutDirection = ldUpDown then
  begin
    if Layout.Y = 0 then Exit;
    x:=(FItemsCount div  Layout.Y);
    if x >= Layout.X then Exit;
    y:=FItemsCount-(Layout.Y * x);
    if y >= Layout.Y then Exit;
  end
  else
  begin
    if Layout.X = 0 then Exit;
    y:=(FItemsCount div  Layout.X);
    if y >= Layout.Y then Exit;
    x:=FItemsCount-(Layout.X * y);
    if x >= Layout.X then Exit;
  end;

  // Установим лист в заданную точку
  FItems[x, y]:=Item;

  Inc(FItemsCount);
  FSizesActual:=False;
end;

function TPagesArray.FGetItem(X, Y: integer): TVisNumPage;
begin
  Result:=nil;
  if Y >= Layout.Y then Exit;
  if X >= Layout.X then Exit;
  Result:=FItems[X, Y];
end;

procedure TPagesArray.Save();
var
  x, y: Integer;
  VisNumPage: TVisNumPage;
begin
  StartTransaction();
  for x:=0 to self.VisPagesList.Count-1 do
  begin
    VisNumPage:=VisPagesList.GetItem(x);
    VisNumPage.Save();
    for y:=0 to VisNumPage.VisTicketList.Count-1 do
    begin
      if Assigned(VisNumPage.VisTicketList[y]) then
      begin
        (VisNumPage.VisTicketList[y] as TVisTicket).Save();
      end;
    end;
  end;
  CloseTransaction();
end;

procedure TPagesArray.SetLayoutDirection(ld: TLayoutDirection);
begin
  if ld <> FLayoutDirection then
  begin
    FLayoutDirection:=ld;
    SetLayout(FLayout);
  end;
end;

procedure TPagesArray.SetLayout(Layout: TPoint);
var
  x, y: Integer;
  List: TList;
begin
  // Сохранение всех листов в список
  List:=TList.Create();
  for x:=Low(FItems) to High(FItems) do
  begin
    for y:=Low(FItems[x]) to High(FItems[x]) do
    begin
      List.Add(FItems[x, y]);
    end;
  end;

  // Переформировка массива
  FSizesActual:=False;
  FLayout:=Layout;
  SetLength(FItems, FLayout.X);
  for x:=Low(FItems) to High(FItems) do
  begin
    SetLength(FItems[x], FLayout.Y);
  end;

  // Перезаполнение массива
  for x:=0 to FItemsCount-1 do
  begin
    AddItem(TVisNumPage(List[x]));
  end;

  List.Free();

  CalculateSizes();
end;

procedure TPagesArray.CalculateSizes();
var
  x, y, sx, sy: Integer;
  VisNumPage: TVisNumPage;
begin
  // Сброс размеров
  MinItemSizeMM:=Point(MaxInt, MaxInt);

  SetLength(FSizesX, FLayout.X);
  SetLength(FSizesY, FLayout.Y);
  for x:=Low(FSizesX) to High(FSizesX) do FSizesX[x]:=0;
  for y:=Low(FSizesY) to High(FSizesY) do FSizesY[y]:=0;

  // Определяем размеры
  for x:=Low(FItems) to High(FItems) do
  begin
    for y:=Low(FItems[x]) to High(FItems[x]) do
    begin
      VisNumPage:=Items[x, y];
      if not Assigned(VisNumPage) then Continue;

      // Размер листа
      sx:=VisNumPage.Size.X;
      sy:=VisNumPage.Size.Y;

      // Максимальный размер листа для колонки и ряда
      if sx  > FSizesX[x] then FSizesX[x]:=sx;
      if sy  > FSizesY[y] then FSizesY[y]:=sy;

      // Обновим минимальный размер листа
      if sx < MinItemSizeMM.X then MinItemSizeMM.X := sx;
      if sy < MinItemSizeMM.Y then MinItemSizeMM.Y := sy;
    end;
  end;
  FSizesActual:=True;
end;

function TPagesArray.FGetSizeX(Index: Integer): Integer;
begin
  if not FSizesActual then CalculateSizes();
  Result:=FSizesX[Index];
end;

function TPagesArray.FGetSizeY(Index: Integer): Integer;
begin
  if not FSizesActual then CalculateSizes();
  Result:=FSizesY[Index];
end;


// ===
procedure SetPen(c: TCanvas; Color: TColor; Mode: TPenMode; Style: TPenStyle; Width: Integer);
begin
  c.Pen.Color:=Color;
  c.Pen.Mode:=Mode;
  c.Pen.Style:=Style;
  c.Pen.Width:=Width;
end;

procedure SetBrush(c: TCanvas; Color: TColor; Style: TBrushStyle);
begin
  c.Brush.Color:=Color;
  c.Brush.Style:=Style;
end;

// === TframeNumOrder ===
constructor TframeNumOrder.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Scale:=1;
  panImage.DoubleBuffered:=True;
  sbPreview.DoubleBuffered:=True;
  PagesArray:=TPagesArray.Create();
  VisTicketList:=TVisTicketList.Create(False);
  UndoList:=TVisTicketList.Create(False);
  OptionsMod('init');
  //
  //Created:=True;
  //ChangeLanguage();
end;

destructor TframeNumOrder.Destroy();
begin
  FreeAndNil(UndoList);
  FreeAndNil(VisTicketList);
  FreeAndNil(PagesArray);
  //Created:=False;
  inherited Destroy();
end;

function TframeNumOrder.Start(): boolean;
var
  i: Integer;
  VisTicket: TVisTicket;
begin
  Result:=False;
  if not Assigned(NumProject) then Exit;

  OptionsMod('load');
  // Set view mode
  ViewMode:='v';

  // Fill tickets list
  PagesArray.VisPagesList.Clear();
  cbbCurNum.Clear();
  for i:=0 to NumProject.NumPlanItems.Count-1 do
  begin
    VisTicket:=PagesArray.VisPagesList.AddNumPlanItem(NumProject.NumPlanItems[i]);
    VisTicketList.Add(VisTicket);
    cbbCurNum.AddItem(IntToStr(i+1), nil);
  end;
  VisTicketList.SortByOrder();
  PagesArray.VisPagesList.SortByOrder();
  if cbbCurNum.Items.Count>0 then cbbCurNum.ItemIndex:=0;

  SetPreviewParams();
  ShowPageTplName:=True;

  // Update preview
  UpdatePreview();
  Result:=True;
end;

procedure TframeNumOrder.SetPreviewParams();
var
  //Canvas: TCanvas;
  kx, ky: Real;
  PreviewSize: TSize;
  i, Cols: Integer;
  sx, sy: Integer;

begin
  // Назначаем расклад
  PagesArray.Clear();
  PagesArray.LayoutDirection:=LayoutDirection;
  if NumProject.Pages.Count=0 then Exit;
  Cols:=PagesInLine;
  if LayoutDirection = ldUpDown then
  begin
    PagesArray.Layout:=Point((NumProject.Pages.Count div Cols)+1, Cols);
  end
  else
  begin
    PagesArray.Layout:=Point(Cols, (NumProject.Pages.Count div Cols)+1)
  end;
  //for i:=0 to NumProject.Pages.Count-1 do PagesArray.AddItem(NumProject.Pages[i]);
  for i:=0 to PagesArray.VisPagesList.Count-1 do PagesArray.AddItem(PagesArray.VisPagesList.GetItem(i));

  // Вычислим размер расклада листов (в мм)
  sx:=0;
  sy:=0;
  for i:=0 to PagesArray.Layout.X-1 do
  begin
    sx:=sx+PagesArray.SizeX[i];
  end;
  for i:=0 to PagesArray.Layout.Y-1 do sy:=sy+PagesArray.SizeY[i];

  // Вычисляем коэффициент размера для базового масштаба
  // Масштаб считаем от минимального размера листа
  // чтобы лист не был слишком мелким на экране
  if PagesArray.MinItemSizeMM.X = 0 then Exit;
  if PagesArray.MinItemSizeMM.Y = 0 then Exit;
  kx := MinPageSize.X / PagesArray.MinItemSizeMM.X;
  ky := MinPageSize.Y / PagesArray.MinItemSizeMM.Y;

  // Задаем общий коэффициент базового масштаба и общий размер вида расклада
  with PreviewParams do
  begin
    if kx < ky then
    begin
      k:=kx*Scale;
    end
    else
    begin
      k:=ky*Scale;
    end;
    PreviewSize.cx:=Round(sx*k)+((PagesArray.Layout.X-1) * BetweenPages);
    PreviewSize.cy:=Round(sy*k)+((PagesArray.Layout.Y-1) * BetweenPages);
    CanvasSize.cx:=PreviewSize.cx+16;
    CanvasSize.cy:=PreviewSize.cy+16;

    SizeMm.cx:=sx;
    SizeMm.cy:=sy;

    // Границы рабочей области
    BordersRect.Left:=(CanvasSize.cx-PreviewSize.cx) div 2;
    BordersRect.Top:=(CanvasSize.cy-PreviewSize.cy) div 2;
    BordersRect.Right:=BordersRect.Left+PreviewSize.cx;
    BordersRect.Bottom:=BordersRect.Top+PreviewSize.cy;

    // Установим полный размер изображения
    pbPreview.Width:=CanvasSize.cx;
    pbPreview.Height:=CanvasSize.cy;
  end;
end;

procedure TframeNumOrder.DrawTicket(Canvas: TCanvas; BasePoint: TPoint; VisTicket: TVisTicket; Text: string);
var
  r: TRect;
  x,y,sx,sy: Integer;
  nx, ny, nsx, nsy: Integer;
begin
  if not Assigned(VisTicket) then Exit;
  with PreviewParams do
  begin
    x:=BasePoint.X+Round(VisTicket.Pos.X*k);
    y:=BasePoint.Y+Round(VisTicket.Pos.Y*k);
    sx:=Round(VisTicket.Size.X*k);
    sy:=Round(VisTicket.Size.Y*k);
    r:=Bounds(x, y, sx, sy);
    VisTicket.DrawRect:=r;
    SetPen(Canvas, clBlack, pmCopy, psSolid, 1);
    SetBrush(Canvas, clWhite, bsSolid);
    if VisTicket.Ordered then SetBrush(Canvas, clMoneyGreen, bsSolid);
    Canvas.Rectangle(r);
    if Length(Text)=0 then Text:=IntToStr(VisTicket.Order);
    nsx:=Canvas.TextWidth(Text);
    nsy:=Canvas.TextHeight(Text);
    nx:=x+((sx-nsx) div 2);
    ny:=y+((sy-nsy) div 2);
    Canvas.TextOut(nx, ny, Text);
  end;
end;

function TframeNumOrder.GetPageFromPos(Pos: TPoint): TVisNumPage;
var
  //RealPoint: TPoint;
  i: Integer;
  VisNumPage: TVisNumPage;
begin
  Result:=nil;
  // Вычисляем точку клика на холсте
  // Точка клика уже на холсте!

  // Находим нужный лист
  for i:=0 to PagesArray.VisPagesList.Count-1 do
  begin
    VisNumPage:=PagesArray.VisPagesList.GetItem(i);
    if PtInRect(VisNumPage.DrawRect, Pos) then
    begin
      Result:=VisNumPage;
      Exit;
    end;
  end;
end;

function TframeNumOrder.GetTicketFromPos(Pos: TPoint): TVisTicket;
var
  //RealPoint: TPoint;
  PointMM: TPoint;
  i: Integer;
  VisNumPage: TVisNumPage;
begin
  Result:=nil;
  // Вычисляем точку клика на холсте
  // Точка клика уже на холсте!

  // Находим нужный лист
  VisNumPage:=GetPageFromPos(Pos);
  if not Assigned(VisNumPage) then Exit;

  // Переводим точку клика в миллиметры внутри листа
  if PreviewParams.k = 0 then Exit;
  PointMM.X:=Round((Pos.X-VisNumPage.DrawRect.Left)/PreviewParams.k);
  PointMM.Y:=Round((Pos.Y-VisNumPage.DrawRect.Top)/PreviewParams.k);

  Result:=VisNumPage.GetTicketFromPos(PointMM);
end;

procedure TframeNumOrder.UpdatePreview();
var
  r, r1: TRect;
  x,y,sx,sy, i, ic, n, nc, m: Integer;
  ix, iy: Integer;
  Ticket: TTicket;
  TicketTpl: TTicketTpl;
  VisTicket, VisTicket2: TVisTicket;
  VisNumPage: TVisNumPage;
  Canvas: TCanvas;
  s: string;
  TempNpi, Npi2: TNumPlanItem;
  //LogFont: TLogFont;
  bmp: TBitmap;
begin
  //SetPreviewParams();
  with PreviewParams do
  begin
    VisibleRect:=sbPreview.ClientRect;
    OffsetRect(VisibleRect, sbPreview.HorzScrollBar.Position, sbPreview.VertScrollBar.Position);

    bmp:=TBitmap.Create();
    bmp.Width:=pbPreview.Width;
    bmp.Height:=pbPreview.Height;
    //Canvas:=imgPreview.Canvas;
    //Canvas:=pbPreview.Canvas;
    Canvas:=bmp.Canvas;
    Canvas.Lock();

    // Clear canvas
    SetBrush(Canvas, clWhite, bsSolid);
    Canvas.FillRect(Bounds(0, 0, CanvasSize.cx, CanvasSize.cy));

    //SetPen(Canvas, clBlack, pmCopy, psSolid, 1);
    //SetBrush(Canvas, clWhite, bsSolid);
    //Canvas.Rectangle(PreviewParams.BordersRect);

    // Draw pages
    ic:=0;
    for ix:=0 to PagesArray.Layout.X-1 do
    begin
      for iy:=0 to PagesArray.Layout.Y-1 do
      begin
        VisNumPage:=PagesArray[ix, iy];
        if not Assigned(VisNumPage) then Continue;
        // Page rectangle
        x:=BordersRect.Left+(Round(PagesArray.SizeX[ix]*k)*ix)+(BetweenPages*ix);
        y:=BordersRect.Top+(Round(PagesArray.SizeY[iy]*k)*iy)+(BetweenPages*iy);
        sx:=Round(VisNumPage.Size.X*k);
        sy:=Round(VisNumPage.Size.Y*k);
        r:=Bounds(x, y, sx, sy);
        VisNumPage.Visible:=IntersectRect(r1, VisibleRect, r);
        if not VisNumPage.Visible then Continue;

        SetPen(Canvas, clBlack, pmCopy, psSolid, 1);
        SetBrush(Canvas, clInfoBk, bsSolid);
        Canvas.Rectangle(r);
        VisNumPage.DrawRect:=r;

        if ShowPageTplName then
        begin
          s:=IntToStr(VisNumPage.Order)+' - '+VisNumPage.Name;
          Canvas.TextOut(x, y+Canvas.Font.Height, s);
        end;

        // Draw tickets
        for i:=0 to VisNumPage.VisTicketList.Count-1 do
        begin
          DrawTicket(Canvas, Point(x, y), (VisNumPage.VisTicketList[i] as TVisTicket), '');
        end;
        Inc(ic);
      end;
    end;

    // Draw arrows
    if actShowArrows.Checked then
    begin
      VisTicket2:=nil;
      VisTicket:=nil;
      for m:=0 to VisTicketList.Count-1 do
      begin
        if m>0 then VisTicket2:=VisTicket;
        VisTicket:=VisTicketList.GetItem(m);
        if not Assigned(VisTicket) then Continue;
        if not Assigned(VisTicket2) then Continue;
        if not VisTicket.VisNumPage.Visible then Continue;
        if not VisTicket2.VisNumPage.Visible then Continue;

        if m>0 then
        begin
          x:=VisTicket.DrawRect.Left+(VisTicket.DrawRect.Right-VisTicket.DrawRect.Left) div 2;
          y:=VisTicket.DrawRect.Top+(VisTicket.DrawRect.Bottom-VisTicket.DrawRect.Top) div 2;
          sx:=VisTicket2.DrawRect.Left+(VisTicket2.DrawRect.Right-VisTicket2.DrawRect.Left) div 2;
          sy:=VisTicket2.DrawRect.Top+(VisTicket2.DrawRect.Bottom-VisTicket2.DrawRect.Top) div 2;
          DrawArrowLine(Canvas, Point(x, y), Point(sx, sy), k);
        end;
      end;
    end;

    {$IFDEF DEBUG}
    {s:='VisibleRect=('
    +IntToStr(VisibleRect.Left)+','
    +IntToStr(VisibleRect.Top)+','
    +IntToStr(VisibleRect.Right)+','
    +IntToStr(VisibleRect.Bottom)+')';

    s:=s+'  VisiblePages='+IntToStr(ic);

    Core.StatusMsg(s);}
    {$ENDIF}

    BitBlt(pbPreview.Canvas.Handle, 0, 0, bmp.Width, bmp.Height, bmp.Canvas.Handle, 0, 0, SRCCOPY );
//    BitBlt(pbPreview.Canvas.Handle,
//          VisibleRect.Left,
//          VisibleRect.Top,
//          VisibleRect.Right-VisibleRect.Left,
//          VisibleRect.Bottom-VisibleRect.Top,
//          bmp.Canvas.Handle,
//          VisibleRect.Left,
//          VisibleRect.Top,
//          SRCCOPY );
  end;

  Canvas.Unlock();
  FreeAndNil(bmp);
end;


procedure TframeNumOrder.pbPreviewPaint(Sender: TObject);
begin
  UpdatePreview();
end;

procedure TframeNumOrder.pbPreviewMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
  VisTicket, VisTicket2: TVisTicket;
  s: string;
  n: Integer;
begin
  if Assigned(self.Parent) then Self.sbPreview.SetFocus(); // For mouse wheel handling
  VisTicket:=GetTicketFromPos(Point(X, Y));
  if not Assigned(VisTicket) then Exit;
  s:='x='+IntToStr(VisTicket.Pos.X)+' y='+IntToStr(VisTicket.Pos.Y)+' order='+IntToStr(VisTicket.Order);
  Core.AddCmd('STATUS '+s);

  if (ssLeft in Shift) then
  begin
    if (ssShift in Shift) or (actInvalidate.Checked) then
    begin
      if not VisTicket.Ordered then Exit;
      VisTicket.Ordered:=False;
      UndoList.Extract(VisTicket);
    end
    else
    begin
      if VisTicket.Ordered then Exit;
      VisTicket.Ordered:=True;
      n:=StrToIntDef(cbbCurNum.Text, 1);
      VisTicket2:=VisTicketList.GetItemByOrder(n);
      if Assigned(VisTicket2) then VisTicket2.Order:=VisTicket.Order;
      VisTicket.Order:=n;
      Inc(n);
      cbbCurNum.Text:=IntToStr(n);
      VisTicketList.SortByOrder();
      UndoList.Add(VisTicket);
      if UndoList.Count>0 then actUndo1.Enabled:=True;
    end;
    UpdatePreview();
  end;
end;

procedure TframeNumOrder.DummyAction(Sender: TObject);
begin
  //

end;

procedure TframeNumOrder.actlstNumOrderExecute(Action: TBasicAction;
  var Handled: Boolean);
var
  VisTicket: TVisTicket;
begin
  if Action = actOK then
  begin
    PagesArray.Save();
    OptionsMod('save');
    NumProject.NumPlanItems.SortByOrder();
    Core.AddCmd('REFRESH TICKETS_LIST');
    Core.AddCmd('REFRESH NUM_PLAN');
    Core.AddCmd('CLOSE '+IntToStr(PageID));
  end

  else if Action = actClose then
  begin
    Core.AddCmd('CLOSE '+IntToStr(PageID));
  end

  else if Action = actHelp then
  begin
    Application.HelpCommand(HELP_CONTEXT, 11);
  end

  else if Action = actZoomPlus then
  begin
    Scale:=Scale+0.2;
    SetPreviewParams();
    UpdatePreview();
  end

  else if Action = actZoomMinus then
  begin
    Scale:=Scale-0.2;
    if Scale=0 then Scale:=0.2;
    SetPreviewParams();
    UpdatePreview();
  end

  else if Action = actZoomFit then
  begin
    Scale:=1;
    SetPreviewParams();
    UpdatePreview();
  end

  else if Action = actOptions then
  begin
    rgLayout.ItemIndex:=Ord(LayoutDirection);
    nsePagesInLine.AsInteger:=PagesInLine;
    nseMinPageSizeX.AsInteger:=MinPageSize.X;
    nseMinPageSizeY.AsInteger:=MinPageSize.Y;
    nseBetweenPages.AsInteger:=BetweenPages;

    panOptions.Visible:=True;
  end

  else if Action = actOptionsOK then
  begin
    LayoutDirection:=ldUpDown;
    if rgLayout.ItemIndex=1 then LayoutDirection:=ldLeftRight;
    PagesInLine:=nsePagesInLine.AsInteger;
    MinPageSize.X:=nseMinPageSizeX.AsInteger;
    MinPageSize.Y:=nseMinPageSizeY.AsInteger;
    BetweenPages:=nseBetweenPages.AsInteger;

    panOptions.Visible:=False;
    SetPreviewParams();
    UpdatePreview();
  end

  else if Action = actOptionsCancel then
  begin
    panOptions.Visible:=False;
  end

  else if Action = actShowArrows then
  begin
    UpdatePreview();
  end

  else if Action = actInvalidate then
  begin

  end

  else if Action = actUndo1 then
  begin
    if UndoList.Count=0 then Exit;
    VisTicket:=UndoList.GetItem(UndoList.Count-1);
    if not VisTicket.Ordered then Exit;
    VisTicket.Ordered:=False;
    UndoList.Extract(VisTicket);
    if UndoList.Count=0 then actUndo1.Enabled:=False;
    UpdatePreview();
  end;
end;

procedure TframeNumOrder.sbPreviewMouseWheel(Sender: TObject;
  Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint;
  var Handled: Boolean);
begin
  //sbPreview.VertScrollBar.Position:=sbPreview.VertScrollBar.Position-WheelDelta;
  if WheelDelta > 0 then
  begin
    sbPreview.VertScrollBar.Position:=sbPreview.VertScrollBar.Position-20;
  end
  else if WheelDelta < 0 then
  begin
    sbPreview.VertScrollBar.Position:=sbPreview.VertScrollBar.Position+20;
  end;
end;

procedure TframeNumOrder.OptionsMod(Action: string);
var
  n: Integer;
  Options: TProjectOptionList;
begin
  if Action = 'load' then
  begin
    if not Assigned(NumProject) then Exit;
    Options:=NumProject.Options;

    n:=Ord(LayoutDirection);
    n:=StrToIntDef(Options.Params['order_layout_direction'], n);
    LayoutDirection := ldUpDown;
    if n = 1 then LayoutDirection := ldLeftRight;

    PagesInLine:=StrToIntDef(Options.Params['order_pages_in_line'], PagesInLine);
    MinPageSize.X:=StrToIntDef(Options.Params['order_min_page_size_x'], MinPageSize.X);
    MinPageSize.Y:=StrToIntDef(Options.Params['order_min_page_size_y'], MinPageSize.Y);
    BetweenPages:=StrToIntDef(Options.Params['order_between_pages'], BetweenPages);
  end

  else if Action = 'save' then
  begin
    if not Assigned(NumProject) then Exit;
    Options:=NumProject.Options;

    Options.Params['order_layout_direction']:=IntToStr(Ord(LayoutDirection));
    Options.Params['order_pages_in_line']:=IntToStr(PagesInLine);
    Options.Params['order_min_page_size_x']:=IntToStr(MinPageSize.X);
    Options.Params['order_min_page_size_y']:=IntToStr(MinPageSize.Y);
    Options.Params['order_between_pages']:=IntToStr(BetweenPages);
    Options.SaveToBase();
  end

  else if Action = 'init' then
  begin
    LayoutDirection := ldUpDown;
    PagesInLine:=5;
    MinPageSize:=Point(MIN_PAGE_X_PP, MIN_PAGE_Y_PP);
    BetweenPages:=BETWEEN_PAGES;
  end;
end;



end.
