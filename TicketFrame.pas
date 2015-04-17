unit TicketFrame;

interface

uses
  Windows, SysUtils, Graphics, Controls, Forms, Types,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, ItemsDef, Grids, ValEdit,
  ActnList, Menus, Classes, Clipbrd, IniFiles, Core;

type
  TfrmTicketTemplate = class(TFrame)
    grpPreview: TGroupBox;
    imgTicket: TImage;
    grpNumLabels: TGroupBox;
    grpLabel: TGroupBox;
    lvLabels: TListView;
    lbFont: TLabel;
    dlgFont: TFontDialog;
    btnFontSelect: TBitBtn;
    lbedNLName: TLabeledEdit;
    lbedNLPosX: TLabeledEdit;
    lbedNLPosY: TLabeledEdit;
    vleNLData: TValueListEditor;
    pmListNL: TPopupMenu;
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
    grpTicketProps: TGroupBox;
    btnOK: TBitBtn;
    actUpdateList: TAction;
    actSaveList: TAction;
    btnCancel: TBitBtn;
    actBtnOK: TAction;
    actBtnCancel: TAction;
    actBtnFont: TAction;
    actBtnColor: TAction;
    actImageFromFile: TAction;
    actImageFromClipboard: TAction;
    actImageClear: TAction;
    pmPreview: TPopupMenu;
    miImageFromClipboard: TMenuItem;
    miImageRemove: TMenuItem;
    cbbNumLabelsTpl: TComboBox;
    lbNumLabelTpl: TLabel;
    lbedAngle: TLabeledEdit;
    lbedFontSize: TLabeledEdit;
    procedure actlstExecute(Action: TBasicAction; var Handled: Boolean);
    procedure DummyAction(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFontSelectClick(Sender: TObject);
    procedure lbedNLNameChange(Sender: TObject);
    procedure lvLabelsSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure edWidthChange(Sender: TObject);
    procedure edHeightChange(Sender: TObject);
    procedure lbedNLPosXChange(Sender: TObject);
    procedure lbedNLPosYChange(Sender: TObject);
    procedure lbedPosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FrameResize(Sender: TObject);
    procedure vleNLDataStringsChange(Sender: TObject);
    procedure cbbNumLabelsTplSelect(Sender: TObject);
    procedure lbedAngleChange(Sender: TObject);
    procedure lbedFontSizeChange(Sender: TObject);
    procedure edNumKeyPress(Sender: TObject; var Key: Char);
    procedure imgTicketMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgTicketMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FrameMouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
  private
    { Private declarations }
    StopUpdate: Boolean;
    PreviewBgImage: Graphics.TBitmap;
    PreviewParams: TPreviewParams;
    procedure ReadItem_Ticket(ListOnly: Boolean = false);
    procedure ReadItem_NumLabel();
    procedure Read_NumLabelTpl();
    procedure WriteItem_Ticket();
    procedure WriteItem_NumLabel();
    procedure NumLabelMod(Item: TListItem; Action: string);
    procedure UpdateFontLabel();
    procedure UpdatePreview();
    function GetNumlabelByPoint(Point: TPoint): TNumLabel;
    procedure SetPreviewParams();
  public
    { Public declarations }
    Form: TForm;
    currLangTicket: string;
    TicketTpl: TTicketTpl;
    NumProject: TNumProject;
    CurNumLabel: TNumLabel;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure ReadItem();
    procedure ChangeLanguage();
  end;

var
  frmTicketCreated: Boolean = False;
  sAskDeleteNumLabel: string = 'Удалить надпись?';

implementation
uses MainForm;

{$R *.dfm}

procedure TfrmTicketTemplate.ChangeLanguage();
var
  Part: string;
begin
   if not Assigned(LangFile) then Exit;
   if not frmTicketCreated then Exit;

   Part:= 'frmTicket';
   sAskDeleteNumLabel:=LangFile.ReadString(Part, 'sAskDeleteNumLabel', sAskDeleteNumLabel);
   Self.grpPreview.Caption:= LangFile.ReadString(Part, 'sgrpPreview', Self.grpPreview.Caption);
   Self.grpTicketProps.Caption:= LangFile.ReadString(Part, 'sgrpTicketProps', Self.grpTicketProps.Caption);
   Self.lbName.Caption:= LangFile.ReadString(Part, 'slbName', Self.lbName.Caption);
   Self.lbHeight.Caption:= LangFile.ReadString(Part, 'slbHeight', Self.lbHeight.Caption);
   Self.lbWidth.Caption:= LangFile.ReadString(Part, 'slbWidth', Self.lbWidth.Caption);
   Self.btnOK.Caption:= LangFile.ReadString(Part, 'sbtnOK', Self.btnOK.Caption);
   Self.btnCancel.Caption:= LangFile.ReadString(Part, 'sbtnCancel', Self.btnCancel.Caption);
   Self.grpNumLabels.Caption:= LangFile.ReadString(Part, 'sgrpNumLabels.', Self.grpNumLabels.Caption);
   Self.lvLabels.Columns[0].Caption:= LangFile.ReadString(Part, 'slvLabels_0', Self.lvLabels.Columns[0].Caption);
   Self.lvLabels.Columns[1].Caption:= LangFile.ReadString(Part, 'slvLabels_1', Self.lvLabels.Columns[1].Caption);
   Self.grpLabel.Caption:= LangFile.ReadString(Part, 'sgrpLabel', Self.grpLabel.Caption);
   Self.btnFontSelect.Caption:= LangFile.ReadString(Part, 'sbtnFontSelect', Self.btnFontSelect.Caption);
   Self.lbedNLName.EditLabel.Caption:= LangFile.ReadString(Part, 'slbedNLName', Self.lbedNLName.EditLabel.Caption);
   Self.lbedNLPosX.EditLabel.Caption:= LangFile.ReadString(Part, 'slbedNLPosX', Self.lbedNLPosX.EditLabel.Caption);
   Self.lbedNLPosY.EditLabel.Caption:= LangFile.ReadString(Part, 'slbedNLPosY', Self.lbedNLPosY.EditLabel.Caption);
   Self.lbedFontSize.EditLabel.Caption:= LangFile.ReadString(Part, 'slbedFontSize', Self.lbedFontSize.EditLabel.Caption);
   Self.lbedAngle.EditLabel.Caption:= LangFile.ReadString(Part, 'slbedAngle', Self.lbedAngle.EditLabel.Caption);
   Self.lbNumLabelTpl.Caption:= LangFile.ReadString(Part, 'slbNumLabelTpl', Self.lbNumLabelTpl.Caption);
   Self.vleNLData.TitleCaptions[0]:= LangFile.ReadString(Part, 'svleNLData_0', Self.vleNLData.TitleCaptions[0]);
   Self.vleNLData.TitleCaptions[1]:= LangFile.ReadString(Part, 'svleNLData_1', Self.vleNLData.TitleCaptions[1]);
end;

function GetFontDescr(font: TFont): string;
begin
  Result:=font.Name+', '+IntToStr(font.Size);
  if (fsBold in font.Style) then Result:=Result+', bold';
  if (fsItalic in font.Style) then Result:=Result+', italic';
  if (fsUnderline in font.Style) then Result:=Result+', underline';
end;

constructor TfrmTicketTemplate.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  StopUpdate:=False;
  PreviewBgImage:=nil;
  vleNLData.Strings.Clear();

  //
  frmTicketCreated:= True;
  ChangeLanguage();
end;

destructor TfrmTicketTemplate.Destroy;
begin
  if Assigned(PreviewBgImage) then FreeAndNil(PreviewBgImage);
  StopUpdate:=True;
  inherited Destroy();

  frmTicketCreated:= False;
end;

procedure TfrmTicketTemplate.UpdateFontLabel();
begin
  if not Assigned(CurNumLabel) then Exit;
  if not Assigned(CurNumLabel.Font) then Exit;

  lbFont.Caption:=GetFontDescr(CurNumLabel.Font);
  lbFont.Font:=CurNumLabel.Font;
  lbFont.Font.Color:=CurNumLabel.Color;
end;

procedure TfrmTicketTemplate.ReadItem_Ticket(ListOnly: Boolean = false);
var
  i: Integer;
  lvi: TListItem;
  nl: TNumLabel;
begin
  if not Assigned(TicketTpl) then Exit;
  TicketTpl.Read(true);
  edName.Text:=TicketTpl.Name;
  edWidth.Text:=IntToStr(TicketTpl.Size.X);
  edHeight.Text:=IntToStr(TicketTpl.Size.Y);

  NumLabelMod(nil, 'update_list');
end;

procedure TfrmTicketTemplate.WriteItem_Ticket();
begin
  if not Assigned(TicketTpl) then Exit;
  TicketTpl.Name:=edName.Text;
  TicketTpl.Size.X:=StrToIntDef(edWidth.Text, 0);
  TicketTpl.Size.Y:=StrToIntDef(edHeight.Text, 0);
  StartTransaction();
  TicketTpl.Write();
  NumLabelMod(nil, 'write_list');
  CloseTransaction();
end;

procedure TfrmTicketTemplate.Read_NumLabelTpl();
var
  i: integer;
  nlt: TNumLabelTpl;
  ItemProp: TItemProp;
begin
  nlt:=nil;
  if cbbNumLabelsTpl.Items.Count>0 then
  begin
    i:=cbbNumLabelsTpl.ItemIndex;
    //if i<0 then i:=0;
    if i >= 0 then nlt:=(cbbNumLabelsTpl.Items.Objects[i] as TNumLabelTpl);
  end;

  vleNLData.Strings.BeginUpdate();
  vleNLData.Strings.Clear();

  if Assigned(nlt) then
  begin
    vleNLData.Values['Action']:=nlt.Action;
    vleNLData.Values['ValueType']:=nlt.ValueType;
    vleNLData.Values['BaseValue']:=nlt.BaseValue;
  end
  else
  begin
    vleNLData.Values['Action']:='=';
    vleNLData.Values['ValueType']:='';
    vleNLData.Values['BaseValue']:='';
  end;

  ItemProp:=vleNLData.ItemProps['BaseValue'];
  ItemProp.KeyDesc:='Нач.значение';

  ItemProp:=vleNLData.ItemProps['ValueType'];
  ItemProp.KeyDesc:='Тип значения';
  ItemProp.EditStyle:=esPickList;
  ItemProp.PickList.Add('Номер');
  ItemProp.PickList.Add('Строка');
  ItemProp.PickList.Add('Дата');

  ItemProp:=vleNLData.ItemProps['Action'];
  ItemProp.KeyDesc:='Действие';
  ItemProp.EditStyle:=esPickList;
  ItemProp.PickList.Add('+');
  ItemProp.PickList.Add('=');
  ItemProp.PickList.Add('-');
  vleNLData.Strings.EndUpdate();
end;

procedure TfrmTicketTemplate.ReadItem_NumLabel();
var
  i: Integer;
  lvi: TListItem;
  nl: TNumLabel;
  ItemProp: TItemProp;
begin
  if not Assigned(CurNumLabel) then Exit;
  nl:=CurNumLabel;

  lbedNLName.Text:=nl.Name;
  lbedNLPosX.Text:=IntToStr(nl.Position.X);
  lbedNLPosY.Text:=IntToStr(nl.Position.Y);
  lbedFontSize.Text:=IntToStr(nl.Size);
  lbedAngle.Text:=IntToStr(nl.Angle);
  UpdateFontLabel();

  if Assigned(nl.NumLabelTpl) then
  begin
    //cbbNumLabelsTpl.Text:=nl.NumLabelTpl.Name;
    i:=cbbNumLabelsTpl.Items.IndexOfObject(nl.NumLabelTpl);
    if i>=0 then cbbNumLabelsTpl.ItemIndex:=i;
  end;
  Read_NumLabelTpl();
end;

procedure TfrmTicketTemplate.WriteItem_NumLabel();
var
  i: Integer;
  nl: TNumLabel;
begin
  if not Assigned(CurNumLabel) then Exit;
  nl:=CurNumLabel;

  nl.Name:=lbedNLName.Text;
  nl.Position.X:=StrToIntDef(lbedNLPosX.Text, nl.Position.X);
  nl.Position.Y:=StrToIntDef(lbedNLPosY.Text, nl.Position.Y);
  nl.Size:=StrToIntDef(lbedFontSize.Text, nl.Size);
  nl.Angle:=StrToIntDef(lbedAngle.Text, nl.Angle);
  nl.Font.Assign(lbFont.Font);
  nl.Color:=lbFont.Font.Color;

  // NumLabelTpl
  if cbbNumLabelsTpl.Items.Count>0 then
  begin
    i:=cbbNumLabelsTpl.ItemIndex;
    //if i<0 then i:=0;
    if i >= 0 then
    begin
      nl.NumLabelTpl:=(cbbNumLabelsTpl.Items.Objects[i] as TNumLabelTpl);
      nl.NumLabelTpl.Action:=vleNLData.Values['Action'];
      nl.NumLabelTpl.ValueType:=vleNLData.Values['ValueType'];
      nl.NumLabelTpl.BaseValue:=vleNLData.Values['BaseValue'];
    end;
  end;

  // Update selected list item
  for i:=0 to lvLabels.Items.Count-1 do
  begin
    if lvLabels.Items[i].Data = nl then
    begin
      lvLabels.Items[i].Caption:=nl.Name;
      if Assigned(nl.NumLabelTpl) then
      begin
        if lvLabels.Items[i].SubItems.Count>0 then
          lvLabels.Items[i].SubItems[0]:=nl.NumLabelTpl.Action
        else
          lvLabels.Items[i].SubItems.Add(nl.NumLabelTpl.Action);
      end;
      Break;
    end;
  end;
end;

procedure TfrmTicketTemplate.NumLabelMod(Item: TListItem; Action: string);
var
  NewItem: TListItem;
  NewObject, ItemObject: TNumLabel;
  i: Integer;
  sNewName: string;
  //TmpForm: TForm;
  //TmpTicketFrame: TfrmTicketTemplate;

procedure FillListItem(NewItem: TListItem; NewObject: TNumLabel);
begin
  NewItem.Caption:=NewObject.Name;
  NewItem.Data:=NewObject;
  NewItem.ImageIndex:=0;
  if Assigned(NewObject.NumLabelTpl) then
  begin
    NewItem.SubItems.Add(NewObject.NumLabelTpl.Action);
  end;
end;

begin
  if not Assigned(TicketTpl) then Exit;
  StopUpdate:=True;
  ItemObject:=nil;
  if Assigned(Item) then
  begin
    if Assigned(Item.Data) then
    begin
      ItemObject:=TNumLabel(Item.Data);
    end;
  end;

  if Action='add' then
  begin
    NewObject:=TNumLabel.Create(NumProject);
    sNewName:=Trim(cbbNumLabelsTpl.Text);
    if sNewName='' then
      sNewName:='Нумератор '+IntToStr(TicketTpl.NumLabels.Count+1)
    else
    begin
      for i:=0 to TicketTpl.NumLabels.Count-1 do
      begin
        if TicketTpl.NumLabels[i].Name = sNewName then sNewName:=sNewName+'1';
      end;
    end;
    NewObject.Name:=sNewName;
    NewObject.TicketTpl:=TicketTpl;
    NewObject.Size:=-NewObject.Font.Height;
    if NumProject.NumLabelsTpl.Count>0 then NewObject.NumLabelTpl:=NumProject.NumLabelsTpl[0];
    if Assigned(CurNumLabel) then
    begin
      NewObject.NumLabelTpl:=CurNumLabel.NumLabelTpl;
      NewObject.Font.Assign(CurNumLabel.Font);
      NewObject.Color:=CurNumLabel.Color;
      NewObject.Position:=CurNumLabel.Position;
      NewObject.Size:=CurNumLabel.Size;
      NewObject.Angle:=CurNumLabel.Angle;
      //NewObject.BaseValue:=CurNumLabel.BaseValue;
      //NewObject.ValueType:=CurNumLabel.ValueType;
      //NewObject.Action:=CurNumLabel.Action;
    end
    else
    begin
      NewObject.Font.Name:='Verdana';
    end;
    TicketTpl.NumLabels.Add(NewObject);
    FillListItem(lvLabels.Items.Add(), NewObject);
  end

  else if Action='del' then
  begin
    if Assigned(Item) then
    begin
      // Are you sure?
      if Application.MessageBox(PAnsiChar(sAskDeleteNumLabel), PAnsiChar(sAskDeleteCaption), MB_OKCANCEL) <> IDOK then Exit;
      i:=lvLabels.Items.IndexOf(Item);
      Item.Delete();
      CurNumLabel.Delete(true);
      TicketTpl.NumLabels.Remove(CurNumLabel);
      CurNumLabel:=nil;

      if TicketTpl.NumLabels.Count>0 then
      begin
        if i >= lvLabels.Items.Count then i:=lvLabels.Items.Count-1;
        lvLabels.ItemIndex:=i;
      end
      else
      begin
        lbedNLName.Text:='';
        lbedNLPosX.Text:='';
        lbedNLPosY.Text:='';
        //vleNLData
      end;
    end;
  end

  {else if Action='edit' then
  begin
    if Assigned(ItemObject) then
    begin
      TmpForm := TForm.Create(self);
      TmpTicketFrame:=TfrmTicketTemplate.Create(TmpForm);
      TmpTicketFrame.TicketTpl:=ItemObject;
      TmpForm.ClientWidth:=TmpTicketFrame.Width;
      TmpForm.ClientHeight:=TmpTicketFrame.Height;
      TmpForm.FreeOnRelease();
      TmpForm.OnClose:=TmpTicketFrame.FormClose;
      TmpForm.Caption:='Шаблон билета - '+ItemObject.Name;
      TmpTicketFrame.Parent:=TmpForm;
      TmpTicketFrame.Form:=TmpForm;
      TmpTicketFrame.Align:=alClient;
      TmpTicketFrame.ReadItem();
      TmpForm.Show();
    end;
  end}

  else if Action='update_list' then
  begin
    //if not TicketTpl.NumLabels.LoadFromBase() then Exit;
    lvLabels.Items.BeginUpdate();
    lvLabels.Items.Clear();

    for i:=0 to TicketTpl.NumLabels.Count-1 do
    begin
      NewObject:=TicketTpl.NumLabels[i];
      NewObject.Read();
      FillListItem(lvLabels.Items.Add(), NewObject);
    end;
    lvLabels.Items.EndUpdate();
  end

  else if Action='write_list' then
  begin
    //TicketTpl.NumLabels.SaveToBase();
    for i:=0 to TicketTpl.NumLabels.Count-1 do
    begin
      TicketTpl.NumLabels[i].Write();
      TicketTpl.NumLabels[i].NumLabelTpl.Write();
    end;
  end

  else if Action='select' then
  begin
    if Assigned(ItemObject) then
    begin
      if Assigned(CurNumLabel) then
      begin
        if CurNumLabel<>ItemObject then
        begin
          // Save previous item
          //WriteItem_NumLabel();
//          if Assigned(CurTicketTpl.TreeNode) then
//          begin
//            CurTicketTpl.Name:=TTreeNode(CurTicketTpl.TreeNode).Text;
//          end;
          //CurProject.Name:=Node.Text;
          //CurTicketTpl.Desc:=memoProjectDesc.Lines.Text;
        end;
      end;
      // Save previous item
      WriteItem_NumLabel();
      CurNumLabel:=ItemObject;
      // Read selected item
      ReadItem_NumLabel();
      UpdatePreview();
      //frmMain.Caption:=snProgramName+' - '+CurProject.Name;
      //memoProjectDesc.Lines.Text:=CurProject.Desc;
    end;
  end;
  StopUpdate:=False;
end;

procedure TfrmTicketTemplate.actlstExecute(Action: TBasicAction;
  var Handled: Boolean);
var
  ListItem: TListItem;
begin
  ListItem:=lvLabels.Selected;
  if Action = actAddItem then
  begin
    NumLabelMod(ListItem, 'add');
  end

  else if Action = actDelItem then
  begin
    NumLabelMod(ListItem, 'del');
  end

  else if Action = actUpdateList then
  begin
    NumLabelMod(ListItem, 'update_list');
  end

  else if Action = actSaveList then
  begin
    NumLabelMod(ListItem, 'write_list');
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

procedure TfrmTicketTemplate.DummyAction(Sender: TObject);
begin
  Exit;
end;

procedure TfrmTicketTemplate.btnCancelClick(Sender: TObject);
begin
  //if Assigned(Form) then Form.Release();
  CurNumLabel:=nil;
  if (Parent is TSomePage) then
  begin
    Core.CmdQueue.AddCmd('CLOSE '+IntToStr((Parent as TSomePage).PageID));
  end;
  if Assigned(Form) then Form.Close();
end;

procedure TfrmTicketTemplate.btnOKClick(Sender: TObject);
begin
  WriteItem_Ticket();
  self.TicketTpl.Write();
  Core.AddCmd('REFRESH TICKETS_TPL_LIST');
  Core.AddCmd('REFRESH NUMLABEL_LIST');
  if (Parent is TSomePage) then
  begin
    Core.AddCmd('CLOSE '+IntToStr((Parent as TSomePage).PageID));
  end;
  //if Assigned(Form) then Form.Release();
  if Assigned(Form) then Form.Close();
  //if (Parent is TSomePage) then (Parent is TSomePage).Re
end;

procedure TfrmTicketTemplate.ReadItem();
var
  i: Integer;
  Item: TNumLabelTpl;
begin
  if not Assigned(NumProject) then Exit;

  cbbNumLabelsTpl.Clear();
  NumProject.NumLabelsTpl.LoadFromBase();
  for i:=0 to NumProject.NumLabelsTpl.Count-1 do
  begin
    Item:=NumProject.NumLabelsTpl[i];
    cbbNumLabelsTpl.AddItem(Item.Name, Item);
  end;

  ReadItem_Ticket();
  UpdatePreview();
  //if Assigned(TicketTpl) then TicketTpl.Read(true);
  //NumLabelMod(nil, 'update_list');
end;

procedure TfrmTicketTemplate.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Assigned(Form) then Form.Release();
end;

procedure TfrmTicketTemplate.btnFontSelectClick(Sender: TObject);
begin
  if not Assigned(CurNumLabel) then Exit;
  if Assigned(CurNumLabel.Font) then dlgFont.Font.Assign(CurNumLabel.Font);
  if dlgFont.Execute() then
  begin
    CurNumLabel.Font.Assign(dlgFont.Font);
    UpdateFontLabel();
    WriteItem_NumLabel();
    UpdatePreview();
  end;
end;

procedure TfrmTicketTemplate.lbedNLNameChange(Sender: TObject);
begin
  if StopUpdate then Exit;
  WriteItem_NumLabel();
  UpdatePreview();
end;

procedure TfrmTicketTemplate.lvLabelsSelectItem(Sender: TObject;
  Item: TListItem; Selected: Boolean);
begin
  if not Selected then Exit;
  NumLabelMod(Item, 'select');
end;

procedure TfrmTicketTemplate.SetPreviewParams();
var
  Canvas: TCanvas;
  kx, ky: Real;
  PreviewSize: TSize;
begin
  imgTicket.Picture.Bitmap.Height:=imgTicket.Height;
  imgTicket.Picture.Bitmap.Width:=imgTicket.Width;
  Canvas:=imgTicket.Canvas;

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

procedure TfrmTicketTemplate.UpdatePreview();
var
  Canvas: TCanvas;
  x,y, i: Integer;
  Item: TNumLabel;
  LogFont: TLogFont;
  hCurDC: HDC;
  iOldMode: Integer;
begin
  SetPreviewParams();
  with PreviewParams do
  begin
    Canvas:=imgTicket.Canvas;
    // Clear canvas
    Canvas.Brush.Color:=clWhite;
    Canvas.Brush.Style:=bsSolid;
    Canvas.FillRect(imgTicket.Canvas.ClipRect);

    Canvas.Pen.Color:=clBlack;
    Canvas.Brush.Color:=clInfoBk; //clYellow;
    Canvas.FillRect(BordersRect);
    Canvas.Rectangle(BordersRect);

    // Draw background image
    if Assigned(PreviewBgImage) then
    begin
      Canvas.StretchDraw(BordersRect, PreviewBgImage);
    end;

    // Draw numlabels
    Canvas.Brush.Style:=bsClear;
    for i:=0 to TicketTpl.NumLabels.Count-1 do
    begin
      Item:=TicketTpl.NumLabels[i];
      if not Assigned(Item.Font) then Continue;
      x:=BordersRect.Left+Round(Item.Position.X*k);
      y:=BordersRect.Top+Round(Item.Position.Y*k);
      //imgTicket.Canvas.Pen.Color:=clBlack;
      Canvas.Pen.Color:=Item.Color;
      Canvas.Font.Assign(Item.Font);
      if Item = CurNumLabel then Canvas.Font.Style:=Canvas.Font.Style + [fsBold];
      // Пересчет размера шрифта
      //Canvas.Font.Height:=Round(Item.Size * Font.PixelsPerInch / 72 *k);
      Canvas.Font.Height:=-Round(Item.Size * k);
      GetObject(Canvas.Font.Handle, SizeOf(TLogFont), @LogFont);
      { Вывести текст 1/10 градуса против часовой стрелки }
      LogFont.lfEscapement := Item.Angle*10;
      Canvas.Font.Handle := CreateFontIndirect(LogFont);
      Canvas.TextOut(x, y, Item.Name);
    end;
  end;
end;

procedure TfrmTicketTemplate.edWidthChange(Sender: TObject);
begin
  UpdatePreview();
end;

procedure TfrmTicketTemplate.edHeightChange(Sender: TObject);
begin
  UpdatePreview();
end;

procedure TfrmTicketTemplate.lbedNLPosXChange(Sender: TObject);
begin
  if StopUpdate then Exit;
  WriteItem_NumLabel();
  UpdatePreview();
end;

procedure TfrmTicketTemplate.lbedNLPosYChange(Sender: TObject);
begin
  if StopUpdate then Exit;
  WriteItem_NumLabel();
  UpdatePreview();
end;

procedure TfrmTicketTemplate.lbedAngleChange(Sender: TObject);
begin
  if StopUpdate then Exit;
  WriteItem_NumLabel();
  UpdatePreview();
end;

procedure TfrmTicketTemplate.lbedFontSizeChange(Sender: TObject);
begin
  if StopUpdate then Exit;
  WriteItem_NumLabel();
  UpdatePreview();
end;

procedure TfrmTicketTemplate.edNumKeyPress(Sender: TObject; var Key: Char);
//var
//  DecimalSeparator: Char;
begin
  //DecimalSeparator:=',';
  case key of
    '0'..'9': ; // цифры
    #8: ; // забой
    '.', ',':
      if Pos(DecimalSeparator, Text) = 0 then
        Key := DecimalSeparator  // десятичный разделитель
      else
        Key := #0;
    else
      key := #0;
  end; // case
end;

procedure TfrmTicketTemplate.lbedPosKeyDown(Sender: TObject;
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

procedure TfrmTicketTemplate.FrameResize(Sender: TObject);
begin
  UpdatePreview();
end;

procedure TfrmTicketTemplate.vleNLDataStringsChange(Sender: TObject);
begin
  if StopUpdate then Exit;
  WriteItem_NumLabel();
end;

procedure TfrmTicketTemplate.cbbNumLabelsTplSelect(Sender: TObject);
var
  i: integer;
  sNewName: string;
begin
  Read_NumLabelTpl();
  if not Assigned(TicketTpl) then Exit;
  if not Assigned(CurNumLabel) then Exit;
  sNewName:=Trim(cbbNumLabelsTpl.Text);
  if sNewName='' then
    sNewName:='Нумератор '+IntToStr(TicketTpl.NumLabels.Count+1)
  else
  begin
    for i:=0 to TicketTpl.NumLabels.Count-1 do
    begin
      if TicketTpl.NumLabels[i].Name = sNewName then sNewName:=sNewName+'1';
    end;
  end;
  lbedNLName.Text:=sNewName;
end;

function TfrmTicketTemplate.GetNumlabelByPoint(Point: TPoint): TNumLabel;
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
    Canvas:=imgTicket.Canvas;

    // Test numlabels
    for i:=0 to TicketTpl.NumLabels.Count-1 do
    begin
      Item:=TicketTpl.NumLabels[i];
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

procedure TfrmTicketTemplate.imgTicketMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  Item: TNumLabel;
  ListItem: TListItem;
begin
  if Button = mbLeft then
  begin
    Item:=GetNumlabelByPoint(Point(X, Y));
    if not Assigned(Item) then Exit;
    ListItem:=GetListItemByItemObject(lvLabels, Item);
    if not Assigned(ListItem) then Exit;
    lvLabels.Selected:=ListItem;
    PreviewParams.MouseOffset.X:=X-PreviewParams.BordersRect.Left-Round(Item.Position.X*PreviewParams.k);
    PreviewParams.MouseOffset.Y:=Y-PreviewParams.BordersRect.Top-Round(Item.Position.Y*PreviewParams.k);
    //NumLabelMod(ListItem, 'select');
    //UpdatePreview();
  end;
end;

procedure TfrmTicketTemplate.imgTicketMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
  PointMM: TPoint;
begin
  if (ssLeft in Shift) then
  begin
    if not Assigned(CurNumLabel) then Exit;
    if PreviewParams.k=0 then Exit;
    StopUpdate:=True;
    PointMM.X:=Round((X-PreviewParams.BordersRect.Left-PreviewParams.MouseOffset.X)/PreviewParams.k);
    PointMM.Y:=Round((Y-PreviewParams.BordersRect.Top-PreviewParams.MouseOffset.Y)/PreviewParams.k);
    CurNumLabel.Position.X:=PointMM.X;
    CurNumLabel.Position.Y:=PointMM.Y;
    lbedNLPosX.Text:=IntToStr(PointMM.X);
    lbedNLPosY.Text:=IntToStr(PointMM.Y);
    UpdatePreview();
    StopUpdate:=False;
  end;
end;

procedure TfrmTicketTemplate.FrameMouseWheel(Sender: TObject;
  Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint;
  var Handled: Boolean);
var
  SizeValue: Integer;
begin
  if not Assigned(CurNumLabel) then Exit;
  SizeValue:=StrToIntDef(lbedFontSize.Text, 0);
  if WheelDelta>0 then Inc(SizeValue);
  if WheelDelta<0 then Dec(SizeValue);
  lbedFontSize.Text:=IntToStr(SizeValue);
  Handled:=True;
end;

end.
