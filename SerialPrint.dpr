program SerialPrint;

{%ToDo 'SerialPrint.todo'}

uses
  Forms,
  MainForm in 'MainForm.pas' {frmMain},
  NumPageFrame in 'NumPageFrame.pas' {frmNumPageTemplate: TFrame},
  ItemsDef in 'ItemsDef.pas',
  NumPlanFrame in 'NumPlanFrame.pas' {frmNumPlan: TFrame},
  TicketFrame in 'TicketFrame.pas' {frmTicketTemplate: TFrame},
  NumPlanMasterFrame in 'NumPlanMasterFrame.pas' {frmNumPlanMaster: TFrame},
  NumPlanPreviewFrame in 'NumPlanPreviewFrame.pas' {frmNumPlanPreview: TFrame},
  HallPlanFrame in 'HallPlanFrame.pas' {frmHallPlan: TFrame},
  PrintPreviewFrame in 'PrintPreviewFrame.pas' {frmPrintPreview: TFrame},
  NumLabelFrame in 'NumLabelFrame.pas' {frmNumLabelTpl: TFrame},
  PageAdjustFrame in 'PageAdjustFrame.pas' {frmPageAdjust: TFrame},
  CopyProtection in 'CopyProtection.pas',
  Core in 'Core.pas',
  Updata in 'Updata.pas' {frmUpdata: TFrame},
  ItemsValidator in 'ItemsValidator.pas',
  NumOrderFrame in 'NumOrderFrame.pas' {frameNumOrder: TFrame},
  ItemsSerialize in 'ItemsSerialize.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
