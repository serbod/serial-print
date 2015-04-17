Unit frm_MainWindow;

Interface

Uses
  Windows,
  Messages,
  SysUtils,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  mxWebUpdate,
  StdCtrls,
  ComCtrls,
  ExtCtrls;

Type
  Tform_MainWindow = Class( TForm )
    mxWebUpdate: TmxWebUpdate;
    grp_ComponentUpdate: TGroupBox;
    btn_Update: TButton;
    btn_Exit: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    lbl_ProductName: TLabel;
    lbl_Author: TLabel;
    lbl_Email: TLabel;
    lbl_YourVersion: TLabel;
    lbl_WebVersion: TLabel;
    ProgressBar: TProgressBar;
    Bevel: TBevel;
    lbl_File: TLabel;
    chk1: TCheckBox;
    Procedure btn_ExitClick( Sender: TObject );
    Procedure btn_UpdateClick( Sender: TObject );
    Procedure mxWebUpdateAfterGetInfo( Sender: TObject );
    Procedure mxWebUpdateDownloadError( Sender: TObject );
    Procedure mxWebUpdateNoUpdateFound( Sender: TObject );
    Procedure mxWebUpdateUpdateAvailable( Sender: TObject; ActualVersion, NewVersion: String; Var CanUpdate: Boolean );
    Procedure mxWebUpdateGetClientFileName( Sender: TObject; Var FileName: String );
    Procedure mxWebUpdateClientFileExists( Sender: TObject; Var FileName: String; Var Overwrite: Boolean );
    Procedure mxWebUpdateAfterDownload( Sender: TObject; FileName: String );
    Procedure mxWebUpdateBeforeDownload( Sender: TObject; FileName: String );
    Procedure mxWebUpdateBeforeShowInfo( Sender: TObject; Var ShowInfo, CheckForUpdate: Boolean );
    Procedure mxWebUpdateBeforeGetInfo( Sender: TObject );
    Procedure mxWebUpdateAfterShowInfo( Sender: TObject; CheckForUpdate: Boolean );
    procedure mxWebUpdateGetInfo(Sender: TObject);
    procedure mxWebUpdateDownload(Sender: TObject; Total,
      Downloaded: Integer; UpdataStatus: Boolean);

  Private

  Public

  End;

Var
  form_MainWindow: Tform_MainWindow;

Implementation

Uses frm_Message;

{$R *.DFM}

Procedure Tform_MainWindow.btn_ExitClick( Sender: TObject );
Begin
  Close;
End;

Procedure Tform_MainWindow.btn_UpdateClick( Sender: TObject );
Begin
  if chk1.Checked then
    mxWebUpdate.CheckForAnUpdate
  else
    mxWebUpdate.GetInfo;
End;

Procedure Tform_MainWindow.mxWebUpdateAfterGetInfo( Sender: TObject );
Begin
  lbl_ProductName.Caption := mxWebUpdate.ProductName;
  lbl_Author.Caption := mxWebUpdate.Author;
  lbl_Email.Caption := mxWebUpdate.EMail;
  lbl_YourVersion.Caption := mxWebUpdate.ProductInfo.Version;
  lbl_WebVersion.Caption := mxWebUpdate.ProductVersion;
  form_message.Close;
End;

Procedure Tform_MainWindow.mxWebUpdateDownloadError( Sender: TObject );
Begin
  MessageDlg( 'Cannot download data from the web!', mtError, [ mbOK ], 0 );
End;

Procedure Tform_MainWindow.mxWebUpdateNoUpdateFound( Sender: TObject );
Begin
  MessageDlg( 'There is no update available!', mtError, [ mbOK ], 0 );
End;

Procedure Tform_MainWindow.mxWebUpdateUpdateAvailable( Sender: TObject; ActualVersion, NewVersion: String; Var CanUpdate: Boolean );
Begin
  CanUpdate := MessageDlg( Format( 'You are using version %s, but version %s is available to ' + #13 + #10 + 'download at the author''s website.' + #13 + #10 + 'Do you want to update your application now?', [ ActualVersion, NewVersion ] ), mtWarning, [ mbYes, mbNo ], 0 ) = mrYes;
End;

Procedure Tform_MainWindow.mxWebUpdateGetClientFileName( Sender: TObject; Var FileName: String );
Begin
  MessageDlg( Format( 'Update will be downloaded to %s', [ FileName ] ), mtInformation, [ mbOK ], 0 );
     // *** You can modify the client side file name here ***
End;

Procedure Tform_MainWindow.mxWebUpdateClientFileExists( Sender: TObject; Var FileName: String; Var Overwrite: Boolean );
Begin
  Overwrite := MessageDlg( Format( 'File %s already exists. Do you want to overwrite it?', [ FileName ] ), mtConfirmation, [ mbYes, mbNo ], 0 ) = mrYes;
End;

Procedure Tform_MainWindow.mxWebUpdateAfterDownload( Sender: TObject; FileName: String );
Begin
  MessageDlg( 'Update has been downloaded.', mtInformation, [ mbOK ], 0 );
End;

Procedure Tform_MainWindow.mxWebUpdateBeforeDownload( Sender: TObject; FileName: String );
Begin
  lbl_File.Caption := Format( 'Downloading file %s', [ ExtractFileName( FileName ) ] );
End;

Procedure Tform_MainWindow.mxWebUpdateBeforeShowInfo( Sender: TObject; Var ShowInfo, CheckForUpdate: Boolean );
Begin
  ShowInfo := MessageDlg( 'Would you like to read the information file?', mtConfirmation, [ mbYes, mbNo ], 0 ) = mrYes;
End;

Procedure Tform_MainWindow.mxWebUpdateBeforeGetInfo( Sender: TObject );
Begin
  form_message.panel_message.Caption := 'Checking for an update';
  form_message.Show;
  form_message.Refresh;
End;

Procedure Tform_MainWindow.mxWebUpdateAfterShowInfo( Sender: TObject; CheckForUpdate: Boolean );
Begin
     // ** You can save CheckForUpdate checkbox's value for future usage here ***
End;

procedure Tform_MainWindow.mxWebUpdateGetInfo(Sender: TObject);
begin
  lbl_ProductName.Caption := mxWebUpdate.ProductName;
  lbl_Author.Caption := mxWebUpdate.Author;
  lbl_Email.Caption := mxWebUpdate.EMail;
  lbl_YourVersion.Caption := mxWebUpdate.ProductInfo.Version;
  lbl_WebVersion.Caption := mxWebUpdate.ProductVersion;
  form_message.Close;
end;

procedure Tform_MainWindow.mxWebUpdateDownload(Sender: TObject; Total,
  Downloaded: Integer; UpdataStatus: Boolean);
begin
  if UpdataStatus then
  begin
    ProgressBar.Max := Total;
    ProgressBar.Position := Downloaded;
  end;
end;

End.

