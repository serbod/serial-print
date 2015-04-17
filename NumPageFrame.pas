unit NumPageFrame;

interface

uses
  Windows, SysUtils, Classes, Graphics, Controls, Forms,
  StdCtrls, Buttons, ComCtrls, ExtCtrls, ItemsDef, Grids, ValEdit,
  ActnList, Menus, MainForm, Clipbrd, Core, IniFiles;

type
  TfrmNumPageTemplate = class(TFrame)
    grpPreview: TGroupBox;
    imgPreview: TImage;
    grpTickets: TGroupBox;
    grpLabel: TGroupBox;
    lvTickets: TListView;
    lbedTicketName: TLabeledEdit;
    lbedTicketPosX: TLabeledEdit;
    lbedTicketPosY: TLabeledEdit;
    vleNLData: TValueListEditor;
    pmList: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    actlst: TActionList;
    actAddItem: TAction;
    actDelItem: TAction;
    edName: TEdit;
    lbName: TLabel;
    edWidth: TEdit;
    lbWidth: TLabel;
    edHeight: TEdit;
    lbHeight: TLabel;
    grpNumPageProps: TGroupBox;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    actUpdateList: TAction;
    actSaveList: TAction;
    cbbTicketTpl: TComboBox;
    lbTicketTpl: TLabel;
    actImageFromFile: TAction;
    actImageFromClipboard: TAction;
    actImageClear: TAction;
    pmImage: TPopupMenu;
    N7: TMenuItem;
    N8: TMenuItem;
    actBtnOK: TAction;
    actBtnCancel: TAction;
    actAddLabel: TAction;
    miAddLabel: TMenuItem;
    procedure actlstExecute(Action: TBasicAction; var Handled: Boolean);
    procedure DummyAction(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure lbedTicketNameChange(Sender: TObject);
    procedure lvTicketsSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure edWidthChange(Sender: TObject);
    procedure edHeightChange(Sender: TObject);
    procedure FrameResize(Sender: TObject);
    procedure lbedTicketPosXChange(Sender: TObject);
    procedure lbedTicketPosYChange(Sender: TObject);
    procedure lbedPosKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure imgPreviewMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgPreviewMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private
    { Private declarations }
    StopUpdate: Boolean;
    PreviewBgImage: TBitmap;
    PreviewParams: TPreviewParams;
    procedure ReadItem_NumPageTpl(ListOnly: Boolean = false);
    procedure ReadItem_Ticket();
    procedure WriteItem_NumPageTpl();
    procedure WriteItem_Ticket();
    procedure TicketMod(Item: TListItem; Action: string);
    procedure UpdatePreview();
    function GetTicketByPoint(Point: TPoint): TTicket;
    function GetNumlabelByPoint(Point: TPoint): TNumLabel;
    procedure SetPreviewParams();
  public
    { Public declarations }
    Form: TForm;
    Page: TSomePage;
    NumPageTpl: TNumPageTpl;
    NumProject: TNumProject;
    CurTicket: TTicket;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure ReadItem();
    procedure ChangeLanguage();
  end;

var
  iImgIndexTicket: Integer = 24;
  iImgIndexNumlabel: Integer = 0;
  NumPageCreated: Boolean = False;
  sAskDeleteTicket: string = 'Удалить билет?';

implementation
//uses MainForm;
{$R *.dfm}

constructor TfrmNumPageTemplate.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  StopUpdate:=False;
  PreviewBgImage:=nil;

  //
  NumPageCreated:= True;
  ChangeLanguage;
end;

destructor TfrmNumPageTemplate.Destroy;
begin
  if Assigned(PreviewBgImage) then FreeAndNil(PreviewBgImage);
  StopUpdate:=True;
  NumPageCreated:= False;
  inherited Destroy();
end;

procedure TfrmNumPageTemplate.ChangeLanguage();
var
  Part: string;
begin
  if not Assigned(langFile) then  Exit;
  if NumPageCreated then
  begin
    Part:= 'NumPage';
    Self.grpNumPageProps.Caption:= LangFile.ReadString(Part, 'sgrpNumPageProps', Self.grpNumPageProps.Caption);
    Self.lbName.Caption:= LangFile.ReadString(Part, 'slbName', Self.lbName.Caption);
    Self.lbHeight.Caption:= LangFile.ReadString(Part, 'slbHeight', Self.lbHeight.Caption);
    Self.lbWidth.Caption:= LangFile.ReadString(Part, 'slbWidth', Self.lbWidth.Caption);
    Self.btnOK.Caption:= LangFile.ReadString(Part, 'sbtnOk', Self.btnOK.Caption);
    Self.btnCancel.Caption:= LangFile.ReadString(Part, 'sbtnCancel', Self.btnCancel.Caption);
    Self.grpPreview.Caption:= LangFile.ReadString(Part, 'sgrpPreview', Self.grpPreview.Caption);
    Self.grpTickets.Caption:= LangFile.ReadString(Part, 'sgrpTickets', Self.grpTickets.Caption);
    Self.lvTickets.Columns[0].Caption:= LangFile.ReadString(Part, 'slvTickets_0', Self.lvTickets.Columns[0].Caption);
    Self.lvTickets.Columns[1].Caption:= LangFile.ReadString(Part, 'slvTickets_1', Self.lvTickets.Columns[1].Caption);
    Self.N1.Caption:= LangFile.ReadString(Part, 'smiAddTicket', Self.N1.Caption);
    Self.miAddLabel.Caption:= LangFile.ReadString(Part, 'smiAddLabel', Self.miAddLabel.Caption);
    Self.N2.Caption:= LangFile.ReadString(Part, 'smiDelete', Self.N2.Caption);
    //Self.N6.Caption:= LangFile.ReadString(Part, 'smiImgFromFile', Self.N6.Caption);
    Self.N7.Caption:= LangFile.ReadString(Part, 'smiImgFromClipboard', Self.N7.Caption);
    Self.N8.Caption:= LangFile.ReadString(Part, 'smiClearImg', Self.N8.Caption);
    Self.grpLabel.Caption:= LangFile.ReadString(Part, 'sgrpLabel', Self.grpLabel.Caption);
    Self.lbedTicketName.EditLabel.Caption:= LangFile.ReadString(Part,'slbedTicketName', Self.lbedTicketName.EditLabel.Caption);
    Self.lbedTicketPosX.EditLabel.Caption:= LangFile.ReadString(Part, 'slbedTicketPosX', Self.lbedTicketPosX.EditLabel.Caption);
    Self.lbedTicketPosY.EditLabel.Caption:= LangFile.ReadString(Part, 'slbedTicketPosY', Self.lbedTicketPosY.EditLabel.Caption);
    Self.lbTicketTpl.Caption:= LangFile.ReadString(Part, 'slbTicketTpl', Self.lbTicketTpl.Caption);
    Self.vleNLData.TitleCaptions[0]:= LangFile.ReadString(Part, 'svleNLData_0', Self.vleNLData.TitleCaptions[0]);
    Self.vleNLData.TitleCaptions[1]:= LangFile.ReadString(Part, 'svleNLData_1', Self.vleNLData.TitleCaptions[1]);

  end;
end;

procedure TfrmNumPageTemplate.ReadItem_NumPageTpl(ListOnly: Boolean = false);
var
  i: Integer;
  lvi: TListItem;
  nl: TNumLabel;
begin
  if not Assigned(NumPageTpl) then Exit;
  NumPageTpl.Read(true);
  edName.Text:=NumPageTpl.Name;
  edWidth.Text:=IntToStr(NumPageTpl.Size.X);
  edHeight.Text:=IntToStr(NumPageTpl.Size.Y);

  TicketMod(nil, 'update_list');
end;

procedure TfrmNumPageTemplate.WriteItem_NumPageTpl();
begin
  if not Assigned(NumPageTpl) then Exit;
  NumPageTpl.Name:=edName.Text;
  NumPageTpl.Size.X:=StrToIntDef(edWidth.Text, 0);
  NumPageTpl.Size.Y:=StrToIntDef(edHeight.Text, 0);
  StartTransaction();
  NumPageTpl.Write();
  TicketMod(nil, 'write_list');
  CloseTransaction();
end;

procedure TfrmNumPageTemplate.ReadItem_Ticket();
var
  Item: TTicket;
  i: Integer;
begin
  if not Assigned(CurTicket) then Exit;
  Item:=CurTicket;

  lbedTicketName.Text:=Item.Name;
  lbedTicketPosX.Text:=IntToStr(Item.Position.X);
  lbedTicketPosY.Text:=IntToStr(Item.Position.Y);

  if Assigned(Item.Tpl) then
  begin
    //cbbTicketTpl.Text:=Item.Tpl.Name;
    i:=cbbTicketTpl.Items.IndexOfObject(Item.Tpl);
    cbbTicketTpl.ItemIndex:=i;
  end;

  vleNLData.Strings.Clear();
//  vleNLData.InsertRow('Action', Item.Action, true);
//  vleNLData.InsertRow('ValueType', Item.ValueType, true);
//  vleNLData.InsertRow('BaseValue', Item.BaseValue, true);
end;

procedure TfrmNumPageTemplate.WriteItem_Ticket();
var
  i: Integer;
  Item: TTicket;
begin
  if not Assigned(CurTicket) then Exit;
  Item:=CurTicket;

  Item.Name:=lbedTicketName.Text;
  Item.Position.X:=StrToIntDef(lbedTicketPosX.Text, 0);
  Item.Position.Y:=StrToIntDef(lbedTicketPosY.Text, 0);

  if cbbTicketTpl.Items.Count>0 then
  begin
    i:=cbbTicketTpl.ItemIndex;
    if i<0 then i:=0;
    Item.Tpl:=(cbbTicketTpl.Items.Objects[i] as TTicketTpl);
  end;
  //Item.Action:=vleNLData.Values['Action'];
  //Item.ValueType:=vleNLData.Values['ValueType'];
  //Item.BaseValue:=vleNLData.Values['BaseValue'];
end;

procedure TfrmNumPageTemplate.TicketMod(Item: TListItem; Action: string);
var
  NewItem: TListItem;
  NewObject, ItemObject: TTicket;
  i: Integer;
begin
  if not Assigned(NumPageTpl) then Exit;
  StopUpdate:=True;
  ItemObject:=nil;
  if Assigned(Item) then
  begin
    if Assigned(Item.Data) then
    begin
      ItemObject:=TTicket(Item.Data);
    end;
  end;

  if Action='add' then
  begin
    NewObject:=TTicket.Create(self.NumProject);
    NewObject.Name:='Билет '+IntToStr(NumPageTpl.Tickets.Count+1);
    if NumProject.TicketTplList.Count>0 then NewObject.Tpl:=NumProject.TicketTplList[0];
    NewObject.NumPageTpl:=NumPageTpl;

    if Assigned(CurTicket) then
    begin
      NewObject.Tpl:=CurTicket.Tpl;
      NewObject.Position:=CurTicket.Position;
      //NewObject.BaseValue:=CurNumLabel.BaseValue;
      //NewObject.ValueType:=CurNumLabel.ValueType;
      //NewObject.Action:=CurNumLabel.Action;
    end;
    NumPageTpl.Tickets.Add(NewObject);

    NewItem:=lvTickets.Items.Add();
    NewItem.Caption:=NewObject.Name;
    NewItem.SubItems.Add(PosToStr(NewObject.Position));
    NewItem.Data:=NewObject;
    NewItem.ImageIndex:=iImgIndexTicket;
  end

  else if Action='del' then
  begin
    if Assigned(Item) then
    begin
      // Are you sure?
      if Application.MessageBox(PAnsiChar(sAskDeleteTicket), PAnsiChar(sAskDeleteCaption), MB_OKCANCEL) <> IDOK then Exit;

      i:=lvTickets.Items.IndexOf(Item);
      Item.Delete();
      ItemObject.Delete();
      NumPageTpl.Tickets.Remove(ItemObject);
      CurTicket:=nil;

      if NumPageTpl.Tickets.Count>0 then
      begin
        if i >= lvTickets.Items.Count then i:=lvTickets.Items.Count-1;
        lvTickets.ItemIndex:=i;
      end
      else
      begin
        lbedTicketName.Text:='';
        lbedTicketPosX.Text:='';
        lbedTicketPosY.Text:='';
        //vleNLData
      end;
    end;
  end

  {else if Action='edit' then
  begin
    if Assigned(ItemObject) then
    begin
    end;
  end}

  else if Action='update_list' then
  begin
    //if not NumPageTpl.Tickets.LoadFromBase() then Exit;
    lvTickets.Items.BeginUpdate();
    lvTickets.Items.Clear();

    for i:=0 to NumPageTpl.Tickets.Count-1 do
    begin
      NewObject:=(NumPageTpl.Tickets[i] as TTicket);
      NewObject.Read();
      NewItem:=lvTickets.Items.Add();
      NewItem.Caption:=NewObject.Name;
      NewItem.Data:=NewObject;
      NewItem.ImageIndex:=iImgIndexTicket;
      NewItem.SubItems.Add(PosToStr(NewObject.Position));
    end;
    lvTickets.Items.EndUpdate();
  end

  else if Action='write_list' then
  begin
    //TicketTpl.NumLabels.SaveToBase();
    for i:=0 to NumPageTpl.Tickets.Count-1 do
    begin
      (NumPageTpl.Tickets[i] as TTicket).Write();
    end;
  end

  else if Action='select' then
  begin
    if Assigned(ItemObject) then
    begin
      if Assigned(CurTicket) then
      begin
        if CurTicket<>ItemObject then
        begin
        end;
      end;
      // Save previous item
      WriteItem_Ticket();
      CurTicket:=ItemObject;
      // Read selected item
      ReadItem_Ticket();
      //frmMain.Caption:=snProgramName+' - '+CurProject.Name;
      //memoProjectDesc.Lines.Text:=CurProject.Desc;
    end;
  end;
  StopUpdate:=False;
end;

procedure TfrmNumPageTemplate.actlstExecute(Action: TBasicAction;
  var Handled: Boolean);
var
  ListItem: TListItem;
begin
  ListItem:=lvTickets.Selected;
  if Action = actAddItem then
  begin
    TicketMod(ListItem, 'add');
  end

  else if Action = actDelItem then
  begin
    TicketMod(ListItem, 'del');
  end

  else if Action = actUpdateList then
  begin
    TicketMod(ListItem, 'update_list');
  end

  else if Action = actSaveList then
  begin
    TicketMod(ListItem, 'write_list');
  end

  else if Action = actImageFromFile then
  begin
  end

  else if Action = actImageFromClipboard then
  begin
    if not Assigned(PreviewBgImage) then PreviewBgImage:=TBitmap.Create();
    PreviewBgImage.LoadFromClipboardFormat(cf_Bitmap, ClipBoard.GetAsHandle(cf_Bitmap), 0);
    UpdatePreview();
  end

  else if Action = actImageClear then
  begin
    FreeAndNil(PreviewBgImage);
    UpdatePreview();
  end;

end;


procedure TfrmNumPageTemplate.DummyAction(Sender: TObject);
begin
  Exit;
end;

procedure TfrmNumPageTemplate.btnCancelClick(Sender: TObject);
begin
  //if Assigned(Form) then Form.Release();
  if (Parent is TSomePage) then
  begin
    Core.CmdQueue.AddCmd('CLOSE '+IntToStr((Parent as TSomePage).PageID));
  end;
  if Assigned(Form) then Form.Close();
end;

procedure TfrmNumPageTemplate.btnOKClick(Sender: TObject);
begin
  WriteItem_Ticket();
  WriteItem_NumPageTpl();
  self.NumPageTpl.Write();
  Core.CmdQueue.AddCmd('REFRESH PAGE_TPL_LIST');
  if (Parent is TSomePage) then
  begin
    Core.CmdQueue.AddCmd('CLOSE '+IntToStr((Parent as TSomePage).PageID));
  end;
  //if Assigned(Form) then Form.Release();
  if Assigned(Form) then Form.Close();
end;

procedure TfrmNumPageTemplate.ReadItem();
var
  i: integer;
  Item: TTicketTpl;
begin
  cbbTicketTpl.Clear();
  for i:=0 to NumProject.TicketTplList.Count-1 do
  begin
    Item:=NumProject.TicketTplList[i];
    cbbTicketTpl.AddItem(Item.Name, Item);
  end;
  ReadItem_NumPageTpl();
  UpdatePreview();
end;

procedure TfrmNumPageTemplate.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Assigned(Form) then Form.Release();
end;

procedure TfrmNumPageTemplate.lbedTicketNameChange(Sender: TObject);
begin
  if Assigned(lvTickets.Selected) then lvTickets.Selected.Caption:=lbedTicketName.Text;
end;

procedure TfrmNumPageTemplate.lvTicketsSelectItem(Sender: TObject;
  Item: TListItem; Selected: Boolean);
begin
  TicketMod(Item, 'select');
  UpdatePreview();
end;

procedure TfrmNumPageTemplate.SetPreviewParams();
var
  Canvas: TCanvas;
  kx, ky: Real;
  PreviewSize: TSize;
begin
  imgPreview.Picture.Bitmap.Height:=imgPreview.Height;
  imgPreview.Picture.Bitmap.Width:=imgPreview.Width;
  Canvas:=imgPreview.Canvas;

  // Compute ticket preview size in pixels
  with PreviewParams do
  begin
    SizeMm.cx:=StrToIntDef(edWidth.Text, 0);
    SizeMm.cy:=StrToIntDef(edHeight.Text, 0);
    CanvasSize.cx:=Canvas.ClipRect.Right-Canvas.ClipRect.Left;
    CanvasSize.cy:=Canvas.ClipRect.Bottom-Canvas.ClipRect.Top;
    PreviewSize.cx:=CanvasSize.cx-8;
    PreviewSize.cy:=CanvasSize.cy-8;

    kx:=0; if SizeMm.cx<>0 then kx:=PreviewSize.cx/SizeMm.cx;
    ky:=0; if SizeMm.cy<>0 then ky:=PreviewSize.cy/SizeMm.cy;

    if kx<ky then
    begin
      k:=kx;
      PreviewSize.cy:=Round(SizeMm.cy*k);
    end
    else
    begin
      k:=ky;
      PreviewSize.cx:=Round(SizeMm.cx*k);
    end;

    BordersRect.Left:=(CanvasSize.cx-PreviewSize.cx) div 2;
    BordersRect.Top:=(CanvasSize.cy-PreviewSize.cy) div 2;
    BordersRect.Right:=BordersRect.Left+PreviewSize.cx;
    BordersRect.Bottom:=BordersRect.Top+PreviewSize.cy;
  end;
end;

procedure TfrmNumPageTemplate.UpdatePreview();
var
  tr, r: TRect;
  x,y,sx,sy,i: Integer;
  Item: TTicket;
  Canvas: TCanvas;
begin
  if not Assigned(NumPageTpl) then Exit;
  SetPreviewParams();
  with PreviewParams do
  begin
    Canvas:=imgPreview.Canvas;
    // Clear canvas
    Canvas.Brush.Color:=clWhite;
    Canvas.FillRect(imgPreview.Canvas.ClipRect);

    Canvas.Pen.Width:=1;
    Canvas.Pen.Color:=clBlack;
    //Canvas.Brush.Color:=clInfoBk; //clYellow;
    //Canvas.FillRect(BordersRect);
    Canvas.Rectangle(BordersRect);

    // Draw background image
    if Assigned(PreviewBgImage) then
    begin
      Canvas.StretchDraw(BordersRect, PreviewBgImage);
    end;

    // Draw tickets
    for i:=0 to NumPageTpl.Tickets.Count-1 do
    begin
      Item:=NumPageTpl.Tickets[i];
      if not Assigned(Item.Tpl) then Continue;
      x:=BordersRect.Left+Round(Item.Position.X*k);
      y:=BordersRect.Top+Round(Item.Position.Y*k);
      sx:=Round(Item.Tpl.Size.X*k);
      sy:=Round(Item.Tpl.Size.Y*k);
      r:=Rect(x, y, x+sx, y+sy);
      Canvas.Pen.Width:=1;
      if Assigned(CurTicket) then
      begin
        if CurTicket.ID = Item.ID then Canvas.Pen.Width:=3;
      end;
      Canvas.Pen.Color:=clBlack;
      Canvas.Brush.Color:=clInfoBk; //clYellow;
      Canvas.FillRect(r);
      Canvas.Rectangle(r);

    end;
  end;
end;


procedure TfrmNumPageTemplate.edWidthChange(Sender: TObject);
begin
  UpdatePreview();
end;

procedure TfrmNumPageTemplate.edHeightChange(Sender: TObject);
begin
  UpdatePreview();
end;

procedure TfrmNumPageTemplate.FrameResize(Sender: TObject);
begin
  UpdatePreview();
end;

procedure TfrmNumPageTemplate.lbedTicketPosXChange(Sender: TObject);
begin
  if StopUpdate then Exit;
  WriteItem_Ticket();
  TicketMod(nil, 'update_list');
  UpdatePreview();
end;

procedure TfrmNumPageTemplate.lbedTicketPosYChange(Sender: TObject);
begin
  if StopUpdate then Exit;
  WriteItem_Ticket();
  TicketMod(nil, 'update_list');
  UpdatePreview();
end;

procedure TfrmNumPageTemplate.lbedPosKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  i, n: Integer;
begin
  n:=0;
  if Key = VK_UP then
  begin
    n:=1;
  end
  else if Key = VK_DOWN then
  begin
    n:=-1;
  end;
  if (ssShift in Shift) then n:=n*5;
  if not (Sender is TLabeledEdit) then Exit;
  i:=StrToIntDef((Sender as TLabeledEdit).Text, 0);
  i:=i+n;
  (Sender as TLabeledEdit).Text:=IntToStr(i);
end;

function TfrmNumPageTemplate.GetNumlabelByPoint(Point: TPoint): TNumLabel;
var
  LocalPoint: TPoint;
  Canvas: TCanvas;
  x,y, i: Integer;
  r: TRect;
  Item: TNumLabel;
  LogFont: TLogFont;
  TextSize: TSize;
begin
  Result:=nil;
  //LocalPoint:=self.ScreenToClient(Point);
  LocalPoint:=Point;
  SetPreviewParams();
  with PreviewParams do
  begin
    Canvas:=imgPreview.Canvas;

    // Test numlabels
    for i:=0 to NumPageTpl.NumLabels.Count-1 do
    begin
      Item:=NumPageTpl.NumLabels[i];
      if not Assigned(Item.Font) then Continue;
      x:=BordersRect.Left+Round(Item.Position.X*k);
      y:=BordersRect.Top+Round(Item.Position.Y*k);
      Canvas.Font.Assign(Item.Font);
      // Пересчет размера шрифта
      //Canvas.Font.Height:=Round(Item.Size * Font.PixelsPerInch / 72 *k);
      Canvas.Font.Height:=-Round(Item.Size * k);
      GetObject(Canvas.Font.Handle, SizeOf(TLogFont), @LogFont);
      { Вывести текст 1/10 градуса против часовой стрелки }
      LogFont.lfEscapement := Item.Angle*10;
      Canvas.Font.Handle := CreateFontIndirect(LogFont);

      TextSize:=Canvas.TextExtent(Item.Name);

      r:=Rect(x, y, x+TextSize.cx, y+TextSize.cy);

      if PtInRect(r, LocalPoint) then
      begin
        Result:=Item;
        Exit;
      end;
    end;
  end;
end;

function TfrmNumPageTemplate.GetTicketByPoint(Point: TPoint): TTicket;
var
  LocalPoint: TPoint;
  Canvas: TCanvas;
  x, y, sx, sy, i: Integer;
  r: TRect;
  Item: TTicket;
  LogFont: TLogFont;
  TextSize: TSize;
begin
  Result:=nil;
  //LocalPoint:=self.ScreenToClient(Point);
  LocalPoint:=Point;
  SetPreviewParams();
  with PreviewParams do
  begin
    Canvas:=imgPreview.Canvas;

    // Test tickets
    for i:=0 to NumPageTpl.Tickets.Count-1 do
    begin
      Item:=NumPageTpl.Tickets[i];
      if not Assigned(Item.Tpl) then Continue;
      x:=BordersRect.Left+Round(Item.Position.X*k);
      y:=BordersRect.Top+Round(Item.Position.Y*k);
      sx:=Round(Item.Tpl.Size.X*k);
      sy:=Round(Item.Tpl.Size.Y*k);
      r:=Rect(x, y, x+sx, y+sy);

      if PtInRect(r, LocalPoint) then
      begin
        Result:=Item;
        Exit;
      end;
    end;
  end;
end;

function GetListItemByItemObject(lv: TListView; ItemObject: TObject): TListItem;
var
  i: integer;
begin
  Result:=nil;
  for i:=0 to lv.Items.Count-1 do
  begin
    if lv.Items[i].Data = ItemObject then
    begin
      Result:=lv.Items[i];
      Exit;
    end;
  end;
end;

procedure TfrmNumPageTemplate.imgPreviewMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  Item1: TTicket;
  Item2: TNumLabel;
  ListItem: TListItem;
begin
  if Button = mbLeft then
  begin
    // Ищем билет по координатам
    Item1:=GetTicketByPoint(Point(X, Y));
    if Assigned(Item1) then
    begin
      ListItem:=GetListItemByItemObject(lvTickets, Item1);
      if not Assigned(ListItem) then Exit;
      lvTickets.Selected:=ListItem;
      PreviewParams.MouseOffset.X:=X-PreviewParams.BordersRect.Left-Round(Item1.Position.X*PreviewParams.k);
      PreviewParams.MouseOffset.Y:=Y-PreviewParams.BordersRect.Top-Round(Item1.Position.Y*PreviewParams.k);
      Exit;
    end;

    // Ищем нумератор по координатам
    Item2:=GetNumlabelByPoint(Point(X, Y));
    if Assigned(Item2) then
    begin
      ListItem:=GetListItemByItemObject(lvTickets, Item2);
      if not Assigned(ListItem) then Exit;
      lvTickets.Selected:=ListItem;
      PreviewParams.MouseOffset.X:=X-PreviewParams.BordersRect.Left-Round(Item2.Position.X*PreviewParams.k);
      PreviewParams.MouseOffset.Y:=Y-PreviewParams.BordersRect.Top-Round(Item2.Position.Y*PreviewParams.k);
      Exit;
    end;
    //NumLabelMod(ListItem, 'select');
    //UpdatePreview();
  end;
end;

procedure TfrmNumPageTemplate.imgPreviewMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
  PointMM: TPoint;
begin
  if (ssLeft in Shift) then
  begin
    if not Assigned(CurTicket) then Exit;
    if PreviewParams.k=0 then Exit;
    StopUpdate:=True;
    PointMM.X:=Round((X-PreviewParams.BordersRect.Left-PreviewParams.MouseOffset.X)/PreviewParams.k);
    PointMM.Y:=Round((Y-PreviewParams.BordersRect.Top-PreviewParams.MouseOffset.Y)/PreviewParams.k);
    CurTicket.Position.X:=PointMM.X;
    CurTicket.Position.Y:=PointMM.Y;
    lbedTicketPosX.Text:=IntToStr(PointMM.X);
    lbedTicketPosY.Text:=IntToStr(PointMM.Y);
    UpdatePreview();
    StopUpdate:=False;
  end;
end;

end.
