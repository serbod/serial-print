/// Ядро программы
/// Здесь находятся глобальные объекты, переменные, процедуры и функции
unit Core;

interface
uses SysUtils, Types, Classes, Controls, ComCtrls, Forms, Contnrs, IniFiles,
     Windows, //Требуется для работы с реестром, а именно бертся от туда значение для RootKey
     Graphics, Menus, Registry, ItemsDef, DateUtils, Dialogs;

type

  // Информация о принтере
  TPrnInfo = record
    PixPerInch: TPoint;      // разрешение, точек на дюйм
    PageSizeMM: TPoint;      // размер области печати в мм
    PaperSizeMM: TPoint;     // размер бумаги в мм
    PhysOffset: TPoint;      // смещение области печати
    PaperSizePP: TPoint;     // размер бумаги в точках
    PageSizePP: TPoint;      // размер области печати в точках
    Margins: TRect;          // Поля (от края бумаги до края печати)
    PageRect: TRect;         // Область печати
  end;

  // Сведения о листе бумаги
  PPaperInfo = ^TPaperInfo;
  TPaperInfo = record
    CalibrationX: real;        // Коэффициент калибровки
    CalibrationY: real;        // (для соответствия экранных мм программным)
    AdjustPointMm: TPoint;     // Точка юстировки (Adjustment point) in mm
    BaseAdjustPointMm: TPoint; // Исходная точка юстировки (Base adjustment point) in mm
  end;

  // Параметры предпросмотра
  TPreviewParams = record
    c: TCanvas;             // Холст
    CanvasSize: TSize;      // размер холста
    BordersRect: TRect;     // границы изображения на холсте
    VisibleRect: TRect;     // видимая часть холста (холст может быть больше окна)
    SizeMm: TSize;          // размер изображения в мм
    k: Real;                // коэффициент размера
    MouseOffset: TPoint;    // смещение курсора мыши (для перетаскивания)
  end;

  // Страница с закладкой
  TSomePage = class(TTabSheet)
  private
    FOnRefresh: TNotifyEvent;
    FOnChangeLanguage: TNotifyEvent;
  public
    PageID: Integer;        // ID страницы
    ObjectID: Integer;      // ID объекта
    Frame: TFrame;
    constructor Create(AFrame: TFrame; ACaption: string); reintroduce;
    destructor Destroy(); override;
    property OnRefresh: TNotifyEvent read FOnRefresh write FOnRefresh;
    property OnChangeLanguage: TNotifyEvent read FOnChangeLanguage write FOnChangeLanguage;
    procedure Refresh();
    procedure ChangeLanguage();
  end;

  // Менеджер страниц
  TPagesManager = class(TObjectList)
  public
    LastPageID: integer;
    constructor Create();
    function AddPage(AFrame: TFrame; ACaption: string; ObjectID: integer): integer;
    function DelPage(APageID: Integer): Boolean;
    function AddForm(AFrame: TFrame; ACaption: string; ObjectID: integer): TForm;
    function ActivateByObjectID(ObjectID: integer): Boolean;
    function UpdateByObjectID(ObjectID: integer): Boolean;
    function ChangeLngPage(): Boolean;
    //function ActivateByType(): Boolean;
  end;

  TCmdQueue = class(TStringList)
  public
    procedure AddCmd(s: string);
    procedure ExecuteCmd();
  end;

  procedure DebugMsg(sMsg, sMode: string);
  procedure StatusMsg(sMsg: string);
  function DebugLogDelete():Boolean;
  procedure CoreStart();
  procedure CoreStop();
  function RegisterProgram(registerPath: string): Boolean;
  function Cmd(CmdText: string): string;
  procedure AddCmd(CmdText: string);
  procedure ChangeLanguage();
  procedure ShowWarning(sText, sCaption: string);
  procedure DrawArrowLine(Canvas: TCanvas; PointA, PointB: TPoint; SideSize: Real = 1);
  function GetSaveFileName(var FileName: string; FileExt: string): Boolean;

  procedure ShowPageAdjust();
  procedure ShowNumlabelTplEdit(ItemObject: TNumLabelTpl);
  procedure ShowTicketTplEdit(ItemObject: TTicketTpl);
  procedure ShowNumPageTplEdit(ItemObject: TNumPageTpl);
  procedure ShowHallPlanEditor();
  procedure ShowNumPlanCreate();
  procedure ShowNumTableEdit();
  procedure ShowNumOrderEdit();
  procedure ShowNumPlanPreview();
  procedure ShowPrintPreview();
  procedure ShowGridPreview();
  procedure ShowUpdater();

  procedure CheckProject(NumProject: TNumProject);

var
  DataPath: string;
  LangPath: string;
  CurrLang: string;
  ini: TMemIniFile;
  LangFile: TMemIniFile;
  TmpForms: TObjectList;
  CmdQueue: TCmdQueue;
  PagesManager: TPagesManager;

  CurProject: TNumProject;
  //CurNumPlanItem: TNumPlanItem;

  csNumber: string = 'Номер';
  csRow: string = 'Ряд';
  csPlace: string = 'Место';
  csPrice: string = 'Цена';
  csSerial: string = 'Серия';

  sWarning: string = 'Предупреждение';


const
  snGrid = 'CalibrationGrid';
  snPaperInfo = 'PaperInfo';
  snProgramName = 'Serial Print';
  snProgramVersion = '0.1';
  snUpdateURL = 'http://tusich.ru/serialprint/?serialprint_update';
  
  RegisterPath = 'SOFTWARE\SerialPrint';

  ciPrintPreviewID = 1;
  ciNumPlanID = 2;
  ciHallPlanID = 3;
  ciNumPlanMasterID = 4;
  ciPageAdjustID = 5;
  ciNumPlanPreviewID = 6;
  ciDebugID = 7;
  ciGridPreviewID = 8;
  ciNumOrderEditID = 9;


implementation
uses MainForm, TicketFrame, NumPageFrame, NumLabelFrame, NumPlanFrame,
NumPlanMasterFrame, NumPlanPreviewFrame, PageAdjustFrame, HallPlanFrame,
PrintPreviewFrame, NumOrderFrame, Updata, ItemsValidator, Math;

procedure StatusMsg(sMsg: string);
begin
  Cmd('STATUS '+sMsg);
end;

procedure DebugMsg(sMsg, sMode: string);
begin
  MainForm.frmMain.DebugMsg(sMsg, sMode);
end;

function DebugLogDelete():Boolean;
var
  Find: Integer;
  sr: TSearchRec;
begin
  Result:= False;
  Find:= FindFirst(ExtractFileDir(ParamStr(0))+'\*.log', faAnyFile, sr);
  
  while Find = 0 do
  begin
    DeleteFile(PAnsiChar(sr.Name));
    Find:= FindNext(sr);
  end;

  Find:= FindFirst(ExtractFileDir(ParamStr(0))+'\*.log', faAnyFile, sr);
  if Find<>0 then Result:=True;
end;  

// === TSomePage ===
constructor TSomePage.Create(AFrame: TFrame; ACaption: string);
begin
  inherited Create(frmMain);
  Self.PageControl:=frmMain.pgcViews;
  Self.Caption:=ACaption;
  Frame:=AFrame;
  Frame.Parent:=Self;
  Frame.Align:=alClient;
  Frame.Realign();
  Self.PageControl.ActivePage:=Self;
end;

destructor TSomePage.Destroy();
begin
  if Assigned(Frame) then
  begin
    // При закрытии срабатывает WriteItem_NumLabel(), где происходит непонятная ошибка
    if (Frame is TfrmTicketTemplate) then (Frame as TfrmTicketTemplate).TicketTpl:=nil;
    if (Frame is TfrmNumPageTemplate) then (Frame as TfrmNumPageTemplate).NumPageTpl:=nil;
    FreeAndNil(Frame);
  end;
  inherited Destroy();
end;

procedure TSomePage.Refresh();
begin
  if Assigned(FOnRefresh) then OnRefresh(Self);
end;

procedure TSomePage.ChangeLanguage();
begin
  if Assigned(FOnChangeLanguage) then OnChangeLanguage(Self);
end;


// === TPagesManager ===
constructor TPagesManager.Create();
begin
  inherited Create(true);
  self.LastPageID:=0;
end;

function TPagesManager.AddPage(AFrame: TFrame; ACaption: string; ObjectID: integer): integer;
var
  i: Integer;
  TmpPage: TSomePage;
begin
  if ObjectID <> 0 then
  begin
    for i:=0 to self.Count-1 do
    begin
      TmpPage:=(self.Items[i] as TSomePage);
      if TmpPage.ObjectID = ObjectID then
      begin
        Result:=TmpPage.PageID;
        frmMain.pgcViews.ActivePage:=TmpPage;
        Exit;
      end;
    end;
  end;
  TmpPage:=TSomePage.Create(AFrame, ACaption);
  Inc(LastPageID);
  TmpPage.PageID:=LastPageID;
  TmpPage.ObjectID:=ObjectID;
  self.Add(TmpPage);
  Result:=LastPageID;
end;

function TPagesManager.AddForm(AFrame: TFrame; ACaption: string; ObjectID: integer): TForm;
begin
  //Result := TForm.Create(frmMain);
  if ACaption=sHallPlanPageName then Result := TForm.Create(nil)
  else Result := TForm.Create(nil);
  Result.ClientWidth:=AFrame.Width;
  Result.ClientHeight:=AFrame.Height;
  Result.FreeOnRelease();
  //Result.OnClose:=AFrame.FormClose;
  Result.Caption:=ACaption;
  AFrame.Parent:=Result;
  //AFrame.Form:=Result;
  AFrame.Align:=alClient;
  //Result.Show();

  // Make window tab visible in Windows Program Manager
  SetWindowLong(Result.Handle, GWL_EXSTYLE, WS_EX_APPWINDOW);
end;

function TPagesManager.DelPage(APageID: Integer): Boolean;
var
  i: Integer;
  TmpPage: TSomePage;
begin
  Result:=false;
  for i:=0 to self.Count-1 do
  begin
    TmpPage:=(self.Items[i] as TSomePage);
    if TmpPage.PageID = APageID then
    begin
      self.Remove(TmpPage);
      Result:=True;
      Exit;
    end;
  end;
end;

function TPagesManager.ActivateByObjectID(ObjectID: integer): Boolean;
var
  i: Integer;
  TmpPage: TSomePage;
begin
  Result:=false;
  if ObjectID <> 0 then
  begin
    for i:=0 to self.Count-1 do
    begin
      TmpPage:=(self.Items[i] as TSomePage);
      if TmpPage.ObjectID = ObjectID then
      begin
        Result:=True;
        frmMain.pgcViews.ActivePage:=TmpPage;
        Exit;
      end;
    end;
  end;
end;

function TPagesManager.UpdateByObjectID(ObjectID: integer): Boolean;
var
  i: Integer;
  TmpPage: TSomePage;
begin
  Result:=false;
  if ObjectID <> 0 then
  begin
    for i:=0 to self.Count-1 do
    begin
      TmpPage:=(self.Items[i] as TSomePage);
      if TmpPage.ObjectID = ObjectID then
      begin
        if Assigned(TmpPage.Frame) then
        begin
          Result:=True;
          // Update TfrmNumPlanPreview
          if (TmpPage.Frame is TfrmNumPlanPreview) then
          begin
            (TmpPage.Frame as TfrmNumPlanPreview).Refresh();
          end;

          // Update TfrmNumPlan
          if (TmpPage.Frame is TfrmNumPlan) then
          begin
            (TmpPage.Frame as TfrmNumPlan).Refresh();
          end;
        end;
        Exit;
      end;
    end;
  end;
end;

function TPagesManager.ChangeLngPage(): Boolean;
var
  i: Integer;
  TmpPage: TSomePage;
begin
  for i:= 0 to Self.Count - 1 do
  begin
    Result:= False;
    TmpPage:= (Self.Items[i] as TSomePage);
    if (TmpPage.Frame is TfrmPrintPreview) then
    begin
      (TmpPage.Frame as TfrmPrintPreview).ChangeLanguage();
      TmpPage.Caption:= sPrintPreviewName;
    end;

    if (TmpPage.Frame is TfrmHallPlan) then
    begin
      (TmpPage.Frame as TfrmHallPlan).ChangeLanguege();
      TmpPage.Caption:= sHallPlanPageName;    //для Формы реализованно в самой процедуре;
    end;

    if (TmpPage.Frame is TfrmPageAdjust) then
    begin
      (TmpPage.Frame as TfrmPageAdjust).ChangeLanguage();
    end;

    if (TmpPage.Frame is TfrmNumPlanPreview) then
    begin
      (TmpPage.Frame as TfrmNumPlanPreview).ChangeLanguage();
      TmpPage.Caption:= sNumPlanPreviewName;
    end;

    if (TmpPage.Frame is TfrmNumPlan) then
    begin
      //(TmpPage.Frame as TfrmNumPlan).;
    end;

    if (TmpPage.Frame is TfrmTicketTemplate) then
    begin
      (TmpPage.Frame as TfrmTicketTemplate).ChangeLanguage();
       //TmpPage.Caption=
    end;

    if (TmpPage.Frame is TfrmNumPageTemplate) then
    begin
      (TmpPage.Frame as TfrmNumPageTemplate).ChangeLanguage();
       //TmpPage.Caption=
    end;

    if (TmpPage.Frame is TfrmNumLabelTpl) then
    begin
      (TmpPage.Frame as TfrmNumLabelTpl).ChangeLanguage();
    end;

    {Общий вид конструкции проверки
    if (TmpPage.Frame is ) then
    begin
      (TmpPage.Frame as );
    end; }
  end;
  Result:=true;
end;


// === TCmdQueue ===
procedure TCmdQueue.AddCmd(s: string);
begin
  self.Append(s);
end;

procedure TCmdQueue.ExecuteCmd();
begin
  if self.Count=0 then Exit;
  Cmd(Self.Strings[0]);
  self.Delete(0);
end;

procedure findLanguages();
var
  sr: TSearchRec;
  findRes: Integer;
  temp: string;
  findOn: Boolean;
  TmpLangFile: TIniFile;
  i: Integer;
  btnLang: TMenuItem;
begin
  temp:= '';
  i:=0;
  findOn:= False;
  findRes:= FindFirst(LangPath+'*.lng', faAnyFile, sr);
  if findRes<>0 then
    temp:= 'Error: #'+ IntToStr(findRes);
  while findRes=0 do
  begin
    temp:= sr.Name;
    TmpLangFile:= TIniFile.Create(LangPath+sr.Name);
    findRes:= FindNext(sr);
    findOn:= True;

    btnLang:= TMenuItem.Create(frmMain);
    btnLang.Caption:= TmpLangFile.ReadString('Lng', 'Name', 'Default');

    btnLang.Name:= Copy(temp, 1, Length(temp)-4);
    btnLang.RadioItem:= True;

    if btnLang.Name = CurrLang  then
    begin
      btnLang.Checked:= True;
     // btnLang.Default:= True;
    end else
      btnLang.Checked:= False;

    btnLang.OnClick:= frmMain.btnLangClick;
    frmMain.language1.Insert(i, btnLang);

    Inc(i);
    TmpLangFile.Free();
  end;

  if findOn then
    temp:= Copy(temp,1,Length(temp)-5);
end;

procedure ChangeLanguage();
begin
  if Assigned(LangFile) then FreeAndNil(LangFile);
  try
    LangFile:=TMemIniFile.Create(LangPath+CurrLang+'.lng');
  except
    FreeAndNil(LangFile);
  end;

  frmMain.ChangeLanguage();
  PagesManager.ChangeLngPage();
end;

// ========================================
procedure CoreStart();
var
  fName: string;
begin
  //DebugLogDelete; //удалим предыдущие log файлы
  MainForm.LOGDgFileName:= IntToStr(DayOf(Now))+IntToStr(MonthOf(Now))+IntToStr(YearOf(Now))+'_'+IntToStr(HourOf(Now))+IntToStr(MinuteOf(Now))+IntToStr(SecondOf(Now));

  DataPath:=GetEnvironmentVariable('APPDATA')+'\SerialPrint\';
  if (not DirectoryExists(DataPath)) then
    if (not CreateDir(DataPath)) then Exit;
  fName:=DataPath+'settings.ini';
  ini:=TMemIniFile.Create(fName);

  RegisterProgram(RegisterPath);

  CurrLang:= ini.ReadString('Main', 'Language', 'Default');
  //LangPath:= ExpendPath(ParamStr(0))+'Languages\';
  LangPath:= ExtractFilePath(ParamStr(0))+'Languages\';
  findLanguages;

  TmpForms:=TObjectList.Create(True);
  PagesManager:=TPagesManager.Create();
  CmdQueue:=TCmdQueue.Create();

  frmMain.lbl3.Caption:= snProgramName+' ver.'+snProgramVersion;

  CheckAllTables();

   
  //чтение языка
  ChangeLanguage();
end;

procedure CoreStop();
begin
  FreeAndNil(CmdQueue);
  FreeAndNil(PagesManager);
  FreeAndNil(TmpForms);
  if Assigned(LangFile) then FreeAndNil(LangFile);
  FreeAndNil(ini);
end;

function RegisterProgram(registerPath: string):Boolean;
var
  Reg: TRegistry;
begin
  Result:= False;
  Reg:= TRegistry.Create;
  Reg.RootKey := HKEY_LOCAL_MACHINE;
  if Reg.OpenKey(RegisterPath, False) then
  begin
    if Reg.ValueExists('Path') then
    begin
      Result:= True;
    end
    else
    begin
      Reg.WriteString('Path', ExtractFilePath(ParamStr(0)));
      Result:= False;
    end;
    Reg.CloseKey
  end else
  begin
    if Reg.CreateKey(RegisterPath) then
    begin
      if Reg.OpenKey(RegisterPath, False) then
      begin
        if Reg.ValueExists('Path') then
        begin
          Result:= True;
        end
        else
        begin
          Reg.WriteString('Path', ExtractFileDir(ParamStr(0)+'\'));
          Result:= False;
        end;
        Reg.CloseKey;
      end;
    end;  
  end;
  Reg.Free;
end;

procedure ShowPageAdjust();
var
  TmpForm: TForm;
  TmpFrame: TfrmPageAdjust;
begin
  TmpFrame:=(frmMain.FindComponent('frmPageAdjust') as TfrmPageAdjust);
  if Assigned(TmpFrame) then
  begin
    TmpForm:=(TmpFrame.Parent as TForm);
    TmpForm.Show();
    Exit;
  end;
  TmpFrame:=TfrmPageAdjust.Create(frmMain);
  TmpFrame.NumProject:=CurProject;
  //if CurProject.Pages.Count>0 then TmpFrame.CurNumPage:=CurProject.Pages[0];
  TmpForm := TForm.Create(frmMain);
  TmpForm.ClientWidth:=TmpFrame.Width;
  TmpForm.ClientHeight:=TmpFrame.Height;
  TmpForm.Top:=frmMain.Top+32;
  TmpForm.Left:=frmMain.Left+32;
  TmpForm.FreeOnRelease();
  TmpForm.Name:= 'frmPageAdjustForm';
  TmpForm.OnClose:=TmpFrame.FormClose;
  TmpForm.Caption:= sPageAdjust;
  TmpFrame.Parent:=TmpForm;
  TmpFrame.Form:=TmpForm;
  TmpFrame.Align:=alClient;
  //TmpFrame.Start();      
  TmpForm.HelpFile:= frmMain.HelpFile;
  TmpForm.HelpContext:=13;
  TmpForm.Show();
  //TmpForms.Add(TmpForm);
 // frmPageAdjust:=
end;

procedure ShowNumlabelTplEdit(ItemObject: TNumLabelTpl);
var
  TmpFrame: TfrmNumLabelTpl;
  TmpForm : TForm;
begin
  if not Assigned(ItemObject) then Exit;
  TmpFrame:=TfrmNumLabelTpl.Create(frmMain);
  TmpFrame.NumProject:=CurProject;
  TmpFrame.NumLabelTpl:=ItemObject;
  TmpForm := TForm.Create(frmMain);
  TmpForm.Top:=frmMain.Top+20;
  TmpForm.Left:=frmMain.Left+20;
  TmpForm.ClientWidth:=TmpFrame.Width;
  TmpForm.ClientHeight:=TmpFrame.Height;
  TmpForm.FreeOnRelease();
  TmpForm.OnClose:=TmpFrame.FormClose;
  TmpForm.Caption:=sNumFrmCaption;
  TmpFrame.Parent:=TmpForm;
  TmpFrame.Form:=TmpForm;
  TmpFrame.Align:=alClient;
  TmpFrame.ReadItem(); 
  TmpForm.HelpFile:= frmMain.HelpFile;
  TmpForm.HelpContext:=4;
  TmpForm.ShowModal();
end;

procedure ShowTicketTplEdit(ItemObject: TTicketTpl);
var
  TmpFrame: TfrmTicketTemplate;
begin
  if PagesManager.ActivateByObjectID(Integer(ItemObject)) then Exit;
  TmpFrame:=TfrmTicketTemplate.Create(nil);
  TmpFrame.TicketTpl:=ItemObject;
  TmpFrame.NumProject:=ItemObject.Project;
  //TmpPage:=TSomePage.Create(TmpFrame, 'Шаблон билета - '+ItemObject.Name);
  PagesManager.AddPage(TmpFrame, sTicketTplName+': '+ItemObject.Name, Integer(ItemObject));
  TmpFrame.ReadItem();
end;

procedure ShowNumPageTplEdit(ItemObject: TNumPageTpl);
var
  TmpFrame: TfrmNumPageTemplate;
begin
  if PagesManager.ActivateByObjectID(Integer(ItemObject)) then Exit;
  TmpFrame:=TfrmNumPageTemplate.Create(nil);
  TmpFrame.NumPageTpl:=ItemObject;
  TmpFrame.NumProject:=ItemObject.Project;
  PagesManager.AddPage(TmpFrame, sPageTplName+': '+ItemObject.Name, Integer(ItemObject));
  TmpFrame.ReadItem();
end;

procedure ShowHallPlanEditor();
var
  TmpForm: TForm;
  TmpFrame: TfrmHallPlan;
begin
  if PagesManager.ActivateByObjectID(ciHallPlanID) then Exit;
  TmpFrame:=TfrmHallPlan.Create(nil);
  TmpFrame.Project:=CurProject;
  TmpFrame.Start();

  //PagesManager.AddPage(TmpFrame, sHallPlanPageName, ciHallPlanID);
  TmpForm:=PagesManager.AddForm(TmpFrame, sHallPlanPageName, ciHallPlanID*65536+CurProject.ID);
  TmpForm.OnClose:=TmpFrame.FormClose;
  TmpForm.HelpFile:= frmMain.HelpFile;
  TmpForm.HelpContext:=10;
  TmpFrame.Form:=TmpForm;
  TmpForm.Show();
end;

procedure ShowNumPlanCreate();
var
  TmpForm: TForm;
  TmpFrame: TfrmNumPlanMaster;
begin
  if PagesManager.ActivateByObjectID(ciNumPlanMasterID) then Exit;
  TmpFrame:=TfrmNumPlanMaster.Create(nil);
  TmpFrame.NumProject:=CurProject;
  if not TmpFrame.Start() then
  begin
    TmpFrame.Free();
    Exit;
  end;

  //PagesManager.AddPage(TmpFrame, sNumPlanMasterName, ciNumPlanMasterID);
  TmpForm:=PagesManager.AddForm(TmpFrame, sNumPlanMasterName, ciNumPlanMasterID*65536+CurProject.ID);
  TmpForm.OnClose:=TmpFrame.FormClose;   
  TmpForm.HelpFile:= frmMain.HelpFile;
  TmpForm.HelpContext:=8;
  TmpFrame.Form:=TmpForm;
  TmpForm.Show();
end;

procedure ShowNumTableEdit();
var
  TmpFrame: TfrmNumPlan;
begin
  if PagesManager.ActivateByObjectID(ciNumPlanID) then Exit;
  TmpFrame:=TfrmNumPlan.Create(nil);
  TmpFrame.NumProject:=CurProject;
  TmpFrame.Start();

  TmpFrame.PageID:=PagesManager.AddPage(TmpFrame, sNumPlanPageName, ciNumPlanID*65536+CurProject.ID);
end;

procedure ShowNumOrderEdit();
var
  TmpFrame: TframeNumOrder;
begin
  if PagesManager.ActivateByObjectID(ciNumOrderEditID) then Exit;
  TmpFrame:=TframeNumOrder.Create(nil);
  TmpFrame.NumProject:=CurProject;
  if not TmpFrame.Start() then
  begin
    TmpFrame.Free();
    Exit;
  end;

  TmpFrame.PageID:=PagesManager.AddPage(TmpFrame, sNumOrderEditName, ciNumOrderEditID*65536+CurProject.ID);
end;

procedure ShowNumPlanPreview();
var
  TmpFrame: TfrmNumPlanPreview;
begin
  if PagesManager.ActivateByObjectID(ciNumPlanPreviewID) then Exit;
  TmpFrame:=TfrmNumPlanPreview.Create(nil);
  TmpFrame.NumProject:=CurProject;
  if not TmpFrame.Start() then
  begin
    TmpFrame.Free();
    Exit;
  end;

  TmpFrame.PageID:=PagesManager.AddPage(TmpFrame, sNumPlanPreviewName, ciNumPlanPreviewID*65536+CurProject.ID);
end;

procedure ShowPrintPreview();
var
  TmpFrame: TfrmPrintPreview;
begin
  if PagesManager.ActivateByObjectID(ciPrintPreviewID) then Exit;
  TmpFrame:=TfrmPrintPreview.Create(nil);
  TmpFrame.NumProject:=CurProject;
  TmpFrame.GridMode:=False;
  if not TmpFrame.Start() then
  begin
    TmpFrame.Free();
    Exit;
  end;

  PagesManager.AddPage(TmpFrame, sPrintPreviewName, ciPrintPreviewID);
end;

procedure ShowGridPreview();
var
  TmpFrame: TfrmPrintPreview;
begin
  if PagesManager.ActivateByObjectID(ciGridPreviewID) then Exit;
  TmpFrame:=TfrmPrintPreview.Create(nil);
  TmpFrame.NumProject:=CurProject;
  TmpFrame.GridMode:=True;
  if not TmpFrame.Start() then
  begin
    TmpFrame.Free();
    Exit;
  end;

  PagesManager.AddPage(TmpFrame, snGrid, ciGridPreviewID);
end;

procedure ShowUpdater();
var
  TmpFrame: TfrmUpdata;
  TmpForm: TForm;
begin
  TmpFrame:=TFrmUpdata.Create(frmMain);
  TmpForm :=TForm.Create(frmMain);
  TmpForm.BorderStyle:= bsToolWindow;
  TmpForm.Constraints.MinWidth:=TmpFrame.minWidth;
  TmpForm.Constraints.MinHeight:=TmpFrame.minHeight;
  TmpForm.ClientWidth:=TmpFrame.Width;
  TmpForm.ClientHeight:=TmpFrame.Height;
  TmpForm.Top:=Trunc(frmMain.Top + frmMain.Height/2 - TmpForm.Height/2);
  TmpForm.Left:=Trunc(frmMain.Left + frmMain.Width/2 - TmpForm.Width/2);
  TmpForm.FreeOnRelease();
  TmpForm.OnClose:=TmpFrame.FormClose;
  TmpForm.Caption:=sUpdataFrmCaption;
  TmpFrame.Parent:=TmpForm;
  TmpFrame.Form:=TmpForm;
  TmpFrame.Align:=alClient;
  //TmpFrame.ReadItem();
  TmpForm.ShowModal();
end;

procedure ShowWarning(sText, sCaption: string);
begin
  Application.MessageBox(PChar(sText), PChar(sCaption), MB_OK);
end;

procedure CheckProject(NumProject: TNumProject);
var
  i: Integer;
  Item: TDbItem;
begin
  DBItemsValidator:=TItemsValidator.Create();
  DBItemsValidator.CheckProject(NumProject);
  for i:=0 to DBItemsValidator.ErrList.Count-1 do
  begin
    Item:=(DBItemsValidator.ErrList.Objects[i] as TDbItem);
    DebugMsg(DBItemsValidator.ErrList[i]+'('+Item.ClassName+'~'+IntToStr(Item.ID)+')', '<>');
  end;
  FreeAndNil(DBItemsValidator);
end;

// === Cmd ===
function Cmd(CmdText: string): string;
var
  Params: array of string;
  Cmd, s: string;
  n: Integer;
  npi: TNumPlanItem;
begin
  DebugMsg(CmdText, 'CMD');
  // Parse params
  Result:='';
  s:=CmdText;
  while Length(s)>0 do
  begin
    SetLength(Params, Length(Params)+1);
    n:=Pos(' ', s);
    if n=0 then n:=MaxInt;
    Params[Length(Params)-1]:=Copy(s, 1, n-1);
    Delete(s, 1, n);
  end;

  Cmd:=Params[0];

  if Cmd='' then
  begin
    Exit
  end
  else if Cmd='REFRESH' then
  begin
    s:=Params[1];
    if s='TICKETS_TPL_LIST' then frmMain.TicketTplMod(nil, 'update_list')
    else if s='PAGE_TPL_LIST' then frmMain.NumPageTplMod(nil, 'update_list')
    else if s='NUMLABEL_LIST' then frmMain.NumLabelsMod(nil, 'update_list')
    else if s='TICKETS_LIST' then frmMain.TicketsMod(nil, 'update_list')
    else if s='NUM_PLAN' then
    begin
      // UPDATE TfrmNumPlanPrewiew
      PagesManager.UpdateByObjectID(ciNumPlanPreviewID*65536+CurProject.ID);
      // UPDATE TfrmNumPlan
      PagesManager.UpdateByObjectID(ciNumPlanID*65536+CurProject.ID);
    end;
    ;
  end

  else if Cmd='CLOSE' then
  begin
    s:=Params[1];
    if s='0' then
    begin
      frmMain.Close();
      Exit;
    end;
    n:=StrToIntDef(s, 0);
    if n>0 then PagesManager.DelPage(n);
  end

  else if Cmd='CHANGE_LANGUAGE' then
  begin
    Core.ChangeLanguage();
  end

  else if Cmd='STATUS' then
  begin
    frmMain.StatusMsg(Copy(CmdText, Pos(' ', CmdText)+1, MaxInt));
  end

  else if Cmd='NUMPLAN_ITEM_SEL' then
  begin
    s:=Params[1];
    n:=StrToIntDef(s, 0);
    if n>0 then
    begin
      npi:=nil;
      if Assigned(CurProject) then npi:=CurProject.NumPlanItems.GetItemByID(n);
      if Assigned(npi) then
      begin
        CurProject.CurNumPlanItem:=npi;
        frmMain.TicketsMod(nil, 'update_item');
        //Core.Cmd('REFRESH TICKETS_LIST');
        Core.Cmd('REFRESH NUM_PLAN');
      end;
    end;
  end

  else if Cmd='PROJECT_SEL' then
  begin

  end

  else if Cmd='' then
  begin

  end

  else if Cmd='' then
  begin

  end

  else if Cmd='' then
  begin

  end;
end;

procedure AddCmd(CmdText: string);
begin
  CmdQueue.AddCmd(CmdText);
end;

procedure DrawArrowLine(Canvas: TCanvas; PointA, PointB: TPoint; SideSize: Real = 1);
var
  AP: TPoint;
  Angle: Real;
  SideLen: integer;
begin
  SideLen:=Round(8*SideSize);
  Canvas.Pen.Width:=1;
  Canvas.Pen.Color:=clBlack;
  Canvas.Pen.Style:=Graphics.psSolid;
  // Line
  Canvas.MoveTo(PointA.X, PointA.Y);
  Canvas.LineTo(PointB.X, PointB.Y);

  // Arrow B
  Angle:=180*ArcTan2(PointB.Y-PointA.Y, PointB.X-PointA.X)/Pi;
  AP:=Point(PointB.X+Round(SideLen*cos(pi*(Angle+150)/180)), PointB.Y+Round(SideLen*sin(pi*(Angle+150)/180)));
  Canvas.MoveTo(PointB.X, PointB.Y);
  Canvas.LineTo(AP.X,AP.y);

  AP:=Point(PointB.X+Round(SideLen*cos(pi*(Angle-150)/180)), PointB.Y+Round(SideLen*sin(pi*(Angle-150)/180)));
  Canvas.MoveTo(PointB.X, PointB.Y);
  Canvas.LineTo(AP.X,AP.y);
end;

function GetSaveFileName(var FileName: string; FileExt: string): Boolean;
var
  SaveDialog: TSaveDialog;
begin
  SaveDialog:=TSaveDialog.Create(frmMain);
  SaveDialog.FileName:=FileName;
  SaveDialog.DefaultExt:=FileExt;
  Result:=SaveDialog.Execute();
  if Result then FileName:=SaveDialog.FileName;
  FreeAndNil(SaveDialog);
end;

end.
