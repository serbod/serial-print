unit Updata;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, mxWebUpdate, ComCtrls, ExtCtrls, Buttons, ShellAPI;

type
  TfrmUpdata = class(TFrame)
    grpUpdataProduct: TGroupBox;
    lbAuthor: TLabel;
    lbProductName: TLabel;
    lbEmail: TLabel;
    lbYourVersion: TLabel;
    lbWebVersion: TLabel;
    Bevel: TBevel;
    pb1: TProgressBar;
    lb_File: TLabel;
    btnFindUpdata: TBitBtn;
    btnDownload: TBitBtn;
    btnCancel: TBitBtn;
    mxwbpdt1: TmxWebUpdate;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FrameResize(Sender: TObject);
    procedure btnFindUpdata1Click(Sender: TObject);
    procedure btnCancel1Click(Sender: TObject);
    procedure mxwbpdt1AfterGetInfo(Sender: TObject);
    procedure mxwbpdt1Download(Sender: TObject; Total, Downloaded: Integer;
      UpdataStatus: Boolean);
    procedure mxwbpdt1AfterDownload(Sender: TObject; FileName: String);
    procedure mxwbpdt1AfterShowInfo(Sender: TObject;
      CheckForUpdate: Boolean);
    procedure mxwbpdt1BeforeDownload(Sender: TObject; FileName: String);
    procedure mxwbpdt1BeforeGetInfo(Sender: TObject);
    procedure mxwbpdt1BeforeShowInfo(Sender: TObject; var ShowInfo,
      CheckForUpdate: Boolean);
    procedure mxwbpdt1ClientFileExists(Sender: TObject;
      var FileName: String; var Overwrite: Boolean);
    procedure mxwbpdt1DownloadError(Sender: TObject);
    procedure mxwbpdt1GetClientFileName(Sender: TObject;
      var FileName: String);
    procedure mxwbpdt1NoUpdateFound(Sender: TObject);
    procedure mxwbpdt1UpdateAvailable(Sender: TObject; ActualVersion,
      NewVersion: String; var CanUpdate: Boolean);
    procedure btnDownload1Click(Sender: TObject);
    procedure mxwbpdt1GetInfo(Sender: TObject; ActualVersion,
      NewVersion: String);
  private
    { Private declarations }
  public
    Form: TForm;
    minWidth: Integer;
    minHeight: Integer;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    { Public declarations }
  end;

  var
    DoError: Boolean = False;
  //  mxwbpdt1: TmxWebUpdate;

implementation

uses MainForm, Core;

{$R *.dfm}
constructor TfrmUpdata.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  //mxwbpdt1.Create(Self);
  minWidth:= (btnFindUpdata.Width + btnDownload.Width + btnCancel.Width + 48);
  minHeight:=(grpUpdataProduct.Height + btnFindUpdata.Height + 40);
  {обьявление параметров компонента обновления}
    mxwbpdt1.TargetFolder:= DataPath;
    mxwbpdt1.Options:=[uoOverwrite];
    mxwbpdt1.ProductInfo.Version:= snProgramVersion;
    mxwbpdt1.ProductInfo.URL:= snUpdateURL;
    mxwbpdt1.OnAfterDownload:= mxwbpdt1AfterDownload;
    mxwbpdt1.OnAfterGetInfo:= mxwbpdt1AfterGetInfo;
    mxwbpdt1.OnAfterShowInfo:= mxwbpdt1AfterShowInfo;
    mxwbpdt1.OnBeforeDownload:= mxwbpdt1BeforeDownload;
    mxwbpdt1.OnBeforeGetInfo:= mxwbpdt1BeforeGetInfo;
    mxwbpdt1.OnBeforeShowInfo:= mxwbpdt1BeforeShowInfo;
    mxwbpdt1.OnClientFileExists:= mxwbpdt1ClientFileExists;
    mxwbpdt1.OnDownload:= mxwbpdt1Download;
    mxwbpdt1.OnDownloadError:= mxwbpdt1DownloadError;
    mxwbpdt1.OnGetClientFileName:= mxwbpdt1GetClientFileName;
    mxwbpdt1.OnGetInfo:= mxwbpdt1GetInfo;
    mxwbpdt1.OnNoUpdateFound:= mxwbpdt1NoUpdateFound;
    mxwbpdt1.OnUpdateAvailable:= mxwbpdt1UpdateAvailable;
end;

destructor TfrmUpdata.Destroy;
begin
  mxwbpdt1.Destroy;
  inherited Destroy;
end;

procedure TfrmUpdata.FrameResize(Sender: TObject);
begin
  btnFindUpdata.Left:= Trunc(Self.Width - (btnFindUpdata.Width + btnDownload.Width + btnCancel.Width + 24));
  btnDownload.Left:= Trunc(Self.Width - (btnDownload.Width + btnCancel.Width + 16));
  btnCancel.Left:= Trunc(Self.Width - (btnCancel.Width + 8));
end;

procedure TfrmUpdata.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Assigned(Form) then Form.Release();
end;

procedure TfrmUpdata.btnFindUpdata1Click(Sender: TObject);
begin
  mxwbpdt1.GetInfo;
end;

procedure TfrmUpdata.btnCancel1Click(Sender: TObject);
begin
 // NumLabelTpl:=nil;
  if (Parent is TSomePage) then
  begin
    Core.CmdQueue.AddCmd('CLOSE '+IntToStr((Parent as TSomePage).PageID));
  end;
  if Assigned(Form) then Form.Close();
end;

procedure TfrmUpdata.mxwbpdt1AfterGetInfo(Sender: TObject);
var
  currVersion, WebVersion: Integer;
begin
  {lbProductName.Caption:=Format( 'Название продукта: %s', [ mxwbpdt1.ProductName ] );
  lbAuthor.Caption:= Format( 'Авторы: %s', [ mxwbpdt1.Author ] );
  lbHomePage.Caption:= lbHomePage.Caption +' ';
  lbEmail.Caption:= Format( 'E-Mail: %s', [ mxwbpdt1.EMail ] );
  lbYourVersion.Caption:= Format( 'Текущая версия: %s', [ mxwbpdt1.ProductInfo.Version ] );
  lbWebVersion.Caption:= Format( 'Версия доступного обновления: %s', [ mxwbpdt1.ProductVersion ] );

  if mxwbpdt1.ProductVersion <> mxwbpdt1.ProductInfo.Version then
    btnDownload.Enabled:= True;

    var
  CanUpdate: Boolean;
begin
  lbProductName.Caption:=Format( 'Название продукта: %s', [ mxwbpdt1.ProductName ] );
  lbAuthor.Caption:= Format( 'Авторы: %s', [ mxwbpdt1.Author ] );
  //lbHomePage.Caption:= lbHomePage.Caption +' ';
  lbEmail.Caption:= Format( 'E-Mail: %s', [ mxwbpdt1.EMail ] );
  lbYourVersion.Caption:= Format( 'Текущая версия: %s', [ mxwbpdt1.ProductInfo.Version ] );
  lbWebVersion.Caption:= Format( 'Версия доступного обновления: %s', [ mxwbpdt1.ProductVersion ] );
  
  if mxwbpdt1.ProductVersion <> mxwbpdt1.ProductInfo.Version then
  begin
    CanUpdate := MessageDlg( Format( 'You are using version %s, but version %s is available to ' + #13 + #10 + 'download at the author''s website.' + #13 + #10 + 'Do you want to update your application now?', [ ActualVersion, NewVersion ] ), mtWarning, [ mbYes, mbNo ], 0 ) = mrYes;
    if CanUpdate then btnDownload( Self );
    btnDownload.Enabled:= True;
  end;}
end;

procedure TfrmUpdata.mxwbpdt1Download(Sender: TObject; Total,
  Downloaded: Integer; UpdataStatus: Boolean);
begin
  if UpdataStatus then
  begin
    pb1.Max:= Total;
    pb1.Position:= Downloaded;
  end;  
end;

procedure TfrmUpdata.mxwbpdt1AfterDownload(Sender: TObject;
  FileName: String);
begin
  MessageDlg( 'Update has been downloaded.'+#10#13+'Program will be rerun!', mtInformation, [ mbOK ], 0 );
  btnCancel.Enabled:= True;
  {$WARNINGS OFF}
    If ShellExecute( Application.MainForm.Handle, PChar( 'open' ), PChar( FileName ), PChar( '/auto_update' ), PChar( '' ), SW_SHOWNORMAL ) <= 32 Then ;//DoCannotExecute;
    {$WARNINGS ON}
    Application.Terminate;
end;

procedure TfrmUpdata.mxwbpdt1AfterShowInfo(Sender: TObject; CheckForUpdate: Boolean);
begin    
  MessageDlg( 'Update has been downloaded.', mtInformation, [ mbOK ], 0 );
end;

procedure TfrmUpdata.mxwbpdt1BeforeDownload(Sender: TObject;
  FileName: String);
begin
  btnCancel.Enabled:= False;
  lb_File.Caption := Format( 'Downloading file %s', [ ExtractFileName( FileName ) ] );

end;

procedure TfrmUpdata.mxwbpdt1BeforeGetInfo(Sender: TObject);
begin
  //
end;

procedure TfrmUpdata.mxwbpdt1BeforeShowInfo(Sender: TObject; var ShowInfo,
  CheckForUpdate: Boolean);
begin 
  ShowInfo := MessageDlg( 'Would you like to read the information file?', mtConfirmation, [ mbYes, mbNo ], 0 ) = mrYes;
end;

procedure TfrmUpdata.mxwbpdt1ClientFileExists(Sender: TObject;
  var FileName: String; var Overwrite: Boolean);
begin 
  Overwrite := True;//MessageDlg( Format( 'File %s already exists. Do you want to overwrite it?', [ FileName ] ), mtConfirmation, [ mbYes, mbNo ], 0 ) = mrYes;
end;

procedure TfrmUpdata.mxwbpdt1DownloadError(Sender: TObject);
begin    
  MessageDlg( 'Cannot download data from the web!', mtError, [ mbOK ], 0 );
  DoError:= True;  
  btnCancel.Enabled:= True;
end;

procedure TfrmUpdata.mxwbpdt1GetClientFileName(Sender: TObject;
  var FileName: String);
begin        
  MessageDlg( Format( 'Update will be downloaded to %s', [ FileName ] ), mtInformation, [ mbOK ], 0 );
end;

procedure TfrmUpdata.mxwbpdt1NoUpdateFound(Sender: TObject);
begin          
  MessageDlg( 'There is no update available!', mtError, [ mbOK ], 0 );
end;

procedure TfrmUpdata.mxwbpdt1UpdateAvailable(Sender: TObject;
  ActualVersion, NewVersion: String; var CanUpdate: Boolean);
begin
  CanUpdate := True; //MessageDlg( Format( 'You are using version %s, but version %s is available to ' + #13 + #10 + 'download at the author''s website.' + #13 + #10 + 'Do you want to update your application now?', [ ActualVersion, NewVersion ] ), mtWarning, [ mbYes, mbNo ], 0 ) = mrYes;
end;

procedure TfrmUpdata.btnDownload1Click(Sender: TObject);
begin
  mxwbpdt1.CheckForAnUpdate;
end;

procedure TfrmUpdata.mxwbpdt1GetInfo(Sender: TObject; ActualVersion,
  NewVersion: String);
var
  CanUpdate: Boolean;
begin
  lbProductName.Caption:=Format( 'Название продукта: %s', [ mxwbpdt1.ProductName ] );
  lbAuthor.Caption:= Format( 'Авторы: %s', [ mxwbpdt1.Author ] );
  //lbHomePage.Caption:= lbHomePage.Caption +' ';
  lbEmail.Caption:= Format( 'E-Mail: %s', [ mxwbpdt1.EMail ] );
  lbYourVersion.Caption:= Format( 'Текущая версия: %s', [ mxwbpdt1.ProductInfo.Version ] );
  lbWebVersion.Caption:= Format( 'Версия доступного обновления: %s', [ mxwbpdt1.ProductVersion ] );
  
  if (mxwbpdt1.ProductVersion <> mxwbpdt1.ProductInfo.Version) and not DoError then
  begin
    CanUpdate := MessageDlg( Format( 'You are using version %s, but version %s is available to ' + #13 + #10 + 'download at the author''s website.' + #13 + #10 + 'Do you want to update your application now?', [ ActualVersion, NewVersion ] ), mtWarning, [ mbYes, mbNo ], 0 ) = mrYes;
    if CanUpdate  then btnDownload1Click( Self );
    btnDownload.Enabled:= True;
  end;

end;

end.
