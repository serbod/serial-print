unit frmDirDialog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, ShellCtrls;

type
  TDirDialog = class(TForm)
    tv1: TShellTreeView;
    pnl1: TPanel;
    btnCancel: TButton;
    btnOk: TButton;
    function Execute():Boolean;
    procedure btnCancelClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DirDialog: TDirDialog;
  exec:Boolean = False;
  closedDlg: Boolean = False;
    DirPath: string;

implementation

{$R *.dfm}

function TDirDialog.Execute:Boolean;
begin
  Result:= False;
  if (not exec) and (not closedDlg) then
    Execute
  else
    if not closedDlg then
      Result:= True;
end;

procedure TDirDialog.btnCancelClick(Sender: TObject);
begin
  closedDlg:= True;
  Close;
end;

procedure TDirDialog.btnOkClick(Sender: TObject);
begin
  DirPath:= tv1.Path;
  exec:= True;  
  closedDlg:= False;
  Close;
end;

end.
