unit VisualHallFrame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls;

type
  //дл€ отрисовки элементов
  IDrawItems = interface
  ['{168B0326-DBE9-4406-8FD0-BE5CA476FB98}']
    function Draw(aCanvas: TCanvas):HRESULT;
  end;
  ISelectedItems = interface
  ['{2872B58B-EBA3-4959-AE9D-A390C9FD8B11}']
    function IsUnderMouse(x: Integer; y: Integer; var resVal : Boolean):HRESULT;
    function SelectedRect(aRect: TRect):HRESULT;
    function SelectedPoint(x: Integer; y: Integer):HRESULT;
    function Reset():HRESULT;
  end;
  IPosition = interface
    ['{3FFFC999-746F-44A4-94AB-BE8459D24CDC}']
    function Shift(dx: Integer; dy: Integer):HRESULT;
  end;

  //резинова€ рамка
  TSelectedArea = class
  public
    StartPoint : TPoint;
    SelRect : TRect;
    Selecting : Boolean;
    constructor Create();
    procedure DrawRect(const canvs:TCanvas);
    procedure NormalRect(const p: TPoint);
//    procedure ItemsIntersectRect(var items : THallPlan);
  private
  end;
  //дл€ перемещени€
  TMoveItems = record
    PosMDown : TPoint;
    Selecting : Boolean;
  end;

  TfrmVisualHall = class(TFrame)
    pbDisplay: TPaintBox;
    procedure pbDisplayPaint(Sender: TObject);
    procedure pbDisplayMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pbDisplayMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure pbDisplayMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    FBkscrn: TBitmap;
    FGridStep: Integer;
    FItems: TInterfaceList;
    FMoveItems: TMoveItems;
    FSelectedArea: TSelectedArea;
    FSelectSingle: Boolean;
    FSelectRegion: Boolean;
    FDrawGrid: Boolean;
    procedure NoBkGnd(var Msg: TWMEraseBkGnd); message WM_ERASEBKGND;
    procedure RefreshSize();
    procedure SetSelectSingle(val: Boolean);
    procedure SetSelectRegion(val: Boolean);
    procedure SetDrawGrid(val: Boolean);
    procedure GridDraw(cnvs: TCanvas);

  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy(); override;
    function AddItem(itm : IUnknown):HRESULT;
    procedure InvalidateCanvas();
    property SelectSingle: Boolean read FSelectSingle write SetSelectSingle;
    property SelectRegion: Boolean read FSelectRegion write SetSelectRegion;
    property DrawGrid: Boolean read FDrawGrid write SetDrawGrid;
  end;

  const
    SEAT_SIZE : Integer = 16; //размер квадрата €чейки (места)

implementation

{$R *.dfm}

procedure TfrmVisualHall.NoBkGnd(var Msg: TWMEraseBkgnd);
begin
    Msg.Result :=1;
end;
//==============================================================================
constructor TSelectedArea.Create();
begin

end;
procedure TSelectedArea.DrawRect(const canvs:TCanvas);
begin
  with canvs do begin
    Pen.Style := psDot;
    Pen.Color := clGray;
    Pen.Mode  := pmXor;
    Brush.Style := bsClear;
    Rectangle(SelRect.Left, SelRect.Top, SelRect.Right, SelRect.Bottom);
  end;
end;
procedure TSelectedArea.NormalRect(const p: TPoint);
begin
  if StartPoint.X < p.X then
  begin
    SelRect.Left := StartPoint.X;
    SelRect.Right := p.X;
  end
  else begin
    SelRect.Left := p.X;
    SelRect.Right := StartPoint.X;
  end;

  if StartPoint.Y < p.Y then
  begin
    SelRect.Top := StartPoint.Y;
    SelRect.Bottom := p.Y;
  end
  else begin
    SelRect.Top := p.Y;
    SelRect.Bottom := StartPoint.Y;
  end;
end;
(*
procedure TSelectedArea.ItemsIntersectRect(var items : THallPlan);
var
  i, n: integer;
  rct: TRect;
  res: TRect;
begin
  with items do begin
    n := Count-1;
    for i:=0 to n do
    begin
      rct := Rect(Items[i].Position.X,          Items[i].Position.Y,
                   Items[i].Position.X+SEAT_SIZE, Items[i].Position.Y+SEAT_SIZE);
      Items[i].Selected := IntersectRect(res, rct, SelRect);
    end;
  end;
end;
(**)
//==============================================================================

procedure TfrmVisualHall.RefreshSize();
begin
    if (FBkscrn.Height <> pbDisplay.Height)
    or (FBkscrn.Width <> pbDisplay.Width)
    then
    begin
      FBkscrn.Height:=pbDisplay.Height;
      FBkscrn.Width:=pbDisplay.Width;
    end;
end;
procedure TfrmVisualHall.SetSelectSingle(val: Boolean);
begin
    if val <> FSelectSingle then
    begin
      FSelectSingle := val;
      FSelectRegion := not FSelectSingle;
    end;

end;
procedure TfrmVisualHall.SetSelectRegion(val: Boolean);
begin
    if val <> FSelectRegion then
    begin
      FSelectRegion := val;
      FSelectSingle := not FSelectRegion;
    end;
end;
procedure TfrmVisualHall.SetDrawGrid(val: Boolean);
begin
    if val <> FDrawGrid then
    begin
      FDrawGrid := val;
      pbDisplay.Invalidate;
    end;
end;

procedure TfrmVisualHall.GridDraw(cnvs: TCanvas);
var
  n, nn:integer;
  i, ii:integer;
  tr: TRect;
begin
    if not FDrawGrid then Exit;
    tr:=cnvs.ClipRect;
    cnvs.Pen.Color:=clBlack;
    cnvs.Pen.Width:=1;
    nn := (tr.Right div FGridStep);
    ii := (tr.Bottom div FGridStep);
    for n:=0 to nn do
    begin
      for i:=0 to ii do
      begin
        cnvs.Pixels[n*FGridStep, i*FGridStep]:= cnvs.Pen.Color;
      end;
    end;
end;
procedure TfrmVisualHall.pbDisplayPaint(Sender: TObject);
  var
    indx : Integer;
    cnt  : Integer;
    itms : IUnknown;
    cnvs  : TCanvas;

begin
  cnvs:=FBkscrn.Canvas;
  try
    cnvs.Lock();

    RefreshSize();

    cnvs.Brush.Color:=clWhite;
    cnvs.FillRect(cnvs.ClipRect);

    GridDraw(cnvs);

    cnt := FItems.Count - 1;
    for indx:=0 to cnt do begin
      itms := IUnknown(FItems[indx]);
      (itms as IDrawItems).Draw(cnvs);
    end;
  finally
    cnvs.Unlock();
    pbDisplay.Canvas.Draw(0, 0, FBkscrn);
  end;
end;
constructor TfrmVisualHall.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FBkscrn:=TBitmap.Create();
  FSelectedArea:= TSelectedArea.Create();
  FItems := TInterfaceList.Create();

  FGridStep := SEAT_SIZE;
end;

destructor TfrmVisualHall.Destroy();
begin
  FItems.Clear;
  FItems.Free();
  FSelectedArea.Free;
  FBkscrn.Free();
  inherited Destroy();
end;

function TfrmVisualHall.AddItem(itm : IUnknown):HRESULT;
begin
  FItems.Add(itm);
  pbDisplay.Invalidate;
  Result := S_OK;
end;

procedure TfrmVisualHall.InvalidateCanvas();
begin
  pbDisplay.Invalidate;
end;

procedure TfrmVisualHall.pbDisplayMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  var
    itms : IUnknown;
    function IsSelectingItems():Boolean;
      var
        i : Integer;
        n : Integer;
        isSelected : Boolean;
        hrRes: HRESULT;
    begin
      isSelected := False;
      n := FItems.Count - 1;
      for i:=0 to n do begin
        itms := IUnknown(FItems[i]);
        hrRes := (itms as ISelectedItems).IsUnderMouse(X, Y, isSelected);
        if (isSelected) and (hrRes = S_OK)
        then  Break;
      end;
      Result := isSelected;
    end;
    procedure ResetSelectItem();
      var
        i : Integer;
        n : Integer;
    begin
      n := FItems.Count - 1;
      for i:=0 to n do begin
        itms := IUnknown(FItems[i]);
        (itms as ISelectedItems).Reset();
      end;
    end;
    procedure SelectingItem();
      var
        i : Integer;
        n : Integer;
    begin
      n := FItems.Count - 1;
      for i:=0 to n do begin
        itms := IUnknown(FItems[i]);
        (itms as ISelectedItems).SelectedPoint(X, Y);
      end;
    end;

begin
  if IsSelectingItems then
  begin //установка курсора на один из элементов
    if ((ssShift in Shift) and (ssCtrl in Shift))
    then begin//при одновременном нажатии Ctrl и Shift и  - начинаем смещение
        FMoveItems.PosMDown := Point(X, Y);
        FMoveItems.Selecting := True;
    end
    else if FSelectSingle
    then begin
        if not(ssCtrl in Shift)
        then ResetSelectItem();
        SelectingItem;
        //ReadHallItemProps(Item);
    end;
  end
  else begin
    if FSelectRegion and not(FSelectedArea.Selecting or (Button <> mbLeft))
    then begin
      FSelectedArea.Selecting := True;
      FSelectedArea.StartPoint := Point(X, Y);
      FSelectedArea.SelRect := Bounds(X, Y, 0, 0);
    end
    else begin
      if not(ssCtrl in Shift)
      then ResetSelectItem();
    end;
  end;
  pbDisplay.Invalidate;


end;

procedure TfrmVisualHall.pbDisplayMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);

  var
    itms : IUnknown;
   procedure ShiftSelectItem(const dx: Integer; const dy: Integer);
      var
        i : Integer;
        n : Integer;
    begin
      n := FItems.Count - 1;
      for i:=0 to n do begin
        itms := IUnknown(FItems[i]);
        (itms as IPosition).Shift(dx, dy);
      end;
    end;
    procedure SelectingItems();
      var
        i : Integer;
        n : Integer;
    begin
      n := FItems.Count - 1;
      for i:=0 to n do begin
        itms := IUnknown(FItems[i]);
        (itms as ISelectedItems).SelectedRect(FSelectedArea.SelRect);
      end;
    end;

begin
  if  FMoveItems.Selecting then
  begin
      //CurHallItem.Position:=GetSnapPoint(X, Y);
      ShiftSelectItem(X - FMoveItems.posMDown.X, Y - FMoveItems.posMDown.Y);
      FMoveItems.posMDown := Point(X, Y);
      pbDisplay.Invalidate;
  end
  else
  begin
    (*
    HallItem:=GetItemAtXY(X, Y);
    if Assigned(HallItem) then
    begin
      ReadHallItemProps(HallItem);
    end;
    (**)
  end;

  if not FSelectedArea.Selecting
  then Exit;
  FSelectedArea.DrawRect(pbDisplay.Canvas);
  FSelectedArea.NormalRect(Point(X, Y));
  SelectingItems();
  pbDisplay.Invalidate;
  FSelectedArea.DrawRect(pbDisplay.Canvas);

end;

procedure TfrmVisualHall.pbDisplayMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
//  if Assigned(CurHallItem) then CurHallItem.Selected:=False;
  FMoveItems.Selecting := False;
  if (not FSelectedArea.Selecting or (Button <> mbLeft))
  then Exit;
    FSelectedArea.NormalRect( Point(X, Y) );
    FSelectedArea.DrawRect( pbDisplay.Canvas );
    FSelectedArea.Selecting := False;

end;

end.
