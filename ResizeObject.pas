unit ResizeObject;

interface

uses
  SysUtils, Windows, Classes, Graphics, Controls, ExtCtrls;

type
  TKindSpots = (ksLeft, ksLeftTop, ksLeftBottom, ksTop, ksTopRight, ksRight, ksBottom, ksBottomRight);
  TSpots = set of TKindSpots;
  TObjectSpot = record
    Kind  : TKindSpots;
    Sport : TShape;
  end;
  TArrObjectSpots = array of TObjectSpot;

  TResizedObject = procedure(const ARect: TRect) of object;

  TResizeObject = class
  private
    FRect:TRect;
    FSpots:TSpots;
    FOnResized : TResizedObject;
    procedure SetSpots(val : TSpots);
    procedure SetRect(val : TRect);
  public
    constructor Create(ARect:TRect; AParent : TWinControl; ACanvas: TCanvas);
    destructor Destroy(); override;
    procedure Refresh();

    property Rect : TRect read FRect write SetRect;
    property Spots : TSpots read FSpots write SetSpots;
    property OnResized : TResizedObject read FOnResized write FOnResized;
  private
    FCanvas: TCanvas;
    FParent: TWinControl;
    FArrSpots:TArrObjectSpots;
    FSizing:Boolean;
    FPosDown:TPoint;
    procedure SpotMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SpotMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure SpotMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ClearArrObject();
    procedure CreateSpot(var ASpot: TShape);
    procedure DrawRectnagle();
    procedure ObjectSpots();
    procedure SetSpotXY(var ASpot : TObjectSpot);
    function GetCursor(kind : TKindSpots):TCursor;
    procedure ShiftSpot(Sender: TObject; X, Y: Integer);
  end;

  const
    SPOT_SIZE: Integer = 4; //размер квадрата
    SPOT_SIZE_H: Integer = 0; //доп смещение


implementation

uses Types;

constructor TResizeObject.Create(ARect:TRect; AParent : TWinControl; ACanvas: TCanvas);
begin
  FOnResized := nil;
  FParent:= AParent;
  FRect:= ARect;
  FCanvas:= ACanvas;
  FSizing:= false;
end;

destructor TResizeObject.Destroy();
begin
  ClearArrObject();
  inherited Destroy();
end;

procedure TResizeObject.Refresh();
  var
   i:Integer;
   n:Integer;
begin
  n := Length(FArrSpots)-1;
  for i:= 0  to n do
  begin
    SetSpotXY(FArrSpots[i]);
  end;
end;

procedure TResizeObject.SetSpots(val : TSpots);
begin
  FSpots := val;
  ObjectSpots();
  Refresh();
end;

procedure TResizeObject.SetRect(val : TRect);
begin
  FRect := val;
  Refresh();
end;

procedure TResizeObject.SpotMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if not(FSizing or (Button <> mbLeft)) then
  begin
    DrawRectnagle();
    FPosDown := (Sender as TShape).ClientToParent(Point(X, Y));
    FSizing:=true;
  end;
end;

procedure TResizeObject.SpotMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if not FSizing then Exit;
  DrawRectnagle();
  ShiftSpot(Sender, X, Y);
  DrawRectnagle();
  Refresh();
end;

procedure TResizeObject.SpotMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if not FSizing then Exit;
  DrawRectnagle();
  FSizing := False;
  ShiftSpot(Sender, X, Y);
  if Assigned(FOnResized) then FOnResized(FRect);
end;

procedure TResizeObject.ClearArrObject();
var
 i: Integer;
 n: Integer;
begin
  n := Length(FArrSpots)-1;
  for i:= 0  to n do
  begin
    FreeAndNil(FArrSpots[i].Sport);
  end;
  SetLength(FArrSpots, 0);
end;


procedure TResizeObject.CreateSpot(var ASpot: TShape);
begin
  ASpot:= TShape.Create(nil);
  ASpot.Height:= SPOT_SIZE;
  ASpot.Width:= SPOT_SIZE;
  ASpot.Shape:= stRectangle;
  ASpot.Parent:= FParent;
  ASpot.OnMouseDown:= SpotMouseDown;
  ASpot.OnMouseMove:= SpotMouseMove;
  ASpot.OnMouseUp:= SpotMouseUp;
end;

procedure TResizeObject.DrawRectnagle();
begin
//  if EqualRect(FRect, Rect(0,0,0,0)) then Exit;
  with FCanvas do
  begin
    Pen.Style := psDot;
    Pen.Color := clGray;
    Pen.Mode  := pmXor;
    Pen.Width := 1;
    Brush.Style := bsClear;
    Rectangle(FRect);
  end;
end;

procedure TResizeObject.ObjectSpots();
var
  lastIndx: Integer;

procedure AddSpot(kind : TKindSpots);
begin
  SetLength(FArrSpots, lastIndx+1);
  FArrSpots[lastIndx].Kind := kind;
  CreateSpot(FArrSpots[lastIndx].Sport);
  FArrSpots[lastIndx].Sport.Tag := lastIndx;
  FArrSpots[lastIndx].Sport.Cursor := GetCursor(kind);
end;

begin
  ClearArrObject();
  lastIndx := 0;
  if  ksLeft in FSpots then
  begin
    AddSpot(ksLeft);
    inc(lastIndx);
  end;
  if  ksLeftTop in FSpots then
  begin
    AddSpot(ksLeftTop);
    inc(lastIndx);
  end;
  if  ksLeftBottom in FSpots then
  begin
    AddSpot(ksLeftBottom);
    inc(lastIndx);
  end;
  if  ksTop in FSpots then
  begin
    AddSpot(ksTop);
    inc(lastIndx);
  end;
  if  ksTopRight in FSpots then
  begin
    AddSpot(ksTopRight);
    inc(lastIndx);
  end;
  if  ksRight in FSpots then
  begin
    AddSpot(ksRight);
    inc(lastIndx);
  end;
  if  ksBottom in FSpots then
  begin
    AddSpot(ksBottom);
    inc(lastIndx);
  end;
  if  ksBottomRight in FSpots then
  begin
    AddSpot(ksBottomRight);
    inc(lastIndx);
  end;
end;

procedure TResizeObject.SetSpotXY(var ASpot : TObjectSpot);
begin
  case ASpot.Kind of
    ksLeft:
      begin
        ASpot.Sport.Left := FRect.Left-SPOT_SIZE_H;
        ASpot.Sport.Top := FRect.Top + ((FRect.Bottom - FRect.Top) div 2) - SPOT_SIZE_H;
      end;
    ksLeftTop:
      begin
        ASpot.Sport.Left := FRect.Left - SPOT_SIZE_H;
        ASpot.Sport.Top := FRect.Top - SPOT_SIZE_H;
      end;
    ksLeftBottom:
      begin
        ASpot.Sport.Left := FRect.Left-SPOT_SIZE_H;
        ASpot.Sport.Top := FRect.Bottom - SPOT_SIZE_H;
      end;
    ksTop:
      begin
        ASpot.Sport.Left := FRect.Left + ((FRect.Right - FRect.Left) div 2)-SPOT_SIZE_H;
        ASpot.Sport.Top := FRect.Top-SPOT_SIZE_H;
      end;
    ksTopRight:
      begin
        ASpot.Sport.Left := FRect.Right-SPOT_SIZE_H;
        ASpot.Sport.Top := FRect.Top-SPOT_SIZE_H;
      end;
    ksRight:
      begin
        ASpot.Sport.Left := FRect.Right-SPOT_SIZE_H;
        ASpot.Sport.Top := FRect.Top + ((FRect.Bottom - FRect.Top) div 2)-SPOT_SIZE_H;
      end;
    ksBottom:
      begin
        ASpot.Sport.Left := FRect.Left + ((FRect.Right - FRect.Left) div 2)-SPOT_SIZE_H;
        ASpot.Sport.Top := FRect.Bottom-SPOT_SIZE_H;
      end;
    ksBottomRight:
      begin
        ASpot.Sport.Left := FRect.Right-SPOT_SIZE_H;
        ASpot.Sport.Top := FRect.Bottom-SPOT_SIZE_H;
      end;
  end;
end;

function TResizeObject.GetCursor(kind : TKindSpots): TCursor;
begin
  Result := crDefault;
  case kind of
    ksLeft:
      Result := crSizeWE;
    ksLeftTop:
      Result := crSizeNWSE;
    ksLeftBottom:
      Result := crSizeNESW;
    ksTop:
      Result := crSizeNS;
    ksTopRight:
      Result := crSizeNESW;
    ksRight:
      Result := crSizeWE;
    ksBottom:
      Result := crSizeNS;
    ksBottomRight:
      Result := crSizeNWSE;
  end;
end;

procedure TResizeObject.ShiftSpot(Sender: TObject; X, Y: Integer);
var
  itmSpot : TObjectSpot;
  tmpPos:TPoint;
  kind: TKindSpots;
begin
  itmSpot := FArrSpots[(Sender as TShape).Tag];
  tmpPos := itmSpot.Sport.ClientToParent(Point(X, Y));

  case itmSpot.Kind of
    ksLeft:
      begin
      end;
    ksLeftTop:
      begin
      end;
    ksTop:
      begin
      end;
    ksTopRight,
    ksRight:
      begin
        tmpPos.Y := FRect.Bottom;
        inc(FRect.Right, (tmpPos.X - FPosDown.X));
      end;
    ksLeftBottom,
    ksBottom:
      begin
        tmpPos.X := FRect.Right;
        inc(FRect.Bottom,(tmpPos.Y - FPosDown.Y));
      end;
    ksBottomRight:
      begin
        inc(FRect.Right, (tmpPos.X - FPosDown.X));
        inc(FRect.Bottom,(tmpPos.Y - FPosDown.Y));
      end;
  end;
  FPosDown := tmpPos;
end;

end.
