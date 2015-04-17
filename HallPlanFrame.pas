unit HallPlanFrame;

interface

uses
  SysUtils, Windows, Classes, Graphics, Controls, Forms, Types,
  ComCtrls, ExtCtrls, StdCtrls, ToolWin, ItemsDef, Contnrs, ActnList,
  Dialogs, Messages, ImgList, ExtDlgs, CommCtrl, IniFiles, Menus, Spin,
  Buttons, Core, ResizeObject;

type
  TInfoStatus = record
    CountTotal : Integer; //всего
    CountSelct : Integer; //выбранных
  end;

  // резиновый прямоугольник
  TSelectionRect = class
  public
    R: TRect;
    StartPoint: TPoint;
    Selecting : Boolean;
    // Action: s-start, m-move, e-end
    procedure Modify(APoint: TPoint; Action: AnsiChar);
    procedure Draw(c: TCanvas);
    procedure NormalRect(const p: TPoint);
  end;

  // для перемещения
  TMoveItems = record
    PosLT : TPoint;
    PosMDown : TPoint;
    IsMoved : Boolean;
  end;

  //отмена очистки фона под PaintBox
  TPanelNoBkGnd = class(TPanel)
  public
    constructor Create(AOwner: TComponent); override;
    procedure NoBkGnd(var Msg: TWMEraseBkGnd); message WM_ERASEBKGND;
  end;

  TfrmHallPlan = class(TFrame)
    tlbHallPlan: TToolBar;
    btnFillItems: TToolButton;
    btnClearItems: TToolButton;
    grpProps: TGroupBox;
    grpHall: TGroupBox;
    spl1: TSplitter;
    lvPlaces: TListView;
    lvProps: TListView;
    btnSelectRegion: TToolButton;
    btnSelectRow: TToolButton;
    actlstHallPlan: TActionList;
    actFillItems: TAction;
    actClearItems: TAction;
    actSelectRow: TAction;
    actAlignSelectedX: TAction;
    actAlignSelectedY: TAction;
    actSelectRegion: TAction;
    actSelectSingle: TAction;
    actZoom100: TAction;
    actZoomPlus: TAction;
    actZoomMinus: TAction;
    actSaveToFile: TAction;
    actPrint: TAction;
    actColorSelect: TAction;
    btn1: TToolButton;
    btnSelectSingle: TToolButton;
    btn2: TToolButton;
    btnAlignSelectedX: TToolButton;
    btnAlignSelectedY: TToolButton;
    btn3: TToolButton;
    btnColorSelect: TToolButton;
    btnSaveToFile: TToolButton;
    btnPrint: TToolButton;
    btn4: TToolButton;
    btnZoom100: TToolButton;
    btnZoomPlus: TToolButton;
    btnZoomMinus: TToolButton;
    actSaveToBase: TAction;
    btnSaveToBase: TToolButton;
    actDrawGrid: TAction;
    btnDrawGrid: TToolButton;
    dlgColor: TColorDialog;
    pbHall: TPaintBox;
    btnAlignSelectedAlong: TToolButton;
    actAlignSelectedAlong: TAction;
    FImageListSmall: TImageList;
    dlgSave: TSavePictureDialog;
    ppmClearItems: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    actClearItemsSelect: TAction;
    btnSettings: TToolButton;
    actSettings: TAction;
    pSettings: TPanel;
    grpPlaceProps: TGroupBox;
    lbHeightPlace: TLabel;
    lbWidthPlace: TLabel;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    seWidthPlace: TSpinEdit;
    seHeightPlace: TSpinEdit;
    btnTypeView: TToolButton;
    actTypePaint: TAction;
    ScrollBox1: TScrollBox;
    grpHallProps: TGroupBox;
    lbHeightHall: TLabel;
    lbWidthHall: TLabel;
    seWidthHall: TSpinEdit;
    seHeightHall: TSpinEdit;
    pHallPosition: TPanel;
    grpHallPosition: TGroupBox;
    lPosY: TLabel;
    lPosX: TLabel;
    sePosHallX: TSpinEdit;
    sePosHallY: TSpinEdit;
    btnOkPos: TBitBtn;
    btnCancelPos: TBitBtn;
    btnNewPlace: TToolButton;
    actNewPlace: TAction;
    btnNewText: TToolButton;
    actNewText: TAction;
    Splitter1: TSplitter;
    StatusBar: TStatusBar;
    pmHall: TPopupMenu;
    miAddLabel: TMenuItem;
    miAddSeat: TMenuItem;
    miAddRow: TMenuItem;
    miN3: TMenuItem;
    miDeleteSelected: TMenuItem;
    actNewRow: TAction;
    btnHelp: TToolButton;
    actHelp: TAction;
    procedure imgHallMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgHallMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure imgHallMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnSaveClick(Sender: TObject);
    procedure DummyAction(Sender: TObject);
    procedure ClearItemAction(Sender: TObject);
    procedure actlstHallPlanExecute(Action: TBasicAction;
      var Handled: Boolean);
    procedure pbHallPaint(Sender: TObject);
    procedure lvPropsMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure lvPropsKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lvPropsExit(Sender: TObject);
    procedure lvPropsSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure btnOKClick(Sender: TObject);
    procedure btnOkPosClick(Sender: TObject);
    procedure lvPropsCustomDrawSubItem(Sender: TCustomListView;
      Item: TListItem; SubItem: Integer; State: TCustomDrawState;
      var DefaultDraw: Boolean);
    procedure lvPlacesData(Sender: TObject; Item: TListItem);
    procedure lvPlacesSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure sePosHallYChange(Sender: TObject);
    procedure seWidthPlaceKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
    bmp: TBitmap;
    pnlBkGnd : TPanelNoBkGnd;
    SelRect: TSelectionRect;
    MoveItems: TMoveItems;
    OldIndxListPlaces: Integer;
    ResizeHall: TResizeObject;
    InfoStatus: TInfoStatus;
    ClickPoint: TPoint;
    // Params
    PlaceSize : TPoint;
    HallSize : TPoint;
    FScale: Real;
    IsEdit: Boolean;
    GridStep: Integer;

	  FEdit : TEdit;
    FComboBox : TComboBox;
    FStateList: TStringDynArray;
	  FPanelExt : TPanel;
	  FEditExt : TEdit;
	  FButtonExt : TButton;
    FSpinEdit : TSpinEdit;

    function GetCountSelect():integer;
    function GetRectHallItem(const Item: THallItem):TRect;
    procedure SelectItemsInRect(const R: TRect; const MergeSelection: Boolean);
    function GetItemAtXY(X, Y: Integer; var indxItm: Integer): THallItem;
    procedure SetColorSelectItem(const clr : TColor);
    procedure RemoveSelectItem();
    procedure ResetSelectItem();
    procedure SelectItem4Row(const item : THallItem);
    procedure ShiftSelectItem(const dx: Integer; const dy: Integer);
    function NewHallItem(Pos: TPoint; NumPlanItem: TNumPlanItem; Color: TColor = clInfoBk; Order: Integer = 0; Kind: AnsiChar = 'S'): THallItem;
    procedure GetSnapPoint(const X: Integer; const Y: Integer; var dx: Integer; var dy : Integer);
    procedure ReadHallItemProps(Item: THallItem; const redraw:Boolean=False);
    procedure FillItemsWithRows();
    procedure FillItems();
    function ClearAllItems(): boolean;
    procedure SaveToFileHallPlan();
    procedure EnableControl();
    procedure DrawGrid(var cnvs: TCanvas; const xPoint : Integer; const yPoint: Integer);
    procedure DrawHallItem(var c: TCanvas; Item: THallItem);
    procedure DrawHallPlan();
    procedure UpdateSizeHall;
    procedure ResizedHallPlan(const val : TRect);
    procedure SetScale(val: Real);
    property Scale: Real read FScale write SetScale;
    procedure AlignSelected(Action: string);

    procedure HideAllTypeControl();
    procedure FillDataToControl(const indxItem :Integer);
    procedure ParamsMod(Action: string);
    procedure SetValueSelectedHallItems(const indxProp :Integer; const propName:String; const textValue:String);
    procedure SetNewItemsValue(const indxProp :Integer; const textValue:String);
    procedure InitEditControl();
    procedure InitPanelPath(var edit: TEdit; var panel: TPanel; var button: TButton);
    procedure RemoveEditControl();
    procedure ComboBoxExit(Sender: TObject);
    procedure EditExit(Sender: TObject);
    procedure FComboBoxKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FEditExtKeyUp(Sender: TObject; var Key: Word;  Shift: TShiftState);
    procedure FSpinEditKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ListViewKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EditNumericKeyPress(Sender: TObject; var Key: Char);
    procedure ButtonPosExtClick(Sender: TObject);
    procedure ButtonColorExtClick(Sender: TObject);
    procedure EditExtExit(Sender: TObject);
    procedure SpinEditExit(Sender: TObject);
    procedure SpinEditChange(Sender: TObject);
    procedure AddStateList(const val : String);
    procedure FillComboBox(var CmbBox : TComboBox);

    procedure SetParametrsStatusBar(extraText : string = '');
  protected
    FListViewOldWndProc : TWndMethod;                 //для отрисовки элементов в списке задач при изменении ширины колонки - старый метод
    procedure ListViewNewWndProc(var Msg: TMessage); //ловим сообщения для см. на 1строку выше
    procedure RedrawTypeContols();
  public
    { Public declarations }
    Form: TForm;
    Project: TNumProject;
    HallPlan: THallPlan;
//    CurHallItem: THallItem;
    //Params: TParamHallPlan;
//    SnapToGrid: Boolean;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy(); override;
    procedure ClearListViewData(var listVeiw : TListView);
    procedure UpdatePreview();
    procedure ChangeLanguege;
    function Start(): boolean;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  end;

  const
    SEAT_SIZE : Integer = 16; //размер квадрата ячейки (места)
    HALL_SIZE : Integer = 50; //размер квадрата зала(минимальный)
    WIDTH_COLUMN : Integer = 20;    //ширина колонки для названий параметров(первоначальная)
    WIDTH_COLUMN_CAPTION : Integer = 140;    //ширина колонки для названий параметров(первоначальная)
    WIDTH_VSCROLL : Integer = 32;  	 //ширина сколлбара
    WIDTH_IMAGE : Integer = 20;  	 //ширина  иконки для имитации ChecBox(a)
    HEIGHT_IMAGE : Integer = 20;  	 //высота иконки для имитации ChecBox(a)
    WIDTH_BUTTON  : Integer = 25; //ширина кнопки открытия диалога выбора файла/директории
    SHIFT_BODER : Integer = 2;			     //смещение для размещения кнопки
    LABEL_XSIZE: Integer = 50;
    KIND_TEXT : AnsiChar = 'T';   //(1)текстовый вид элемента зала (по умолчанию стандартное)
    KIND_PLACE: AnsiChar = 'S';
  var
    HallPlanCreated: Boolean = False;

implementation
uses MainForm, StoHtmlHelp;

{$R *.dfm}
(*
constructor TPanelEraseBkgnd.Create(AOwner: TComponent);
begin
  inherited;
  Ctl3D := false;
  BorderStyle := bsNone;
end;
procedure TPanelEraseBkgnd.WMEraseBkgnd(var Msg: TWMEraseBkgnd);
begin
  Msg.Result :=1;
end;
(**)
// === TSelectionRect ===


procedure TfrmHallPlan.ChangeLanguege;
var
  Part: string;
begin
  if not Assigned(LangFile) then Exit;
  if HallPlanCreated then
  begin
    Part:='HallPlan';
    Self.btnFillItems.Caption:= LangFile.ReadString(Part, 'sbtnFillItems', btnFillItems.Caption);
    Self.btnFillItems.Hint:= LangFile.ReadString(Part, 'hbtnFillItems', btnFillItems.Hint);
    Self.btnClearItems.Caption:= LangFile.ReadString(Part, 'sbtnClearItems', btnClearItems.Caption);
    Self.btnClearItems.Hint:= LangFile.ReadString(Part, 'hbtnClearItems', btnClearItems.Hint);
    Self.btnSelectSingle.Caption:= LangFile.ReadString(Part, 'sbtnSelectSingle', btnSelectSingle.Caption);
    Self.btnSelectSingle.Hint:= LangFile.ReadString(Part, 'hbtnSelectSingle', btnSelectSingle.Hint);
    Self.btnSelectRow.Caption:= LangFile.ReadString(Part, 'sbtnSelectRow', btnSelectRow.Caption);
    Self.btnSelectRow.Hint:= LangFile.ReadString(Part, 'hbtnSelectRow', btnSelectRow.Hint);
    Self.btnSelectRegion.Caption:= LangFile.ReadString(Part, 'sbtnSelectRegion', btnSelectRegion.Caption);
    Self.btnSelectRegion.Hint:= LangFile.ReadString(Part, 'hbtnSelectRegion', btnSelectRegion.Hint);
    Self.btnDrawGrid.Caption:= LangFile.ReadString(Part, 'sbtnDrawGrid', btnDrawGrid.Caption);
    Self.btnDrawGrid.Hint:= LangFile.ReadString(Part, 'hbtnDrawGrid', btnDrawGrid.Hint);
    Self.btnAlignSelectedX.Caption:= LangFile.ReadString(Part, 'sbtnAlignSelectedX', btnAlignSelectedX.Caption);
    Self.btnAlignSelectedX.Hint:= LangFile.ReadString(Part, 'hbtnAlignSelectedX', btnAlignSelectedX.Hint);
    Self.btnAlignSelectedY.Caption:= LangFile.ReadString(Part, 'sbtnAlignSelectedY', btnAlignSelectedY.Caption);
    Self.btnAlignSelectedY.Hint:= LangFile.ReadString(Part, 'hbtnAlignSelectedY', btnAlignSelectedY.Hint);
    Self.btnColorSelect.Caption:= LangFile.ReadString(Part, 'sbtnColorSelect', btnColorSelect.Caption);
    Self.btnColorSelect.Hint:= LangFile.ReadString(Part, 'hbtnColorSelect', btnColorSelect.Hint);
    Self.btnSaveToFile.Caption:= LangFile.ReadString(Part, 'sbtnSaveToFile', btnSaveToFile.Caption);
    Self.btnSaveToFile.Hint:= LangFile.ReadString(Part, 'hbtnSaveToFile', btnSaveToFile.Hint);
    Self.btnSaveToBase.Caption:= LangFile.ReadString(Part, 'sbtnSaveToBase', btnSaveToBase.Caption);
    Self.btnSaveToBase.Hint:= LangFile.ReadString(Part, 'hbtnSaveToBase', btnSaveToBase.Hint);
    Self.btnPrint.Caption:= LangFile.ReadString(Part, 'sbtnPrint', btnPrint.Caption);
    Self.btnPrint.Hint:= LangFile.ReadString(Part, 'hbtnPrint', btnPrint.Hint);
    Self.btnZoom100.Caption:= LangFile.ReadString(Part, 'sbtnZoom100', btnZoom100.Caption);
    Self.btnZoom100.Hint:= LangFile.ReadString(Part, 'hbtnZoom100', btnZoom100.Hint);
    Self.btnZoomPlus.Caption:= LangFile.ReadString(Part, 'sbtnZoomPlus', btnZoomPlus.Caption);
    Self.btnZoomPlus.Hint:= LangFile.ReadString(Part, 'hbtnZoomPlus', btnZoomPlus.Hint);
    Self.btnZoomMinus.Caption:= LangFile.ReadString(Part, 'sbtnZoomMinus', btnZoomMinus.Caption);
    Self.btnZoomMinus.Hint:= LangFile.ReadString(Part, 'hbtnZoomMinus', btnZoomMinus.Hint);
    Self.grpHall.Caption:= LangFile.ReadString(Part, 'sgrpHall', grpHall.Caption);
    Self.grpProps.Caption:= LangFile.ReadString(Part, 'sgrpProps', grpProps.Caption);
    Self.lvPlaces.Columns[0].Caption:= LangFile.ReadString(Part, 'slvPlaces_0', lvPlaces.Columns[0].Caption);
    Self.lvPlaces.Columns[1].Caption:= LangFile.ReadString(Part, 'slvPlaces_1', lvPlaces.Columns[1].Caption);
    Self.lvPlaces.Columns[2].Caption:= LangFile.ReadString(Part, 'slvPlaces_2', lvPlaces.Columns[2].Caption);
    Self.lvProps.Columns[0].Caption:= LangFile.ReadString(Part, 'slvProps_0', lvProps.Columns[0].Caption);
    Self.lvProps.Columns[1].Caption:= LangFile.ReadString(Part, 'slvProps_1', lvProps.Columns[1].Caption);

    Self.Form.Caption:= sHallPlanPageName;
  end;
end;

// === TSelectionRect ===
procedure TSelectionRect.Modify(APoint: TPoint; Action: AnsiChar);
begin
  if Action='s' then // start
  begin
    StartPoint:=APoint;
    Selecting := True;
    R := Bounds(0, 0, 0, 0);
  end
  else if Action='m' then // move
  begin
    if PointsEqual(StartPoint, Point(0,0)) then Exit;
    //R:=Bounds(StartPoint.X, StartPoint.Y, (APoint.X-StartPoint.X), (APoint.Y-StartPoint.Y));
    NormalRect(APoint);
  end
  else if Action='e' then // end
  begin
    StartPoint:=Point(0,0);
    Selecting := False;
    R := Bounds(0, 0, 0, 0);
  end;
end;

procedure TSelectionRect.Draw(c: TCanvas);
begin
  if EqualRect(R, Rect(0,0,0,0)) then Exit;
  c.Pen.Style := psDot;
  c.Pen.Color := clGray;
  c.Pen.Mode  := pmXor;
  c.Pen.Width := 1;
  c.Brush.Style := bsClear;
  c.Rectangle(R);
end;

procedure TSelectionRect.NormalRect(const p: TPoint);
begin
  if StartPoint.X < p.X then
  begin
    R.Left := StartPoint.X;
    R.Right := p.X;
  end
  else
  begin
    R.Left := p.X;
    R.Right := StartPoint.X;
  end;

  if StartPoint.Y < p.Y then
  begin
    R.Top := StartPoint.Y;
    R.Bottom := p.Y;
  end
  else
  begin
    R.Top := p.Y;
    R.Bottom := StartPoint.Y;
  end;
end;

// === TPanelNoBkGnd ===
constructor TPanelNoBkGnd.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Self.BorderStyle := bsNone;
  Self.Align := alNone;//alClient;
end;
procedure TPanelNoBkGnd.NoBkGnd(var Msg: TWMEraseBkGnd);
begin
  Msg.Result := 1;
end;

// === TfrmHallPlan ===
constructor TfrmHallPlan.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  //дополнительный буфер для отрисовки
  bmp:=TBitmap.Create();
  bmp.Height:=grpHall.ClientHeight;
  bmp.Width:=grpHall.ClientWidth;

  SelRect:=TSelectionRect.Create();

  dlgColor.CustomColors.Add('ColorA='+IntToHex(clInfoBk, 6));
  dlgColor.CustomColors.Add('ColorB='+IntToHex(clHotLight, 6));
  dlgColor.CustomColors.Add('ColorC='+IntToHex(clMoneyGreen, 6));
  dlgColor.CustomColors.Add('ColorD='+IntToHex(clSkyBlue, 6));
  dlgColor.CustomColors.Add('ColorE='+IntToHex(clTeal, 6));
  dlgColor.CustomColors.Add('ColorF='+IntToHex(clAqua, 6));
  dlgColor.CustomColors.Add('ColorG='+IntToHex(clMedGray, 6));

  actSelectSingle.Checked:=True;
  actDrawGrid.Checked:=True;

  //InitParamHallPlan();
  FScale:=1;

  IsEdit:=true;
  ParamsMod('init');

  // Установка границ значений настроек
  seWidthPlace.MinValue := SEAT_SIZE;
  seHeightPlace.MinValue := SEAT_SIZE;
  seWidthPlace.MaxValue := 10*SEAT_SIZE;
  seHeightPlace.MaxValue := 10*SEAT_SIZE;

  seWidthHall.MinValue := HALL_SIZE;
  seHeightHall.MinValue := HALL_SIZE;
  seWidthHall.MaxValue := 1000*HALL_SIZE;
  seHeightHall.MaxValue := 1000*HALL_SIZE;

  EnableControl();
  OldIndxListPlaces := -1;

  //добавляется панель с отменой отрисовки фона
  pnlBkGnd := TPanelNoBkGnd.Create(Self);
  pnlBkGnd.DoubleBuffered := true;
  pnlBkGnd.Width := HallSize.X;
  pnlBkGnd.Height := HallSize.Y;
  pnlBkGnd.Left:= 0;
  pnlBkGnd.Top:= 0;
  pnlBkGnd.Parent := pbHall.Parent;
  pbHall.Parent := pnlBkGnd;

  // Рамка изменения размера зала
  ResizeHall := TResizeObject.Create(pbHall.ClientRect, pnlBkGnd.Parent, pnlBkGnd.Canvas);
  ResizeHall.Spots := [ksLeft, ksLeftTop, ksLeftBottom, ksTop, ksTopRight, ksRight, ksBottom, ksBottomRight];
  ResizeHall.OnResized := ResizedHallPlan;
  ScrollBox1.DoubleBuffered := true;

  //редактирование параметров
  FListViewOldWndProc := lvProps.WindowProc;
  lvProps.WindowProc   := ListViewNewWndProc;
  InitEditControl();

  // Размеры панели кнопок - сбиваются в IDE
  tlbHallPlan.ButtonHeight:=24;
  tlbHallPlan.ButtonWidth:=24;
  tlbHallPlan.Height:=26;

  //Локализация
  HallPlanCreated:=True;
  ChangeLanguege;
end;

destructor TfrmHallPlan.Destroy();
begin
  FreeAndNil(SelRect);
  RemoveEditControl();
  lvProps.WindowProc    := FlistViewOldWndProc;
  FListViewOldWndProc  := nil;

  ClearListViewData(lvProps);
  bmp.Free();
  SetLength(FStateList,0);
  inherited Destroy();

  HallPlanCreated:= False;
end;

procedure TfrmHallPlan.AlignSelected(Action: string);
var
  cntPoint : Integer;
  i: Integer;
  l: Double;
  ItemA, ItemB, TempItem: THallItem;

  procedure PerpendicularLine(var posItem : TPoint);
  var
    tmpPoint : TPoint;
    r       : Double;
  begin
    r := ((ItemA.Position.Y - posItem.Y)*(ItemA.Position.Y - ItemB.Position.Y) - (ItemA.Position.X - posItem.X)*(ItemB.Position.X - ItemA.Position.X))/(l*l);
    tmpPoint.X := Round(ItemA.Position.X + r*(ItemB.Position.X - ItemA.Position.X));
    tmpPoint.Y := Round(ItemA.Position.Y + r*(ItemB.Position.Y - ItemA.Position.Y));
    posItem.X := tmpPoint.X;
    posItem.Y := tmpPoint.Y;
  end;

begin
  //if (FItemA = nil) or (FItemB = nil) then Exit;
  cntPoint := HallPlan.Count;
  if (cntPoint < 2) then Exit;

  // Находим верхний левый и нижний правый объекты
  ItemA:=nil;
  ItemB:=nil;
  for i:=0 to cntPoint-1 do
  begin
    TempItem:=HallPlan.Items[i];
    if TempItem.Selected then
    begin
      if ItemA = nil then
      begin
        ItemA:=TempItem;
        ItemB:=TempItem;
      end;

      if (TempItem.Position.X < ItemA.Position.X)
      or (TempItem.Position.Y < ItemA.Position.Y)
      then ItemA:=TempItem;

      if (TempItem.Position.X > ItemB.Position.X)
      or (TempItem.Position.Y > ItemB.Position.Y)
      then ItemB:=TempItem;
    end;
  end;
  if ItemA=ItemB then Exit;

  if Action = 'horizontal' then
  begin
    for i:=0 to cntPoint-1 do
      if HallPlan.Items[i].Selected then
      begin
        HallPlan.Items[i].Position.Y := ItemA.Position.Y;
      end;
  end

  else if Action = 'vertical' then
  begin
    for i:=0 to cntPoint-1 do
      if HallPlan.Items[i].Selected then
      begin
        HallPlan.Items[i].Position.X := ItemA.Position.X;
      end;
  end

  else if Action = 'line' then
  begin
    if (cntPoint < 3) then Exit;
    l := Sqrt(Sqr(ItemA.Position.X - ItemB.Position.X) + Sqr(ItemA.Position.Y - ItemB.Position.Y));
    if (l = 0) then Exit;
    for i:=0 to cntPoint-1 do
      if HallPlan.Items[i].Selected then
      begin
        PerpendicularLine(HallPlan.Items[i].Position);
      end;
  end;
end;

procedure TfrmHallPlan.ClearListViewData(var listVeiw : TListView);
 var
   i     : Integer;
   Count : Integer;
begin
  //очищаем деревья
  Count := listVeiw.Items.Count-1;
  for i := 0 to Count do
    if listVeiw.Items.Item[i].Data <> nil
    then  //ссылка на объект только у не корневых элементов
    begin
      Dispose(listVeiw.Items.Item[i].Data);
      listVeiw.Items.Item[i].Data := nil;
    end;
end;

procedure TfrmHallPlan.SetValueSelectedHallItems(const indxProp :Integer; const propName:String; const textValue:String);
  var
    i : Integer;
    n : Integer;

  procedure SetValuedHallItem();
  begin
    case indxProp of
    0:
      begin
        //HallPlan.Items[i].Position := StrToPos(textValue);
        HallPlan.Items[i].Position.X := StrToInt(textValue);
      end;
    1:
      begin
        HallPlan.Items[i].Position.Y := StrToInt(textValue);
      end;
    2:
      begin
        HallPlan.Items[i].Color := StrToIntDef(textValue, lvProps.Color);
      end;
    3:
      begin
        if lvProps.Tag = 0
        then HallPlan.Items[i].State := textValue
        else HallPlan.Items[i].ParamsText := textValue;

      end;
    4:
      begin
        HallPlan.Items[i].Order := StrToIntDef(textValue, 0)
      end;
    5:
      begin
        HallPlan.Items[i].NumPlanItem.State := textValue;
      end;
    else
      begin
        HallPlan.Items[i].NumPlanItem.DataValue[propName] := textValue;;
      end;
    (*
    6:
      begin
        HallPlan.Items[i].Row := StrToIntDef(textValue, 0);
      end;
      (**)
    end;
  end;

begin
  try
    Screen.Cursor := crHourGlass;
    n := HallPlan.Count-1;
    for i:=0 to n do
      with HallPlan.Items[i] do
      begin
        if HallPlan.Items[i].Selected then
        begin
           SetValuedHallItem();
        end;
      end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmHallPlan.SetNewItemsValue(const indxProp :Integer; const textValue:String);
begin
  lvProps.Items[indxProp].SubItems.Strings[0] := textValue;
  SetValueSelectedHallItems(indxProp, lvProps.Items[indxProp].Caption, textValue);
end;

procedure TfrmHallPlan.InitEditControl();
begin
  FComboBox := TComboBox.Create(Self);
  FComboBox.Width := WIDTH_COLUMN;
  FComboBox.OnExit := ComboBoxExit;
  FComboBox.OnKeyUp := FComboBoxKeyUp;

  FEdit := TEdit.Create(Self);
  FEdit.Width := WIDTH_COLUMN;
  FEdit.OnExit := EditExit;
  FEdit.OnKeyUp := FEditExtKeyUp;

  InitPanelPath(FEditExt, FPanelExt, FButtonExt);
  FEditExt.OnExit :=  EditExtExit;
  FEditExt.OnKeyUp := FEditExtKeyUp;
  FButtonExt.OnExit := EditExtExit;

  FSpinEdit := TSpinEdit.Create(Self);
  FSpinEdit.Width := WIDTH_COLUMN;
  FSpinEdit.OnExit := SpinEditExit;
  FSpinEdit.OnKeyUp := FSpinEditKeyUp;
end;

procedure TfrmHallPlan.InitPanelPath(var edit: TEdit; var panel: TPanel; var button: TButton);
begin
	edit := TEdit.Create(Self);
	edit.Width := WIDTH_COLUMN_CAPTION;
	edit.Visible := true;
  edit.ReadOnly := true;

	panel := TPanel.Create(Self);
	panel.SetBounds(0,0,edit.Width,edit.Height);
	panel.Visible := false;
	panel.BevelInner  := bvNone;
	panel.BevelOuter  := bvNone;
	panel.BorderStyle := bsNone;

	edit.Parent := panel;
	edit.Align  := alClient;

	button := TButton.Create(Self);
	button.Parent := panel;
	button.Anchors := [akTop , akRight , akBottom];
	button.SetBounds(edit.Width-WIDTH_BUTTON-SHIFT_BODER,
							  SHIFT_BODER,WIDTH_BUTTON,edit.Height-2*SHIFT_BODER);
	button.Visible := true;
	button.Caption := '...';
	button.BringToFront();
end;

procedure TfrmHallPlan.RemoveEditControl();
begin
  FreeAndNil(FComboBox);
  FreeAndNil(FEdit);
  FreeAndNil(FEditExt);
  FreeAndNil(FButtonExt);
  FreeAndNil(FPanelExt);
  FreeAndNil(FSpinEdit);
end;

procedure TfrmHallPlan.ComboBoxExit(Sender: TObject);
begin
  if FComboBox.Tag<0 then Exit;
	//Перебросим выбранное значение из ComboBox в таблицу
  AddStateList(lvProps.Items[FComboBox.Tag].SubItems.Strings[0]);
	SetNewItemsValue(FComboBox.Tag, lvProps.Items[FComboBox.Tag].SubItems.Strings[0]);
	FComboBox.Visible := false;
end;

procedure TfrmHallPlan.EditExit(Sender: TObject);
begin
  if FEdit.Tag<0 then Exit;
	//Перебросим выбранное значение из Edit в таблицу
	SetNewItemsValue(FEdit.Tag, lvProps.Items[FEdit.Tag].SubItems.Strings[0]);
	FEdit.Visible := false;
end;

procedure TfrmHallPlan.FComboBoxKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
  VK_ESCAPE :
    begin
      if (lvProps.Selected <> nil)then
      begin
        FComboBox.Tag := -1;
        HideAllTypeControl();
      end;
    end;
  VK_RETURN :
    begin
        lvProps.Selected.SubItems.Strings[0] := FComboBox.Text;
        lvPropsExit(lvProps);
    end;
  end;
end;

procedure TfrmHallPlan.FEditExtKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
  VK_ESCAPE :
    begin
      if (lvProps.Selected <> nil)then
      begin
        (Sender as TEdit).Tag := -1;
        HideAllTypeControl();
      end;
    end;
  VK_RETURN :
    begin
        lvProps.Selected.SubItems.Strings[0] := (Sender as TEdit).Text;
        lvPropsExit(lvProps);
    end;
  end;
end;

procedure TfrmHallPlan.FSpinEditKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
  VK_ESCAPE :
    begin
      if (lvProps.Selected <> nil)then
      begin
        lvPropsExit(lvProps);
      end;
    end;
  VK_RETURN :
    begin
        lvProps.Selected.SubItems.Strings[0] := IntToStr(FSpinEdit.Value);
        lvPropsExit(lvProps);
    end;
  end;
end;

procedure TfrmHallPlan.ListViewKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  var
    oldVal : String;
begin
  case Key of
  VK_ESCAPE :
    begin
      if (lvProps.Selected <> nil)then
      begin
        //сначало запоминаем старое значение
        oldVal := lvProps.Selected.SubItems.Strings[0];
        //скрываем контрол
        lvPropsExit(lvProps);
        //возвращаем значение на место
        lvProps.Selected.SubItems.Strings[0] := oldVal;
      end;
    end;
  VK_RETURN :
    begin
      lvPropsExit(lvProps);
    end;
  end;
end;

procedure TfrmHallPlan.EditNumericKeyPress(Sender: TObject; var Key: Char);
begin
 if not (Key in ['0'..'9',#8]) then Key := #0;
end;

procedure TfrmHallPlan.ButtonPosExtClick(Sender: TObject);
var
//  posItm : TPoint;
  posVal : TPoint;
  rItem : TRect;
  posParent : TPoint;

begin
  if (lvProps.Selected = nil) then Exit;
//  pHallPosition.Parent := lvProps;

//  posItm := lvProps.Selected.GetPosition;
	rItem := lvProps.Selected.DisplayRect(drBounds);

	inc(rItem.Left, lvProps.Columns.Items[0].Width);
  inc(rItem.Top, HEIGHT_IMAGE);
  posParent :=lvProps.ClientToParent(Point(rItem.Left, rItem.Top));
  pHallPosition.Left := posParent.X;
  pHallPosition.Top := posParent.Y;

  posVal := StrToPos(lvProps.Selected.SubItems.Strings[0]);
  sePosHallX.Value := posVal.X;
  sePosHallY.Value := posVal.Y;

  pHallPosition.Visible := true;
end;

procedure TfrmHallPlan.ButtonColorExtClick(Sender: TObject);
var
//  posItm : TPoint;
//  posVal : TPoint;
  rItem : TRect;
  posParent : TPoint;

begin
  if (lvProps.Selected = nil) then Exit;

	rItem := lvProps.Selected.DisplayRect(drBounds);

	inc(rItem.Left, lvProps.Columns.Items[0].Width);
  inc(rItem.Top, HEIGHT_IMAGE);
  posParent :=lvProps.ClientToParent(Point(rItem.Left, rItem.Top));

  dlgColor.Color := StrToIntDef(lvProps.Selected.SubItems.Strings[0], lvProps.Color);
  if not dlgColor.Execute() then Exit;

  FEditExt.Text := IntToStr(dlgColor.Color);
  lvProps.Selected.SubItems.Strings[0] := FEditExt.Text;
  EditExtExit(FEditExt);

  SetColorSelectItem(dlgColor.Color);
  UpdatePreview();
end;

procedure TfrmHallPlan.EditExtExit(Sender: TObject);
begin
  if FEditExt.Tag<0 then Exit;
	//Перебросим выбранное значение из Edit в таблицу
	SetNewItemsValue(FEditExt.Tag, lvProps.Items[FEditExt.Tag].SubItems.Strings[0]);
	FPanelExt.Visible := false;
  UpdatePreview();
end;

procedure TfrmHallPlan.SpinEditExit(Sender: TObject);
  function CheckOrderValue(const val : integer):Boolean;
  begin
    Result := false;
  end;
begin
  if FSpinEdit.Tag<0 then Exit;
  if (FSpinEdit.Tag = 0) or (FSpinEdit.Tag = 1) then
  begin
	  SetNewItemsValue(FSpinEdit.Tag, lvProps.Items[FSpinEdit.Tag].SubItems.Strings[0]);
  end
  else if CheckOrderValue(StrToIntDef(lvProps.Items[FSpinEdit.Tag].SubItems.Strings[0],-1)) then
  begin
	  SetNewItemsValue(FSpinEdit.Tag, lvProps.Items[FSpinEdit.Tag].SubItems.Strings[0]);
  end;
	FSpinEdit.Visible := false;
  UpdatePreview();
end;

procedure TfrmHallPlan.SpinEditChange(Sender: TObject);
begin
  if FSpinEdit.Text = lvProps.Items[FSpinEdit.Tag].SubItems.Strings[0] then Exit;
  SetValueSelectedHallItems(FSpinEdit.Tag, lvProps.Items[FSpinEdit.Tag].Caption, IntToStr(FSpinEdit.Value));
  UpdatePreview();
end;


procedure TfrmHallPlan.AddStateList(const val : String);
var
  n:Integer;
  i:Integer;
  isFind:Boolean;
begin
  if Trim(val)='' then Exit;
  isFind:= false;
  n := Length(FStateList)-1;
  for i:=0 to n do
  if FStateList[i] = val then
  begin
    isFind := true;
    Break;
  end;
  if not isFind then
  begin
    n := Length(FStateList);
    SetLength(FStateList, n+1);
    FStateList[n] := val;
  end;
end;

procedure TfrmHallPlan.FillComboBox(var CmbBox : TComboBox);
var
  nItem : Integer;
  iItem : Integer;

begin
  nItem := Length(FStateList)-1;
  CmbBox.Items.Clear;
  for iItem := 0 to nItem do
  begin
    CmbBox.Items.Add(FStateList[iItem]);
  end;
end;

procedure TfrmHallPlan.SetParametrsStatusBar(extraText : string = '');
begin
  StatusBar.Panels.Items[0].Text := Format('Выбранных мест: %d из %d',[InfoStatus.CountSelct,InfoStatus.CountTotal]);
  StatusBar.Panels.Items[1].Text := extraText;
  StatusBar.Refresh;
end;//SetParametrsStatusBar

procedure TfrmHallPlan.ListViewNewWndProc(var Msg: TMessage);
//для отрисовки элементов в списке задач при изменении полжения элементов
var
  hdn : ^THDNotify;
begin
  if Msg.Msg = WM_NOTIFY then
  begin
    hdn := Pointer(Msg.lParam);
    if (hdn.hdr.code = HDN_ITEMCHANGING) or (hdn.hdr.code = HDN_ITEMCHANGINGW) or (hdn.hdr.code = HDN_ITEMCHANGEDW)or
       (hdn.hdr.code = HDN_TRACK) or (hdn.hdr.code = HDN_ENDTRACK) or (hdn.hdr.code = HDN_BEGINTRACK)
    then
    begin
      RedrawTypeContols;
    end;
  end
  else
    if (Msg.Msg = WM_HScroll)
       or
        (Msg.Msg = WM_VScroll)
       or
        (Msg.Msg = WM_SIZE)
       or
        (Msg.Msg = WM_MOUSEWHEEL)
    then
    begin
     RedrawTypeContols;
    end;
  FListViewOldWndProc(Msg);
end;

procedure TfrmHallPlan.RedrawTypeContols();
  var
    rItem : TRect;
begin
  //перерисовываем элементы редактирования
	if (lvProps.Selected <> nil) then
	begin
		rItem := lvProps.Selected.DisplayRect(drBounds);
		inc(rItem.Left, lvProps.Columns.Items[0].Width);
		if (FComboBox.Visible) then FComboBox.BoundsRect := rItem;
		if (FEdit.Visible)     then FEdit.BoundsRect := rItem;
		if (FPanelExt.Visible) then FPanelExt.BoundsRect := rItem;
		if (FSpinEdit.Visible) then FSpinEdit.BoundsRect := rItem;
	end;
end;

function TfrmHallPlan.GetCountSelect(): integer;
var
  i, n: integer;
begin
  Result:=0;
  n := HallPlan.Count-1;
  for i:=0 to n do
  begin
    if HallPlan.Items[i].Selected then Inc(Result);
  end;
end;

function TfrmHallPlan.GetRectHallItem(const Item: THallItem): TRect;
begin
  if Item.Kind = KIND_TEXT
  then
    Result := Bounds(
      Round(Item.Position.X*Scale),
      Round(Item.Position.Y*Scale),
      Round(pbHall.Canvas.TextWidth(Item.ParamsText)*Scale),
      Round(pbHall.Canvas.TextHeight(Item.ParamsText)*Scale)
    )
  else
    Result := Bounds(
      Round(Item.Position.X*Scale),
      Round(Item.Position.Y*Scale),
      Round(PlaceSize.X*Scale),
      Round(PlaceSize.Y*Scale)
    );
end;

procedure TfrmHallPlan.SelectItemsInRect(const R: TRect; const MergeSelection: Boolean);
var
  i, n: integer;
  res: TRect;
  isSel: Boolean;
begin
  with HallPlan do
  begin
    n := Count-1;
    for i:=0 to n do
    begin
      isSel := IntersectRect(res, GetRectHallItem(Items[i]), R);
      if (not MergeSelection) or isSel then Items[i].Selected := isSel;
    end;
  end;
end;

function TfrmHallPlan.GetItemAtXY(X, Y: Integer; var indxItm: Integer): THallItem;
var
  i, n: integer;
  LocPoint: TPoint;
begin
  Result:=nil;
  indxItm := -1;
  LocPoint.X:=X;
  LocPoint.Y:=Y;
  n := HallPlan.Count-1;
  for i:=0 to n do
  begin
    if PtInRect(GetRectHallItem(HallPlan.Items[i]), LocPoint) then
    begin
      Result:=HallPlan.Items[i];
      indxItm := i;
      Break;
    end;
  end;
end;

procedure TfrmHallPlan.SetColorSelectItem(const clr : TColor);
var
  i : Integer;
  n : Integer;
begin
  try
    Screen.Cursor := crHourGlass;
    n := HallPlan.Count-1;
    for i:=0 to n do begin
      if HallPlan.Items[i].Selected
      then HallPlan.Items[i].Color := clr;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmHallPlan.RemoveSelectItem();
var
  n: Integer;
begin
  try
    Screen.Cursor := crHourGlass;
    n:=HallPlan.Count-1;
    while n >= 0 do
    begin
      if HallPlan[n].Selected then
      begin
        HallPlan[n].Delete();
        HallPlan.Delete(n);
      end;
      dec(n);
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmHallPlan.ResetSelectItem();
var
  i : Integer;
  n : Integer;
begin
  n := HallPlan.Count-1;
  for i:=0 to n do
  begin
    if HallPlan.Items[i].Selected
    then HallPlan.Items[i].Selected := False;
  end;
end;

procedure TfrmHallPlan.SelectItem4Row(const item : THallItem);
var
  i : Integer;
  n : Integer;
begin
  try
    Screen.Cursor := crHourGlass;
    n := HallPlan.Count-1;
    for i:=0 to n do
      HallPlan.Items[i].Selected := (HallPlan.Items[i].Row = item.Row);
  finally
    Screen.Cursor := crDefault;
  end;
end;


procedure TfrmHallPlan.ShiftSelectItem(const dx: Integer; const dy: Integer);
var
  i : Integer;
  n : Integer;
begin
  n := HallPlan.Count-1;
  for i:=0 to n do
  begin
    with HallPlan.Items[i] do
    begin
      if Selected then
      begin
        if dx<>0 then inc(Position.X, dx);
        if dy<>0 then inc(Position.Y, dy);
      end;
    end;
  end;
end;

procedure TfrmHallPlan.imgHallMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  itemUnderMouse : THallItem;
  indxItm: Integer;

  procedure SelectedPlaces();
  begin
    if indxItm < lvPlaces.Items.Count then
    begin
      try
        lvPlaces.OnSelectItem := nil;
        lvPlaces.ItemIndex := indxItm;
        lvPlaces.Selected.MakeVisible(true);
      finally
        lvPlaces.OnSelectItem := lvPlacesSelectItem;
      end;
    end;
  end;

begin
  {
  При нажатии кнопки мыши:
  * запоминаем точку клика, нахожим объект под кликом
  * если под кликом есть объект, то покажем свойства объекта
  - Если ПКМ
    * выделяем точку клика крестиком
    * показываем контекстное меню
    * выход
  * Устанавливаем начало резиновой рамки

  При движении мыши:
  - Если ЛКМ не зажата то выход
  - Если под кликом был объект
    - Если объект выделен, то двигаем все выделенные объекты
    * Выход
  * Меняем резиновую рамку, выделяем объекты под ней

  При отпускании кнопки мыши:
  - Если ПКМ то выход
  * запоминаем произведенное действие в списке последних действий
  * очищаем точку клика
  - Если текущие координаты равны точке клика и под точкой клика есть объект
    * переключаем выделение объекта
  }

  if not IsEdit then Exit;
  if (ssRight	in Shift) then
  begin
    // Popup menu
    ClickPoint:=Point(X, Y);
    Exit;
  end;
  itemUnderMouse := GetItemAtXY(X, Y, indxItm);
  if (itemUnderMouse <> nil) then
  begin
    //установка курсора на один из элементов
//    if ((ssShift in Shift)) then //при одновременном нажатии Ctrl и Shift и  - начинаем смещение
//    begin
        MoveItems.PosLT.X := Round(itemUnderMouse.Position.X*Scale);
        MoveItems.PosLT.Y := Round(itemUnderMouse.Position.Y*Scale);
        MoveItems.PosMDown := Point(X, Y);
        MoveItems.IsMoved := True;
//    end;
//    else
    if btnSelectSingle.Down then
    begin
      if not(ssShift in Shift) then ResetSelectItem();
      itemUnderMouse.Selected := not itemUnderMouse.Selected;
      DrawHallPlan();
    end
    else if btnSelectRow.Down then
    begin
      SelectItem4Row(itemUnderMouse);
    end;
    ReadHallItemProps(itemUnderMouse, true);
    SelectedPlaces();
    InfoStatus.CountSelct := GetCountSelect();
    SetParametrsStatusBar();
  end
  else
  begin
    //if btnSelectRegion.Down and not(SelRect.Selecting or (Button <> mbLeft)) then
    if not(SelRect.Selecting or (Button <> mbLeft)) then
    begin
      SelRect.Modify(Point(X, Y), 's'); // Start
    end
    else
    begin
      if not(ssShift in Shift) then ResetSelectItem();
    end;
  end;
  if btnNewPlace.Down then
  begin
    //HallPlan.Add(CreateNewPlace(X, Y));
  end
  else if btnNewText.Down then
  begin
    //HallPlan.Add(CreateNewText(X, Y));
    //HallPlan.Add(NewHallItem(Point(X, Y), nil, clBlack, 0, KIND_TEXT));
  end;
  UpdatePreview();
end;

procedure TfrmHallPlan.imgHallMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if not IsEdit then Exit;

  MoveItems.IsMoved := False;
  if (SelRect.Selecting or (Button <> mbLeft)) then
  begin
    SelRect.Modify(Point(X, Y), 'm'); // Modify
    SelRect.Selecting := False;
  end;
  UpdatePreview();
end;

procedure TfrmHallPlan.GetSnapPoint(const X: Integer; const Y: Integer; var dx: Integer; var dy : Integer);
var
  nCellx:integer;
  nCelly:integer;
  cellSize:integer;

  posx:integer;
  posy:integer;
begin
  if btnDrawGrid.Down then
  begin
    cellSize := Round(GridStep*Scale);
    nCellx := (X - MoveItems.PosMDown.X);
    if (nCellx div cellSize)<>0 then
    begin
      posx := (X div cellSize)*cellSize;
      dx := Round((posx - MoveItems.PosLT.X)/Scale);
      MoveItems.PosLT.X := posx;
      MoveItems.PosMDown.X := X;
    end
    else dx :=0;

    nCelly := (Y - MoveItems.PosMDown.Y);
    if (nCelly div cellSize)<>0 then
    begin
      posy := (Y div cellSize)*cellSize;
      dy := Round((posy - MoveItems.PosLT.Y)/Scale);
      MoveItems.PosLT.Y := posy;
      MoveItems.PosMDown.Y := Y;
    end
    else dy := 0;
  end
  else
  begin
    dx :=  Round((X - MoveItems.posMDown.X)/Scale);
    dy :=  Round((Y - MoveItems.posMDown.Y)/Scale);
    MoveItems.PosMDown.X := X;
    MoveItems.PosMDown.Y := Y;
  end;
end;

procedure TfrmHallPlan.imgHallMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
  var
    HallItem: THallItem;
    posDown : TPoint;
    dx, dy : Integer;
    indxItm: Integer;

begin
  if not IsEdit then
  begin
    HallItem:=GetItemAtXY(X, Y, indxItm);
    if Assigned(HallItem) then
    begin
      ReadHallItemProps(HallItem);
    end;
    Exit;
  end;

  if MoveItems.IsMoved then
  begin
    posDown := Point(X, Y);
    //пересчитываем экранные координаты в "истинные" с учетом масштаба
    GetSnapPoint(X, Y, dx, dy);
    ShiftSelectItem(dx, dy);
  end;

  if SelRect.Selecting then
  begin
    SelRect.Modify(Point(X, Y), 'm'); // Modify
    SelectItemsInRect(SelRect.R, (ssShift in Shift));
  end;
  UpdatePreview();

  InfoStatus.CountSelct := GetCountSelect();
  SetParametrsStatusBar();
end;

procedure TfrmHallPlan.DrawHallItem(var c: TCanvas; Item: THallItem);
var
  r: TRect;

// DrawHallItem.DrawTextPlace
procedure DrawTextPlace(s: string);
var
  hText:TPoint;
  hPos:TPoint;
  OldBkMode:integer;
begin
  hText.X := c.TextWidth(s) div 2;
  hPos.X := (r.Right - r.Left) div 2;
  hText.Y := c.TextHeight(s) div 2;
  hPos.Y := (r.Bottom - r.Top) div 2;
  OldBkMode := 0;
  try
    OldBkMode := SetBkMode(c.Handle, TRANSPARENT);
    c.TextOut(r.Left+hPos.X-hText.X, r.Top+hPos.Y-hText.Y, s);
  finally
    SetBkMode(c.Handle, OldBkMode);
  end;
end;

// DrawHallItem.DrawItemKindPlace
procedure DrawItemKindPlace();
begin
  c.Pen.Style := psSolid;
  c.Pen.Color := clBlack;
  c.Pen.Mode  := pmCopy;
  c.Pen.Width:=1;
    //if CurHallItem.ID = HallItem.ID then
    if Item.Selected and IsEdit then
    begin
      c.Pen.Width:=3;
    end;
  c.Brush.Style := bsSolid;
  c.Brush.Color:=Item.Color; //clYellow;
  c.Rectangle(r);
  //Canvas.Arc(R.Left, R.Top, R.Right, R.Bottom, R.Left, R.Bottom, R.Right, R.Bottom);

  // Draw seat number
  //Canvas.Font.Assign(NumLabel.Font);
  if Length(Item.State)=0
  then DrawTextPlace(IntToStr(Item.Place))
  else DrawTextPlace(Item.State);
end;

// DrawHallItem.DrawItemKindText
procedure DrawItemKindText();
var
  OldBkMode:integer;
  stlFnt: TFontStyles;
  clrFnt: TColor;
begin
  OldBkMode := 0;
  clrFnt := 0;
  try
    clrFnt := c.Font.Color;
    c.Font.Color := Item.Color;
    if Item.Selected and IsEdit then
    begin
      stlFnt := c.Font.Style;
      c.Font.Style := [fsBold];
    end;
    OldBkMode := SetBkMode(c.Handle, TRANSPARENT);
    c.TextOut(r.Left, r.Top, Item.ParamsText);
  finally
    SetBkMode(c.Handle, OldBkMode);
    c.Font.Style := stlFnt;
    c.Font.Color := clrFnt;
  end;
end;

begin
  r := GetRectHallItem(Item);
  if Item.Kind = KIND_TEXT
  then DrawItemKindText()
  else DrawItemKindPlace();
end;

procedure TfrmHallPlan.UpdatePreview();
begin
  pbHall.Invalidate;
end;

procedure TfrmHallPlan.DrawGrid(var cnvs: TCanvas; const xPoint : Integer; const yPoint: Integer);
var
  i,n: Integer;
  sizeCell: Integer;
  xPos: Integer;
begin
  with cnvs do
  begin
    Pen.Color := clBlack;
    sizeCell := Round(GridStep*Scale);
    for n:=0 to xPoint do//(tr.Right div GridStep)
    begin
      xPos := n*sizeCell;
      for i:=0 to  yPoint do//(tr.Bottom div GridStep)
      begin
        Pixels[xPos, i*sizeCell]:= Pen.Color;
      end;
    end;
  end;
end;

procedure TfrmHallPlan.DrawHallPlan();
var
  tr: TRect;
  i,n: Integer;
  Canvas: TCanvas;
  cellSize: Integer;
begin
  //if not Assigned(Project) then Exit;
  if not Assigned(HallPlan) then Exit;
  //HallPlan.LoadFromBase();

  Canvas:=bmp.Canvas;
  Canvas.Lock();

(*  if (bmp.Height <> grpHall.ClientHeight)
  or (bmp.Width <> grpHall.ClientWidth)
  then
  begin
    bmp.Height:=grpHall.ClientHeight;
    bmp.Width:=grpHall.ClientWidth;
  end;
(**)
  // Clear canvas
  Canvas.Pen.Style := psSolid;
  Canvas.Pen.Color := clBlack;
  Canvas.Pen.Mode  := pmCopy;
  Canvas.Pen.Width:=1;

  Canvas.Brush.Style:=bsSolid;
  Canvas.Brush.Color:=clWhite;

  tr:=Canvas.ClipRect;
  Canvas.FillRect(tr);

  // Draw grid
  if actDrawGrid.Checked and IsEdit then
  begin
    cellSize := Round(GridStep*Scale);
    DrawGrid(Canvas, (tr.Right div cellSize), (tr.Bottom div cellSize));
  end;

  // Draw seats
  n := HallPlan.Count-1;
  for i:=0 to n do
  begin
    DrawHallItem(Canvas, HallPlan[i]);
  end;

  if SelRect.Selecting then SelRect.Draw(Canvas);

  Canvas.Unlock();
  //imgHall.Picture.Bitmap.Canvas.Draw(0,0,bmp);
  //BitBlt(imgHall.Canvas.Handle, 0, 0, bmp.Width, bmp.Height, bmp.Canvas.Handle, 0, 0, SRCCOPY );
  BitBlt(pbHall.Canvas.Handle, 0, 0, bmp.Width, bmp.Height, bmp.Canvas.Handle, 0, 0, SRCCOPY );
end;

procedure TfrmHallPlan.UpdateSizeHall();
begin
  pnlBkGnd.Width := Round(HallSize.X*Scale);
  pnlBkGnd.Height := Round(HallSize.Y*Scale);
  if (bmp.Height <> pnlBkGnd.ClientHeight)
  or (bmp.Width <> pnlBkGnd.ClientWidth)
  then
  begin
    bmp.Height:=pnlBkGnd.ClientHeight;
    bmp.Width:=pnlBkGnd.ClientWidth;
    if (ResizeHall<> nil)
    then ResizeHall.Rect := pnlBkGnd.ClientRect;
  end;
end;

procedure TfrmHallPlan.ResizedHallPlan(const val: TRect);
begin
  HallSize.Y := val.Bottom - val.Top;
  HallSize.X := val.Right - val.Left;
  UpdateSizeHall();
  UpdatePreview();
end;

procedure TfrmHallPlan.SetScale(val: Real);
begin
  if val <> FScale then
  begin
    FScale := val;
    UpdateSizeHall;
    UpdatePreview();
  end;
end;

procedure TfrmHallPlan.ParamsMod(Action: string);
begin
  if Action = 'load' then
  begin
    HallSize.X:=StrToIntDef(Project.Options.Params['hall_size_x'], HallSize.X);
    HallSize.Y:=StrToIntDef(Project.Options.Params['hall_size_y'], HallSize.Y);
    PlaceSize.X:=StrToIntDef(Project.Options.Params['place_size_x'], PlaceSize.X);
    PlaceSize.Y:=StrToIntDef(Project.Options.Params['place_size_y'], PlaceSize.Y);
    GridStep:=StrToIntDef(Project.Options.Params['grid_step'], GridStep);
  end

  else if Action = 'save' then
  begin
    Project.Options.Params['hall_size_x']:=IntToStr(HallSize.X);
    Project.Options.Params['hall_size_y']:=IntToStr(HallSize.Y);
    Project.Options.Params['place_size_x']:=IntToStr(PlaceSize.X);
    Project.Options.Params['place_size_y']:=IntToStr(PlaceSize.Y);
    Project.Options.Params['grid_step']:=IntToStr(GridStep);
  end

  else if Action = 'init' then
  begin
    HallSize.X := HALL_SIZE;
    HallSize.Y := HALL_SIZE;
    PlaceSize.X := SEAT_SIZE;
    PlaceSize.Y := SEAT_SIZE;
    GridStep:=8;
  end;
end;

function TfrmHallPlan.Start(): boolean;
begin
  HallPlan:=Project.HallPlan;

  ParamsMod('load');
  UpdateSizeHall();

  InfoStatus.CountSelct := 0;
  InfoStatus.CountTotal := HallPlan.Count;
  SetParametrsStatusBar();
  // Update preview
  UpdatePreview();
  Result:=True;
end;

procedure TfrmHallPlan.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Assigned(Form) then Form.Release();
end;

function TfrmHallPlan.NewHallItem(Pos: TPoint; NumPlanItem: TNumPlanItem; Color: TColor = clInfoBk; Order: Integer = 0; Kind: AnsiChar = 'S'): THallItem;
var
  HallItem: THallItem;
begin
  HallItem:=THallItem.Create(Project);
  HallItem.Position.X:=Pos.X;
  HallItem.Position.Y:=Pos.Y;
  HallItem.Color:=Color;
  HallItem.NumPlanItem:=NumPlanItem;
  if Assigned(NumPlanItem) then
  begin
    HallItem.Row:=StrToIntDef(NumPlanItem.DataValue[csRow], 0);
    HallItem.Place:=StrToIntDef(NumPlanItem.DataValue[csPlace], 0);
    HallItem.State:=NumPlanItem.State;
  end;
  HallItem.Order:=Order;
  if Order=0 then HallItem.Order:=HallPlan.Count;
  HallItem.Kind:=Kind;
  HallPlan.Add(HallItem);
  Result:=HallItem;
end;

procedure TfrmHallPlan.FillItemsWithRows();
var
  i, n, nn: Integer;
  iRowMax, iRowPos: integer;
  HallItem: THallItem;
  NumPlanItems: TNumPlan;
  NumPlanItem: TNumPlanItem;
  RowList, PlacesList: TStringList;
  sRow, sPlace: string;
begin
  NumPlanItems:=Project.NumPlanItems;

  // Places matrix
  RowList:=TStringList.Create();
  for i:=0 to NumPlanItems.Count-1 do
  begin
    NumPlanItem:=NumPlanItems[i];
    sRow:=Format('%5s', [NumPlanItem.DataValue[csRow]]);
    sPlace:=Format('%5s', [NumPlanItem.DataValue[csPlace]]);
    PlacesList:=nil;
    for n:=0 to RowList.Count-1 do
    begin
      if RowList[n] = sRow then
      begin
        PlacesList:=(RowList.Objects[n] as TStringList);
        Break;
      end;
    end;

    if PlacesList=nil then
    begin
      PlacesList:=TStringList.Create();
      RowList.AddObject(sRow, PlacesList);
    end;

    PlacesList.AddObject(sPlace, NumPlanItem);
  end;

  // Create places in matrix order
  iRowPos:=0;
  RowList.Sort();
  for i:=0 to RowList.Count-1 do
  begin
    PlacesList:=(RowList.Objects[i] as TStringList);
    Inc(iRowPos, (PlaceSize.Y+GridStep));
    PlacesList.Sort();
    for n:=0 to PlacesList.Count-1 do
    begin
      if n=0 then
      begin
        HallItem:=NewHallItem(Point(5, iRowPos), nil, clBlack, 0, KIND_TEXT);
        HallItem.ParamsText:=csRow+' '+IntToStr(i+1);
      end;
      NumPlanItem:=(PlacesList.Objects[n] as TNumPlanItem);
      NewHallItem(Point(LABEL_XSIZE+(n*(PlaceSize.X+GridStep)), iRowPos), NumPlanItem);
    end;
    PlacesList.Free();
  end;

  RowList.Free();
end;

procedure TfrmHallPlan.FillItems();
var
  i, n, nn: Integer;
  iRowMax, iRowPos: integer;
  HallItem: THallItem;
  NumPlanItems: TNumPlan;
  posBottomRight: TPoint;
begin
  if HallPlan.Count>0 then ClearAllItems();
  try
    NumPlanItems:=Project.NumPlanItems;
    Screen.Cursor := crHourGlass;

    n:=0;
    for i:=0 to Project.NumLabelsTpl.Count-1 do
    begin
      if Project.NumLabelsTpl[i].Name = csRow then Inc(n);
      if Project.NumLabelsTpl[i].Name = csPlace then Inc(n);
    end;

    if n>1 then FillItemsWithRows() else
    begin
      iRowMax:=30;
      iRowPos:=0;
      n:=0; nn:=0;
      for i:=0 to NumPlanItems.Count-1 do
      begin
        if n = iRowMax then
        begin
          Inc(iRowPos, (PlaceSize.Y+GridStep));
          n:=0;
        end;
        Inc(n);
        Inc(nn);
        NewHallItem(Point((n+1)*(PlaceSize.X+GridStep), iRowPos), NumPlanItems[i]);
      end;
    end;
  finally
    Screen.Cursor := crDefault;
  end;

  // Get BottomRight item position
  posBottomRight:=Point(0,0);
  for i:=0 to HallPlan.Count-1 do
  begin
    HallItem:=HallPlan[i];
    AddStateList(HallItem.State);
    if posBottomRight.X<HallItem.Position.X then posBottomRight.X:=HallItem.Position.X;
    if posBottomRight.Y<HallItem.Position.Y then posBottomRight.Y:=HallItem.Position.Y;
  end;

  if (posBottomRight.X > HallSize.X)
    or
     (posBottomRight.Y > HallSize.Y)
  then
  begin
    if ((posBottomRight.X + 2*PlaceSize.X) > HallSize.X)
    then HallSize.X := posBottomRight.X + 2*PlaceSize.X;
    if ((posBottomRight.Y + 2*PlaceSize.Y) > HallSize.Y)
    then HallSize.Y := posBottomRight.Y + 2*PlaceSize.Y;
    UpdateSizeHall;
  end;
  lvPlaces.Items.Count := NumPlanItems.Count;

  InfoStatus.CountSelct := 0;
  InfoStatus.CountTotal := NumPlanItems.Count;
  SetParametrsStatusBar();
  UpdatePreview();
end;

function TfrmHallPlan.ClearAllItems(): Boolean;
begin
  Result:=False;
  if Application.MessageBox(PAnsiChar('Будут удалены все объекты'), PAnsiChar('Внимание'), MB_OKCANCEL or MB_ICONEXCLAMATION) <> IDOK then Exit;
  HallPlan.DeleteFromBase();
  Result:=True;
end;

procedure TfrmHallPlan.SaveToFileHallPlan();
var
  filename: string;
  ext: string;
begin
	if not dlgSave.Execute() then Exit;

	filename := dlgSave.FileName;
	ext := ExtractFileExt(filename);
	if (Length(ext) = 0) then
    case (dlgSave.FilterIndex) of
      1: filename := filename + '.bmp';
      2: filename := filename + '.jpg';
    end;
  bmp.SaveToFile(filename);
end;

procedure TfrmHallPlan.EnableControl();
begin
  btnSettings.Enabled := IsEdit;
  btnFillItems.Enabled := IsEdit;
  btnClearItems.Enabled := IsEdit;
  btnSelectRegion.Enabled := IsEdit;
  btnSelectRow.Enabled := IsEdit;
  btnSelectSingle.Enabled := IsEdit;
  btnDrawGrid.Enabled := IsEdit;
  btnAlignSelectedX.Enabled := IsEdit;
  btnAlignSelectedY.Enabled := IsEdit;
  btnAlignSelectedAlong.Enabled := IsEdit;
  btnColorSelect.Enabled := IsEdit;
end;

procedure TfrmHallPlan.btnSaveClick(Sender: TObject);
begin
  HallPlan.SaveToBase();
end;

procedure TfrmHallPlan.DummyAction(Sender: TObject);
begin
  //
end;

procedure TfrmHallPlan.ClearItemAction(Sender: TObject);
begin
  if Sender = N1 then
    btnClearItems.Action := actClearItemsSelect
  else
    btnClearItems.Action := actClearItems;
end;

procedure TfrmHallPlan.actlstHallPlanExecute(Action: TBasicAction;
  var Handled: Boolean);
var
  cellSize: Integer;
begin
  if Action = actTypePaint then
  begin
    IsEdit := actTypePaint.Checked;
    EnableControl();
    UpdatePreview();
  end

  else if Action = actSettings then
  begin
    pSettings.Left := btnSettings.Left;
    pSettings.Top := grpProps.Top;
    seHeightPlace.Value := PlaceSize.Y;
    seWidthPlace.Value := PlaceSize.X;
    seHeightHall.Value := HallSize.Y;
    seWidthHall.Value := HallSize.X;

    pSettings.Visible := true;
  end

  else if Action = actFillItems then
  begin
    FillItems();
  end

  else if Action = actClearItems then
  begin
    if ClearAllItems() then UpdatePreview();
  end

  else if Action = actClearItemsSelect then
  begin
    RemoveSelectItem();
    UpdatePreview();
  end

  //------- group buttons ----------------------------
  else if Action = actSelectSingle then
  begin
    actSelectSingle.Checked:=True;
    actSelectRow.Checked:=False;
    actSelectRegion.Checked:=False;
  end

  else if Action = actSelectRow then
  begin
    actSelectSingle.Checked:=False;
    actSelectRow.Checked:=True;
    actSelectRegion.Checked:=False;
  end

  else if Action = actSelectRegion then
  begin
    actSelectSingle.Checked:=False;
    actSelectRow.Checked:=False;
    actSelectRegion.Checked:=True;
  end
  //------- group buttons ----------------------------
  //------- group buttons ----------------------------
  else if Action = actNewPlace then
  begin
    if actNewPlace.Checked
    then actNewText.Checked:=False;
  end

  else if Action = actNewText then
  begin
    if actNewText.Checked
    then actNewPlace.Checked:=False;
  end
  //------- group buttons ----------------------------

  else if Action = actDrawGrid then
  begin
    UpdatePreview();
  end

  else if Action = actSaveToBase then
  begin
    HallPlan.SaveToBase();
    Project.Options.SaveToBase();
  end

  else if Action = actColorSelect then
  begin
    if not dlgColor.Execute() then Exit;
    SetColorSelectItem(dlgColor.Color);
    UpdatePreview();
  end

  else if Action = actZoom100 then
  begin
    Scale:=1;
    UpdatePreview();
  end

  else if Action = actZoomPlus then
  begin
    //Проверка корект мастштаба(в окне помещается один элемент)
    cellSize := Round(GridStep*(Scale+0.2));
    if ( ((pbHall.Canvas.ClipRect.Right div cellSize) > 1)
        and
       ((pbHall.Canvas.ClipRect.Bottom div cellSize) > 1) )
    then
    begin
      Scale:=Scale+0.2;
      UpdatePreview();
    end;
  end

  else if Action = actZoomMinus then
  begin
    //Проверка корект мастштаба(элемент отображается точкой)
    if (Round(PlaceSize.Y*(Scale-0.2)) >= 1) and (Round(PlaceSize.X*(Scale-0.2)) >= 1) then
    begin
      Scale:=Scale-0.2;
      UpdatePreview();
    end;
  end

  else if Action = actAlignSelectedX then
  begin
    AlignSelected('horizontal');
    UpdatePreview();
  end

  else if Action = actAlignSelectedY then
  begin
    AlignSelected('vertical');
    UpdatePreview();
  end

  else if Action = actAlignSelectedAlong then
  begin
    AlignSelected('line');
    UpdatePreview();
  end

  else if Action = actSaveToFile then
  begin
    SaveToFileHallPlan();
  end

  else if Action = actHelp then
  begin
    Application.HelpCommand(HELP_CONTEXT, 10);
  end;
end;

procedure TfrmHallPlan.pbHallPaint(Sender: TObject);
begin
  DrawHallPlan();
end;

procedure TfrmHallPlan.ReadHallItemProps(Item: THallItem; const redraw:Boolean);
var
  i: Integer;
  ListItem: TListItem;
  NumPlanItem: TNumPlanItem;
  NLDataList: TNumLabelDataList;

// ReadHallItemProps.AddItem
procedure AddItem(Name, Value: string);
begin
  ListItem:=lvProps.Items.Add();
  ListItem.Caption:=Name;
  ListItem.SubItems.Add(Value);
  ListItem.Data := nil;
end;

begin
  if not Assigned(Item) then Exit;
//  if CurHallItem = Item then Exit;
  lvProps.Items.BeginUpdate();
  ClearListViewData(lvProps);
  lvProps.Clear();

  if Item.Kind = KIND_TEXT
  then  lvProps.Tag := 1
  else lvProps.Tag := 0;
  // HallItem props
  AddItem('Position.X', IntToStr(Item.Position.X));
  AddItem('Position.Y', IntToStr(Item.Position.Y));
  AddItem('Color', IntToStr(Item.Color));

  if Item.Kind = KIND_TEXT then
  begin
      AddItem('Text', Item.ParamsText);
  end
  else
  begin
    AddItem('State', Item.State);
    // NumPlanItem props
    NumPlanItem:=Item.NumPlanItem;
    if Assigned(NumPlanItem) then
    begin
      AddItem('Order', IntToStr(NumPlanItem.Order));
      AddItem('State 2', NumPlanItem.State);

      NLDataList:=NumPlanItem.NumLabelDataList;
      if Assigned(NLDataList) then
      begin
        if NLDataList.Count=0 then NLDataList.LoadFromBase();
        for i:=0 to NLDataList.Count-1 do
        begin
          AddItem(NLDataList[i].NumLabelTpl.Name, NLDataList[i].Value);
        end;
      end;
    end;
  end;
  lvProps.Items.EndUpdate();
  if redraw then lvProps.Repaint;
end;

procedure TfrmHallPlan.HideAllTypeControl();
begin
	if (FEdit<>nil) then FEdit.Visible := false;

	if (FComboBox<>nil) then FComboBox.Visible := false;

	if (FPanelExt<>nil) then FPanelExt.Visible := false;

	if (FSpinEdit<>nil) then FSpinEdit.Visible := false;
end;

procedure TfrmHallPlan.FillDataToControl(const indxItem :Integer);
var
  rItem : TRect;

  procedure InitEdit;
  begin
    FEdit.OnKeyPress := nil;
    FEdit.Parent := lvProps;
    FEdit.BoundsRect := rItem;
    FEdit.Tag := indxItem;
    FEdit.Text := lvProps.Selected.SubItems.Strings[0];
    FEdit.Visible := true;
  end;

  procedure InitSpinEdit(evnt : TNotifyEvent = nil);
  begin
    FSpinEdit.Parent := lvProps;
    FSpinEdit.BoundsRect := rItem;
    FSpinEdit.Tag := indxItem;
    FSpinEdit.MinValue := 0;
    FSpinEdit.OnChange := evnt;
    FSpinEdit.Value := StrToIntDef(lvProps.Selected.SubItems.Strings[0], 0);
    FSpinEdit.Visible := true;
  end;

begin
  rItem := lvProps.Selected.DisplayRect(drBounds);
	rItem.Left := lvProps.Columns[0].Width;
  case indxItem of
  0,1:
    begin
      InitSpinEdit(SpinEditChange);
    end;
  2:
    begin
 		  FButtonExt.OnClick := ButtonColorExtClick;

      FPanelExt.Parent := lvProps;
      FPanelExt.BoundsRect := rItem;
      FEditExt.Tag := indxItem;
      FEditExt.Text := lvProps.Selected.SubItems.Strings[0];
      FPanelExt.Visible := true;
    end;
  3:
    begin
      if lvProps.Tag = 0
      then begin
        FComboBox.Parent := lvProps;
        FComboBox.BoundsRect := rItem;
        FComboBox.Tag := indxItem;
        FillComboBox(FComboBox);
        FComboBox.Text := lvProps.Selected.SubItems.Strings[0];
        FComboBox.Visible := true;
      end
      else InitEdit;
    end;
  4://Order or Text
    begin
      InitSpinEdit;
    end;
  else
   begin
    InitEdit;
   end;
(*  6://Row
    begin//numeric
      FEdit.OnKeyPress := EditNumericKeyPress;
      FEdit.MaxLength := 4;
      FEdit.Parent := lvProps;
      FEdit.BoundsRect := rItem;
      FEdit.Tag := indxItem;
      FEdit.Text := lvProps.Selected.SubItems.Strings[0];
      FEdit.Visible := true;
      //numeric
    end;
(**)
  end;

end;

function GetName4Index(const indx:Integer):string;
begin
  Result := '';
  case indx of
    0: Result := 'Position';
    1: Result := 'Color';
    2: Result := 'State';
    3: Result := 'Order';
    4: Result := 'State 2';
  end;
end;

procedure TfrmHallPlan.lvPropsMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  //если щелкнули по выделенному элементу
  if (lvProps.Selected <> nil) then
  begin
    FillDataToControl(lvProps.Selected.Index);
  end;
end;


procedure TfrmHallPlan.lvPropsKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  ListViewKeyUp(Sender , Key, Shift);
end;

procedure TfrmHallPlan.lvPropsExit(Sender: TObject);
begin
  HideAllTypeControl();
end;

procedure TfrmHallPlan.lvPropsSelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
begin
	if ((Selected) and (Item<>nil)) then
  begin
    FillDataToControl(Item.Index);
  end
	else
  begin//если клик произошол в области где нет ни одного элемента - скрываем все редакторы
		HideAllTypeControl();
	end;
end;


procedure TfrmHallPlan.btnOKClick(Sender: TObject);
begin
  PlaceSize.X := seWidthPlace.Value;
  PlaceSize.Y := seHeightPlace.Value;
  HallSize.X := seWidthHall.Value;
  HallSize.Y := seHeightHall.Value;
  ParamsMod('save');
  UpdateSizeHall();
  pSettings.Visible := false;
end;

procedure TfrmHallPlan.btnCancelClick(Sender: TObject);
begin
  pSettings.Visible := false;
end;

procedure TfrmHallPlan.seWidthPlaceKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
  VK_ESCAPE :
    begin
      btnCancel.Click();
    end;
  VK_RETURN :
    begin
      btnOK.Click();
    end;
  end;
end;

procedure TfrmHallPlan.btnOkPosClick(Sender: TObject);
begin
  if (Sender = btnOkPos) then
  begin
    FEditExt.Text := PosToStr(Point(sePosHallX.Value, sePosHallY.Value));
  end;
  EditExtExit(FEditExt);
  UpdatePreview();
  pHallPosition.Visible := false;
end;

procedure TfrmHallPlan.sePosHallYChange(Sender: TObject);
begin
  SetValueSelectedHallItems(FPanelExt.Tag, lvProps.Items[FPanelExt.Tag].Caption, PosToStr(Point(sePosHallX.Value, sePosHallY.Value)));
  UpdatePreview();
end;

procedure TfrmHallPlan.lvPropsCustomDrawSubItem(Sender: TCustomListView;
  Item: TListItem; SubItem: Integer; State: TCustomDrawState;
  var DefaultDraw: Boolean);
const
  SHIFT_RECT = 4;
var
  rItem : TRect;
begin
  if (Item.Caption = 'Color') then
  begin
//    valColor :=
		rItem := Item.DisplayRect(drBounds);
		inc(rItem.Left, lvProps.Columns.Items[0].Width + SHIFT_RECT);
		inc(rItem.Top, SHIFT_RECT);
		dec(rItem.Bottom, SHIFT_RECT);
    dec(rItem.Right, SHIFT_RECT);

    //clr := sender.canvas.brush.Color;
    sender.canvas.brush.Color :=  StrToIntDef(Item.SubItems.Strings[0], lvProps.Color);
    sender.canvas.FillRect(rItem);
//    sender.canvas.Pen.Style := psSolid;
    sender.canvas.Pen.Color := clBlack;
    sender.canvas.Pen.Width:=1;
    sender.canvas.Rectangle(rItem);
    //sender.canvas.brush.Color := clr;
    DefaultDraw := false;
  end;
end;

procedure TfrmHallPlan.lvPlacesData(Sender: TObject; Item: TListItem);
var
  NumPlanItems: TNumPlan;
begin
  NumPlanItems:=Project.NumPlanItems;
  if (Item.Index < 0) or (Item.Index >= NumPlanItems.Count) then Exit;

  Item.Caption:= NumPlanItems[Item.Index].DataValue[csRow];
  Item.SubItems.Add(NumPlanItems[Item.Index].DataValue[csPlace]);
  Item.SubItems.Add(NumPlanItems[Item.Index].DataValue[csSerial]);
end;

procedure TfrmHallPlan.lvPlacesSelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
begin
  if Item = nil then Exit;
  HallPlan.Items[Item.Index].Selected := Selected;
  if OldIndxListPlaces > -1 then
    HallPlan.Items[OldIndxListPlaces].Selected := False;
  OldIndxListPlaces := Item.Index;
  UpdatePreview();
end;

end.

