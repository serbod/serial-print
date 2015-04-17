program Updater;

uses
  Forms,
  MainForm in 'MainForm.pas' {frmUpdater},
  frmDirDialog in 'frmDirDialog.pas' {DirDialog};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmUpdater, frmUpdater);
  Application.CreateForm(TDirDialog, DirDialog);
  Application.Run;
end.
