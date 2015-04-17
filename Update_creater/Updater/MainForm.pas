unit MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, CheckLst, ComCtrls;

type
  TfrmUpdater = class(TForm)
    btnCreate: TButton;
    btnClose: TButton;
    chklst1: TCheckListBox;
    lbl_Path_Update: TLabel;
    edt_Path: TEdit;
    btnBrowse: TButton;
    mmo1: TMemo;
    pb1: TProgressBar;
    dlgSave1: TSaveDialog;
    lbl1: TLabel;
    mmoHelp: TMemo;
    procedure btnBrowseClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnCreateClick(Sender: TObject);
    procedure edt_PathKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUpdater: TfrmUpdater;
  saveFile: string;
  listFile: array [0..10] of string = ('SerialPrint.exe','*.chm','','','','','','','','','');
  listDir: array [0..10] of string = ('Languages','','','','','','','','','','');

implementation

uses frmDirDialog;

{$R *.dfm}
{$R update.res}
function ExportResource(AType: PAnsiChar; AName, ePath : string; pb: TProgressBar):Boolean;
const
  BlockSize = 65536;
var
  rStream: TResourceStream;
  fStream: TFileStream;
  ElapsedSize, CopySize: Integer;
  temp: string;
begin
  Result:= False;

  if FindResource(HInstance, PChar(AName), AType) = 0 then
  begin
    exit;
  end;

  rStream:= TResourceStream.Create(HInstance, AName, AType);
 // rStream.CopyFrom();
  try
    fStream:= TFileStream.Create(ePath, fmCreate);
    ElapsedSize:= rStream.Size - rStream.Position;
    pb.Position:=0;
    pb.Max:= rStream.Size;
    try
      while ElapsedSize > 0 do
      begin
        if ElapsedSize < BlockSize then
          CopySize:= ElapsedSize
        else
          CopySize:= BlockSize;
        fStream.CopyFrom(rStream,CopySize);
        ElapsedSize:= rStream.Size - rStream.Position;
        pb.Position:= rStream.Position;
        Application.ProcessMessages;
        Result:= True;
      end;
    finally
      fStream.Free;
    end;
  finally
    rStream.Free;
//    writeln('  [ Ok ]    ');
    //lbl1.Caption:= 'Ok';
  end;

end;

function addResourceUpdate(AType: PAnsiChar; APath, fPath, AName: string):Boolean;
var
  hFile: HWND;
  Buf: array of Byte;
  fStream: TFileStream;
  {rStream: THandle;//TResourceStream;
  buffer: Pointer;
  f: file;
  ElapsedSize, CopySize, size: Integer;  }
begin
  //pb1.Position:= 0;
  Result:= False ;
  if (Length(APath) < 1)and(Length(fPath)< 1)and(Length(AName)< 1) then Exit;
  fStream:= TFileStream.Create(fPath, fmOpenRead);
  try
    hFile:= BeginUpdateResource(PChar(APath), False);
    try
      if hFile = 0 then
      begin
        RaiseLastOSError;
      end;
      SetLength(Buf, fStream.Size);
      fStream.Position:= 0;
      fStream.Read(Buf[0], fStream.Size);
      if not UpdateResource(hFile, AType, PChar(AName), 0, @Buf[0], fStream.Size) then
        RaiseLastOSError
      else
        Result:= True;
      Finalize(Buf);
    finally
      EndUpdateResource(hFile, False);
    end;

  finally
    fStream.Free;
  end;

end;  

function findInArray(strArray: array of string; str: string):Boolean;
var
  i, lenArray: Integer;
begin
  Result:= False;
  for i:=0 to 10 do
  begin
    if AnsiLowerCase(str) = AnsiLowerCase(strarray[i]) then
      result:=True;
  end;

end;  

function findFile(Path: string):TStringList;
var
  findDir, findRes, Attr, i: Integer;
  temp: TStringList;
  findOn: Boolean;
  sr, sdir:TSearchRec;
  CurrDir: string;

begin
  findFile:= TStringList.Create;
  temp:= TStringList.Create;
  temp.Clear;
  i:=0;
  findOn:= False;
  Attr:= faReadOnly+faHidden+faSysFile ;
  findDir:= FindFirst(Path+'*.*',faDirectory, sdir);
  if findDir<>0 then Exit;
    //temp:= 'Error: #'+ IntToStr(findRes);
  while findDir=0 do
  begin
    if findInArray(listDir, sdir.Name) then
    begin
      if LowerCase(sdir.Name) = 'languages' then
        findres:= FindFirst(Path+sdir.Name+'\*.lng', faAnyFile, sr);
      while findRes = 0 do
      begin
        temp.Add(sdir.Name+'\'+sr.Name);
        findRes:= FindNext(sr)

      end;
    end;

    //TmpLangFile:= TIniFile.Create(LangPath+sr.Name);
    findDir:= FindNext(sdir);
  end;

  for i:=0 to 10 do
  begin
    findres:= FindFirst(Path+'\'+listfile[i], faAnyFile, sr);
    if findRes = 0 then
      temp.Add(sr.Name);

  end;

 { while findRes = 0 do
  begin
    if findInArray(listFile, sr.Name) then
    begin
      temp.Add(sr.Name);
    end;
    findRes:= FindNext(sr);
  end;            }
  findFile:= temp;
end;  

procedure TfrmUpdater.btnBrowseClick(Sender: TObject);
var
  list: TStringList;
  RecCount, i, CurrRec: Integer;
begin
  DirDialog.Left:= Trunc(frmUpdater.Left+ frmUpdater.Width/2 - DirDialog.Width/2);  
  DirDialog.top:= Trunc(frmUpdater.top+ frmUpdater.Height/2 - DirDialog.Height/2);
  dirdialog.ShowModal;
  chklst1.Clear;
 // if DirDialog.Execute then
  begin
    edt_Path.Text:= DirPath;
    list:= TStringList.Create;
    list:= findFile(DirPath+'\');
    RecCount:= list.Count;
    for i:=0 to RecCount - 1 do
    begin
      CurrRec:=chklst1.Items.Add(list.Strings[i]);
      chklst1.Checked[i]:= True;
    end;
  end;
end;

procedure TfrmUpdater.btnCloseClick(Sender: TObject);
begin

 Application.Terminate;   
end;

procedure TfrmUpdater.btnCreateClick(Sender: TObject);
var
  RecCount, i: Integer;
  f: TextFile;
  temp: string;
  checked: Boolean;
  overwrite: Boolean;
  findsFile: Integer;
  sr: TSearchRec;
begin
  overwrite:= False;
  checked:= False;
  for i:= 0 to chklst1.Count - 1 do
  begin
    if chklst1.Checked[i] then checked:= True;
  end;
  if not checked then
  begin
    MessageDlg('Не выбран ни один файл обновления!', mtError, [ mbOK ], 0);
    Exit;
  end;  
  lbl1.Caption:='Компилируется Обновлятор: Пожалуйста ждите...';
  btnCreate.Enabled:=False;
  btnClose.Enabled:=False;
  lbl1.Visible:= True;
  pb1.Position:= 0;
  while not overwrite do
  begin
    saveFile:='';
    if dlgSave1.Execute then
    begin
      saveFile:= dlgSave1.FileName;
    end;
    if Length(saveFile) < 1 then overwrite:= True;

    findsFile:= FindFirst(saveFile, faAnyFile, sr);
    if findsFile = 0 then
      overwrite:= MessageDlg(Format('Файл %s существует.'+#13+'Хотите заменить его?', [ ExtractFileName(saveFile) ]), mtWarning, [ mbOK, mbCancel], 0) = mrOk
    else
      overwrite:= True;
  end;
  if Length(saveFile) < 1 then
  begin
    lbl1.Visible:=False;
    btnCreate.Enabled:=True;
    btnClose.Enabled:=true;
    Exit;
  end;

  RecCount:= chklst1.Count;
  mmo1.Clear;
  for i:=0 to RecCount -1 do
  begin
    if chklst1.Checked[i] then
      temp:= temp + chklst1.Items.Strings[i]+#13;
  end;

  ExportResource(RT_RCDATA, 'update',saveFile,pb1);

  AssignFile(f, ExtractFileDir(ParamStr(0))+'\temp.txt');
  Rewrite(f);
  write(f, temp);
  CloseFile(f);
  addResourceUpdate(RT_RCDATA, saveFile, ExtractFileDir(ParamStr(0))+'\temp.txt', 'ListFile');

  for i:=0 to RecCount - 1 do
  begin

    if chklst1.Checked[i] then
    begin
      addResourceUpdate(RT_RCDATA, saveFile, DirPath+'\'+chklst1.Items.Strings[i], chklst1.Items.Strings[i]);
    end;
  end;
  DeleteFile(ExtractFileDir(ParamStr(0))+'\temp.txt');

  lbl1.Caption:='Компилируется Обновлятор: Компиляция завершена.';
  btnCreate.Enabled:=True;
  btnClose.Enabled:=true;
end;

procedure TfrmUpdater.edt_PathKeyPress(Sender: TObject; var Key: Char);
begin
  key:=#0;
end;

procedure TfrmUpdater.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if not btnClose.Enabled then action:= caNone;
end;

end.
