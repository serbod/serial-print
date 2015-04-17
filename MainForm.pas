unit MainForm;

interface

uses
  Windows, SysUtils, Classes, Graphics, Controls, Forms, Contnrs, ImgList,
  ActnList, Menus, XPMan, Dialogs, ComCtrls, ExtCtrls, Buttons, StdCtrls,
  CheckLst, ToolWin, Printers, Mask, Preview,
  ItemsDef, NxColumns, NxColumnClasses, NxScrollControl,
  NxCustomGridControl, NxCustomGrid, NxGrid, AppEvnts, Core, mxWebUpdate, DateUtils;

type
  TSomeForm = class(TForm)
  protected
    procedure CreateParams(var Params: TCreateParams); override;
  end;

  TfrmMain = class(TForm)
    pgcMain: TPageControl;
    grpSettings: TGroupBox;
    tsPrint: TTabSheet;
    tsData: TTabSheet;
    tsOptions: TTabSheet;
    grpPrinters: TGroupBox;
    chklstPrinters: TCheckListBox;
    grpPrinterInfo: TGroupBox;
    lstPrinterInfo: TListBox;
    btnGridPrint: TButton;
    grpPrintGrid: TGroupBox;
    dlgPageSetup: TPageSetupDialog;
    dlgPrint: TPrintDialog;
    dlgPrintSet: TPrinterSetupDialog;
    btnPrint: TBitBtn;
    btnPrintSet: TBitBtn;
    xpmnfst: TXPManifest;
    btnPageSet: TBitBtn;
    rbGridInPixels: TRadioButton;
    rbGridInMm: TRadioButton;
    edStep1: TEdit;
    edStep2: TEdit;
    lb1: TLabel;
    lb2: TLabel;
    spl1: TSplitter;
    pan1: TPanel;
    grpPagesTpl: TGroupBox;
    lvPagesTpl: TListView;
    grpTicketsTpl: TGroupBox;
    lvTicketsTpl: TListView;
    grpNumLabelsTpl: TGroupBox;
    lvNumerators: TListView;
    btnPreview: TBitBtn;
    edPpX: TEdit;
    edMmX: TEdit;
    lbEq: TLabel;
    lbPp: TLabel;
    lbMm: TLabel;
    lbPpm: TLabel;
    edPpmX: TEdit;
    edStep3: TEdit;
    lbStep3: TLabel;
    pmPagesTpl: TPopupMenu;
    pmTicketsTpl: TPopupMenu;
    alSettings: TActionList;
    actPageAdd: TAction;
    actPageDel: TAction;
    actPageEdit: TAction;
    actTicketAdd: TAction;
    actTicketDel: TAction;
    actTicketEdit: TAction;
    actPageAdd1: TMenuItem;
    actPageDel1: TMenuItem;
    actPageEdit1: TMenuItem;
    actTicketAdd1: TMenuItem;
    actTicketDel1: TMenuItem;
    actTicketEdit1: TMenuItem;
    tsTemplates: TTabSheet;
    tsProjects: TTabSheet;
    grpProjectList: TGroupBox;
    tvProjects: TTreeView;
    grpProjectDetails: TGroupBox;
    StatusBar: TStatusBar;
    memoProjectDesc: TMemo;
    alProjects: TActionList;
    actProjectAdd: TAction;
    actProjectDel: TAction;
    actProjectEdit: TAction;
    actProjectAddSub: TAction;
    pmProjects: TPopupMenu;
    actProjectAdd1: TMenuItem;
    actProjectDel1: TMenuItem;
    actProjectGroupAdd1: TMenuItem;
    actProjectEdit1: TMenuItem;
    actProjectListToBase: TAction;
    actProjectListToFile: TAction;
    actProjectListFromBase: TAction;
    actProjectListFromFile: TAction;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    grpAbout: TGroupBox;
    lblAftors: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    grpHelpList: TGroupBox;
    tvOptions: TTreeView;
    lblProjName: TLabel;
    edProjName: TEdit;
    actProjectToFile: TAction;
    N4: TMenuItem;
    pgcViews: TPageControl;
    pmViews: TPopupMenu;
    alViews: TActionList;
    actClose: TAction;
    N5: TMenuItem;
    actHide: TAction;
    actDetach: TAction;
    N6: TMenuItem;
    N7: TMenuItem;
    grpNumPlan: TGroupBox;
    tlbData: TToolBar;
    Images24: TImageList;
    btnNumTable: TToolButton;
    btnHallPlan: TToolButton;
    btnNumPreview: TToolButton;
    Images16: TImageList;
    btnNumPlanCreate: TToolButton;
    alData: TActionList;
    actNumPlanCreate: TAction;
    actNumPlanEdit: TAction;
    actNumPlanPreview: TAction;
    actHallEdit: TAction;
    btnSep1: TToolButton;
    btnPagesOrder: TToolButton;
    btnSep2: TToolButton;
    actPagesOrder: TAction;
    memoSummary: TMemo;
    btnGridPreview: TButton;
    edPpY: TEdit;
    edMmY: TEdit;
    edPpmY: TEdit;
    lbSizeX: TLabel;
    lbSizeY: TLabel;
    Timer10ms: TTimer;
    pmNumLabels: TPopupMenu;
    actNumLabelAdd: TAction;
    actNumLabelDel: TAction;
    actNumLabelEdit: TAction;
    miNumLabelAdd: TMenuItem;
    miNumLabelDel: TMenuItem;
    miNumLabelEdit: TMenuItem;
    btnPageAdjust: TToolButton;
    actPageAdjust: TAction;
    lbProgramKey: TLabel;
    edProgramKey: TEdit;
    lbProtectionKey: TLabel;
    edProtectionKey: TEdit;
    panTicketsList: TPanel;
    grpTickets: TGroupBox;
    lvTickets: TListView;
    grpNumerators: TGroupBox;
    ngNum: TNextGrid;
    nxtxtclmnTextCol1: TNxTextColumn;
    nxtxtclmnTextCol2: TNxTextColumn;
    tmrHlpMtr: TTimer;
    lb3: TLabel;
    LangMenu: TPopupMenu;
    language1: TMenuItem;
    actProjectFromFile: TAction;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    N8: TMenuItem;
    miDebug1: TMenuItem;
    tsDebug: TTabSheet;
    memoDebug: TMemo;
    AppEvents: TApplicationEvents;
    btnUpdate: TBitBtn;
    lb4: TLabel;
    actProjectCheck: TAction;
    miProjectCheck: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure btnPrintSetClick(Sender: TObject);
    procedure btnPageSetClick(Sender: TObject);
    procedure btnPreviewClick(Sender: TObject);
    procedure edNumKeyPress(Sender: TObject; var Key: Char);
    procedure edMmXChange(Sender: TObject);
    procedure edMmYChange(Sender: TObject);
    procedure rbGridInMmClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure DummyAction(Sender: TObject);
    procedure alSettingsExecute(Action: TBasicAction;
      var Handled: Boolean);
    procedure alProjectsExecute(Action: TBasicAction;
      var Handled: Boolean);
    procedure tvProjectsChange(Sender: TObject; Node: TTreeNode);
    procedure tvProjectsDeletion(Sender: TObject; Node: TTreeNode);
    procedure pgcMainChange(Sender: TObject);
    procedure lvTicketsTplChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure lvTicketsTplDeletion(Sender: TObject; Item: TListItem);
    procedure lvTicketsTplDblClick(Sender: TObject);
    procedure edProjNameChange(Sender: TObject);
    procedure lvPagesTplDblClick(Sender: TObject);
    procedure alViewsExecute(Action: TBasicAction; var Handled: Boolean);
    procedure btnNumPlanCreateClick(Sender: TObject);
    procedure btnNumPlanPreviewClick(Sender: TObject);
    procedure btnNumTableEditClick(Sender: TObject);
    procedure btnHallEditClick(Sender: TObject);
    procedure btnGridPreviewClick(Sender: TObject);
    procedure chklstPrintersClick(Sender: TObject);
    procedure Timer10msTimer(Sender: TObject);
    procedure lvNumeratorsEdited(Sender: TObject; Item: TListItem;
      var S: String);
    procedure lvNumeratorsClick(Sender: TObject);
    procedure actPageAdjustExecute(Sender: TObject);
    procedure edProtectionKeyChange(Sender: TObject);
    procedure edProtectionKeyKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lvTicketsSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure tmrHlpMtrTimer(Sender: TObject);
    procedure actProjectFromFileExecute(Sender: TObject);
    procedure actProjectToFileExecute(Sender: TObject);
    procedure miDebug1Click(Sender: TObject);
    procedure AppEventsException(Sender: TObject; E: Exception);
    procedure btnUpdateClick(Sender: TObject);
    procedure ngNumAfterEdit(Sender: TObject; ACol, ARow: Integer;
      Value: WideString);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actPagesOrderExecute(Sender: TObject);
  private
    { Private declarations }
    PrevPage: TTabSheet;
    procedure GetPrinters();
    procedure ShowPrinterInfo(pinf: TPrnInfo);
    procedure ResetUnits();
    procedure LoadProject();
    procedure UpdateSummary();
    function GetPpmStr(sPp, sMm: string): string;
    procedure FillNumerators();

  public
    { Public declarations }
    hlpBtn: TSpeedButton;
    ProjectList: TNumProjectList;
    PrevProject: TNumProject;
    CurTicketTpl: TTicketTpl;
    CurNumPageTpl: TNumPageTpl;
    CurNumLabelTpl: TNumLabelTpl;
    procedure ChangeLanguage();
    procedure ProjectMod(Node: TTreeNode; Action: string);
    procedure TicketTplMod(Item: TListItem; Action: string);
    procedure NumPageTplMod(Item: TListItem; Action: string);
    procedure NumLabelsMod(Item: TListItem; Action: string);
    procedure TicketsMod(Item: TListItem; Action: string);
    procedure StatusMsg(s: string; i: integer=0);
    function GetPrinterInfo(PrnName: string): TPrnInfo;
    procedure DebugMsg(const sMsg, sMode: string);

    procedure btnLangClick(Sender: TObject);
    procedure hlpBtnCreate(Num: integer; Component: TWinControl);
    procedure hlpExec(Sender: TObject);
  end;

var
  frmMain: TfrmMain;
  PaperInfo: TPaperInfo;
  ProtectionKey: string = '';
  LOGDgFileName: string;
  DebugToFile: Boolean = False;

const
  hlpBtnH = 18;
  hlpBtnW = 18;
  hlpBtnF = 10;
  HelpAddProject = 2;

var
  StatMsg: string = 'Не выбран проект!';

  sMemoSummary_0: string = 'Всего билетов: ';
  sMemoSummary_1: string = 'Всего листов: ';
  sMemoSummary_2: string = 'Всего нумераторов: ';

  slvInfo_0: string ='Точек на дюйм: ';
  slvInfo_1: string ='Размер листа в мм: ';
  slvInfo_2: string ='Область печати в мм: ';
  slvInfo_3: string ='Размер листа, точек: ';
  slvInfo_4: string ='Область печати, точек: ';
  slvInfo_5: string ='Смещение области печати, точек: ';
  slvInfo_6: string ='---- границы печати, мм ----';
  slvInfo_7: string ='Верхняя: ';
  slvInfo_8: string ='Нижняя: ';
  slvInfo_9: string ='Левая: ';
  slvInfo_10: string ='Правая: ';

  //sChangeLangage: string = '';
  sUpdataFrmCaption: string = 'Обновление...';
  sPageAdjust: string ='Юстировка листа';
  sNewProjectName: string = 'Проект';
  sPageTplName: string = 'Макет листа';
  sNewPageTplName: string = 'Лист';
  sTicketTplName: string = 'Макет билета';
  sNewTicketTplName: string = 'Билет';
  sNewNumLabelTplName: string = 'Нумератор';
  sNumFrmCaption: string = 'Нумератор';
  sAskDeleteCaption: string = 'Удалить?';
  sAskDeleteProject: string = 'Удалить выбраный проект?'+#13+#10+'Удаленный проект нельзя восстановить.';
  sAskDeleteNumLabelTpl: string = 'Удалить нумератор?';
  sAskDeleteTicketTpl: string = 'Удалить макет билета?';
  sAskDeletePageTpl: string = 'Удалить макет листа?';
  sNumOrderEditName: string = 'Порядок обхода билетов';
  sNumPlanPreviewName: string = 'Предпросмотр плана нумерации';
  sNumPlanPageName: string = 'План нумерации';
  sHallPlanPageName: string = 'План зала';
  sNumPlanMasterName: string = 'Мастер плана нумерации';
  sPrintPreviewName: string = 'Предпросмотр печати';
  sAskCloseProgram: string = 'Закрыть программу?';
  sAskCloseCaption: string = 'Закрыть?';

implementation
uses CopyProtection, StoHtmlHelp, {hlpHandler,} ItemsSerialize, IniFiles;

{$R *.dfm}

// === TSomeForm ===
procedure TSomeForm.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  Params.ExStyle:=Params.ExStyle or WS_EX_APPWINDOW;
end;


// === TfrmMain ===
function TfrmMain.GetPrinterInfo(PrnName: string): TPrnInfo;
var
  DC:HDC;
  pinf: TPrnInfo;
begin
  DC:=Printer.Handle;
  with pinf do
  begin
    PixPerInch.X:=GetDeviceCaps(DC, LOGPIXELSX);
    PixPerInch.Y:=GetDeviceCaps(DC, LOGPIXELSY);
    PageSizeMM.X:=GetDeviceCaps(DC, HORZSIZE);
    PageSizeMM.Y:=GetDeviceCaps(DC, VERTSIZE);

    PhysOffset.X:=GetDeviceCaps(DC, PHYSICALOFFSETX);
    PhysOffset.Y:=GetDeviceCaps(DC, PHYSICALOFFSETY);

    PaperSizePP.X:=GetDeviceCaps(DC, PHYSICALWIDTH);
    PaperSizePP.Y:=GetDeviceCaps(DC, PHYSICALHEIGHT);

    PageSizePP.X:=GetDeviceCaps(DC, HORZRES);
    PageSizePP.Y:=GetDeviceCaps(DC, VERTRES);

    PaperSizeMM.X:=round(PaperSizePP.X / PixPerInch.X * 25.4);
    PaperSizeMM.Y:=round(PaperSizePP.Y / PixPerInch.Y * 25.4);

    // границы печати, мм
    Margins.Top:=round(PhysOffset.Y/PixPerInch.Y*25.4);
    Margins.Left:=round(PhysOffset.X/PixPerInch.X*25.4);
    Margins.Bottom:=round((PaperSizePP.Y-PageSizePP.Y-PhysOffset.Y)/PixPerInch.Y*25.4);
    Margins.Right:=round((PaperSizePP.X-PageSizePP.X-PhysOffset.X)/PixPerInch.X*25.4);
  end;
  result:=pinf;
end;

procedure TfrmMain.ShowPrinterInfo(pinf: TPrnInfo);
begin
  lstPrinterInfo.Items.Clear();
  with lstPrinterInfo.Items do
  begin
    Add(slvInfo_0+IntToStr(pinf.PixPerInch.X)+'x'+IntToStr(pinf.PixPerInch.Y));
    Add(slvInfo_1+IntToStr(pinf.PaperSizeMM.X)+'x'+IntToStr(pinf.PaperSizeMM.Y));
    Add(slvInfo_2+IntToStr(pinf.PageSizeMM.X)+'x'+IntToStr(pinf.PageSizeMM.Y));
    Add(slvInfo_3+IntToStr(pinf.PaperSizePP.X)+'x'+IntToStr(pinf.PaperSizePP.Y));
    Add(slvInfo_4+IntToStr(pinf.PageSizePP.X)+'x'+IntToStr(pinf.PageSizePP.Y));
    Add(slvInfo_5+IntToStr(pinf.PhysOffset.X)+'x'+IntToStr(pinf.PhysOffset.Y));
    Add(slvInfo_6);
    Add(slvInfo_7+IntToStr(pinf.Margins.Top));
    Add(slvInfo_8+IntToStr(pinf.Margins.Bottom));
    Add(slvInfo_9+IntToStr(pinf.Margins.Left));
    Add(slvInfo_10+IntToStr(pinf.Margins.Right));
  end;
end;

procedure TfrmMain.GetPrinters();
var
  pinf: TPrnInfo;
begin
  chklstPrinters.Items:=Printer.Printers;
  //Printer.Capabilities
  pinf:=GetPrinterInfo('');
  ShowPrinterInfo(pinf);
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var
  bShowDebug: boolean;
begin
  CoreStart();

  //grpSettings.DoubleBuffered:=True;
  pgcMain.DoubleBuffered:=True;
  pgcViews.DoubleBuffered:=True;
  //tsTemplates.DoubleBuffered:=True;
  //grpNumLabelsTpl.DoubleBuffered:=True;
  lvNumerators.DoubleBuffered:=True;
  lvTicketsTpl.DoubleBuffered:=True;
  lvPagesTpl.DoubleBuffered:=True;
  lvTickets.DoubleBuffered:=True;
  tvProjects.DoubleBuffered:=True;
  memoProjectDesc.DoubleBuffered:=True;
  memoSummary.DoubleBuffered:=True;
  memoDebug.DoubleBuffered:=True;

  // Чтение настроек
  ProtectionKey:=ini.ReadString('Main', 'ProtectionKey', ProtectionKey);
  edProgramKey.Text:=CopyProtection.GetDiskCSerial();
  edProtectionKey.Text:=ProtectionKey;
  bShowDebug:=ini.ReadBool('Main', 'ShowDebug', False);
  DebugToFile:=ini.ReadBool('Main', 'DebugToFile', False);

  edStep1.Text:=ini.ReadString(snGrid, 'mmStep1', '1');
  edStep2.Text:=ini.ReadString(snGrid, 'mmStep2', '5');
  edStep3.Text:=ini.ReadString(snGrid, 'mmStep3', '10');

  edPpX.Text:=ini.ReadString(snGrid, 'ppx', '');
  edMmX.Text:=ini.ReadString(snGrid, 'mmx', '');
  edPpmX.Text:=ini.ReadString(snGrid, 'ppmx', '');

  edPpY.Text:=ini.ReadString(snGrid, 'ppy', '');
  edMmY.Text:=ini.ReadString(snGrid, 'mmy', '');
  edPpmY.Text:=ini.ReadString(snGrid, 'ppmy', '');

  PaperInfo.CalibrationX:=ini.ReadFloat(snPaperInfo, 'CalibrationX', PaperInfo.CalibrationX);
  PaperInfo.CalibrationY:=ini.ReadFloat(snPaperInfo, 'CalibrationY', PaperInfo.CalibrationY);
  PaperInfo.AdjustPointMm.X:=ini.ReadInteger(snPaperInfo, 'AdjustPointMm.X', PaperInfo.AdjustPointMm.X);
  PaperInfo.AdjustPointMm.Y:=ini.ReadInteger(snPaperInfo, 'AdjustPointMm.Y', PaperInfo.AdjustPointMm.Y);
  PaperInfo.BaseAdjustPointMm.X:=ini.ReadInteger(snPaperInfo, 'BaseAdjustPointMm.X', PaperInfo.BaseAdjustPointMm.X);
  PaperInfo.BaseAdjustPointMm.Y:=ini.ReadInteger(snPaperInfo, 'BaseAdjustPointMm.Y', PaperInfo.BaseAdjustPointMm.Y);

  //edMmXChange(self);
  //edMmYChange(self);

  tsDebug.TabVisible:=bShowDebug;
  tsDebug.Visible:=bShowDebug;

  GetPrinters();
  rbGridInPixels.Checked:=True;

  PrevProject:=nil;
  CurProject:=nil;
  CurTicketTpl:=nil;
  CurNumPageTpl:=nil;
  CurNumLabelTpl:=nil;
  ProjectList:=TNumProjectList.Create();
  ProjectMod(nil, 'update_list');
  pgcMainChange(pgcMain);
  Timer10ms.Enabled:=True;

end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  Timer10ms.Enabled:=False;
  tmrHlpMtr.Enabled:=False;
  ini.WriteString('Main', 'ProtectionKey', ProtectionKey);
  ini.WriteString('Main','Language', CurrLang);
  ini.WriteBool('Main', 'ShowDebug', tsDebug.Visible);
  ini.WriteBool('Main', 'DebugToFile', DebugToFile);

  ini.WriteString(snGrid, 'ppx', edPpX.Text);
  ini.WriteString(snGrid, 'mmx', edMmX.Text);
  ini.WriteString(snGrid, 'ppmx', edPpmX.Text);

  ini.WriteString(snGrid, 'ppy', edPpY.Text);
  ini.WriteString(snGrid, 'mmy', edMmY.Text);
  ini.WriteString(snGrid, 'ppmy', edPpmY.Text);

  ini.WriteFloat(snPaperInfo, 'CalibrationX', PaperInfo.CalibrationX);
  ini.WriteFloat(snPaperInfo, 'CalibrationY', PaperInfo.CalibrationY);
  ini.WriteInteger(snPaperInfo, 'AdjustPointMm.X', PaperInfo.AdjustPointMm.X);
  ini.WriteInteger(snPaperInfo, 'AdjustPointMm.Y', PaperInfo.AdjustPointMm.Y);
  ini.WriteInteger(snPaperInfo, 'BaseAdjustPointMm.X', PaperInfo.BaseAdjustPointMm.X);
  ini.WriteInteger(snPaperInfo, 'BaseAdjustPointMm.Y', PaperInfo.BaseAdjustPointMm.Y);

  ini.UpdateFile();

  FreeAndNil(ProjectList);
  CurProject:=nil;
  CurTicketTpl:=nil;
  CurNumPageTpl:=nil;
  CurNumLabelTpl:=nil;
  //CurNumPlanItem:=nil;

  CoreStop();
end;

procedure TfrmMain.btnPrintClick(Sender: TObject);
begin
  dlgPrint.Execute();
end;

procedure TfrmMain.btnPrintSetClick(Sender: TObject);
begin
  if dlgPrintSet.Execute() then ShowPrinterInfo(GetPrinterInfo(''));

end;

procedure TfrmMain.btnPageSetClick(Sender: TObject);
begin
  if dlgPageSetup.Execute() then ShowPrinterInfo(GetPrinterInfo(''));
end;

procedure TfrmMain.btnGridPreviewClick(Sender: TObject);
begin
  Core.ShowGridPreview();
end;

procedure TfrmMain.btnPreviewClick(Sender: TObject);
begin
  Core.ShowPrintPreview();
end;

procedure TfrmMain.edNumKeyPress(Sender: TObject; var Key: Char);
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

function TfrmMain.GetPpmStr(sPp, sMm: string): string;
var
  mm, pp: real;
begin
  pp:=StrToFloatDef(sPp, 0);
  mm:=StrToFloatDef(sMm, 0);
  Result:='';
  if mm=0 then Exit;
  Result:=FloatToStrF(pp/mm, ffNumber, 8, 4);
end;

procedure TfrmMain.edMmXChange(Sender: TObject);
begin
  edPpmX.Text:=GetPpmStr(edPpX.Text, edMmX.Text);
end;

procedure TfrmMain.edMmYChange(Sender: TObject);
begin
  edPpmY.Text:=GetPpmStr(edPpY.Text, edMmY.Text);
end;

procedure TfrmMain.ResetUnits();
begin
  if rbGridInPixels.Checked then
  begin
    ini.WriteString(snGrid, 'mmStep1', edStep1.Text);
    ini.WriteString(snGrid, 'mmStep2', edStep2.Text);
    ini.WriteString(snGrid, 'mmStep3', edStep3.Text);
    edStep1.Text:=ini.ReadString(snGrid, 'ppStep1', '100');
    edStep2.Text:=ini.ReadString(snGrid, 'ppStep2', '500');
    edStep3.Text:=ini.ReadString(snGrid, 'ppStep3', '500');
  end
  else if rbGridInMm.Checked then
  begin
    ini.WriteString(snGrid, 'ppStep1', edStep1.Text);
    ini.WriteString(snGrid, 'ppStep2', edStep2.Text);
    ini.WriteString(snGrid, 'ppStep3', edStep3.Text);
    edStep1.Text:=ini.ReadString(snGrid, 'mmStep1', '1');
    edStep2.Text:=ini.ReadString(snGrid, 'mmStep2', '5');
    edStep3.Text:=ini.ReadString(snGrid, 'mmStep3', '10');
  end;
end;

procedure TfrmMain.rbGridInMmClick(Sender: TObject);
begin
  ResetUnits();
end;

procedure TfrmMain.ProjectMod(Node: TTreeNode; Action: string);
var
  NewNode: TTreeNode;
  NewObject, NodeObject: TNumProject;
  i: Integer;

begin
  NodeObject:=nil;
  if Assigned(Node) then
  begin
    if Assigned(Node.Data) then
    begin
      NodeObject:=TNumProject(Node.Data);
    end;
  end;

  if Action='add' then
  begin
    NewObject:=TNumProject.Create();
    NewObject.Name:=sNewProjectName+' '+IntToStr(ProjectList.Count+1);
    ProjectList.Add(NewObject);
    NewObject.Write(True);

    //ntn:=TTreeNode.Create(tvProjects.Items);
    //ntn:=tvProjects.Items.AddChild(Node, 'Новый проект');
    NewNode:=tvProjects.Items.Add(Node, NewObject.Name);
    NewNode.Data:=NewObject;
    NewNode.ImageIndex:=0;
    NewObject.TreeNode:=NewNode;
  end

  else if Action='add_sub' then
  begin
    if not Assigned(Node) then Exit;
    NewObject:=TNumProject.Create();
    NewObject.Name:=Node.Text+'.'+IntToStr(Node.Count+1);

    //ntn:=TTreeNode.Create(tvProjects.Items);
    //ntn:=tvProjects.Items.Add(Node, 'Новый проект');
    NewNode:=tvProjects.Items.AddChild(Node, NewObject.Name);
    NewNode.Data:=NewObject;
    NewNode.ImageIndex:=0;
    NewObject.TreeNode:=NewNode;
    Node.ImageIndex:=1;
    if Assigned(NodeObject) then
    begin
      NewObject.ParentID:=NodeObject.ID;
    end;
    ProjectList.Add(NewObject);
    NewObject.Write(True);

  end

  else if Action='del' then
  begin
    if Assigned(Node) then
    begin
      // Are you sure?
      if Application.MessageBox(PAnsiChar(sAskDeleteProject), PAnsiChar(sAskDeleteCaption), MB_OKCANCEL) <> IDOK then Exit;
      Node.Delete();
      CurProject:=nil;
      frmMain.Caption:=snProgramName;
      if Assigned(NodeObject) then
      begin
        NodeObject.Delete(True);
        ProjectList.Remove(NodeObject);
      end;
    end;
  end

  else if Action='edit' then
  begin
    if Assigned(Node) then
    begin
      ///
    end;
  end

  else if Action='update_list' then
  begin
    if not self.ProjectList.LoadFromBase() then Exit;
    // multi-level list
    tvProjects.Items.BeginUpdate();
    tvProjects.Items.Clear();
    for i:=0 to ProjectList.Count-1 do
    begin
      NewObject:=ProjectList[i];
      NewNode:=tvProjects.Items.Add(nil, NewObject.Name);
      NewNode.Data:=NewObject;
      NewNode.ImageIndex:=0;
      NewObject.TreeNode:=NewNode;
    end;
    //
    for i:=0 to ProjectList.Count-1 do
    begin
      NewObject:=ProjectList.GetProjectByID(ProjectList[i].ParentID);
      if NewObject <> nil then TTreeNode(ProjectList[i].TreeNode).MoveTo(TTreeNode(NewObject.TreeNode), naAddChild);
    end;
    if tvProjects.Items.Count>0 then tvProjects.Selected:=tvProjects.Items[0];
    tvProjects.Items.EndUpdate();
  end

  else if Action='write_list' then
  begin
    self.ProjectList.SaveToBase();
  end

  else if Action='select' then
  begin
    if Assigned(NodeObject) then
    begin
      if Assigned(CurProject) then
      begin
        if CurProject<>NodeObject then
        begin
          if Assigned(CurProject.TreeNode) then
          begin
            CurProject.Name:=TTreeNode(CurProject.TreeNode).Text;
          end;
          //CurProject.Name:=Node.Text;
          CurProject.Desc:=memoProjectDesc.Lines.Text;
          CurProject.Write(false);
        end;
      end;
      PrevProject:=CurProject;
      CurProject:=NodeObject;
      frmMain.Caption:=snProgramName+' - '+CurProject.Name;
      edProjName.Text:=CurProject.Name;
      memoProjectDesc.Lines.Text:=CurProject.Desc;
      UpdateSummary();
    end;
  end;
end;

procedure TfrmMain.TicketTplMod(Item: TListItem; Action: string);
var
  NewObject, ItemObject: TTicketTpl;
  i: Integer;
  TmpPage: TSomePage;

procedure FillListItem(NewItem: TListItem; NewObject: TTicketTpl);
begin
  NewItem.Caption:=NewObject.Name;
  NewItem.Data:=NewObject;
  NewItem.ImageIndex:=0;
  NewItem.SubItems.Add(IntToStr(NewObject.Size.X)+' x '+IntToStr(NewObject.Size.Y));
  NewItem.SubItems.Add(IntToStr(NewObject.NumLabels.Count)+' нумераторов');
end;

begin
  if not Assigned(CurProject) then Exit;
  ItemObject:=nil;
  if Assigned(Item) then
  begin
    if Assigned(Item.Data) then
    begin
      ItemObject:=TTicketTpl(Item.Data);
    end;
  end;

  if Action='add' then
  begin
    NewObject:=TTicketTpl.Create(CurProject);
    if Assigned(ItemObject) then NewObject.Assign(ItemObject);
    NewObject.Name:=sNewTicketTplName+' '+IntToStr(CurProject.TicketTplList.Count+1);
    CurProject.TicketTplList.Add(NewObject);
    NewObject.Write(True);
    FillListItem(lvTicketsTpl.Items.Add(), NewObject);
  end

  else if Action='del' then
  begin
    if Assigned(Item) then
    begin
      // Are you sure?
      if Application.MessageBox(PAnsiChar(sAskDeleteTicketTpl), PAnsiChar(sAskDeleteCaption), MB_OKCANCEL) <> IDOK then Exit;
      Item.Delete();
      if Assigned(ItemObject) then
      begin
        ItemObject.Delete(false);
        CurProject.TicketTplList.Remove(ItemObject);
        //FreeAndNil(ItemObject);
      end;
      CurTicketTpl:=nil;
      //frmMain.Caption:=snProgramName;
    end;
  end

  else if Action='edit' then
  begin
    if Assigned(ItemObject) then
    begin
      Core.ShowTicketTplEdit(ItemObject);
    end;
  end

  else if Action='update_list' then
  begin
    lvTicketsTpl.Items.BeginUpdate();
    lvTicketsTpl.Items.Clear();
    for i:=0 to CurProject.TicketTplList.Count-1 do
    begin
      NewObject:=(CurProject.TicketTplList[i] as TTicketTpl);
      FillListItem(lvTicketsTpl.Items.Add(), NewObject);
    end;
    lvTicketsTpl.Items.EndUpdate();
  end

  else if Action='write_list' then
  begin
    //self.ProjectList.SaveToBase();
  end

  else if Action='select' then
  begin
    if Assigned(ItemObject) then
    begin
      if Assigned(CurTicketTpl) then
      begin
        {if CurTicketTpl<>ItemObject then
        begin
          if Assigned(CurTicketTpl.TreeNode) then
          begin
            CurTicketTpl.Name:=TTreeNode(CurTicketTpl.TreeNode).Text;
          end;
          //CurProject.Name:=Node.Text;
          //CurTicketTpl.Desc:=memoProjectDesc.Lines.Text;
        end; }
      end;
      CurTicketTpl:=ItemObject;
      //frmMain.Caption:=snProgramName+' - '+CurProject.Name;
      //memoProjectDesc.Lines.Text:=CurProject.Desc;
    end;
  end;
end;

procedure TfrmMain.NumPageTplMod(Item: TListItem; Action: string);
var
  NewObject, ItemObject: TNumPageTpl;
  i: Integer;

procedure FillListItem(NewItem: TListItem; NewObject: TNumPageTpl);
begin
  NewItem.Caption:=NewObject.Name;
  NewItem.Data:=NewObject;
  NewItem.ImageIndex:=0;
  NewItem.SubItems.Add(IntToStr(NewObject.Size.X)+' x '+IntToStr(NewObject.Size.Y));
  NewItem.SubItems.Add(IntToStr(NewObject.Tickets.Count)+' билетов');
end;

begin
  if not Assigned(CurProject) then Exit;
  ItemObject:=nil;
  if Assigned(Item) then
  begin
    if Assigned(Item.Data) then
    begin
      ItemObject:=TNumPageTpl(Item.Data);
    end;
  end;

  if Action='add' then
  begin
    NewObject:=TNumPageTpl.Create(CurProject);
    if Assigned(ItemObject) then NewObject.Assign(ItemObject);
    NewObject.Name:=sNewPageTplName+' '+IntToStr(CurProject.PagesTpl.Count+1);
    NewObject.Size.X:=dlgPageSetup.PageWidth div 100;
    NewObject.Size.Y:=dlgPageSetup.PageHeight div 100;
    CurProject.PagesTpl.Add(NewObject);
    NewObject.Write(True);
    FillListItem(lvPagesTpl.Items.Add(), NewObject);
  end

  else if Action='del' then
  begin
    if Assigned(Item) then
    begin
      // Are you sure?
      if Application.MessageBox(PAnsiChar(sAskDeletePageTpl), PAnsiChar(sAskDeleteCaption), MB_OKCANCEL) <> IDOK then Exit;
      Item.Delete();
      if Assigned(ItemObject) then
      begin
        ItemObject.Delete(true);
        CurProject.PagesTpl.Remove(ItemObject);
        //FreeAndNil(ItemObject);
      end;
      CurNumPageTpl:=nil;
      //frmMain.Caption:=snProgramName;
    end;
  end

  else if Action='edit' then
  begin
    if Assigned(ItemObject) then
    begin
      ShowNumPageTplEdit(ItemObject);
    end;
  end

  else if Action='update_list' then
  begin
    lvPagesTpl.Items.BeginUpdate();
    lvPagesTpl.Items.Clear();
    for i:=0 to CurProject.PagesTpl.Count-1 do
    begin
      NewObject:=CurProject.PagesTpl[i];
      FillListItem(lvPagesTpl.Items.Add(), NewObject);
    end;
    lvPagesTpl.Items.EndUpdate();
  end

  else if Action='write_list' then
  begin
    //self.ProjectList.SaveToBase();
  end

  else if Action='select' then
  begin
    if Assigned(ItemObject) then
    begin
      if Assigned(CurNumPageTpl) then
      begin
        {if CurTicketTpl<>ItemObject then
        begin
          if Assigned(CurTicketTpl.TreeNode) then
          begin
            CurTicketTpl.Name:=TTreeNode(CurTicketTpl.TreeNode).Text;
          end;
          //CurProject.Name:=Node.Text;
          //CurTicketTpl.Desc:=memoProjectDesc.Lines.Text;
        end; }
      end;
      CurNumPageTpl:=ItemObject;
      //frmMain.Caption:=snProgramName+' - '+CurProject.Name;
      //memoProjectDesc.Lines.Text:=CurProject.Desc;
    end;
  end;
end;

procedure TfrmMain.NumLabelsMod(Item: TListItem; Action: string);
var
  NewObject, ItemObject: TNumLabelTpl;
  i, n: Integer;

procedure FillListItem(NewItem: TListItem; NewObject: TNumLabelTpl);
begin
  NewItem.Caption:=NewObject.Name;
  NewItem.Data:=NewObject;
  NewItem.ImageIndex:=0;
  NewItem.SubItems.Add(NewObject.BaseValue);
  NewItem.SubItems.Add(NewObject.Action);
end;

begin
  if not Assigned(CurProject) then Exit;
  ItemObject:=nil;
  if Assigned(Item) then
  begin
    if Assigned(Item.Data) then
    begin
      ItemObject:=TNumLabelTpl(Item.Data);
    end;
  end;

  if Action='add' then
  begin
    NewObject:=TNumLabelTpl.Create(CurProject);
    NewObject.Name:=sNewNumLabelTplName+' '+IntToStr(CurProject.PagesTpl.Count+1);
    NewObject.Write();
    CurProject.NumLabelsTpl.Add(NewObject);

    FillListItem(lvNumerators.Items.Add(), NewObject);
  end

  else if Action='del' then
  begin
    if Assigned(Item) then
    begin
      // Are you sure?
      if Application.MessageBox(PAnsiChar(sAskDeleteNumLabelTpl), PAnsiChar(sAskDeleteCaption), MB_OKCANCEL) <> IDOK then Exit;
      Item.Delete();
      if Assigned(ItemObject) then
      begin
        ItemObject.Delete(true);
        CurProject.NumLabelsTpl.Remove(ItemObject);
        //FreeAndNil(ItemObject);
      end;
      CurNumLabelTpl:=nil;
      //frmMain.Caption:=snProgramName;
    end;
  end

  else if Action='edit' then
  begin
    if not Assigned(ItemObject) then Exit;
    Core.ShowNumlabelTplEdit(ItemObject);
  end

  else if Action='update_list' then
  begin
    lvNumerators.Items.BeginUpdate();
    lvNumerators.Items.Clear();
    for i:=0 to CurProject.NumLabelsTpl.Count-1 do
    begin
      NewObject:=CurProject.NumLabelsTpl[i];
      FillListItem(lvNumerators.Items.Add(), NewObject);
    end;
    lvNumerators.Items.EndUpdate();
  end

  else if Action='write_list' then
  begin
    //self.ProjectList.SaveToBase();
  end

  else if Action='select' then
  begin
    if Assigned(ItemObject) then
    begin
      if Assigned(CurNumLabelTpl) then
      begin
      end;
      CurNumLabelTpl:=ItemObject;
    end;
  end;
end;

procedure TfrmMain.TicketsMod(Item: TListItem; Action: string);
var
  NewObject, ItemObject: TNumPlanItem;
  i, n: Integer;
  //TmpFrame: TfrmNumLabelTpl;
  //TmpForm: TForm;

procedure FillListItem(NewItem: TListItem; NewObject: TNumPlanItem);
var
  s: string;
begin
  NewItem.Caption:=IntToStr(NewObject.Order);
  //NewItem.Caption:=NewObject.Name;
  NewItem.Data:=NewObject;
  NewItem.ImageIndex:=0;
  s:='';
  if Assigned(NewObject.NumPage) then
    s:=IntToStr(NewObject.NumPage.Order);
  NewItem.SubItems.Add(s);

  s:='';
  if Assigned(NewObject.Ticket) then
    if Assigned(NewObject.Ticket.Tpl) then
      s:=NewObject.Ticket.Tpl.Name;
  NewItem.SubItems.Add(s);

  s:='';
  if Assigned(NewObject.NumPage) then
    if Assigned(NewObject.NumPage.NumPageTpl) then
      s:=NewObject.NumPage.NumPageTpl.Name;
  NewItem.SubItems.Add(s);
end;

begin
  if not Assigned(CurProject) then Exit;
  ItemObject:=nil;
  if Assigned(Item) then
  begin
    if Assigned(Item.Data) then
    begin
      ItemObject:=TNumPlanItem(Item.Data);
    end;
  end;

  if Action='add' then
  begin
    {NewObject:=TNumPlanItem.Create(CurProject);
    NewObject.Name:=sNewNumLabelTplName+' '+IntToStr(CurProject.PagesTpl.Count+1);
    NewObject.Write();
    CurProject.NumLabelsTpl.Add(NewObject);

    FillListItem(lvNumerators.Items.Add(), NewObject);}
  end

  else if Action='del' then
  begin
    {if Assigned(Item) then
    begin
      // Are you sure?
      Item.Delete();
      if Assigned(ItemObject) then
      begin
        ItemObject.Delete(true);
        CurProject.NumLabelsTpl.Remove(ItemObject);
        //FreeAndNil(ItemObject);
      end;
      CurNumLabelTpl:=nil;
      //frmMain.Caption:=snProgramName;
    end;}
  end

  else if Action='edit' then
  begin
  end

  else if Action='update_list' then
  begin
    n:=lvTickets.Tag;
    lvTickets.Tag:=-1; // Lock
    lvTickets.Items.BeginUpdate();
    lvTickets.Items.Clear();
    CurProject.NumPlanItems.SortByOrder();
    for i:=0 to CurProject.NumPlanItems.Count-1 do
    begin
      NewObject:=CurProject.NumPlanItems[i];
      FillListItem(lvTickets.Items.Add(), NewObject);
    end;
//    if Assigned(CurProject.CurNumPlanItem) then
//    begin
//      lvTickets.Selected:=lvTickets.FindData(0, CurProject.CurNumPlanItem, True, True);
//      if Assigned(lvTickets.Selected) then
//      begin
//        lvTickets.Selected.MakeVisible(false);
//      end;
//    end;
    lvTickets.Items.EndUpdate();
    lvTickets.Tag:=n; // Unlock
    //FillNumerators();
  end

  else if Action='update_item' then
  begin
    NewObject:=CurProject.CurNumPlanItem;
    if Assigned(CurProject.CurNumPlanItem) then
    begin
      n:=lvTickets.Tag;
      lvTickets.Tag:=-1; // Lock
      lvTickets.Items.BeginUpdate();
      lvTickets.Selected:=lvTickets.FindData(0, NewObject, True, True);
      if Assigned(lvTickets.Selected) then
      begin
        lvTickets.Selected.MakeVisible(false);
        FillListItem(lvTickets.Selected, NewObject);
      end;
      lvTickets.Items.EndUpdate();
      lvTickets.Tag:=n; // Unlock
      FillNumerators();
    end;
  end

  else if Action='write_list' then
  begin
    //self.ProjectList.SaveToBase();
  end

  else if Action='select' then
  begin
    if Assigned(ItemObject) then
    begin
      if Assigned(CurProject.CurNumPlanItem) then
      begin
      end;
      CurProject.CurNumPlanItem:=ItemObject;
      FillNumerators();
      //CmdQueue.AddCmd('REFRESH NUM_PLAN');
      Core.AddCmd('NUMPLAN_ITEM_SEL '+IntToStr(ItemObject.ID));
    end;
  end;
end;

procedure TfrmMain.alSettingsExecute(Action: TBasicAction;
  var Handled: Boolean);
begin
  if not Assigned(CurProject) then
  begin
    StatusMsg(StatMsg);
    Exit;
  end;

  if Action = actPageAdd then
  begin
    NumPageTplMod(lvPagesTpl.Selected, 'add');
  end
  else if Action = actPageDel then
  begin
    NumPageTplMod(lvPagesTpl.Selected, 'del');
  end
  else if Action = actPageEdit then
  begin
    NumPageTplMod(lvPagesTpl.Selected, 'edit');
  end

  else if Action = actTicketAdd then
  begin
    TicketTplMod(lvTicketsTpl.Selected, 'add');
  end
  else if Action = actTicketDel then
  begin
    TicketTplMod(lvTicketsTpl.Selected, 'del');
  end
  else if Action = actTicketEdit then
  begin
    TicketTplMod(lvTicketsTpl.Selected, 'edit');
  end

  else if Action = actNumLabelAdd then
  begin
    NumLabelsMod(lvNumerators.Selected, 'add');
  end
  else if Action = actNumLabelDel then
  begin
    NumLabelsMod(lvNumerators.Selected, 'del');
  end
  else if Action = actNumLabelEdit then
  begin
    NumLabelsMod(lvNumerators.Selected, 'edit');
  end;
end;

procedure TfrmMain.alProjectsExecute(Action: TBasicAction;
  var Handled: Boolean);
var
  CurTreeNode: TTreeNode;
begin
  CurTreeNode:=tvProjects.Selected;
  if Action = actProjectAdd then
  begin
    ProjectMod(CurTreeNode, 'add');
    //NewPageTpl:= TNumPageTpl.Create();
  end

  else if Action = actProjectAddSub then
  begin
    ProjectMod(CurTreeNode, 'add_sub');
    //NewTicketTpl := TTicketTpl.Create();
  end

  else if Action = actProjectDel then
  begin
    ProjectMod(CurTreeNode, 'del');
  end

  else if Action = actProjectEdit then
  begin
    ProjectMod(CurTreeNode, 'edit');
  end

  else if Action = actProjectListToBase then
  begin
    ProjectMod(CurTreeNode, 'write_list');
  end

  else if Action = actProjectListFromBase then
  begin
    ProjectMod(CurTreeNode, 'update_list');
  end

  else if Action = actProjectCheck then
  begin
    Core.CheckProject(CurProject);
  end;
end;

procedure TfrmMain.DummyAction(Sender: TObject);
begin
  //
end;

procedure TfrmMain.actProjectToFileExecute(Sender: TObject);
var
  streamXml : TXmlItemSerialize;
  CurTreeNode: TTreeNode;
  NodeObject: TNumProject;
  nameFl : string;
begin
  CurTreeNode := tvProjects.Selected;
  if CurTreeNode = nil then
  begin
    Exit;
  end;
  if not Assigned(CurTreeNode.Data) then
  begin
    Exit;
  end;

  NodeObject:=TNumProject(CurTreeNode.Data);
  SaveDialog1.FileName := NodeObject.Name + '.xml';
  if (SaveDialog1.Execute) then
  begin
    nameFl := ChangeFileExt(SaveDialog1.FileName, '.xml');
    try
      streamXml := TXmlItemSerialize.Create(nameFl, fmCreate);
      NodeObject.Serialize(TItemSerialize(streamXml));
    finally
      streamXml.Free;
    end;
  end;
end;

procedure TfrmMain.actProjectFromFileExecute(Sender: TObject);
  var
    streamXml : TXmlItemSerialize;
    NewNode: TTreeNode;
    NewObject, NodeObject: TNumProject;
begin
  if OpenDialog1.Execute then
  begin
    try
      streamXml := TXmlItemSerialize.Create(OpenDialog1.FileName, fmOpenRead);

      NewObject:=TNumProject.Create();
      NewObject.Deserialize(TItemSerialize(streamXml));
    finally
      streamXml.Free;
    end;
    if not Assigned(NewObject) then Exit;
    ProjectList.Add(NewObject);

    NewNode:=tvProjects.Items.Add(nil, NewObject.Name);
    NewNode.Data:=NewObject;
    NewNode.ImageIndex:=0;
    NewObject.TreeNode:=NewNode;
  end;

end;

procedure TfrmMain.StatusMsg(s: string; i: integer=0);
begin
  StatusBar.Panels[0].Text:=s;
end;


procedure TfrmMain.tvProjectsChange(Sender: TObject; Node: TTreeNode);
begin
  ProjectMod(Node, 'select');
end;

procedure TfrmMain.tvProjectsDeletion(Sender: TObject; Node: TTreeNode);
begin
  if not Assigned(ProjectList) then Exit;
  if Assigned(Node) then
  begin
    if Assigned(Node.Data) then
    begin
      if Assigned(CurProject) then
      begin
        if CurProject=TNumProject(Node.Data) then
        begin
          CurProject.TreeNode:=nil;
          CurProject:=nil;
        end;
      end;
      TNumProject(Node.Data).TreeNode:=nil;
    end;
  end;

end;

procedure TfrmMain.lvTicketsTplChange(Sender: TObject; Item: TListItem;
  Change: TItemChange);
begin
  TicketTplMod(Item, 'select');
end;

procedure TfrmMain.LoadProject();
begin
  if not Assigned(CurProject) then Exit;
  if CurProject.Loaded then Exit;

  CurProject.Read();
  CurProject.Loaded:=true;
end;

procedure TfrmMain.FillNumerators();
var
  i,n: Integer;
  NumLabelData: TNumLabelData;
  TicketTpl: TTicketTpl;
  NumLabel: TNumLabel;
  CurNumPlanItem: TNumPlanItem;
begin
  if not Assigned(CurProject) then
  begin
    ngNum.RowCount:=0;
    Exit;
  end;
  if not Assigned(CurProject.CurNumPlanItem) then
  begin
    ngNum.RowCount:=0;
    Exit;
  end;
  CurNumPlanItem:=CurProject.CurNumPlanItem;
  //CurNumPlanItem.Read(True);
  if not Assigned(CurNumPlanItem.Ticket) then Exit;
  //CurNumPlanItem.Ticket.Read();
  TicketTpl:=CurNumPlanItem.Ticket.Tpl;
  if not Assigned(TicketTpl) then Exit;

  ngNum.BeginUpdate();
  ngNum.ClearRows();
  ngNum.AddRow(TicketTpl.NumLabels.Count);
  for i:=0 to TicketTpl.NumLabels.Count-1 do
  begin
    NumLabel:=TicketTpl.NumLabels[i];
    ngNum.Cells[0,i]:=NumLabel.Name;

    for n:=0 to CurNumPlanItem.NumLabelDataList.Count-1 do
    begin
      NumLabelData:=CurNumPlanItem.NumLabelDataList[n];
      if NumLabelData.NumLabelTpl.ID = NumLabel.NumLabelTpl.ID then
      begin
        ngNum.Cells[1,i]:=NumLabelData.Value;
        ngNum.Cell[0, i].ObjectReference:=NumLabelData;
        Break;
      end;
    end;
  end;
  ngNum.EndUpdate();
end;

procedure TfrmMain.UpdateSummary();
begin
  memoSummary.Lines.Clear();
  if not Assigned(CurProject) then Exit;
  memoSummary.Lines.Add(sMemoSummary_0+' '+IntToStr(CurProject.NumPlanItems.Count));
  memoSummary.Lines.Add(sMemoSummary_1+' '+IntToStr(CurProject.Pages.Count));
  memoSummary.Lines.Add(sMemoSummary_2+' '+IntToStr(CurProject.NumLabelsTpl.Count));
end;

procedure TfrmMain.pgcMainChange(Sender: TObject);
begin
  if (pgcMain.ActivePage <> PrevPage) then
  begin
    if (PrevPage = tsProjects) then
    begin
      if PrevProject<>CurProject then
      begin
        If Assigned(PrevProject) then
        begin
          // Сохранение предыдущего проекта
          // (не нужно, проект сохраняется во время редактирования)
          //PrevProject.Write(true);
          // !!! Закрытие окон предыдущего проекта

        end;
        CurTicketTpl:=nil;
        CurNumPageTpl:=nil;
        CurNumLabelTpl:=nil;
        LoadProject();
      end;
    end;
  end;
  if (pgcMain.ActivePage = tsTemplates) then
  begin
    LoadProject();
    //ProjectMod(tvProjects.Selected, 'select');
    TicketTplMod(nil, 'update_list');
    NumPageTplMod(nil, 'update_list');
    NumLabelsMod(nil, 'update_list');
  end;
  if (pgcMain.ActivePage = tsData) then
  begin
    LoadProject();
    TicketsMod(nil, 'update_list');
  end;
  if (pgcMain.ActivePage = tsPrint) then
  begin
    LoadProject();
  end;
  PrevPage:=pgcMain.ActivePage;
end;

procedure TfrmMain.lvTicketsTplDeletion(Sender: TObject; Item: TListItem);
begin
  if not Assigned(CurTicketTpl) then Exit;
  if Assigned(Item) then
  begin
    if Assigned(Item.Data) then
    begin
      if CurTicketTpl=TTicketTpl(Item.Data) then
      begin
        //CurTicketTpl.TreeNode:=nil;
        CurTicketTpl:=nil;
      end;
    end;
  end;
end;

procedure TfrmMain.lvTicketsTplDblClick(Sender: TObject);
begin
  TicketTplMod(lvTicketsTpl.Selected, 'edit');
end;

procedure TfrmMain.lvPagesTplDblClick(Sender: TObject);
begin
  NumPageTplMod(lvPagesTpl.Selected, 'edit');
end;

procedure TfrmMain.lvTicketsSelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
begin
  if lvTickets.Tag = -1 then Exit;
  if Selected then TicketsMod(Item, 'select');
end;

procedure TfrmMain.edProjNameChange(Sender: TObject);
begin
  if Assigned(CurProject) then
  begin
    if Assigned(CurProject.TreeNode) then
    begin
      CurProject.Name:=edProjName.Text;
      TTreeNode(CurProject.TreeNode).Text:=CurProject.Name;
    end;
  end;
end;

procedure TfrmMain.alViewsExecute(Action: TBasicAction;
  var Handled: Boolean);
var
  SomePage: TSomePage;
begin
  if Action = actClose then
  begin
    if (pgcViews.ActivePage is TSomePage) then
    begin
      SomePage:=(pgcViews.ActivePage as TSomePage);
      //if SomePage.Frame = PrintPreviewFrame then PrintPreviewFrame:=nil;
      //SomePage.Free();
      PagesManager.Remove(SomePage);
    end;
  end;
end;

procedure TfrmMain.btnNumPlanCreateClick(Sender: TObject);
begin
  ShowNumPlanCreate();
end;

procedure TfrmMain.actPagesOrderExecute(Sender: TObject);
begin
  Core.ShowNumOrderEdit();
end;

procedure TfrmMain.btnNumPlanPreviewClick(Sender: TObject);
begin
  Core.ShowNumPlanPreview();
end;

procedure TfrmMain.btnNumTableEditClick(Sender: TObject);
begin
  ShowNumTableEdit();
end;

procedure TfrmMain.btnHallEditClick(Sender: TObject);
begin
  Core.ShowHallPlanEditor();
end;

procedure TfrmMain.chklstPrintersClick(Sender: TObject);
var
  //Device, Driver, Port: array[0..1023] of char;
  //sDevice, sDriver, sPort: string;
  //s: string;
  i: integer;
begin
  //s:=(Sender as TCheckListBox).Items[(Sender as TCheckListBox).ItemIndex];
  //Printer.GetPrinter(Device, Driver, Port);
  //Device
  //Printer.SetPrinter(PChar(s), nil, nil, 0);
  i:=(Sender as TCheckListBox).ItemIndex;
  Printer.PrinterIndex:=i;
  ShowPrinterInfo(GetPrinterInfo(''));
end;

procedure TfrmMain.Timer10msTimer(Sender: TObject);
begin
  if Assigned(CmdQueue) then CmdQueue.ExecuteCmd();
end;

procedure TfrmMain.lvNumeratorsEdited(Sender: TObject; Item: TListItem;
  var S: String);
var
  nlt: TNumLabelTpl;
begin
  if not Assigned(Item) then Exit;
  if not Assigned(Item.Data) then Exit;
  nlt:=TNumLabelTpl(Item.Data);
  nlt.Name:=S;
  nlt.Write();
end;

procedure TfrmMain.lvNumeratorsClick(Sender: TObject);
var
  Item: TListItem;
begin
  Item:=(Sender as TListView).Selected;
  if not Assigned(Item) then Exit;
  if not Assigned(Item.Data) then Exit;
  NumLabelsMod(Item, 'edit');
end;

procedure TfrmMain.actPageAdjustExecute(Sender: TObject);
begin
  Core.ShowPageAdjust();
end;

procedure TfrmMain.edProtectionKeyChange(Sender: TObject);
begin
  ProtectionKey:=edProtectionKey.Text;
  if CopyProtection.CheckProtectionKey(ProtectionKey) then
  begin
    //lbProtectionKey.Caption:='Код защиты - ОК';
    edProtectionKey.Color:=clMoneyGreen;
  end
  else
  begin
    //lbProtectionKey.Caption:='Код защиты';
    edProtectionKey.Color:=$8888ff;
  end;
end;

procedure TfrmMain.edProtectionKeyKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_F7) and (ssShift	in Shift) then
  begin
    edProtectionKey.Text:=CopyProtection.GetProtectionKey();
  end;
end;

procedure TfrmMain.hlpBtnCreate( Num: integer; Component: TWinControl);
var
  temp: Integer;
begin
  if not Assigned(hlpBtn) then hlpBtn:=TSpeedButton.Create(self);
  hlpBtn.Caption:='?';
  hlpBtn.BringToFront;
  hlpBtn.Font.Size:= hlpBtnF;
  hlpBtn.Font.Style:= [fsBold];
  hlpBtn.Height:=hlpBtnH;
  hlpBtn.Width:=hlpBtnW;
  hlpBtn.Tag:= 100 + Num;
  hlpBtn.Top:= 0;
  hlpBtn.Left:=Trunc(Component.Width - hlpBtn.Width - 5);
  if Component is TListView then
  begin
    hlpBtn.Top:= 23;
    temp:= (Component as TListView).Items.Count*14 + 14+39;
    if temp >= Component.Height then
      hlpBtn.Left:= Trunc(Component.Width - 2*hlpBtn.Width - 4);

  end;
  hlpBtn.Cursor:=crHelp;
  hlpBtn.OnClick:= hlpExec;
  hlpBtn.Parent:= Component;
end;

procedure TfrmMain.hlpExec(Sender: TObject);
begin
  Application.HelpCommand(HELP_CONTEXT, TSpeedButton(Sender).Tag - 100)
end;

procedure TfrmMain.tmrHlpMtrTimer(Sender: TObject);
var
  mouse: TMouse;
  MousePos: TPoint;

function ShowHelpBtn(Num: integer; Component: TWinControl): Boolean;
begin
  Result:=False;
  if not Assigned(Component) then Exit;
  MousePos:=Component.ScreenToClient(mouse.CursorPos);
  if not PtInRect(Component.ClientRect, MousePos) then Exit;
  if Assigned(hlpBtn) then
  begin
    if hlpBtn.Parent <> Component then FreeAndNil(hlpBtn)
    else
    begin
      Result:=True;
      Exit;
    end;
  end;
  hlpBtnCreate(Num, Component);
  Result:=True;
end;

begin
  if pgcMain.ActivePage = tsProjects then
  begin
    //находимся в вкладке Проекты
    if ShowHelpBtn(2, grpProjectList) then Exit;
  end

  else if pgcMain.ActivePage = tsTemplates then
  begin
    //находимля во вкладке Шаблоны
    if ShowHelpBtn(4, grpNumLabelsTpl) then Exit;
    if ShowHelpBtn(5, grpTicketsTpl) then Exit;
    if ShowHelpBtn(6, grpPagesTpl) then Exit;
  end

  else if pgcMain.ActivePage = tsData then
  begin
    //находимля во вкладке Данные
    if ShowHelpBtn(8, grpTickets) then Exit;
  end

  else if pgcMain.ActivePage = tsPrint then
  begin
    //находимля во вкладке Печать
    if ShowHelpBtn(14, grpPrinters) then Exit;
  end;
  if Assigned(hlpBtn) then FreeAndNil(hlpBtn);
end;

procedure TfrmMain.btnLangClick(Sender:TObject);
begin
  CurrLang:= TMenuItem(Sender).Name;
  TMenuItem(Sender).Checked:= True;
  Core.CmdQueue.AddCmd('CHANGE_LANGUAGE');
end;

procedure TfrmMain.ChangeLanguage();
var
  i, k: Integer;
  Part: string;
begin

  if Assigned(langFile) then
  begin
    Part:= 'Main';
    grpSettings.Caption:= langFile.ReadString(Part, 'sgrpSetting', grpSettings.Caption);
    language1.Caption:= langFile.ReadString(Part,'sLanguages1', language1.Caption);
    sUpdataFrmCaption:= langFile.ReadString(Part, 'sUpdataFrmCaption', sUpdataFrmCaption);
    sPageTplName:= langFile.ReadString(Part, 'sPageTplName', sPageTplName);
    sNewPageTplName:= langFile.ReadString(Part, 'sNewPageTplName', sNewPageTplName);
    sTicketTplName:= langFile.ReadString(Part, 'sTicketTplName', sTicketTplName);
    sNewTicketTplName:= langFile.ReadString(Part, 'sNewTicketTplName', sNewTicketTplName);
    sNewNumLabelTplName:= langFile.ReadString(Part, 'sNewNumLabelTplName', sNewNumLabelTplName);
    sAskDeleteCaption:= langFile.ReadString(Part, 'sAskDeleteCaption', sAskDeleteCaption);
    sAskDeleteProject:= langFile.ReadString(Part, 'sAskDeleteProject', sAskDeleteProject)+#13+#10+langFile.ReadString(Part, 'sAskDeleteProject_1', '');
    sAskDeleteNumLabelTpl:= langFile.ReadString(Part, 'sAskDeleteNumLabelTpl', sAskDeleteNumLabelTpl);
    sAskDeleteTicketTpl:= langFile.ReadString(Part, 'sAskDeleteTicketTpl', sAskDeleteTicketTpl);
    sAskDeletePageTpl:= langFile.ReadString(Part, 'sAskDeletePageTpl', sAskDeletePageTpl);
    sNumPlanPreviewName:= langFile.ReadString(Part, 'sNumPlanPreviewName', sNumPlanPreviewName);
    sNumPlanPageName:= langFile.ReadString(Part, 'sNumPlanPageName', sNumPlanPageName);
    sHallPlanPageName:= langFile.ReadString(Part, 'sHallPlanPageName', sHallPlanPageName);
    sNumPlanMasterName:= langFile.ReadString(Part, 'sNumPlanMasterName', sNumPlanMasterName);
    sPrintPreviewName:= langFile.ReadString(Part, 'sPrintPreviewName', sPrintPreviewName);
    StatMsg:= langFile.ReadString(Part, 'StatMsg', StatMsg);
    sNewProjectName:= langFile.ReadString(Part, 'sNewProjectName', sNewProjectName);
    sNumFrmCaption:= langFile.ReadString(Part, 'sNumFrmCaption', sNumFrmCaption);
    sAskCloseProgram:= langFile.ReadString(Part, 'sAskCloseProgram', sAskCloseProgram);
    sAskCloseCaption:= langFile.ReadString(Part, 'sAskCloseCaption', sAskCloseCaption);

    Self.actProjectAdd1.Caption:= LangFile.ReadString(Part, 'spmAddProject', Self.actProjectAdd1.Caption);
    Self.actProjectGroupAdd1.Caption:= LangFile.ReadString(Part, 'spmAddProjectGroup', Self.actProjectGroupAdd1.Caption);
    Self.actProjectDel1.Caption:= LangFile.ReadString(Part, 'spmProjectDel', Self.actProjectDel1.Caption);
    Self.N4.Caption:= LangFile.ReadString(Part, 'spmProjectExport', Self.N4.Caption);
    Self.N8.Caption:= LangFile.ReadString(Part, 'spmProjectInport', Self.N8.Caption);
    Self.N2.Caption:= LangFile.ReadString(Part, 'spmProjectReadAll', Self.N2.Caption);
    Self.N3.Caption:= LangFile.ReadString(Part, 'spmProjectSaveAll', Self.N3.Caption);
    Self.actTicketAdd1.Caption:= LangFile.ReadString(Part, 'spmTicketAdd', Self.actTicketAdd1.Caption);
    Self.actTicketDel1.Caption:= LangFile.ReadString(Part, 'spmTicketDel', Self.actTicketDel1.Caption);
    Self.actTicketEdit1.Caption:= LangFile.ReadString(Part, 'spmTicketEdit', Self.actTicketEdit1.Caption);
    Self.N5.Caption:= LangFile.ReadString(Part, 'spmViewsClose', Self.N5.Caption);
    Self.N6.Caption:= LangFile.ReadString(Part, 'spmViewsHide', Self.N6.Caption);
    Self.N7.Caption:= LangFile.ReadString(Part, 'spmViewsDetach', Self.N7.Caption);
    Self.miNumLabelAdd.Caption:= LangFile.ReadString(Part, 'smiNumLabelAdd', Self.miNumLabelAdd.Caption);
    Self.miNumLabelDel.Caption:= LangFile.ReadString(Part, 'smiNumLabelDel', Self.miNumLabelDel.Caption);
    Self.miNumLabelEdit.Caption:= LangFile.ReadString(Part, 'smiNumLabelEdit', Self.miNumLabelEdit.Caption);
    Self.actPageAdd1.Caption:= LangFile.ReadString(Part, 'sactPageAdd1', Self.actPageAdd1.Caption);
    Self.actPageDel1.Caption:= LangFile.ReadString(Part, 'sactPageDel1', Self.actPageDel1.Caption);
    Self.actPageEdit1.Caption:= LangFile.ReadString(Part, 'sactPageEdit1', Self.actPageEdit1.Caption);
    Self.btnUpdate.Caption:= LangFile.ReadString(Part, 'sbtnUpdate', Self.btnUpdate.Caption);

    //Подгруппа проектов
    Part:='Project';
    tsProjects.Caption:= langFile.ReadString(Part, 'stsProject', tsProjects.Caption);
    grpProjectList.Caption:= langFile.ReadString(Part, 'sgrpProgect', grpProjectList.Caption);
    grpProjectDetails.Caption:= langFile.ReadString(Part,'sgrpProjectDetails', grpProjectDetails.Caption);
    lblProjName.Caption:= langFile.ReadString(Part,'slblProjName', lblProjName.Caption);
    grpNumPlan.Caption:= langFile.ReadString(Part, 'sgrpNumPlan', grpNumPlan.Caption);
    sMemoSummary_0:= langFile.ReadString(Part, 'sMemoSummary_0', sMemoSummary_0);
    sMemoSummary_1:= langFile.ReadString(Part, 'sMemoSummary_1', sMemoSummary_1);
    sMemoSummary_2:= langFile.ReadString(Part, 'sMemoSummary_2', sMemoSummary_2);

    //Подгруппа шаблонов
    Part:='Templates';
    tsTemplates.Caption:= langFile.ReadString(Part, 'stsTemplates', tsTemplates.Caption);
    grpNumLabelsTpl.Caption:= langFile.ReadString(Part, 'sgrpNumLabels', grpNumLabelsTpl.Caption);
    lvNumerators.Columns[0].Caption:= langFile.ReadString(Part, 'stvNumerators_0', lvNumerators.Columns[0].Caption);
    lvNumerators.Columns[1].Caption:= langFile.ReadString(Part, 'stvNumerators_1', lvNumerators.Columns[1].Caption);
    lvNumerators.Columns[2].Caption:= langFile.ReadString(Part, 'stvNumerators_2', lvNumerators.Columns[2].Caption);
    grpTicketsTpl.Caption:= langFile.ReadString(Part, 'sgrpTicketsTpl', grpTicketsTpl.Caption);
    lvTicketsTpl.Columns[0].Caption:= langFile.ReadString(Part, 'stvTicketsTpl_0', lvTicketsTpl.Columns[0].Caption);
    lvTicketsTpl.Columns[1].Caption:= langFile.ReadString(Part, 'stvTicketsTpl_1', lvTicketsTpl.Columns[1].Caption);
    lvTicketsTpl.Columns[2].Caption:= langFile.ReadString(Part, 'stvTicketsTpl_2', lvTicketsTpl.Columns[2].Caption);
    grpPagesTpl.Caption:= langFile.ReadString(Part, 'sgrpPagesTpl', grpPagesTpl.Caption);
    lvPagesTpl.Columns[0].Caption:= langFile.ReadString(Part, 'stvTicketsTpl_0', lvPagesTpl.Columns[0].Caption);
    lvPagesTpl.Columns[1].Caption:= langFile.ReadString(Part, 'stvTicketsTpl_1', lvPagesTpl.Columns[1].Caption);
    lvPagesTpl.Columns[2].Caption:= langFile.ReadString(Part, 'stvTicketsTpl_2', lvPagesTpl.Columns[2].Caption);

    //Подгруппа данных
    Part:='Data';
    tsData.Caption:= langFile.ReadString(Part, 'stsData', tsData.Caption);
    btnNumPlanCreate.Caption:= langFile.ReadString(Part, 'sbtnNumPlanCreate', btnNumPlanCreate.Caption);
    btnNumPlanCreate.Hint:= langFile.ReadString(Part, 'shbtnNumPlanCreate', btnNumPlanCreate.Hint);
    btnNumTable.Caption:= langFile.ReadString(Part, 'sbtnNumTable', btnNumTable.Caption);
    btnNumTable.Hint:= langFile.ReadString(Part, 'shbtnNumTable', btnNumTable.Hint);
    btnHallPlan.Caption:= langFile.ReadString(Part, 'sbtnHallPlan', btnHallPlan.Caption);
    btnHallPlan.Hint:= langFile.ReadString(Part, 'shbtnHallPlan', btnHallPlan.Hint);
    btnPagesOrder.Caption:= langFile.ReadString(Part, 'sbtnPagesOrder', btnPagesOrder.Caption);
    btnPagesOrder.Hint:= langFile.ReadString(Part, 'shbtnPagesOrder', btnPagesOrder.Hint);
    btnNumPreview.Caption:= langFile.ReadString(Part, 'sbtnNumPreview', btnNumPreview.Caption);
    btnNumPreview.Hint:= langFile.ReadString(Part, 'shbtnNumPreview', btnNumPreview.Hint);
    btnPageAdjust.Caption:= langFile.ReadString(Part, 'sbtnPageAdjust', btnPageAdjust.Caption);
    btnPageAdjust.Hint:= langFile.ReadString(Part, 'shbtnPageAdjust', btnPageAdjust.Hint);
    grpTickets.Caption:= langFile.ReadString(Part, 'sgrpTickets', grpTickets.Caption);
    lvTickets.Columns[0].Caption:= langFile.ReadString(Part, 'slvTickets_0', lvTickets.Columns[0].Caption);
    lvTickets.Columns[1].Caption:= langFile.ReadString(Part, 'slvTickets_1', lvTickets.Columns[1].Caption);
    grpNumerators.Caption:= langFile.ReadString(Part, 'sgrpNumerators', grpNumerators.Caption);
    nxtxtclmnTextCol1.Header.Caption:= langFile.ReadString(Part, 'sngNum_0', nxtxtclmnTextCol1.Header.Caption);
    nxtxtclmnTextCol2.Header.Caption:= langFile.ReadString(Part, 'sngNum_0', nxtxtclmnTextCol2.Header.Caption);

    //Подгруппа Печать
    Part:= 'Print';
    tsPrint.Caption:= langFile.ReadString(Part, 'stsPrint', tsPrint.Caption);
    grpPrinters.Caption:= langFile.ReadString(Part,'sgrpPrinters', grpPrinters.Caption);
    grpPrinterInfo.Caption:= langFile.ReadString(Part, 'sgrpPrinterInfo', grpPrinterInfo.Caption);
    slvInfo_0:= langFile.ReadString(Part, 'slvInfo_0', slvInfo_0);
    slvInfo_1:= langFile.ReadString(Part, 'slvInfo_1', slvInfo_1);
    slvInfo_2:= langFile.ReadString(Part, 'slvInfo_2', slvInfo_2);
    slvInfo_3:= langFile.ReadString(Part, 'slvInfo_3', slvInfo_3);
    slvInfo_4:= langFile.ReadString(Part, 'slvInfo_4', slvInfo_4);
    slvInfo_5:= langFile.ReadString(Part, 'slvInfo_5', slvInfo_5);
    slvInfo_6:= langFile.ReadString(Part, 'slvInfo_6', slvInfo_6);
    slvInfo_7:= langFile.ReadString(Part, 'slvInfo_7', slvInfo_7);
    slvInfo_8:= langFile.ReadString(Part, 'slvInfo_8', slvInfo_8);
    slvInfo_9:= langFile.ReadString(Part, 'slvInfo_9', slvInfo_9);
    slvInfo_10:= langFile.ReadString(Part, 'slvInfo_10', slvInfo_10);
    grpPrintGrid.Caption:= langFile.ReadString(Part, 'sgprPrintGrid', grpPrintGrid.Caption);
    rbGridInPixels.Caption:= langFile.ReadString(Part, 'srbGridInPixels', rbGridInPixels.Caption);
    rbGridInMm.Caption:= langFile.ReadString(Part, 'sfbGridInMm', rbGridInMm.Caption);
    lb1.Caption:= langFile.ReadString(Part, 'slb1', lb1.Caption);
    lb2.Caption:= langFile.ReadString(Part, 'slb2', lb2.Caption);
    lbPp.Caption:= LangFile.ReadString(Part, 'slbPp', lbPp.Caption);
    lbPpm.Caption:= LangFile.ReadString(Part,'slbPpm', lbPpm.Caption);
    lbStep3.Caption:= langFile.ReadString(Part,'slbStep3', lbStep3.Caption);
    lbSizeX.Caption:= langFile.ReadString(Part, 'slbSizeX', lbSizeX.Caption);
    lbSizeY.Caption:= langFile.ReadString(Part, 'slbSizeY', lbSizeY.Caption);
    lbMm.Caption:= langFile.ReadString(Part, 'slbMm', lbMm.Caption);
    btnGridPreview.Caption:= langFile.ReadString(Part, 'sbtnGridPreview', btnGridPreview.Caption);
    btnGridPrint.Caption:= langFile.ReadString(Part, 'sbtnGridPrint', btnGridPrint.Caption);
    btnPrintSet.Caption:= langFile.ReadString(Part, 'sbtnPrintSet', btnPrintSet.Caption);
    btnPageSet.Caption:= langFile.ReadString(Part, 'sbtnPageSet', btnPageSet.Caption);
    btnPreview.Caption:= langFile.ReadString(Part, 'sbtnPreview', btnPreview.Caption);
    btnPrint.Caption:= langFile.ReadString(Part, 'sbtnPrint', btnPrint.Caption);

    //Подгруппа интформация
    Part:= 'Options';
    tsOptions.Caption:= langFile.ReadString(Part, 'stsOptions', tsOptions.Caption);
    grpAbout.Caption:= langFile.ReadString(Part, 'sgrpAbout', grpAbout.Caption);
    lbl4.Caption:= langFile.ReadString(Part, 'slbl4', lbl4.Caption);
    lblAftors.Caption:= langFile.ReadString(Part, 'slblAftors', lblAftors.Caption);
    lbProgramKey.Caption:= langFile.ReadString(Part, 'slbProgramKey', lbProgramKey.Caption);
    lbProtectionKey.Caption:= langFile.ReadString(Part, 'slbProtectionKey', lbProtectionKey.Caption);

    part:= 'PageAdjust';
    sPageAdjust:= langFile.ReadString(Part, 'sPageAdjust', sPageAdjust);

  end;

  ShowPrinterInfo(GetPrinterInfo(''));
  UpdateSummary();
//  for i:=0 to TmpForms.Count-1 do
//  begin
//    Part:=(TmpForms.Items[i] as TForm).Name;
//    k:= (TmpForms.Items[i] as TForm).ComponentCount;
//    //if Part = 'frmPageAdjustForm' then
//    if (TmpForms.Items[i] as TForm).Controls[0] is TfrmPageAdjust then
//    begin
//      //StatusMsg((TmpForms.Items[i] as TForm).Name,1);
//      k:=i;
//    end;
//      
//  end;

 // frmPageAdjust.ChangeLanguage;
 // MessageDlg()
end;

procedure TfrmMain.DebugMsg(const sMsg, sMode: string);
var
  s, Temp: string;
  logFile: TextFile;
  i: Integer;
begin
  s:='['+sMode+'] ';
  while Length(s) < 10 do s:=s+' ';
  memoDebug.Lines.Add(s+sMsg);
  if not DebugToFile then Exit;

  AssignFile(logFile, ExtractFileDir(ParamStr(0))+'\'+LOGDgFileName+'.log');
  {$I-}
    Append(logFile);
  {$I+}
  if IOResult <> 0 then Rewrite(logFile);
  //temp:='Log файл от: '+ IntToStr(DayOf(now))+'.'+IntToStr(MonthOf(now))+'.'+IntToStr(YearOf(now))+'  '+IntToStr(HourOf(Now))+':'+IntToStr(MinuteOf(Now))+':'+IntToStr(SecondOf(Now));
  //Writeln(logFile, temp);
  //Writeln(logFile);
  temp:='';
  Temp:=IntToStr(HourOf(Now))+':'+IntToStr(MinuteOf(Now))+':'+IntToStr(SecondOf(Now))+':  '+s + sMsg;
  Writeln(logFile, temp);
  CloseFile(logFile);
end;

procedure TfrmMain.miDebug1Click(Sender: TObject);
begin
  tsDebug.Visible:=True;
  tsDebug.TabVisible:=True;
end;

procedure TfrmMain.AppEventsException(Sender: TObject; E: Exception);
begin
  DebugMsg(Sender.ClassName+' - '+E.Message, 'APP_ERR')
end;

procedure TfrmMain.btnUpdateClick(Sender: TObject);
begin
  ShowUpdater();
end;

procedure TfrmMain.ngNumAfterEdit(Sender: TObject; ACol, ARow: Integer;
  Value: WideString);
var
  NumLabelData: TNumLabelData;
begin
  //
  NumLabelData:=(ngNum.Cell[0, ARow].ObjectReference as TNumLabelData);
  if not Assigned(NumLabelData) then Exit;
  //NumLabelData.Value:=ngNum.Cell[1, ARow].AsString;
  NumLabelData.Value:=Value;
  NumLabelData.Write();
  Core.AddCmd('REFRESH NUM_PLAN');
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Application.MessageBox(PAnsiChar(sAskCloseProgram), PAnsiChar(sAskCloseCaption), MB_OKCANCEL) <> IDOK then Action:=caNone;
end;

end.
