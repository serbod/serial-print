unit NumLabelFrame;

interface

uses
  SysUtils, Classes, Controls, Forms, StdCtrls, Buttons, ItemsDef, ActnList,
  IniFiles, Core;

type
  TfrmNumLabelTpl = class(TFrame)
    grpNumLabelProps: TGroupBox;
    lbNumLabelName: TLabel;
    cbbName: TComboBox;
    lbValueType: TLabel;
    cbbValueType: TComboBox;
    lbDefaultAction: TLabel;
    cbbDefaultAction: TComboBox;
    lbBaseValue: TLabel;
    edBaseValue: TEdit;
    grpHelp: TGroupBox;
    mmoHelp: TMemo;
    edPrefix: TEdit;
    edSuffix: TEdit;
    lbPrefix: TLabel;
    lbSuffix: TLabel;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    actlstNumLabel: TActionList;
    actOK: TAction;
    actCancel: TAction;
    procedure actOKExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actCancelExecute(Sender: TObject);
  private
    { Private declarations }
    procedure WriteItem();
  public
    { Public declarations }
    Form: TForm;
    CurrLangNumLabel: string;
    NumProject: TNumProject;
    NumLabelTpl: TNumLabelTpl;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure ReadItem();
    procedure ChangeLanguage();
  end;

var
  NumLabelCreated: Boolean = False;
  sBaseValueEmpty: string = 'ѕустое базовое значение нумератора';
  sActionNotApplicable: string = 'ќсновное действие не применимо к значению нумератора';

implementation
uses MainForm;
{$R *.dfm}

procedure TfrmNumLabelTpl.ChangeLanguage();
const
  CR_LF = #13#10;
  CR_LF2 = '^';//Chr(3);
var
  s, Part: string;
begin
  if not Assigned(LangFile) then Exit;
  if NumLabelCreated then
  begin
    Part:= 'NumLabel';
    Self.grpNumLabelProps.Caption:= LangFile.ReadString(Part, 'sgrpNumLabelProps', Self.grpNumLabelProps.Caption);
    Self.lbNumLabelName.Caption:= LangFile.ReadString(Part, 'slbNumLabelName', Self.lbNumLabelName.Caption);
    Self.lbDefaultAction.Caption:= LangFile.ReadString(Part, 'slbDefaultAction', Self.lbDefaultAction.Caption);
    Self.lbPrefix.Caption:= LangFile.ReadString(Part, 'slbPrefix', Self.lbPrefix.Caption);
    Self.lbBaseValue.Caption:= LangFile.ReadString(Part, 'slbBaseValue', Self.lbBaseValue.Caption);
    Self.lbSuffix.Caption:= LangFile.ReadString(Part, 'slbSuffix', Self.lbSuffix.Caption);
    Self.lbValueType.Caption:= LangFile.ReadString(Part, 'slbValueType', Self.lbValueType.Caption);
    Self.btnOK.Caption:= LangFile.ReadString(Part, 'sbtnOk', Self.btnOK.Caption);
    Self.btnCancel.Caption:= LangFile.ReadString(Part, 'sbtnCancel', Self.btnCancel.Caption);

    sBaseValueEmpty:=LangFile.ReadString(sBaseValueEmpty, 'sBaseValueEmpty', sBaseValueEmpty);
    sActionNotApplicable:=LangFile.ReadString(sActionNotApplicable, 'sActionNotApplicable', sActionNotApplicable);

    Self.grpHelp.Caption:= LangFile.ReadString(Part, 'sgrpHelp', Self.grpHelp.Caption);
    //LangFile.WriteString(Part, 'smmoHelp',mmoToStr(mmoHelp));

    s:=LangFile.ReadString(Part, 'smmoHelp', Self.mmoHelp.Text);
    Self.mmoHelp.Text:=StringReplace(s, CR_LF2, CR_LF, [rfReplaceAll]);
    Self.Form.Caption:= MainForm.sNewNumLabelTplName;

  end;
end;

constructor TfrmNumLabelTpl.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  //StopUpdate:=False;
  //PreviewBgImage:=nil;
  cbbName.Clear();
  cbbName.AddItem(csNumber, nil);
  cbbName.AddItem(csRow, nil);
  cbbName.AddItem(csPlace, nil);
  cbbName.AddItem(csPrice, nil);
  cbbName.AddItem(csSerial, nil);

  cbbDefaultAction.Clear();
  cbbDefaultAction.AddItem('=', nil);
  cbbDefaultAction.AddItem('+', nil);
  cbbDefaultAction.AddItem('-', nil);

  //
  NumLabelCreated:= True;
  ChangeLanguage;

end;

destructor TfrmNumLabelTpl.Destroy;
begin
  //if Assigned(PreviewBgImage) then FreeAndNil(PreviewBgImage);
  //StopUpdate:=True;
  NumLabelCreated:= False;
  inherited Destroy();
end;

procedure TfrmNumLabelTpl.ReadItem();
begin
  if not Assigned(NumLabelTpl) then Exit;
  cbbName.Text:=NumLabelTpl.Name;
  cbbDefaultAction.Text:=NumLabelTpl.Action;
  edBaseValue.Text:=NumLabelTpl.BaseValue;
  edPrefix.Text:=NumLabelTpl.Prefix;
  edSuffix.Text:=NumLabelTpl.Suffix;
end;

procedure TfrmNumLabelTpl.WriteItem();
begin
  if not Assigned(NumLabelTpl) then Exit;
  NumLabelTpl.Name:=cbbName.Text;
  NumLabelTpl.Action:=cbbDefaultAction.Text;
  NumLabelTpl.BaseValue:=edBaseValue.Text;
  NumLabelTpl.Prefix:=edPrefix.Text;
  NumLabelTpl.Suffix:=edSuffix.Text;
end;

procedure TfrmNumLabelTpl.actOKExecute(Sender: TObject);
var
  s, ss: string;
begin
  s:=Trim(edBaseValue.Text);
  if Length(s)=0 then
  begin
    Core.ShowWarning(sBaseValueEmpty, sWarning);
    Exit;
  end;

  if Trim(cbbDefaultAction.Text)<>'=' then
  begin
    ss:='0123456789';
    if Pos(Copy(s, Length(s), 1), ss)=0 then
    begin
      Core.ShowWarning(sActionNotApplicable, sWarning);
      Exit;
    end;
  end;
  WriteItem();
  if Assigned(NumLabelTpl) then
  begin
    NumLabelTpl.Write();
    NumLabelTpl:=nil;
  end;
  Core.CmdQueue.AddCmd('REFRESH NUMLABEL_LIST');
  if (Parent is TSomePage) then
  begin
    Core.CmdQueue.AddCmd('CLOSE '+IntToStr((Parent as TSomePage).PageID));
  end;
  if Assigned(Form) then Form.Close();
end;

procedure TfrmNumLabelTpl.actCancelExecute(Sender: TObject);
begin
  NumLabelTpl:=nil;
  if (Parent is TSomePage) then
  begin
    Core.CmdQueue.AddCmd('CLOSE '+IntToStr((Parent as TSomePage).PageID));
  end;
  if Assigned(Form) then Form.Close();
end;

procedure TfrmNumLabelTpl.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Assigned(Form) then Form.Release();
end;

end.
