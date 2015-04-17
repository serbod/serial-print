program Demo;

uses
  Forms,
  frm_MainWindow in 'frm_MainWindow.pas' {form_MainWindow},
  frm_Message in 'frm_Message.pas' {form_Message};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(Tform_MainWindow, form_MainWindow);
  Application.CreateForm(Tform_Message, form_Message);
  Application.Run;
end.
