unit ItemsDef;
{$DEFINE DEBUG}
{$DEFINE DEBUG_SQL}

interface
uses SysUtils, Types, Graphics, Contnrs, Classes, ItemsSerialize,
     DateUtils, MkSqLite3, Variants;

const
  STATE_ARRAY : array[0..2] of string = ('продано', 'сободно', 'неисправно');
type
  TDbItemField = record
    Name: string;
    Value: string;
    ValueType: AnsiChar; // I-Integer, N-Numeric (n.m), S-String
  end;
  TDbItemFields = array of TDbItemField;

  // Базовый класс объекта, хранимого в базе данных
  TDbItem = class(TObject)
  protected
    procedure WriteSL(sl: TStrings; TableName: string); virtual;
    procedure WriteFields(fl: TDbItemFields; TableName: string); virtual;
    //procedure ReadFromDataset(ds: TDataSet); virtual;
    procedure ReadFromDatasetMk(ds: IMkSqlStmt);
    //function ExecSQL(SQL: string): TDataSet; virtual;
    function ExecSqlMk(SQL: string): IMkSqlStmt;
  public
    ID: Integer;
    SubItemsLoaded: Boolean;
    function GetFields(var fl: TDbItemFields): Boolean; virtual;
    function SetFields(var fl: TDbItemFields): Boolean; virtual;
    function GetTableName(): string; virtual;
    procedure Write(WriteSubitems: Boolean = False); virtual;
    procedure Read(ReadSubitems: Boolean = False); virtual;
    procedure Delete(DeleteSubitems: Boolean = False); virtual;
    function Assign(Item: TDbItem): boolean; virtual;
    procedure Serialize(var Stream: TItemSerialize); virtual;
    procedure Deserialize(var Stream: TItemSerialize); virtual;
  end;

  // Базовый класс списка однотипных объектов, хранимых в базе данных
  TDbItemsList = class(TObjectList)
  public
    SQL_Load: string;
    SQL_Delete: string;
    ItemsLoaded: boolean;
    function AGetItemByID(ItemID: integer): TDbItem; virtual;
    procedure SaveToBase();
    function LoadFromBase(): Boolean; virtual;
    function CreateItem(): TDbItem; virtual;
    procedure DeleteFromBase(DeleteSubitems: Boolean = False); virtual;
    procedure Serialize(var Stream: TItemSerialize);virtual;
    procedure Deserialize(var Stream: TItemSerialize);virtual;
  end;

  TNumLabelTplList = class;
  TNumLabelList = class;
  TNumLabelDataList = class;
  TTicketTplList = class;
  TTicketList = class;
  TTicketTpl = class;
  TNumProject = class;
  TNumPlanItem = class;
  TNumPageTpl = class;

  // Шаблон нумератора
  TNumLabelTpl = class(TDbItem)
  public
    Project: TNumProject;
    Name: string;       // Название
    BaseValue: string;  // Начальное значение
    ValueType: string;  // Тип значения
    Action: string;     // Действие
    ActionTrigger: AnsiChar; // На чем срабатывает действие (P-лист, T-билет)
    Prefix: string;     // Префикс
    Suffix: string;     // Суффикс
    constructor Create(AProject: TNumProject);
    destructor Destroy(); override;
    function GetTableName(): string; override;
    function GetFields(var fl: TDbItemFields): Boolean; override;
    function SetFields(var fl: TDbItemFields): Boolean; override;
    //procedure Write(WriteSubitems: Boolean = False); override;
    //procedure Read(ReadSubitems: Boolean = False); override;
    //procedure ReadFromDataset(ds: TDataSet); override;
    //procedure Delete(DeleteSubitems: Boolean = False); override;
  end;

  // Нумератор - число или строка, располагающаяся на шаблоне билета
  // Подчинен шаблону билета
  // Подчинен шаблону листа
  // Ссылается на шаблон нумератора
  TNumLabel = class(TDbItem)
  private
    FTicketTpl: TTicketTpl;
    FNumPageTpl: TNumPageTpl;
    FNumLabelTpl: TNumLabelTpl;
    function GetTicketTpl(): TTicketTpl;
    function GetNumPageTpl(): TNumPageTpl;
    function GetNumLabelTpl(): TNumLabelTpl;
  public
    Project: TNumProject;
    Name: string;      // Название
    Position: TPoint;  // Положение внутри билета/листа
    Size: Integer;     // Размер (высота) надписи
    Angle: Integer;    // Угол наклона
    Font: TFont;       // Шрифт
    Color: TColor;     // Цвет
    constructor Create(AProject: TNumProject);
    destructor Destroy(); override;
    function GetTableName(): string; override;
    function GetFields(var fl: TDbItemFields): Boolean; override;
    function SetFields(var fl: TDbItemFields): Boolean; override;
    // Fields
    property TicketTpl: TTicketTpl read GetTicketTpl write FTicketTpl;
    property NumPageTpl: TNumPageTpl read GetNumPageTpl write FNumPageTpl;
    property NumLabelTpl: TNumLabelTpl read GetNumLabelTpl write FNumLabelTpl;
  end;

  // Данные нумератора
  // Подчинен элементу плана нумерации
  // Ссылается на шаблон нумератора
  TNumLabelData = class(TDbItem)
  private
    FNumPlanItem: TNumPlanItem;
    FNumLabelTpl: TNumLabelTpl;
    function GetNumPlanItem(): TNumPlanItem;
    function GetNumLabelTpl(): TNumLabelTpl;
  public
    Project: TNumProject;
    Value: string;        // Значение
    ValueType: string;    // Тип значения
    Action: string;       // Действие
    constructor Create(AProject: TNumProject);
    function GetTableName(): string; override;
    function GetFields(var fl: TDbItemFields): Boolean; override;
    function SetFields(var fl: TDbItemFields): Boolean; override;
    //procedure ReadFromDataset(ds: TDataSet); override;
    // Fields
    property NumPlanItem: TNumPlanItem read GetNumPlanItem write FNumPlanItem;
    property NumLabelTpl: TNumLabelTpl read GetNumLabelTpl write FNumLabelTpl;
  end;

  // Шаблон листа
  // Содержит список билетов
  // Содержит список нумераторов
  TNumPageTpl = class(TDbItem)
  private
    FTickets: TTicketList;
    FNumLabels: TNumLabelList;
    function GetTickets(): TTicketList;
    function GetNumLabels(): TNumLabelList;
  public
    Project: TNumProject;
    Name: string;    // Название
    Size: TPoint;    // Размер
    //Orientation:
    constructor Create(AProject: TNumProject);
    destructor Destroy(); override;
    function GetTableName(): string; override;
    function GetFields(var fl: TDbItemFields): Boolean; override;
    function SetFields(var fl: TDbItemFields): Boolean; override;
    procedure Write(WriteSubitems: Boolean = False); override;
    procedure Read(ReadSubitems: Boolean = False); override;
    procedure Delete(DeleteSubitems: Boolean = False); override;
    procedure Serialize(var Stream: TItemSerialize);override;
    procedure Deserialize(var Stream: TItemSerialize);override;
    // Subitems
    property Tickets: TTicketList read GetTickets;
    property NumLabels: TNumLabelList read GetNumLabels;
    // Extra
    function Assign(Item: TDbItem): boolean; override;
  end;

  // Шаблон билета
  // Содержит список нумераторов
  TTicketTpl = class(TDbItem)
  private
    FNumLabels: TNumLabelList;
    function GetNumLabels(): TNumLabelList;
  public
    Project: TNumProject;
    Name: string;      // Название
    Size: TPoint;      // Размер
    constructor Create(AProject: TNumProject);
    destructor Destroy(); override;
    function GetTableName(): string; override;
    function GetFields(var fl: TDbItemFields): Boolean; override;
    function SetFields(var fl: TDbItemFields): Boolean; override;
    procedure Write(WriteSubitems: Boolean = False); override;
    procedure Read(ReadSubitems: Boolean = False); override;
    //procedure ReadFromDataset(ds: TDataSet); override;
    procedure Delete(DeleteSubitems: Boolean = False); override;
    procedure Serialize(var Stream: TItemSerialize);override;
    procedure Deserialize(var Stream: TItemSerialize);override;
    // Subitems
    property NumLabels: TNumLabelList read GetNumLabels;
    // Extra
    /// Копирует свойства элемента и подчиненные элементы. Старые значения удаляются.
    function Assign(Item: TDbItem): boolean; override;
  end;

  // Билет шаблона листа
  // Подчинен шаблону листа
  // Ссылается на шаблон билета
  TTicket = class(TDbItem)
  private
    FTpl: TTicketTpl;
    FNumPageTpl: TNumPageTpl;
    function GetTpl(): TTicketTpl;
    function GetNumPageTpl(): TNumPageTpl;
  public
    Project: TNumProject;
    Name: string;           // Название
    Position: TPoint;       // Положение на листе
    //NumDataList: TObjectList;
    constructor Create(AProject: TNumProject);
    destructor Destroy(); override;
    function GetTableName(): string; override;
    function GetFields(var fl: TDbItemFields): Boolean; override;
    function SetFields(var fl: TDbItemFields): Boolean; override;
    procedure Read(ReadSubitems: Boolean = False); override;
    // Fields
    property Tpl: TTicketTpl read GetTpl write FTpl;
    property NumPageTpl: TNumPageTpl read GetNumPageTpl write FNumPageTpl;
  end;

  /// Лист билетной книги
  /// Ссылается на шаблон листа
  TNumPage = class(TDbItem)
  private
    FNumPageTpl: TNumPageTpl;
  public
    Order: integer;         // Порядковый номер
    State: string;          // Состояние
    Project: TNumProject;
    constructor Create(AProject: TNumProject);
    destructor Destroy(); override;
    function GetTableName(): string; override;
    function GetFields(var fl: TDbItemFields): Boolean; override;
    function SetFields(var fl: TDbItemFields): Boolean; override;

    //procedure Write(WriteSubitems: Boolean = False); override;
    procedure Read(ReadSubitems: Boolean = False); override;
    //procedure ReadFromDataset(ds: TDataSet); override;
    //procedure Delete(DeleteSubitems: Boolean = False); override;
    // Fields
    function GetNumPageTpl(): TNumPageTpl;
    property NumPageTpl: TNumPageTpl read GetNumPageTpl write FNumPageTpl;
  end;

  // Элемент плана нумерации
  // Ссылается на билет, лист с билетами
  // Содержит список данных нумераторов
  TNumPlanItem = class(TDbItem)
  private
    FTicket: TTicket;
    FNumPage: TNumPage;
    FNumLabelDataList: TNumLabelDataList;
    function GetTicket(): TTicket;
    function GetNumPage(): TNumPage;
    function GetNumLabelDataList(): TNumLabelDataList;
    function GetDataValue(const AName: string): string;
    procedure SetDataValue(const AName, AValue: string);
  public
    Order: integer;   // Порядковый номер
    State: string;    // Состояние
    Project: TNumProject;
    constructor Create(AProject: TNumProject);
    destructor Destroy(); override;
    function GetTableName(): string; override;
    function GetFields(var fl: TDbItemFields): Boolean; override;
    function SetFields(var fl: TDbItemFields): Boolean; override;
    procedure Write(WriteSubitems: Boolean = False); override;
    procedure Read(ReadSubitems: Boolean = False); override;
    procedure Delete(DeleteSubitems: Boolean = False); override;
    procedure Serialize(var Stream: TItemSerialize);override;
    procedure Deserialize(var Stream: TItemSerialize);override;
    // Fields
    property Ticket: TTicket read GetTicket write FTicket;
    property NumPage: TNumPage read GetNumPage write FNumPage;
    // Subitems
    property NumLabelDataList: TNumLabelDataList read GetNumLabelDataList;
    // Extra
    property DataValue[const AName: string]: string read GetDataValue write SetDataValue;
  end;

  //THallItemKind = (hikSeat, hikScreen, );
  THallItemState = (hisBusy, hikFree);

  // Элемент зала
  // Ссылается на элемент плана нумерации
  THallItem = class(TDbItem)
  private
    FNumPlanItem: TNumPlanItem;
    function GetNumPlanItem(): TNumPlanItem;
  public
    Project: TNumProject;
    Position: TPoint;    // Положение на плане
    // S-место, O-настройка, F-фигура,  T-текст
    Kind: AnsiChar;      // Вид элемента
    ParamsText: string;  // Строка параметров
    Color: TColor;       // Цвет
    Row: integer;        // Номер ряда
    Place: integer;      // Номер места
    Sector: integer;     // Номер сектора
    State: string;       // Состояние
    // not for DB
    Selected: Boolean;
    Moved: Boolean;
    Order: integer;
    constructor Create(AProject: TNumProject);
    destructor Destroy(); override;
    function GetTableName(): string; override;
    function GetFields(var fl: TDbItemFields): Boolean; override;
    function SetFields(var fl: TDbItemFields): Boolean; override;
    //procedure Write(WriteSubitems: Boolean = False); override;
    procedure Read(ReadSubitems: Boolean = False); override;
    //procedure ReadFromDataset(ds: TDataSet); override;
    //procedure Delete(DeleteSubitems: Boolean = False); override;
    // Fields
    property NumPlanItem: TNumPlanItem read GetNumPlanItem write FNumPlanItem;
  end;

  // Элемент настроек проекта
  TProjectOption = class(TDbItem)
  public
    Project: TNumProject;
    Name: string;
    Value: string;
    constructor Create(AProject: TNumProject);
    //destructor Destroy(); override;
    function GetTableName(): string; override;
    function GetFields(var fl: TDbItemFields): Boolean; override;
    function SetFields(var fl: TDbItemFields): Boolean; override;
  end;

  TNumProjectList = class(TDbItemsList)
  private
    function GetItem(Index: Integer): TNumProject;
    procedure SetItem(Index: Integer; Value: TNumProject);
  public
    property Items[Index: Integer]: TNumProject read GetItem write SetItem; default;
    function GetProjectByID(ProjectID: integer): TNumProject;
    procedure SaveToFile(Filename: string);
    function LoadFromFile(Filename: string): Boolean;
    //procedure SaveToBase();
    function LoadFromBase(): Boolean; override;
    function CreateItem(): TDbItem; override;
  end;

  TTicketTplList = class(TDbItemsList)
  private
    function GetItem(Index: Integer): TTicketTpl;
    procedure SetItem(Index: Integer; Value: TTicketTpl);
  public
    NumProject: TNumProject;
    property Items[Index: Integer]: TTicketTpl read GetItem write SetItem; default;
    function GetItemByID(ItemID: integer): TTicketTpl;
    //procedure SaveToBase();
    function LoadFromBase(): Boolean; override;
    function CreateItem(): TDbItem; override;
  end;

  TTicketList = class(TDbItemsList)
  private
    function GetItem(Index: Integer): TTicket;
    procedure SetItem(Index: Integer; Value: TTicket);
  public
    NumProject: TNumProject;
    NumPageTPL: TNumPageTpl;
    property Items[Index: Integer]: TTicket read GetItem write SetItem; default;
    function GetItemByID(ItemID: integer): TTicket;
    //procedure SaveToBase();
    function LoadFromBase(): Boolean; override;
    function CreateItem(): TDbItem; override;
  end;

  TNumPageTplList = class(TDbItemsList)
  private
    function GetItem(Index: Integer): TNumPageTpl;
    procedure SetItem(Index: Integer; Value: TNumPageTpl);
  public
    NumProject: TNumProject;
    constructor Create(AProject: TNumProject; OwnsItems: Boolean=true);
    property Items[Index: Integer]: TNumPageTpl read GetItem write SetItem; default;
    function GetItemByID(ItemID: integer): TNumPageTpl;
    //procedure SaveToBase();
    function LoadFromBase(): Boolean; override;
    function CreateItem(): TDbItem; override;
  end;

  TNumPageList = class(TDbItemsList)
  private
    function GetItem(Index: Integer): TNumPage;
    procedure SetItem(Index: Integer; Value: TNumPage);
  public
    NumProject: TNumProject;
    constructor Create(AProject: TNumProject; OwnsItems: Boolean=true);
    property Items[Index: Integer]: TNumPage read GetItem write SetItem; default;
    function GetItemByID(ItemID: integer): TNumPage;
    //procedure SaveToBase();
    function LoadFromBase(): Boolean; override;
    procedure DeleteFromBase(DeleteSubitems: Boolean = False); override;
    function CreateItem(): TDbItem; override;
    procedure SortByOrder();
  end;

  TNumLabelTplList = class(TDbItemsList)
  private
    function GetItem(Index: Integer): TNumLabelTpl;
    procedure SetItem(Index: Integer; Value: TNumLabelTpl);
  public
    NumProject: TNumProject;
    property Items[Index: Integer]: TNumLabelTpl read GetItem write SetItem; default;
    function GetItemByID(ItemID: integer): TNumLabelTpl;
    //procedure SaveToBase();
    function LoadFromBase(): Boolean; override;
    function CreateItem(): TDbItem; override;
  end;

  /// Список нумерторов шаблона билета или листа
  //
  TNumLabelList = class(TDbItemsList)
  private
    function GetItem(Index: Integer): TNumLabel;
    procedure SetItem(Index: Integer; Value: TNumLabel);
  public
    NumProject: TNumProject;
    TicketTpl: TTicketTpl;
    NumPageTpl: TNumPageTpl;
    property Items[Index: Integer]: TNumLabel read GetItem write SetItem; default;
    function GetItemByID(ItemID: integer): TNumLabel;
    //procedure SaveToBase();
    function LoadFromBase(): Boolean; override;
    procedure DeleteFromBase(DeleteSubitems: Boolean = False); override;
    function CreateItem(): TDbItem; override;
  end;

  TNumLabelDataList = class(TDbItemsList)
  private
    function GetItem(Index: Integer): TNumLabelData;
    procedure SetItem(Index: Integer; Value: TNumLabelData);
  public
    NumProject: TNumProject;
    NumPlanItem: TNumPlanItem;
    property Items[Index: Integer]: TNumLabelData read GetItem write SetItem; default;
    function GetItemByID(ItemID: integer): TNumLabelData;
    //procedure SaveToBase();
    function LoadFromBase(): Boolean; override;
    procedure DeleteFromBase(DeleteSubitems: Boolean = False); override;
    function CreateItem(): TDbItem; override;
  end;

  TNumPlan = class(TDbItemsList)
  private
    function GetItem(Index: Integer): TNumPlanItem;
    procedure SetItem(Index: Integer; Value: TNumPlanItem);
  public
    NumProject: TNumProject;
    property Items[Index: Integer]: TNumPlanItem read GetItem write SetItem; default;
    function GetItemByID(ItemID: integer): TNumPlanItem;
    //procedure SaveToBase(SaveSubitems: Boolean = false); reintroduce;
    function LoadFromBase(): Boolean; override;
    procedure DeleteFromBase(DeleteSubitems: Boolean = False); override;
    function CreateItem(): TDbItem; override;
    procedure SortByOrder();
    function GetItemByOrder(AOrder: integer): TNumPlanItem;
  end;

  THallPlan = class(TDbItemsList)
  private
    function GetItem(Index: Integer): THallItem;
    procedure SetItem(Index: Integer; Value: THallItem);
  public
    NumProject: TNumProject;
    property Items[Index: Integer]: THallItem read GetItem write SetItem; default;
    function GetItemByID(ItemID: integer): THallItem;
    //procedure SaveToBase(SaveSubitems: Boolean = false); reintroduce;
    function LoadFromBase(): Boolean; override;
    procedure DeleteFromBase(DeleteSubitems: Boolean = False); override;
    function CreateItem(): TDbItem; override;
  end;

  TProjectOptionList = class(TDbItemsList)
  private
    function GetItem(Index: Integer): TProjectOption;
    procedure SetItem(Index: Integer; Value: TProjectOption);
    function FGetOption(const Name: string): string;
    procedure FSetOption(const Name: string; Value: string);
  public
    NumProject: TNumProject;
    property Items[Index: Integer]: TProjectOption read GetItem write SetItem; default;
    function GetItemByID(ItemID: integer): TProjectOption;
    //procedure SaveToBase(SaveSubitems: Boolean = false); reintroduce;
    function LoadFromBase(): Boolean; override;
    function CreateItem(): TDbItem; override;
    property Params[const Name: string]: string read FGetOption write FSetOption;
  end;

  // Проект нумерации
  // Содержит шаблоны, страницы, билеты, план нумерации, план зала
  TNumProject = class(TDbItem)
  private
    FPagesTpl: TNumPageTplList;
    FPages: TNumPageList;
    FTickets: TTicketList;
    FTicketTplList: TTicketTplList;
    FNumLabelsTpl: TNumLabelTplList;
    FHallPlan: THallPlan;
    FNumPlanItems: TNumPlan;
    FOptions: TProjectOptionList;
    function GetPagesTpl(): TNumPageTplList;
    function GetPages(): TNumPageList;
    function GetTickets(): TTicketList;
    function GetTicketTplList(): TTicketTplList;
    function GetNumLabelsTpl(): TNumLabelTplList;
    function GetHallPlan(): THallPlan;
    function GetNumPlanItems(): TNumPlan;
    function GetOptions(): TProjectOptionList;
  public
    ParentID: Integer;    // ID вышестоящего проекта
    Name: string;         // Название
    Desc: string;         // Описание
    // Not for DB
    Loaded: Boolean;      // Загружен
    TreeNode: Pointer;    // Ссылка на узел визуального дерева проектов
    CurNumPlanItem: TNumPlanItem; // Текущий билет
    constructor Create();
    destructor Destroy(); override;
    function GetTableName(): string; override;
    function GetFields(var fl: TDbItemFields): Boolean; override;
    function SetFields(var fl: TDbItemFields): Boolean; override;
    procedure Write(WriteSubitems: Boolean = False); override;
    procedure Read(ReadSubitems: Boolean = False); override;
    //procedure ReadFromDataset(ds: TDataSet); override;
    procedure Delete(DeleteSubitems: Boolean = False); override;
    procedure Serialize(var Stream: TItemSerialize);override;
    procedure Deserialize(var Stream: TItemSerialize);override;
    // Subitems
    property PagesTpl: TNumPageTplList read GetPagesTpl;
    property Pages: TNumPageList read GetPages;
    property Tickets: TTicketList read GetTickets;
    property TicketTplList: TTicketTplList read GetTicketTplList;
    property NumLabelsTpl: TNumLabelTplList read GetNumLabelsTpl;
    property HallPlan: THallPlan read GetHallPlan;
    property NumPlanItems: TNumPlan read GetNumPlanItems;
    property Options: TProjectOptionList read GetOptions;
  end;

  function CheckAllTables(): Boolean;
  function PosToStr(Pos: TPoint): string;
  function StrToPos(const val : string):TPoint;
  function ApplyAction(Value, Action: string): string;
  function StartTransaction(): Boolean;
  function CloseTransaction(): Boolean;
  function AbortTransaction(): Boolean;

  procedure DebugMsg(sMsg, sMode: string);

const
  sTableNumLabelData  = 'num_data';
  sTableNumLabelTpl   = 'num_label_tpl';
  sTableNumLabels     = 'num_labels';
  sTableTicketsTpl    = 'tickets_tpl';
  sTableTickets       = 'tickets';
  sTableNumPagesTpl   = 'pages_tpl';
  sTableNumPages      = 'pages';
  sTableProjects      = 'projects';
  sTableNumPlanItems  = 'num_plan_items';
  sTableHallItems     = 'hall_items';
  sTableProjectOptions= 'project_options';

var
  TransactionActive: Boolean;
  DT: TDateTime;
  db: TMkSqlite;

  sTicketTplErr: string = 'Не назначен макет билета';
  sNumLabelTplErr: string = 'Не назначен шаблон нумератора';

implementation
uses MainForm;

procedure DebugMsg(sMsg, sMode: string);
begin
  MainForm.frmMain.DebugMsg(sMsg, sMode);
end;

function Disarm(s: string): string;
var DoDisarm: Boolean;
begin
  DoDisarm:=false;
  if Pos(' ', s)>-1 then DoDisarm:=true
  else if Pos(',', s)>-1 then DoDisarm:=true
  else if Pos('"', s)>-1 then DoDisarm:=true;

  if DoDisarm then
  begin
    Result:=StringReplace(s, '"', '""', [rfReplaceAll]);
    Result:='"'+Result+'"';
    Exit;
  end;
  Result:=s;
end;

function PosToStr(Pos: TPoint): string;
begin
  Result:=IntToStr(Pos.X)+' x '+IntToStr(Pos.Y);
end;

function StrToPos(const val : string):TPoint;
  const FIND_STR = ' x ';

  var
    strVal : string;
    ps : integer;
begin
  ps:= pos(FIND_STR, val);
  if ps>0 then
  begin
    strVal := copy(val,1,ps-1);
    Result.X := StrToIntDef(strVal, -1);
    strVal := copy(val,ps+length(FIND_STR),length(val)-ps);
    Result.Y := StrToIntDef(strVal, -1);
  end
  else Result := Point(-1, -1);
end;

function ApplyAction2(Value, Action: string): string;
var
  i, n: integer;
  Cmd, Param: string;
begin
  Cmd:=Copy(Action, 1, 1);
  Param:=Copy(Action, 2, MaxInt);
  if Cmd='=' then
  begin
    if Param='' then Result:=Value else Result:=Param;
    Exit;
  end;

  i:=StrToIntDef(Value, 0);
  n:=StrToIntDef(Param, 1);
  if Cmd='+' then
  begin
    Result:=IntToStr(i+n);
  end
  else if Cmd='-' then
  begin
    Result:=IntToStr(i-n);
  end;
end;

function ApplyAction(Value, Action: string): string;
var
  i, n, l, ln: integer;
  Cmd, Param: string;
begin
  Cmd:=Copy(Action, 1, 1);
  if Pos(Cmd, '+-=')=0 then
  begin
    Result:='';
    Exit;
  end;
  Param:=Copy(Action, 2, MaxInt);
  if Cmd='=' then
  begin
    if Param='' then Result:=Value else Result:=Param;
    Exit;
  end;

  l:=Length(Value);
  if l=0 then
  begin
    Result:='';
    Exit;
  end;
  Result:=Copy(Value, 1, l);
  ln:=l;
  //n:=StrToIntDef(Param, 1);
  n:=1;
  while ln>0 do
  begin
    i:=StrToIntDef(Result[ln], 0);
    if Cmd='+' then
    begin
      i:=i+n;
      if i > 9 then i:=0;
      Result[ln]:=IntToStr(i)[1];
      if i=0 then Dec(ln) else ln:=0;
      if (i=0) and (ln=0) then Result:='1'+Result;
    end
    else if Cmd='-' then
    begin
      i:=i-n;
      if i < 0 then i:=9;
      Result[ln]:=IntToStr(i)[1];
      if i=9 then Dec(ln) else ln:=0;
    end;
  end;
end;

function FontToStr(font: TFont): string;
begin
  Result:=font.Name+', '+IntToStr(font.Size);
  if (fsBold in font.Style) then Result:=Result+', bold';
  if (fsItalic in font.Style) then Result:=Result+', italic';
  if (fsUnderline in font.Style) then Result:=Result+', underline';
end;

function StrToFont(s: string; font: TFont): Boolean;
var
  ss, sn: string;

function GetParam(var sr: string): string;
var
  i: integer;
begin
  Result:='';
  i:=Pos(',', sr);
  if i=0 then i := maxint-1;
  Result:=Trim(Copy(sr, 1, i-1));
  Delete(sr, 1, i);
  sr:=Trim(sr);
end;

begin
  Result:=False;
  if not Assigned(font) then Exit;
  ss:=s;
  font.Name:=GetParam(ss);
  font.Size:=StrToIntDef(GetParam(ss), font.Size);
  while ss<>'' do
  begin
    sn:=GetParam(ss);
    if sn='bold' then font.Style:=font.Style + [fsBold];
    if sn='italic' then font.Style:=font.Style + [fsItalic];
    if sn='underline' then font.Style:=font.Style + [fsUnderline];
  end;
  Result:=True;
end;

procedure CreateTable(sTableName: string; sl: TStringList);
var
  SQL: string;
  i: Integer;
  ds: IMkSqlStmt;
begin
  SQL:='CREATE TABLE '+sTableName+' (';
  for i:=0 to sl.Count-1 do
  begin
    if i>0 then SQL:=SQL+',';
    SQL:=SQL+sl.Names[i]+' '+sl.ValueFromIndex[i];
  end;
  SQL:=SQL+');';
  {$IFDEF DEBUG_SQL}
  DebugMsg(SQL, 'SQL');
  {$ENDIF}
  ds:=db.exec(SQL);
end;

procedure RebuildTable(sTableName: string; sl: TStringList);
var
  i: integer;
  sTmpTableName: string;
  //rs: IMkSqlStmt;
  ds: IMkSqlStmt;
  s, sn, st, sql: string;
begin
  if not Assigned(db) then Exit;
  // old table info
  sn:='';
  //rs:=db.SchemaTableInfo(sTableName);
  SQL:='SELECT * FROM '+sTableName+' LIMIT 1;';
  {$IFDEF DEBUG_SQL}
  DebugMsg(SQL, 'SQL');
  {$ENDIF}
  try
    ds:=db.exec(SQL);
  except
    Exit;
  end;
  for i:=0 to ds.fieldCount-1 do
  begin
    if sl.IndexOfName(ds.Field[i].name)<0 then Continue;
    if Length(sn)>0 then sn:=sn+',';
    sn:=sn+ds.Field[i].name;
  end;

  // rename table to temp
  sTmpTableName:=sTableName+'_tmp';
  sql:='ALTER TABLE '+sTableName+' RENAME TO '+sTmpTableName+';';
  {$IFDEF DEBUG_SQL}
  DebugMsg(sql, 'SQL');
  {$ENDIF}
  db.Exec(sql);

  // create new table
  CreateTable(sTableName, sl);

  // refill new table
  sql:='INSERT INTO '+sTableName+' ('+sn+') '
  +'SELECT '+sn+' FROM '+sTmpTableName+';';
  {$IFDEF DEBUG_SQL}
  DebugMsg(sql, 'SQL');
  {$ENDIF}
  db.Exec(sql);

  // drop temp table
  sql:='DROP TABLE '+sTmpTableName+';';
  {$IFDEF DEBUG_SQL}
  DebugMsg(sql, 'SQL');
  {$ENDIF}
  db.Exec(sql);
end;

function CheckTable(sTableName: string; sl: TStringList): Boolean;
var
  SQL: string;
  i: Integer;
  ds: IMkSqlStmt;
begin
  Result:=True;
  //sTableProjects
  SQL:='SELECT * FROM '+sTableName+' LIMIT 1;';
  {$IFDEF DEBUG_SQL}
  DebugMsg(SQL, 'SQL');
  {$ENDIF}
  try
    ds:=db.exec(SQL);
  except
    CreateTable(sTableName, sl);
    Exit;
  end;

  ds.First();
  if ds.fieldCount=0 then
  begin
    CreateTable(sTableName, sl);
    Exit;
  end;

  for i:=0 to sl.Count-1 do
  begin
    if ds.fieldIndex(sl.Names[i])<0 then
    begin
      RebuildTable(sTableName, sl);
      Exit;
    end;
  end;
  //Result:=False;
end;

function StartTransaction(): Boolean;
begin
  Result:=False;
  if TransactionActive then Exit;
  //DataModule1.DataBase.StartTransaction();
  db.beginTransaction();
  TransactionActive:=True;
  Result:=True;
end;

function CloseTransaction(): Boolean;
begin
  Result:=False;
  if not TransactionActive then Exit;
  //DataModule1.DataBase.Commit();
  db.Commit();
  TransactionActive:=False;
  Result:=True;
end;

function AbortTransaction(): Boolean;
begin
  Result:=False;
  if not TransactionActive then Exit;
  //DataModule1.DataBase.RollBack();
  db.RollBack();
  TransactionActive:=False;
  Result:=True;
end;

procedure SetDbItemField(var f: TDbItemField; Name, Value: string; ValueType: AnsiChar);
begin
  f.Name:=Name;
  f.Value:=Value;
  f.ValueType:=ValueType;
end;

procedure AddDbItemField(var fl: TDbItemFields; Name, Value: string; ValueType: AnsiChar);
var
  i: Integer;
begin
  i:=Length(fl);
  SetLength(fl, i+1);
  fl[i].Name:=Name;
  fl[i].Value:=Value;
  fl[i].ValueType:=ValueType;
end;

function GetDbItemFieldValue(var fl: TDbItemFields; Name: string): string;
var
  i, flCount: Integer;
begin
  flCount:=Length(fl);
  for i:=0 to flCount-1 do
  begin
    if fl[i].Name=Name then
    begin
      Result:=fl[i].Value;
      Exit;
    end;
  end;
  Result:='';
end;

// === TDbItem ===
procedure TDbItem.WriteSL(sl: TStrings; TableName: string);
var
  SQL: string;
  i: Integer;
begin
  SQL:='';
  if self.ID = 0 then
  begin
    SQL:='INSERT INTO '+TableName+' (';
    for i:=1 to sl.Count-1 do
    begin
      if i>1 then SQL:=SQL+',';
      SQL:=SQL+sl.Names[i];
    end;
    SQL:=SQL+') VALUES (';
    for i:=1 to sl.Count-1 do
    begin
      if i>1 then SQL:=SQL+',';
      SQL:=SQL+sl.ValueFromIndex[i];
    end;
    SQL:=SQL+');';
    {$IFDEF DEBUG_SQL}
    DebugMsg(SQL, 'SQL');
    {$ENDIF}
    db.execCmd(SQL);
    ID:=db.LastInsertRowId();
    //DataModule1.Query1.SQL.Text:=SQL;
    //DataModule1.Query1.ExecSQL();
    //ID:=DataModule1.Query1.GetLastInsertRow();
  end
  else
  begin
    SQL:='UPDATE '+TableName+' SET ';
    for i:=1 to sl.Count-1 do
    begin
      if i>1 then SQL:=SQL+',';
      SQL:=SQL+sl[i];
    end;
    SQL:=SQL+' WHERE id='+IntToStr(ID)+';';
    {$IFDEF DEBUG_SQL}
    DebugMsg(SQL, 'SQL');
    {$ENDIF}
    db.execCmd(SQL);
    //DataModule1.Query1.SQL.Text:=SQL;
    //DataModule1.Query1.ExecSQL();
  end;
end;

procedure TDbItem.WriteFields(fl: TDbItemFields; TableName: string);
var
  SQL: string;
  i, flCount: Integer;
begin
  SQL:='';
  flCount:=Length(fl);
  if self.ID = 0 then
  begin
    SQL:='INSERT INTO '+TableName+' (';
    for i:=1 to flCount-1 do
    begin
      if i>1 then SQL:=SQL+',';
      SQL:=SQL+fl[i].Name;
    end;
    SQL:=SQL+') VALUES (';
    for i:=1 to flCount-1 do
    begin
      if i>1 then SQL:=SQL+',';
      if fl[i].ValueType='S' then
        SQL:=SQL+Disarm(fl[i].Value)
      else
        SQL:=SQL+fl[i].Value;
    end;
    SQL:=SQL+');';
    //DataModule1.Query1.SQL.Text:=SQL;
    //DataModule1.Query1.ExecSQL();
    //ID:=DataModule1.Query1.GetLastInsertRow();
    {$IFDEF DEBUG_SQL}
    DebugMsg(SQL, 'SQL');
    {$ENDIF}
    db.execCmd(SQL);
    ID:=db.LastInsertRowId();
  end
  else
  begin
    SQL:='UPDATE '+TableName+' SET ';
    for i:=1 to flCount-1 do
    begin
      if i>1 then SQL:=SQL+',';
      SQL:=SQL+fl[i].Name+'=';
      if fl[i].ValueType='S' then
        SQL:=SQL+Disarm(fl[i].Value)
      else
        SQL:=SQL+fl[i].Value;
    end;
    SQL:=SQL+' WHERE id='+IntToStr(ID)+';';
    //DataModule1.Query1.SQL.Text:=SQL;
    //DataModule1.Query1.ExecSQL();
    {$IFDEF DEBUG_SQL}
    DebugMsg(SQL, 'SQL');
    {$ENDIF}
    db.execCmd(SQL);
  end;
end;

procedure TDbItem.Write(WriteSubitems: Boolean = False);
var
  fl: TDbItemFields;
begin
  if GetFields(fl) then WriteFields(fl, GetTableName());
end;

procedure TDbItem.Read(ReadSubitems: Boolean = False);
var
  SQL: string;
begin
  if ID=0 then Exit;
  SQL:='SELECT * FROM '+GetTableName()+' WHERE id='+IntToStr(ID)+';';
  //ReadFromDataset(ExecSQL(SQL));
  ReadFromDatasetMk(ExecSqlMk(SQL));
end;

procedure TDbItem.Delete(DeleteSubitems: Boolean = False);
begin
  //ExecSQL('DELETE FROM '+GetTableName()+' WHERE id='+IntToStr(ID));
  if ID <> 0 then ExecSqlMk('DELETE FROM '+GetTableName()+' WHERE id='+IntToStr(ID));
end;

//function TDbItem.ExecSQL(SQL: string): TDataSet;
//begin
//  Result:=DataModule1.Query1;
//  {$IFDEF DEBUG_SQL}
//  DebugMsg(SQL, 'SQL');
//  {$ENDIF}
//  DataModule1.Query1.SQL.Text:=SQL;
//  DataModule1.Query1.ExecSQL();
//  if Result.RecordCount=0 then Exit;
//  Result.First();
//  //ReadFromDataset(DataModule1.Query1);
//end;

function TDbItem.ExecSqlMk(SQL: string): IMkSqlStmt;
begin
  {$IFDEF DEBUG_SQL}
  DebugMsg(SQL, 'SQL');
  {$ENDIF}
  Result:=db.exec(SQL);
end;

//procedure TDbItem.ReadFromDataset(ds: TDataSet);
//var
//  sl: TStringList;
//  i: Integer;
//  s: string;
//begin
//  sl:=TStringList.Create();
//  ds.GetFieldNames(sl);
//  for i:=0 to sl.Count-1 do
//  begin
//    s:=sl[i];
//    sl[i]:=s+'='+ds.Fields[i].AsString;
//  end;
//  SetFields(sl);
//  sl.Free();
//end;

//procedure TDbItem.ReadFromDataset(ds: TDataSet);
//var
//  fl: TDbItemFields;
//  i: Integer;
//begin
//  //ds.GetFieldNames(sl);
//  SetLength(fl, ds.FieldCount);
//  for i:=0 to ds.FieldCount-1 do
//  begin
//    fl[i].Name:=ds.Fields[i].FieldName;
//    fl[i].Value:=ds.Fields[i].AsString;
//  end;
//  SetFields(fl);
//end;

procedure TDbItem.ReadFromDatasetMk(ds: IMkSqlStmt);
var
  fl: TDbItemFields;
  i: Integer;
begin
  //ds.GetFieldNames(sl);
  SetLength(fl, ds.FieldCount);
  for i:=0 to ds.FieldCount-1 do
  begin
    fl[i].Name:=ds.Field[i].name;
    fl[i].Value:=ds.value[i];
  end;
  SetFields(fl);
end;

function TDbItem.GetFields(var fl: TDbItemFields): Boolean;
begin
  SetLength(fl, 1);
  SetDbItemField(fl[0], 'id', IntToStr(ID), 'I');
  Result:=True;
end;

function TDbItem.SetFields(var fl: TDbItemFields): Boolean;
var
  i, flCount: Integer;
begin
  flCount:=Length(fl);
  for i:=0 to flCount-1 do
  begin
    if fl[i].Name='id' then ID:=StrToIntDef(fl[i].Value, ID);
  end;
  Result:=True;
end;

function TDbItem.GetTableName(): string;
begin
  Result:='';
end;

procedure TDbItem.Serialize(var Stream: TItemSerialize);
var
  fl: TDbItemFields;
  i, flCount: Integer;
begin
  if not GetFields(fl) then Exit;
  try
    flCount:=Length(fl);
    //Stream.StartItem(GetTableName());
    for i:=0 to flCount-1 do Stream.AddAttribute(fl[i].Name, fl[i].Value);
    //Stream.CloseItem(GetTableName());
  finally
  end;
end;

procedure TDbItem.Deserialize(var Stream: TItemSerialize);
var
  fl: TDbItemFields;
  i, flCount: Integer;
  s: string;
begin
  if not GetFields(fl) then Exit;
  flCount:=Length(fl);
  try
    for i:=0 to flCount-1 do
    begin
      s:=Stream.GetAttrValue(fl[i].Name);
      if (s <> '') then fl[i].Value:=s;
    end;
    SetFields(fl);
  finally
  end;
end;

function TDbItem.Assign(Item: TDbItem): boolean;
var
  fl: TDbItemFields;
  OldID: Integer;
begin
  Result:=False;
  if not Assigned(Item) then Exit;
  OldID:=self.ID;
  if Item.GetFields(fl) then Result:=Self.SetFields(fl);
  Self.ID:=OldID;
end;


// === TNumLabelTpl ===
constructor TNumLabelTpl.Create(AProject: TNumProject);
begin
  self.Project:=AProject;
  ActionTrigger:='T';
end;

destructor TNumLabelTpl.Destroy();
begin
  //
end;

function TNumLabelTpl.GetTableName(): string;
begin
  Result:=sTableNumLabelTpl;
end;

function TNumLabelTpl.GetFields(var fl: TDbItemFields): Boolean;
begin
  inherited GetFields(fl);
  AddDbItemField(fl, 'project_id', IntToStr(Project.ID), 'I');
  AddDbItemField(fl, 'name', Name, 'S');
  AddDbItemField(fl, 'base_value', BaseValue, 'S');
  AddDbItemField(fl, 'value_type', ValueType, 'S');
  AddDbItemField(fl, 'action', Action, 'S');
  AddDbItemField(fl, 'action_trigger', ActionTrigger, 'S');
  AddDbItemField(fl, 'prefix', Prefix, 'S');
  AddDbItemField(fl, 'suffix', Suffix, 'S');
  Result:=True;
end;

function TNumLabelTpl.SetFields(var fl: TDbItemFields): Boolean;
var
  i, flCount: Integer;
  s: string;
begin
  Result:=inherited SetFields(fl);
  flCount:=Length(fl);
  for i:=0 to flCount-1 do
  begin
    if fl[i].Name='name' then Name:=fl[i].Value
    else if fl[i].Name='base_value' then BaseValue:=fl[i].Value
    else if fl[i].Name='value_type' then ValueType:=fl[i].Value
    else if fl[i].Name='action' then Action:=fl[i].Value
    else if fl[i].Name='action_trigger' then
    begin
      s:=fl[i].Value;
      if Length(s)>0 then ActionTrigger:=s[1];
    end
    else if fl[i].Name='prefix' then Prefix:=fl[i].Value
    else if fl[i].Name='suffix' then Suffix:=fl[i].Value;
  end;
  Result:=True;
end;

// === TNumLabel ===
constructor TNumLabel.Create(AProject: TNumProject);
begin
  Self.Font:=TFont.Create();
  self.Project:=AProject;
  Self.TicketTpl:=nil;
  self.NumPageTpl:=nil;
  self.NumLabelTpl:=nil;
end;

destructor TNumLabel.Destroy();
begin
  FreeAndNil(Font);
end;

function TNumLabel.GetTableName(): string;
begin
  Result:=sTableNumLabels;
end;

function TNumLabel.GetFields(var fl: TDbItemFields): Boolean;
var
  TicketTplID: integer;
  NumPageTplID: integer;
  NumLabelTplID: integer;
begin
  TicketTplID:=0;
  NumPageTplID:=0;
  NumLabelTplID:=0;

  if Assigned(TicketTpl) then TicketTplID:=TicketTpl.ID;
  if Assigned(NumPageTpl) then NumPageTplID:=NumPageTpl.ID;
  if Assigned(NumLabelTpl) then NumLabelTplID:=NumLabelTpl.ID;

  inherited GetFields(fl);
  AddDbItemField(fl, 'project_id', IntToStr(Project.ID), 'I');
  AddDbItemField(fl, 'ticket_tpl_id', IntToStr(TicketTplID), 'I');
  AddDbItemField(fl, 'numpage_tpl_id', IntToStr(NumPageTplID), 'I');
  AddDbItemField(fl, 'numlabel_tpl_id', IntToStr(NumLabelTplID), 'I');
  AddDbItemField(fl, 'name', Name, 'S');
  AddDbItemField(fl, 'pos_x', IntToStr(Position.X), 'I');
  AddDbItemField(fl, 'pos_y', IntToStr(Position.Y), 'I');
  AddDbItemField(fl, 'size', IntToStr(Size), 'I');
  AddDbItemField(fl, 'angle', IntToStr(Angle), 'I');
  AddDbItemField(fl, 'color', IntToStr(Color), 'I');
  AddDbItemField(fl, 'font', FontToStr(Font), 'S');

  Result:=True;
end;

function TNumLabel.SetFields(var fl: TDbItemFields): Boolean;
begin
  Result:= inherited SetFields(fl);
  Name:=GetDbItemFieldValue(fl, 'name');
  FTicketTpl:=Project.TicketTplList.GetItemByID(StrToIntDef(GetDbItemFieldValue(fl, 'ticket_tpl_id'), 0));
  FNumPageTpl:=Project.PagesTpl.GetItemByID(StrToIntDef(GetDbItemFieldValue(fl, 'numpage_tpl_id'), 0));
  FNumLabelTpl:=Project.NumLabelsTpl.GetItemByID(StrToIntDef(GetDbItemFieldValue(fl, 'numlabel_tpl_id'), 0));
  Position.X:=StrToIntDef(GetDbItemFieldValue(fl, 'pos_x'), Position.X);
  Position.Y:=StrToIntDef(GetDbItemFieldValue(fl, 'pos_y'), Position.Y);
  Size:=StrToIntDef(GetDbItemFieldValue(fl, 'size'), Size);
  Angle:=StrToIntDef(GetDbItemFieldValue(fl, 'angle'), Angle);
  Color:=StrToIntDef(GetDbItemFieldValue(fl, 'color'), Color);
  StrToFont(GetDbItemFieldValue(fl, 'font'), Font);
  Result:=True;
end;

function TNumLabel.GetTicketTpl(): TTicketTpl;
begin
  if (not Assigned(FNumPageTpl)) and (not Assigned(FTicketTpl)) then Read();
  Result:=FTicketTpl;
end;

function TNumLabel.GetNumPageTpl(): TNumPageTpl;
begin
  if (not Assigned(FNumPageTpl)) and (not Assigned(FTicketTpl)) then Read();
  Result:=FNumPageTpl;
end;

function TNumLabel.GetNumLabelTpl(): TNumLabelTpl;
begin
  if not Assigned(FNumLabelTpl) then Read();
  Result:=FNumLabelTpl;
end;

// === TNumLabelData ===
constructor TNumLabelData.Create(AProject: TNumProject);
begin
  inherited Create();
  Self.Project:=AProject;
end;

function TNumLabelData.GetTableName(): string;
begin
  Result:=sTableNumLabelData;
end;

function TNumLabelData.GetFields(var fl: TDbItemFields): Boolean;
var
  NumPlanItemID: integer;
  NumLabelTplID: integer;
begin
  NumPlanItemID:=0;
  NumLabelTplID:=0;
  if Assigned(NumPlanItem) then NumPlanItemID:=NumPlanItem.ID;
  if Assigned(NumLabelTpl) then NumLabelTplID:=NumLabelTpl.ID;

  inherited GetFields(fl);
  AddDbItemField(fl, 'project_id', IntToStr(Project.ID), 'I');  // *
  AddDbItemField(fl, 'numplan_item_id', IntToStr(NumPlanItemID), 'I');
  AddDbItemField(fl, 'numlabel_tpl_id', IntToStr(NumLabelTplID), 'I');
  AddDbItemField(fl, 'value', Value, 'S');
  AddDbItemField(fl, 'action', Action, 'S');

  Result:=True;
end;

function TNumLabelData.SetFields(var fl: TDbItemFields): Boolean;
begin
  Result:= inherited SetFields(fl);
  FNumPlanItem:=Project.NumPlanItems.GetItemByID(StrToIntDef(GetDbItemFieldValue(fl, 'numplan_item_id'), 0));
  FNumLabelTpl:=Project.NumLabelsTpl.GetItemByID(StrToIntDef(GetDbItemFieldValue(fl, 'numlabel_tpl_id'), 0));
  Value:=GetDbItemFieldValue(fl, 'value');
  Action:=GetDbItemFieldValue(fl, 'action');
  Result:=True;
end;

// Optimisation for speed (epic fail)
//procedure TNumLabelData.ReadFromDataset(ds: TDataSet);
//var
//  i: Integer;
//begin
//  i:=ds.FieldValues['numplan_item_id'];
//  if (FNumPlanItem = nil) or (FNumPlanItem.ID <> i) then
//  begin
//    FNumPlanItem:=Project.NumPlanItems.GetItemByID(i);
//  end;
//  i:=ds.FieldValues['numlabel_tpl_id'];
//  if (FNumLabelTpl = nil) or (FNumLabelTpl.ID <> i) then
//  begin
//    FNumLabelTpl:=Project.NumLabelsTpl.GetItemByID(i);
//  end;
//  Value:=ds.FieldValues['value'];
//  Action:=ds.FieldValues['action'];
//end;

function TNumLabelData.GetNumPlanItem(): TNumPlanItem;
begin
  if not Assigned(FNumPlanItem) then Read();
  Result:=FNumPlanItem;
end;

function TNumLabelData.GetNumLabelTpl(): TNumLabelTpl;
begin
  if not Assigned(FNumLabelTpl) then Read();
  Result:=FNumLabelTpl;
end;

// === TNumPageTpl ===
constructor TNumPageTpl.Create(AProject: TNumProject);
begin
  inherited Create();
  //Self.TreeNode:=nil;
  Self.Project:=AProject;

  Self.FTickets:=TTicketList.Create(true);
  Self.FTickets.NumProject:=AProject;
  Self.FTickets.NumPageTpl:=Self;

  Self.FNumLabels:=TNumLabelList.Create(true);
  Self.FNumLabels.NumProject:=AProject;
  Self.FNumLabels.NumPageTpl:=Self;
end;

destructor TNumPageTpl.Destroy();
begin
  FreeAndNil(FTickets);
  FreeAndNil(FNumLabels);
end;

function TNumPageTpl.GetTableName(): string;
begin
  Result:=sTableNumPagesTpl;
end;

function TNumPageTpl.GetFields(var fl: TDbItemFields): Boolean;
begin
  inherited GetFields(fl);
  AddDbItemField(fl, 'project_id', IntToStr(Project.ID), 'I');
  AddDbItemField(fl, 'name', Name, 'S');
  AddDbItemField(fl, 'size_x', IntToStr(Size.X), 'I');
  AddDbItemField(fl, 'size_y', IntToStr(Size.Y), 'I');
  Result:=True;
end;

function TNumPageTpl.SetFields(var fl: TDbItemFields): Boolean;
begin
  Result:= inherited SetFields(fl);
  Name:=GetDbItemFieldValue(fl, 'name');
  Size.X:=StrToIntDef(GetDbItemFieldValue(fl, 'size_x'), Size.X);
  Size.Y:=StrToIntDef(GetDbItemFieldValue(fl, 'size_y'), Size.Y);
  Result:=True;
end;

procedure TNumPageTpl.Write(WriteSubitems: Boolean=false);
begin
  inherited Write(WriteSubitems);

  // Write subitems
  if not WriteSubitems then Exit;
  Self.Tickets.SaveToBase();
  Self.NumLabels.SaveToBase();
end;

procedure TNumPageTpl.Read(ReadSubitems: Boolean = False);
begin
  inherited Read(ReadSubitems);

  // Retrieve subitems
  if not ReadSubitems then Exit;
  Self.Tickets.LoadFromBase();
  Self.NumLabels.LoadFromBase();
end;

procedure TNumPageTpl.Delete(DeleteSubitems: Boolean = False);
begin
  inherited Delete(DeleteSubitems);
  if not DeleteSubitems then Exit;
  Self.Tickets.DeleteFromBase();
  //Self.NumLabels.DeleteFromBase();   // !!!
end;

procedure TNumPageTpl.Serialize(var Stream: TItemSerialize);
begin
  inherited Serialize(Stream);
  Tickets.Serialize(Stream);
  NumLabels.Serialize(Stream);
end;

procedure TNumPageTpl.Deserialize(var Stream: TItemSerialize);
begin
  inherited Deserialize(Stream);
  Tickets.Deserialize(Stream);
  NumLabels.Deserialize(Stream);
end;

function TNumPageTpl.GetTickets(): TTicketList;
begin
  Result:=FTickets;
  if not FTickets.ItemsLoaded then FTickets.LoadFromBase();
end;

function TNumPageTpl.GetNumLabels(): TNumLabelList;
begin
  Result:=FNumLabels;
  if not FNumLabels.ItemsLoaded then FNumLabels.LoadFromBase();
end;

function TNumPageTpl.Assign(Item: TDbItem): boolean;
var
  i: Integer;
  t: TTicket;
begin
  Result:=inherited Assign(Item);
  if not Result then Exit;
  self.Tickets.Clear();
  for i:=0 to (Item as TNumPageTpl).Tickets.Count-1 do
  begin
    t:=TTicket.Create(self.Project);
    t.Assign((Item as TNumPageTpl).Tickets[i]);
    self.Tickets.Add(t);
  end;
end;


// === TTicketTpl ===
constructor TTicketTpl.Create(AProject: TNumProject);
begin
  inherited Create();
  //Self.TreeNode:=nil;
  Self.Project:=AProject;
  Self.FNumLabels:=TNumLabelList.Create(false);
  Self.FNumLabels.NumProject:=AProject;
  Self.FNumLabels.TicketTpl:=Self;
end;

destructor TTicketTpl.Destroy();
begin
  FreeAndNil(FNumLabels);
end;

function TTicketTpl.GetTableName(): string;
begin
  Result:=sTableTicketsTpl;
end;

function TTicketTpl.GetFields(var fl: TDbItemFields): Boolean;
begin
  inherited GetFields(fl);
  AddDbItemField(fl, 'project_id', IntToStr(Project.ID), 'I');
  AddDbItemField(fl, 'name', Name, 'S');
  AddDbItemField(fl, 'width', IntToStr(Size.X), 'I');
  AddDbItemField(fl, 'height', IntToStr(Size.Y), 'I');
  Result:=True;
end;

function TTicketTpl.SetFields(var fl: TDbItemFields): Boolean;
begin
  Result:= inherited SetFields(fl);
  Name:=GetDbItemFieldValue(fl, 'name');
  Size.X:=StrToIntDef(GetDbItemFieldValue(fl, 'width'), Size.X);
  Size.Y:=StrToIntDef(GetDbItemFieldValue(fl, 'height'), Size.Y);
  Result:=True;
end;

procedure TTicketTpl.Write(WriteSubitems: Boolean = False);
begin
  inherited Write(WriteSubitems);
  // Write subitems
  if not WriteSubitems then Exit;
  Self.NumLabels.SaveToBase();
end;

procedure TTicketTpl.Read(ReadSubitems: Boolean = False);
begin
  inherited Read(ReadSubitems);
  // Read subitems
  if not ReadSubitems then Exit;
  Self.NumLabels.LoadFromBase();
end;

procedure TTicketTpl.Delete(DeleteSubitems: Boolean = False);
begin
  inherited Delete(DeleteSubitems);
  // Delete subitems
  if not DeleteSubitems then Exit;
  //Self.NumLabels.DeleteFromBase(); // !!!
end;

procedure TTicketTpl.Serialize(var Stream: TItemSerialize);
begin
  inherited Serialize(Stream);
  NumLabels.Serialize(Stream);
end;

procedure TTicketTpl.Deserialize(var Stream: TItemSerialize);
begin
  inherited Deserialize(Stream);
  NumLabels.Deserialize(Stream);
end;

function TTicketTpl.GetNumLabels(): TNumLabelList;
begin
  Result:=FNumLabels;
  if not FNumLabels.ItemsLoaded then FNumLabels.LoadFromBase();
end;

function TTicketTpl.Assign(Item: TDbItem): boolean;
var
  i: Integer;
  nl : TNumLabel;
begin
  Result:=inherited Assign(Item);
  if not Result then Exit;
  self.NumLabels.Clear();
  for i:=0 to (Item as TTicketTpl).NumLabels.Count-1 do
  begin
    nl:=TNumLabel.Create(self.Project);
    //if Self.NumLabels[i].GetFields(fl) then Item.SetFields(fl);
    nl.Assign((Item as TTicketTpl).NumLabels[i]);
    self.NumLabels.Add(nl);
  end;
end;

// === TTicket ===
constructor TTicket.Create(AProject: TNumProject);
begin
  inherited Create();
  //Self.TreeNode:=nil;
  Self.Project:=AProject;
  Self.FTpl:=nil;
  Self.FNumPageTpl:=nil;
end;

destructor TTicket.Destroy();
begin
end;

function TTicket.GetTableName(): string;
begin
  Result:=sTableTickets;
end;

function TTicket.GetFields(var fl: TDbItemFields): Boolean;
var
  TicketTplID: integer;
  NumPageTplID: integer;
begin
  TicketTplID:=0;
  NumPageTplID:=0;

  if Assigned(self.Tpl) then TicketTplID:=self.Tpl.ID;
  if Assigned(self.NumPageTpl) then NumPageTplID:=self.NumPageTpl.ID;

  inherited GetFields(fl);
  AddDbItemField(fl, 'project_id', IntToStr(Project.ID), 'I');
  AddDbItemField(fl, 'page_tpl_id', IntToStr(NumPageTplID), 'I');
  AddDbItemField(fl, 'tpl_id', IntToStr(TicketTplID), 'I');
  AddDbItemField(fl, 'name', Name, 'S');
  AddDbItemField(fl, 'pos_x', IntToStr(Position.X), 'I');
  AddDbItemField(fl, 'pos_y', IntToStr(Position.Y), 'I');
  Result:=True;
end;

function TTicket.SetFields(var fl: TDbItemFields): Boolean;
begin
  ID:=StrToIntDef(GetDbItemFieldValue(fl, 'id'), ID);
  FNumPageTpl:=Project.PagesTpl.GetItemByID(StrToIntDef(GetDbItemFieldValue(fl, 'page_tpl_id'), 0));
  FTpl:=Project.TicketTplList.GetItemByID(StrToIntDef(GetDbItemFieldValue(fl, 'tpl_id'), 0));
  Name:=GetDbItemFieldValue(fl, 'name');
  Position.X:=StrToIntDef(GetDbItemFieldValue(fl, 'pos_x'), Position.X);
  Position.Y:=StrToIntDef(GetDbItemFieldValue(fl, 'pos_y'), Position.Y);
  Result:=True;
end;

procedure TTicket.Read(ReadSubitems: Boolean = False);
begin
  if ID=0 then Exit;
  if not Project.PagesTpl.ItemsLoaded then Project.PagesTpl.LoadFromBase();
  if not Project.TicketTplList.ItemsLoaded then Project.TicketTplList.LoadFromBase();
  inherited Read(ReadSubitems);
end;

function TTicket.GetTpl(): TTicketTpl;
begin
  if not Assigned(FTpl) then Read();
  Result:=FTpl;
end;

function TTicket.GetNumPageTpl(): TNumPageTpl;
begin
  if not Assigned(FNumPageTpl) then Read();
  Result:=FNumPageTpl;
end;

// === TNumPage ===
constructor TNumPage.Create(AProject: TNumProject);
begin
  inherited Create();
  //Self.TreeNode:=nil;
  Self.Project:=AProject;
end;

destructor TNumPage.Destroy();
begin
end;

function TNumPage.GetTableName(): string;
begin
  Result:=sTableNumPages;
end;

function TNumPage.GetFields(var fl: TDbItemFields): Boolean;
var
  NumPageTplID: integer;
begin
  NumPageTplID:=0;
  if Assigned(NumPageTpl) then NumPageTplID:=NumPageTpl.ID;

  inherited GetFields(fl);
  AddDbItemField(fl, 'project_id', IntToStr(Project.ID), 'I');
  AddDbItemField(fl, 'page_tpl_id', IntToStr(NumPageTplID), 'I');
  AddDbItemField(fl, 'num_order', IntToStr(Order), 'I');
  AddDbItemField(fl, 'state', State, 'S');
  Result:=True;
end;

function TNumPage.SetFields(var fl: TDbItemFields): Boolean;
begin
  Result:=inherited SetFields(fl);
  FNumPageTpl:=Project.PagesTpl.GetItemByID(StrToIntDef(GetDbItemFieldValue(fl, 'page_tpl_id'), 0));
  Order:=StrToIntDef(GetDbItemFieldValue(fl, 'num_order'), Order);
  State:=GetDbItemFieldValue(fl, 'state');
  Result:=True;
end;

procedure TNumPage.Read(ReadSubitems: Boolean = False);
var
  SQL: string;
begin
  if ID=0 then Exit;
  if not Project.PagesTpl.ItemsLoaded then Project.PagesTpl.LoadFromBase();
  inherited Read(ReadSubitems);
end;

function TNumPage.GetNumPageTpl(): TNumPageTpl;
begin
  if not Assigned(FNumPageTpl) then Read();
  Result:=FNumPageTpl;
end;

// === TNumPlanItem ===
constructor TNumPlanItem.Create(AProject: TNumProject);
begin
  inherited Create();
  //Self.TreeNode:=nil;
  Self.Project:=AProject;
  self.FNumLabelDataList:=TNumLabelDataList.Create(true);
  self.FNumLabelDataList.NumProject:=AProject;
  self.FNumLabelDataList.NumPlanItem:=Self;
end;

destructor TNumPlanItem.Destroy();
begin
  FreeAndNil(FNumLabelDataList);
end;

function TNumPlanItem.GetTableName(): string;
begin
  Result:=sTableNumPlanItems;
end;

function TNumPlanItem.GetFields(var fl: TDbItemFields): Boolean;
var
  TicketTplID: integer;
  NumPageTplID: integer;
begin
  TicketTplID:=0;
  NumPageTplID:=0;

  if Assigned(Ticket) then TicketTplID:=Ticket.ID;
  if Assigned(NumPage) then NumPageTplID:=NumPage.ID;

  inherited GetFields(fl);
  AddDbItemField(fl, 'project_id', IntToStr(Project.ID), 'I');
  AddDbItemField(fl, 'ticket_id', IntToStr(TicketTplID), 'I');
  AddDbItemField(fl, 'page_id', IntToStr(NumPageTplID), 'I');
  AddDbItemField(fl, 'num_order', IntToStr(Order), 'I');
  AddDbItemField(fl, 'state', State, 'S');
  Result:=True;
end;

function TNumPlanItem.SetFields(var fl: TDbItemFields): Boolean;
begin
  Result:=inherited SetFields(fl);
  Ticket:=Project.Tickets.GetItemByID(StrToIntDef(GetDbItemFieldValue(fl, 'ticket_id'), 0));
  NumPage:=Project.Pages.GetItemByID(StrToIntDef(GetDbItemFieldValue(fl, 'page_id'), 0));
  Order:=StrToIntDef(GetDbItemFieldValue(fl, 'num_order'), Order);
  State:=GetDbItemFieldValue(fl, 'state');
  Result:=True;
end;

procedure TNumPlanItem.Write(WriteSubitems: Boolean = False);
var
  sl: TStringList;
begin
  inherited Write(WriteSubitems);
  // Write subitems
  if not WriteSubitems then Exit;
  Self.NumLabelDataList.SaveToBase();
end;

procedure TNumPlanItem.Read(ReadSubitems: Boolean = False);
var
  SQL: string;
begin
  if ID=0 then Exit;
  if not Project.Tickets.ItemsLoaded then Project.Tickets.LoadFromBase();
  if not Project.Pages.ItemsLoaded then Project.Pages.LoadFromBase();
  inherited Read(ReadSubitems);

  // Retrieve subitems
  if not ReadSubitems then Exit;
  Self.NumLabelDataList.LoadFromBase();
end;

procedure TNumPlanItem.Delete(DeleteSubitems: Boolean = False);
begin
  inherited Delete(DeleteSubitems);
  if not DeleteSubitems then Exit;
  Self.NumLabelDataList.DeleteFromBase();
end;

procedure TNumPlanItem.Serialize(var Stream: TItemSerialize);
begin
  inherited Serialize(Stream);
  NumLabelDataList.Serialize(Stream);
end;

procedure TNumPlanItem.Deserialize(var Stream: TItemSerialize);
begin
  inherited Deserialize(Stream);
  NumLabelDataList.Deserialize(Stream);
end;

function TNumPlanItem.GetTicket(): TTicket;
begin
  if not Assigned(FTicket) then Read();
  Result:=FTicket;
end;

function TNumPlanItem.GetNumPage(): TNumPage;
begin
  if not Assigned(FNumPage) then Read();
  Result:=FNumPage;
end;

function TNumPlanItem.GetNumLabelDataList(): TNumLabelDataList;
begin
  Result:=FNumLabelDataList;
  if not FNumLabelDataList.ItemsLoaded then FNumLabelDataList.LoadFromBase();
end;

function TNumPlanItem.GetDataValue(const AName: string): string;
var
  i: Integer;
begin
  for i:=0 to NumLabelDataList.Count-1 do
  begin
    if AnsiSameText(NumLabelDataList[i].NumLabelTpl.Name, AName) then
    begin
      Result:=NumLabelDataList[i].Value;
      Exit;
    end;
  end;
  Result:='';
end;

procedure TNumPlanItem.SetDataValue(const AName, AValue: string);
var
  i: Integer;
begin
  for i:=0 to NumLabelDataList.Count-1 do
  begin
    if AnsiSameText(NumLabelDataList[i].NumLabelTpl.Name, AName) then
    begin
      NumLabelDataList[i].Value:=AValue;
      Exit;
    end;
  end;
end;

// === THallItem ===
constructor THallItem.Create(AProject: TNumProject);
begin
  inherited Create();
  //Self.TreeNode:=nil;
  Self.Project:=AProject;
end;

destructor THallItem.Destroy();
begin
end;

function THallItem.GetTableName(): string;
begin
  Result:=sTableHallItems;
end;

function THallItem.GetFields(var fl: TDbItemFields): Boolean;
var
  NumPlanItemID: integer;
begin
  NumPlanItemID:=0;
  if Assigned(NumPlanItem) then NumPlanItemID:=NumPlanItem.ID;

  inherited GetFields(fl);
  AddDbItemField(fl, 'project_id', IntToStr(Project.ID), 'I');
  AddDbItemField(fl, 'numplan_item_id', IntToStr(NumPlanItemID), 'I');
  AddDbItemField(fl, 'pos_x', IntToStr(Position.X), 'I');
  AddDbItemField(fl, 'pos_y', IntToStr(Position.Y), 'I');
  AddDbItemField(fl, 'color', IntToStr(Color), 'I');
  AddDbItemField(fl, 'n_row', IntToStr(Row), 'I');
  AddDbItemField(fl, 'n_place', IntToStr(Place), 'I');
  AddDbItemField(fl, 'n_sector', IntToStr(Sector), 'I');
  AddDbItemField(fl, 'state', State, 'S');
  AddDbItemField(fl, 'kind', Kind, 'S');
  AddDbItemField(fl, 'param_text', ParamsText, 'S');
  Result:=True;
end;

function THallItem.SetFields(var fl: TDbItemFields): Boolean;
var
  s: string;
begin
  ID:=StrToIntDef(GetDbItemFieldValue(fl, 'id'), ID);
  FNumPlanItem:=Project.NumPlanItems.GetItemByID(StrToIntDef(GetDbItemFieldValue(fl, 'numplan_item_id'), 0));
  Position.X:=StrToIntDef(GetDbItemFieldValue(fl, 'pos_x'), Position.X);
  Position.Y:=StrToIntDef(GetDbItemFieldValue(fl, 'pos_y'), Position.Y);
  Color:=StrToIntDef(GetDbItemFieldValue(fl, 'color'), Color);
  Row:=StrToIntDef(GetDbItemFieldValue(fl, 'n_row'), Row);
  Place:=StrToIntDef(GetDbItemFieldValue(fl, 'n_place'), Place);
  Sector:=StrToIntDef(GetDbItemFieldValue(fl, 'n_sector'), Sector);
  State:=GetDbItemFieldValue(fl, 'state');
  s:=GetDbItemFieldValue(fl, 'kind');
  if Length(s)>0 then Kind:=s[1];
  ParamsText:=GetDbItemFieldValue(fl, 'param_text');
  Result:=True;
end;

procedure THallItem.Read(ReadSubitems: Boolean = False);
begin
  if ID=0 then Exit;
  if not Project.NumPlanItems.ItemsLoaded then Project.NumPlanItems.LoadFromBase();
  inherited Read(ReadSubitems);
end;

function THallItem.GetNumPlanItem(): TNumPlanItem;
begin
  if not Assigned(FNumPlanItem) then Read();
  Result:=FNumPlanItem;
end;

// === TProjectOption ===
constructor TProjectOption.Create(AProject: TNumProject);
begin
  inherited Create();
  Self.Project:=AProject;
end;

function TProjectOption.GetTableName(): string;
begin
  Result:=sTableProjectOptions;
end;

function TProjectOption.GetFields(var fl: TDbItemFields): Boolean;
begin
  inherited GetFields(fl);
  AddDbItemField(fl, 'project_id', IntToStr(Project.ID), 'I');  // *
  AddDbItemField(fl, 'name', Name, 'S');
  AddDbItemField(fl, 'value', Value, 'S');

  Result:=True;
end;

function TProjectOption.SetFields(var fl: TDbItemFields): Boolean;
begin
  Result:= inherited SetFields(fl);
  Name:=GetDbItemFieldValue(fl, 'name');
  Value:=GetDbItemFieldValue(fl, 'value');
  Result:=True;
end;

// === TNumProject ===
constructor TNumProject.Create();
begin
  inherited Create();
  Self.TreeNode:=nil;
  self.Loaded:=false;

  self.FPages:=TNumPageList.Create(self, true);
  self.FPages.NumProject:=Self;

  self.FPagesTpl:=TNumPageTplList.Create(self, true);
  self.FPagesTpl.NumProject:=Self;

  self.FTickets:=TTicketList.Create(true);
  self.FTickets.NumProject:=Self;

  self.FTicketTplList:=TTicketTplList.Create();
  self.FTicketTplList.NumProject:=Self;

  //self.FNumLabels:=TNumLabelList.Create(true);
  //self.FNumLabels.NumProject:=Self;

  self.FNumLabelsTpl:=TNumLabelTplList.Create(true);
  self.FNumLabelsTpl.NumProject:=Self;

  self.FNumPlanItems:=TNumPlan.Create(true);
  self.FNumPlanItems.NumProject:=Self;

  self.FHallPlan:=THallPlan.Create(true);
  self.FHallPlan.NumProject:=Self;

  self.FOptions:=TProjectOptionList.Create(true);
  self.FOptions.NumProject:=Self;
end;

destructor TNumProject.Destroy();
begin
  FreeAndNil(FOptions);
  FreeAndNil(FHallPlan);
  FreeAndNil(FNumPlanItems);
  FreeAndNil(FNumLabelsTpl);
  //FreeAndNil(FNumLabels);
  FreeAndNil(FTicketTplList);
  FreeAndNil(FTickets);
  FreeAndNil(FPagesTpl);
  FreeAndNil(FPages);
end;

function TNumProject.GetTableName(): string;
begin
  Result:=sTableProjects;
end;

function TNumProject.GetFields(var fl: TDbItemFields): Boolean;
begin
  inherited GetFields(fl);
  AddDbItemField(fl, 'parent_id', IntToStr(ParentID), 'I');
  AddDbItemField(fl, 'name', Name, 'S');
  AddDbItemField(fl, 'desc', Desc, 'S');
  Result:=True;
end;

function TNumProject.SetFields(var fl: TDbItemFields): Boolean;
begin
  Result:=inherited SetFields(fl);
  Name:=GetDbItemFieldValue(fl, 'name');
  Desc:=GetDbItemFieldValue(fl, 'desc');
  ParentID:=StrToIntDef(GetDbItemFieldValue(fl, 'parent_id'), ParentID);
  Result:=True;
end;

procedure TNumProject.Write(WriteSubitems: Boolean = False);
begin
  inherited Write(WriteSubitems);
  // Write subitems
  if not WriteSubitems then Exit;
  StartTransaction();
  Self.NumLabelsTpl.SaveToBase();
  Self.TicketTplList.SaveToBase();
  Self.PagesTpl.SaveToBase();
  Self.Tickets.SaveToBase();
  Self.Pages.SaveToBase();
  Self.NumPlanItems.SaveToBase();
  Self.HallPlan.SaveToBase();
  CloseTransaction();
end;

procedure TNumProject.Read(ReadSubitems: Boolean = False);
begin
  if ID=0 then Exit;
  inherited Read(ReadSubitems);
  // Retrieve subitems
  if not ReadSubitems then Exit;
  StartTransaction();
  Self.NumLabelsTpl.LoadFromBase();
  Self.TicketTplList.LoadFromBase();
  Self.PagesTpl.LoadFromBase();
  Self.Tickets.LoadFromBase();
  Self.Pages.LoadFromBase();
  Self.NumPlanItems.LoadFromBase();
  Self.HallPlan.LoadFromBase();
  CloseTransaction();
end;

procedure TNumProject.Delete(DeleteSubitems: Boolean = False);
begin
  inherited Delete(DeleteSubitems);
  // Delete subitems
  if not DeleteSubitems then Exit;
  StartTransaction();
  Self.HallPlan.DeleteFromBase();
  Self.NumPlanItems.DeleteFromBase();
  Self.Tickets.DeleteFromBase();
  Self.Pages.DeleteFromBase();
  Self.PagesTpl.DeleteFromBase();
  Self.TicketTplList.DeleteFromBase();
  Self.NumLabelsTpl.DeleteFromBase();
  CloseTransaction();
end;

procedure TNumProject.Serialize(var Stream: TItemSerialize);
begin
  StartTransaction();
  Stream.StartItem(GetTableName());
  inherited Serialize(Stream);
  NumLabelsTpl.Serialize(Stream);
  TicketTplList.Serialize(Stream);
  PagesTpl.Serialize(Stream);
  Pages.Serialize(Stream);
  NumPlanItems.Serialize(Stream);
  HallPlan.Serialize(Stream);
  Stream.CloseItem(GetTableName());
  CloseTransaction();
end;

procedure TNumProject.Deserialize(var Stream: TItemSerialize);
var
  ItemName: string;
  TempID: Integer;
  TempItem: TDbItem;
begin
  StartTransaction();
  //Stream.SetTag(GetTableName());
  while Stream.GetItem do
  begin
    ItemName:=Stream.GetItemName();
    TempID:=StrToIntDef(Stream.GetAttrValue('id'), 0);
    if ItemName = PagesTpl.ClassName then
    begin
      TempItem:=PagesTpl.GetItemByID(TempID);
      if not Assigned(TempItem) then TempItem:=PagesTpl.CreateItem();
      TempItem.Deserialize(Stream);
    end;
  end;
  inherited Deserialize(Stream);
  PagesTpl.Deserialize(Stream);
  Pages.Deserialize(Stream);
  Tickets.Deserialize(Stream);
  TicketTplList.Deserialize(Stream);
  NumLabelsTpl.Deserialize(Stream);
  HallPlan.Deserialize(Stream);
  NumPlanItems.Deserialize(Stream);
  CloseTransaction();
end;

function TNumProject.GetPagesTpl(): TNumPageTplList;
begin
  Result:=FPagesTpl;
  if not FPagesTpl.ItemsLoaded then FPagesTpl.LoadFromBase();
end;

function TNumProject.GetPages(): TNumPageList;
begin
  Result:=FPages;
  if not FPages.ItemsLoaded then FPages.LoadFromBase();
end;

function TNumProject.GetTickets(): TTicketList;
begin
  Result:=FTickets;
  if not FTickets.ItemsLoaded then FTickets.LoadFromBase();
end;

function TNumProject.GetTicketTplList(): TTicketTplList;
begin
  Result:=FTicketTplList;
  if not FTicketTplList.ItemsLoaded then FTicketTplList.LoadFromBase();
end;

function TNumProject.GetNumLabelsTpl(): TNumLabelTplList;
begin
  Result:=FNumLabelsTpl;
  if not FNumLabelsTpl.ItemsLoaded then FNumLabelsTpl.LoadFromBase();
end;

function TNumProject.GetHallPlan(): THallPlan;
begin
  Result:=FHallPlan;
  if not FHallPlan.ItemsLoaded then FHallPlan.LoadFromBase();
end;

function TNumProject.GetNumPlanItems(): TNumPlan;
begin
  Result:=FNumPlanItems;
  if not FNumPlanItems.ItemsLoaded then FNumPlanItems.LoadFromBase();
end;

function TNumProject.GetOptions(): TProjectOptionList;
begin
  Result:=FOptions;
  if not FOptions.ItemsLoaded then FOptions.LoadFromBase();
end;


// === TDbItemsList ===
function TDbItemsList.CreateItem(): TDbItem;
begin
  Result:=TDbItem.Create();
end;

function TDbItemsList.AGetItemByID(ItemID: integer): TDbItem;
var
  i: Integer;
begin
  Result:=nil;
  //if not ItemsLoaded then LoadFromBase();
  for i:=0 to Count-1 do
  begin
    if (Items[i] as TDbItem).ID = ItemID then
    begin
      Result:=TDbItem(Items[i]);
      Exit;
    end;
  end;
end;

procedure TDbItemsList.SaveToBase();
var
  i: Integer;
  DoTransaction: Boolean;
begin
  DoTransaction:=False;
  if not TransactionActive then
  begin
    DoTransaction:=True;
    StartTransaction();
  end;

  for i:=0 to Self.Count-1 do
  begin
    (Items[i] as TDbItem).Write();
  end;

  if DoTransaction then
  begin
    DoTransaction:=False;
    CloseTransaction();
  end;
end;

//function TDbItemsList.LoadFromBase(): Boolean;
//var
//  np: TDbItem;
//  ds: TDataSet;
//begin
//  //Self.Clear();
//  Result:=False;
//  DataModule1.Query1.SQL.Text:=SQL_Load;
//  try
//    DataModule1.Query1.ExecSQL();
//  except
//    Exit;
//  end;
//  ds:=DataModule1.Query1;
//
//  ItemsLoaded:=True;
//  ds.First();
//  while not ds.Eof do
//  begin
//    np:=self.AGetItemByID(ds.FieldValues['id']);
//    if not Assigned(np) then
//    begin
//      np:=CreateItem();
//      np.ID:=ds.FieldValues['id'];
//      self.Add(np);
//    end;
//    np.ReadFromDataset(ds);
//    ds.Next();
//  end;
//  Result:=True;
//end;

function TDbItemsList.LoadFromBase(): Boolean;
var
  np: TDbItem;
  ds: IMkSqlStmt;
  i: Integer;
begin
  //Self.Clear();
  Result:=False;
  //DataModule1.Query1.SQL.Text:=SQL_Load;
  {$IFDEF DEBUG_SQL}
  DebugMsg(SQL_Load, 'SQL');
  {$ENDIF}
  try
    ds:=db.exec(SQL_Load);
  except
    Exit;
  end;
  //ds:=DataModule1.Query1;

  ItemsLoaded:=True;
  ds.First();
  while not ds.Eof do
  begin
    //i:=ds.FieldValues['id'];
    i:=ds.valueof['id'];
    np:=self.AGetItemByID(i);
    if not Assigned(np) then
    begin
      np:=CreateItem();
      np.ID:=i;
      self.Add(np);
    end;
    //np.ReadFromDataset(ds);
    np.ReadFromDatasetMk(ds);
    ds.Next();
  end;
  Result:=True;
end;

procedure TDbItemsList.DeleteFromBase(DeleteSubitems: Boolean = False);
var
  i, n: Integer;
  DoTransaction: Boolean;
  SQL, s, sTableName: string;

procedure DelSQL();
begin
  s:=Copy(s, 1, Length(s)-1);
  SQL:='DELETE FROM "'+sTableName+'" WHERE id IN ('+s+');';
  {$IFDEF DEBUG_SQL}
  DebugMsg(SQL, 'SQL');
  {$ENDIF}
  db.execCmd(SQL);
  SQL:='';
end;

begin
  DoTransaction:=False;
  if not TransactionActive then
  begin
    DoTransaction:=True;
    StartTransaction();
  end;

  if Length(SQL_Delete)>0 then
  begin
    {$IFDEF DEBUG_SQL}
    DebugMsg(SQL_Delete, 'SQL');
    {$ENDIF}
    db.execCmd(SQL_Delete);
  end
  else
  begin
    s:='';
    n:=Self.Count-1;
    for i:=n downto 0 do
    begin
      //(Items[i] as TDbItem).Delete(DeleteSubitems);
      s:=s+IntToStr((Items[i] as TDbItem).ID)+',';
      if i=n then sTableName:=(Items[i] as TDbItem).GetTableName();
      Delete(i);
      if Length(s)>1024 then DelSQL();
    end;
    if Length(s)>0 then DelSQL();
  end;

  if DoTransaction then
  begin
    DoTransaction:=False;
    CloseTransaction();
  end;
  self.Clear();
end;

procedure TDbItemsList.Serialize(var Stream: TItemSerialize);
var
  i: Integer;
  sName: string;
begin
  sName := self.ClassName;
  Stream.StartItem(sName);
  for i:=0 to Self.Count-1 do
  begin
    Stream.StartItem((Self[i] as TDbItem).GetTableName());
    (Self[i] as TDbItem).Serialize(Stream);
    Stream.CloseItem((Self[i] as TDbItem).GetTableName());
  end;
  Stream.CloseItem(sName);
end;

procedure TDbItemsList.Deserialize(var Stream: TItemSerialize);
var
  ItemName: string;
  TempID: Integer;
  TempItem: TDbItem;
begin
  while Stream.GetItem() do
  begin
    ItemName:=Stream.GetItemName();
    TempID:=StrToIntDef(Stream.GetAttrValue('id'), 0);
    if ItemName = self.ClassName then
    begin
      TempItem:=self.AGetItemByID(TempID);
      if not Assigned(TempItem) then TempItem:=self.CreateItem();
      TempItem.Deserialize(Stream);
    end
    else Exit;
  end;
end;

// === TNumProjectList ===
function TNumProjectList.GetItem(Index: Integer): TNumProject;
begin
  Result:=TNumProject(inherited Items[index]);
end;

procedure TNumProjectList.SetItem(Index: Integer; Value: TNumProject);
begin
  inherited Items[Index]:=Value;
end;

function TNumProjectList.GetProjectByID(ProjectID: integer): TNumProject;
begin
  Result:=TNumProject(AGetItemByID(ProjectID));
end;

function TNumProjectList.CreateItem(): TDbItem;
begin
  Result:=TNumProject.Create();
end;

procedure TNumProjectList.SaveToFile(Filename: string);
var
  sl: TStringList;
  i: Integer;
begin
  if Count=0 then Exit;
  sl:=TStringList.Create();
  for i:=0 to Count-1 do
  begin
    //sl.Add(Items[i].ToString);
  end;
  sl.SaveToFile(Filename);
  sl.Free();
end;

function TNumProjectList.LoadFromFile(Filename: string): Boolean;
var
  sl: TStringList;
  i: Integer;
begin
  Result:=false;
  Self.Clear();
  if not FileExists(Filename) then Exit;
  sl:=TStringList.Create();
  try
    sl.LoadFromFile(Filename);
  except
    sl.Free();
    Exit;
  end;

  for i:=0 to sl.Count-1 do
  begin
    //np:=TNumProject.Create();
    //if np.FromString(sl[i]) then self.Add(li);
  end;
  sl.Free();
  Result:=True;
end;

function TNumProjectList.LoadFromBase(): Boolean;
begin
  self.SQL_Load:='SELECT * FROM '+sTableProjects+';';
  Result:=inherited LoadFromBase();
end;

// === TTicketTplList ===
function TTicketTplList.GetItem(Index: Integer): TTicketTpl;
begin
  Result:=TTicketTpl(inherited Items[index]);
end;

procedure TTicketTplList.SetItem(Index: Integer; Value: TTicketTpl);
begin
  inherited Items[Index]:=Value;
end;

function TTicketTplList.GetItemByID(ItemID: integer): TTicketTpl;
begin
  Result:=TTicketTpl(AGetItemByID(ItemID));
end;

function TTicketTplList.CreateItem(): TDbItem;
begin
  Result:=TTicketTpl.Create(self.NumProject);
end;

function TTicketTplList.LoadFromBase(): Boolean;
begin
  self.SQL_Load:='SELECT * FROM '+sTableTicketsTpl+' WHERE project_id='+IntToStr(NumProject.ID)+';';
  Result:=inherited LoadFromBase();
end;

// === TTicketlList ===
function TTicketList.GetItem(Index: Integer): TTicket;
begin
  Result:=TTicket(inherited Items[index]);
end;

procedure TTicketList.SetItem(Index: Integer; Value: TTicket);
begin
  inherited Items[Index]:=Value;
end;

function TTicketList.GetItemByID(ItemID: integer): TTicket;
begin
  Result:=TTicket(AGetItemByID(ItemID));
end;

function TTicketList.CreateItem(): TDbItem;
begin
  Result:=TTicket.Create(self.NumProject);
  (Result as TTicket).NumPageTpl:=Self.NumPageTPL;
end;

function TTicketList.LoadFromBase(): Boolean;
begin
  if Assigned(self.NumPageTPL) then
  begin
    SQL_Load:='SELECT * FROM '+sTableTickets+' WHERE project_id='+IntToStr(NumProject.ID)
    +' AND page_tpl_id='+IntToStr(NumPageTPL.ID)+';';
  end
  else
  begin
    SQL_Load:='SELECT * FROM '+sTableTickets+' WHERE project_id='+IntToStr(NumProject.ID)+';';
  end;
  //if not NumProject.PagesTpl.ItemsLoaded then NumProject.PagesTpl.LoadFromBase();
  //if not NumProject.TicketTplList.ItemsLoaded then NumProject.TicketTplList.LoadFromBase();
  Result:=inherited LoadFromBase();
end;

// === TNumPageTplList ===
constructor TNumPageTplList.Create(AProject: TNumProject; OwnsItems: Boolean=true);
begin
  inherited Create(OwnsItems);
  Self.NumProject:=AProject;
end;

function TNumPageTplList.GetItem(Index: Integer): TNumPageTpl;
begin
  Result:=TNumPageTpl(inherited Items[index]);
end;

procedure TNumPageTplList.SetItem(Index: Integer; Value: TNumPageTpl);
begin
  inherited Items[Index]:=Value;
end;

function TNumPageTplList.GetItemByID(ItemID: integer): TNumPageTpl;
begin
  Result:=TNumPageTpl(AGetItemByID(ItemID));
end;

function TNumPageTplList.CreateItem(): TDbItem;
begin
  Result:=TNumPageTpl.Create(self.NumProject);
end;

function TNumPageTplList.LoadFromBase(): Boolean;
begin
  self.SQL_Load:='SELECT * FROM '+sTableNumPagesTpl+' WHERE project_id='+IntToStr(NumProject.ID)+';';
  Result:=inherited LoadFromBase();
end;

// === TNumPageList ===
constructor TNumPageList.Create(AProject: TNumProject; OwnsItems: Boolean=true);
begin
  inherited Create(OwnsItems);
  Self.NumProject:=AProject;
end;

function TNumPageList.GetItem(Index: Integer): TNumPage;
begin
  Result:=TNumPage(inherited Items[index]);
end;

procedure TNumPageList.SetItem(Index: Integer; Value: TNumPage);
begin
  inherited Items[Index]:=Value;
end;

function TNumPageList.GetItemByID(ItemID: integer): TNumPage;
begin
  Result:=TNumPage(AGetItemByID(ItemID));
end;

function TNumPageList.CreateItem(): TDbItem;
begin
  Result:=TNumPage.Create(self.NumProject);
end;

function TNumPageList.LoadFromBase(): Boolean;
begin
  self.SQL_Load:='SELECT * FROM '+sTableNumPages+' WHERE project_id='+IntToStr(NumProject.ID)+';';
  if not NumProject.PagesTpl.ItemsLoaded then NumProject.PagesTpl.LoadFromBase();
  Result:=inherited LoadFromBase();
end;

procedure TNumPageList.DeleteFromBase(DeleteSubitems: Boolean = False);
begin
  if not Assigned(NumProject) then Exit;
  self.SQL_Delete:='DELETE FROM '+sTableNumPages+' WHERE project_id='+IntToStr(NumProject.ID)+';';
  inherited DeleteFromBase(DeleteSubitems);
end;

function NumPageListCompareFunction(Item1, Item2: Pointer): Integer;
begin
  Result:=TNumPage(Item1).Order-TNumPage(Item2).Order;
end;

procedure TNumPageList.SortByOrder();
begin
  Sort(@NumPageListCompareFunction);
end;


// === TNumLabelTplList ===
function TNumLabelTplList.GetItem(Index: Integer): TNumLabelTpl;
begin
  Result:=TNumLabelTpl(inherited Items[index]);
end;

procedure TNumLabelTplList.SetItem(Index: Integer; Value: TNumLabelTpl);
begin
  inherited Items[Index]:=Value;
end;

function TNumLabelTplList.GetItemByID(ItemID: integer): TNumLabelTpl;
begin
  Result:=TNumLabelTpl(AGetItemByID(ItemID));
end;

function TNumLabelTplList.CreateItem(): TDbItem;
begin
  Result:=TNumLabelTpl.Create(Self.NumProject);
end;

function TNumLabelTplList.LoadFromBase(): Boolean;
begin
  //Self.Clear();
  Result:=False;
  if not Assigned(NumProject) then Exit;
  self.SQL_Load:='SELECT * FROM '+sTableNumLabelTpl+' WHERE project_id='+IntToStr(NumProject.ID)+';';
  Result:=inherited LoadFromBase();
end;

// === TNumLabelList ===
function TNumLabelList.GetItem(Index: Integer): TNumLabel;
begin
  Result:=TNumLabel(inherited Items[index]);
end;

procedure TNumLabelList.SetItem(Index: Integer; Value: TNumLabel);
begin
  inherited Items[Index]:=Value;
end;

function TNumLabelList.GetItemByID(ItemID: integer): TNumLabel;
begin
  Result:=TNumLabel(AGetItemByID(ItemID));
end;

function TNumLabelList.CreateItem(): TDbItem;
begin
  Result:=TNumLabel.Create(Self.NumProject);
  (Result as TNumLabel).TicketTpl:=Self.TicketTpl;
end;

function TNumLabelList.LoadFromBase(): Boolean;
begin
  //Self.Clear();
  Result:=False;
  if not Assigned(NumProject) then Exit;
  if Assigned(TicketTpl) then
  begin
    self.SQL_Load:='SELECT * FROM '+sTableNumLabels+' WHERE ticket_tpl_id='+IntToStr(TicketTpl.ID)+';';
  end
  else if Assigned(NumPageTpl) then
  begin
    self.SQL_Load:='SELECT * FROM '+sTableNumLabels+' WHERE numpage_tpl_id='+IntToStr(NumPageTpl.ID)+';';
  end
  else
  begin
    self.SQL_Load:='SELECT * FROM '+sTableNumLabels+' WHERE project_id='+IntToStr(NumProject.ID)+';';
  end;
  Result:=inherited LoadFromBase();
end;

procedure TNumLabelList.DeleteFromBase(DeleteSubitems: Boolean = False);
begin
  if not Assigned(NumProject) then Exit;
  if Assigned(TicketTpl) then
  begin
    self.SQL_Delete:='DELETE FROM '+sTableNumLabels+' WHERE ticket_tpl_id='+IntToStr(TicketTpl.ID)+';';
  end
  else if Assigned(NumPageTpl) then
  begin
    self.SQL_Delete:='DELETE FROM '+sTableNumLabels+' WHERE numpage_tpl_id='+IntToStr(NumPageTpl.ID)+';';
  end
  else
  begin
    self.SQL_Delete:='DELETE FROM '+sTableNumLabels+' WHERE project_id='+IntToStr(NumProject.ID)+';';
  end;
  inherited DeleteFromBase(DeleteSubitems);
end;

// === TNumLabelDataList ===
function TNumLabelDataList.GetItem(Index: Integer): TNumLabelData;
begin
  Result:=TNumLabelData(inherited Items[index]);
end;

procedure TNumLabelDataList.SetItem(Index: Integer; Value: TNumLabelData);
begin
  inherited Items[Index]:=Value;
end;

function TNumLabelDataList.GetItemByID(ItemID: integer): TNumLabelData;
begin
  Result:=TNumLabelData(AGetItemByID(ItemID));
end;

function TNumLabelDataList.CreateItem(): TDbItem;
begin
  Result:=TNumLabelData.Create(Self.NumProject);
  (Result as TNumLabelData).NumPlanItem:=Self.NumPlanItem;
end;

function TNumLabelDataList.LoadFromBase(): Boolean;
begin
  //Self.Clear();
  Result:=False;
  if not Assigned(NumProject) then Exit;
  if Assigned(NumPlanItem) then
  begin
    self.SQL_Load:='SELECT * FROM '+sTableNumLabelData+' WHERE numplan_item_id='+IntToStr(NumPlanItem.ID)+';';
  end
  else
  begin
    self.SQL_Load:='SELECT * FROM '+sTableNumLabelData+' WHERE project_id='+IntToStr(NumProject.ID)+';';
  end;
  //if not NumProject.NumPlanItems.ItemsLoaded then NumProject.NumPlanItems.LoadFromBase();
  //if not NumProject.NumLabelsTpl.ItemsLoaded then NumProject.NumLabelsTpl.LoadFromBase();
  Result:=inherited LoadFromBase();

end;

procedure TNumLabelDataList.DeleteFromBase(DeleteSubitems: Boolean = False);
begin
  if not Assigned(NumProject) then Exit;
  if Assigned(NumPlanItem) then
  begin
    self.SQL_Delete:='DELETE FROM '+sTableNumLabelData+' WHERE numplan_item_id='+IntToStr(NumPlanItem.ID)+';';
  end
  else
  begin
    self.SQL_Delete:='DELETE FROM '+sTableNumLabelData+' WHERE project_id='+IntToStr(NumProject.ID)+';';
  end;
  inherited DeleteFromBase(DeleteSubitems);
end;

// === TNumPlan ===
function TNumPlan.GetItem(Index: Integer): TNumPlanItem;
begin
  Result:=TNumPlanItem(inherited Items[index]);
end;

procedure TNumPlan.SetItem(Index: Integer; Value: TNumPlanItem);
begin
  inherited Items[Index]:=Value;
end;

function TNumPlan.GetItemByID(ItemID: integer): TNumPlanItem;
begin
  Result:=TNumPlanItem(AGetItemByID(ItemID));
end;

function TNumPlan.CreateItem(): TDbItem;
begin
  Result:=TNumPlanItem.Create(self.NumProject);
end;

{procedure TNumPlan.SaveToBase(SaveSubitems: Boolean = false);
var
  i: Integer;
begin
  DataModule1.Query1.StartTransaction();
  for i:=0 to Self.Count-1 do
  begin
    (Items[i] as TDbItem).Write(SaveSubitems);
  end;
  DataModule1.Query1.Commit();
end;}

function TNumPlan.LoadFromBase(): Boolean;
var
  ds: IMkSqlStmt;
  StrSQL: string;
  i: Integer;
  NumPlanItem: TNumPlanItem;
begin
  Result:=False;
  if not Assigned(NumProject) then Exit;
  {$IFDEF DEBUG}
  DT:=Now();
  {$ENDIF}
  self.SQL_Load:='SELECT * FROM '+sTableNumPlanItems+' WHERE project_id='+IntToStr(NumProject.ID)+' ORDER BY num_order;';
  //if not NumProject.Tickets.ItemsLoaded then NumProject.Tickets.LoadFromBase();
  //if not NumProject.Pages.ItemsLoaded then NumProject.Pages.LoadFromBase();
  Result:=inherited LoadFromBase();

  {$IFDEF DEBUG}
  DebugMsg('Loaded '+IntToStr(Count)+' items in '+IntToStr(MilliSecondsBetween(DT, Now))+' ms', 'NumPlan');
  {$ENDIF}
end;

procedure TNumPlan.DeleteFromBase(DeleteSubitems: Boolean = False);
begin
  if not Assigned(NumProject) then Exit;
  self.SQL_Delete:='DELETE FROM '+sTableNumPlanItems+' WHERE project_id='+IntToStr(NumProject.ID)+';';
  inherited DeleteFromBase(DeleteSubitems);
end;

function NumPlanCompareFunction(Item1, Item2: Pointer): Integer;
begin
  Result:=TNumPlanItem(Item1).Order-TNumPlanItem(Item2).Order;
end;

procedure TNumPlan.SortByOrder();
begin
  Sort(@NumPlanCompareFunction);
end;

function TNumPlan.GetItemByOrder(AOrder: integer): TNumPlanItem;
var
  i: Integer;
begin
  Result:=nil;
  for i:=0 to Count-1 do
  begin
    if Items[i].Order = AOrder then
    begin
      Result:=Items[i];
      Break;
    end;
  end;
end;

// === THallPlan ===
function THallPlan.GetItem(Index: Integer): THallItem;
begin
  Result:=THallItem(inherited Items[index]);
end;

procedure THallPlan.SetItem(Index: Integer; Value: THallItem);
begin
  inherited Items[Index]:=Value;
end;

function THallPlan.GetItemByID(ItemID: integer): THallItem;
begin
  Result:=THallItem(AGetItemByID(ItemID));
end;

function THallPlan.CreateItem(): TDbItem;
begin
  Result:=THallItem.Create(self.NumProject);
end;

function THallPlan.LoadFromBase(): Boolean;
begin
  Result:=False;
  if not Assigned(NumProject) then Exit;
  {$IFDEF DEBUG}
  DT:=Now();
  {$ENDIF}
  self.SQL_Load:='SELECT * FROM '+sTableHallItems+' WHERE project_id='+IntToStr(NumProject.ID)+';';
  if not NumProject.NumPlanItems.ItemsLoaded then NumProject.NumPlanItems.LoadFromBase();
  Result:=inherited LoadFromBase();
  {$IFDEF DEBUG}
  DebugMsg('Loaded '+IntToStr(Count)+' items in '+IntToStr(MilliSecondsBetween(DT, Now))+' ms', 'HallPlan');
  {$ENDIF}
end;

procedure THallPlan.DeleteFromBase(DeleteSubitems: Boolean = False);
begin
  if not Assigned(NumProject) then Exit;
  self.SQL_Delete:='DELETE FROM '+sTableHallItems+' WHERE project_id='+IntToStr(NumProject.ID)+';';
  inherited DeleteFromBase(DeleteSubitems);
end;

// === TProjectOptionList ===
function TProjectOptionList.GetItem(Index: Integer): TProjectOption;
begin
  Result:=TProjectOption(inherited Items[index]);
end;

procedure TProjectOptionList.SetItem(Index: Integer; Value: TProjectOption);
begin
  inherited Items[Index]:=Value;
end;

function TProjectOptionList.GetItemByID(ItemID: integer): TProjectOption;
begin
  Result:=TProjectOption(AGetItemByID(ItemID));
end;

function TProjectOptionList.CreateItem(): TDbItem;
begin
  Result:=TProjectOption.Create(self.NumProject);
end;

function TProjectOptionList.LoadFromBase(): Boolean;
begin
  Result:=False;
  if not Assigned(NumProject) then Exit;
  self.SQL_Load:='SELECT * FROM '+sTableProjectOptions+' WHERE project_id='+IntToStr(NumProject.ID)+';';
  Result:=inherited LoadFromBase();
end;

function TProjectOptionList.FGetOption(const Name: string): string;
var
  i: Integer;
begin
  Result:='';
  for i:=0 to self.Count-1 do
  begin
    if Self.Items[i].Name = Name then
    begin
      Result:=Self.Items[i].Value;
      Break;
    end;
  end;
end;

procedure TProjectOptionList.FSetOption(const Name: string; Value: string);
var
  i: Integer;
  Item: TProjectOption;
begin
  for i:=0 to self.Count-1 do
  begin
    if Self.Items[i].Name = Name then
    begin
      Self.Items[i].Value := Value;
      Exit;
    end;
  end;
  Item:=(self.CreateItem() as TProjectOption);
  Item.Name:=Name;
  Item.Value:=Value;
  Self.Add(Item);
end;


// ==============
function CheckAllTables(): boolean;
var
  sl: TStringList;
  SQL: string;
begin
  sl:=TStringList.Create();

  // Projects
  sl.Clear();
  sl.Add('id=INTEGER NOT NULL PRIMARY KEY');
  sl.Add('parent_id=INTEGER');
  sl.Add('name=VARCHAR(20)');
  sl.Add('desc=TEXT');
  Result:=ItemsDef.CheckTable(sTableProjects, sl);
  if not Result then Exit;

  // TicketTpl
  sl.Clear();
  sl.Add('id=INTEGER NOT NULL PRIMARY KEY');
  sl.Add('project_id=INTEGER');
  sl.Add('name=VARCHAR(20)');
  sl.Add('width=NUMERIC');
  sl.Add('height=NUMERIC');
  Result:=ItemsDef.CheckTable(sTableTicketsTpl, sl);
  if not Result then Exit;

  // Ticket
  sl.Clear();
  sl.Add('id=INTEGER NOT NULL PRIMARY KEY');
  sl.Add('project_id=INTEGER NOT NULL');
  sl.Add('page_tpl_id=INTEGER NOT NULL');
  sl.Add('tpl_id=INTEGER NOT NULL');
  sl.Add('name=VARCHAR(20)');
  sl.Add('pos_x=NUMERIC');
  sl.Add('pos_y=NUMERIC');
  Result:=ItemsDef.CheckTable(sTableTickets, sl);
  if not Result then Exit;

  // NumPageTpl
  sl.Clear();
  sl.Add('id=INTEGER NOT NULL PRIMARY KEY');
  sl.Add('project_id=INTEGER');
  sl.Add('name=VARCHAR(20)');
  sl.Add('size_x=NUMERIC');
  sl.Add('size_y=NUMERIC');
  Result:=ItemsDef.CheckTable(sTableNumPagesTpl, sl);
  if not Result then Exit;

  // NumLabelTpl
  sl.Clear();
  sl.Add('id=INTEGER NOT NULL PRIMARY KEY');
  sl.Add('project_id=INTEGER');
  sl.Add('name=VARCHAR(20)');
  sl.Add('base_value=TEXT');
  sl.Add('value_type=TEXT');
  sl.Add('action=TEXT');
  sl.Add('action_trigger=VARCHAR(1)');
  sl.Add('prefix=TEXT');
  sl.Add('suffix=TEXT');
  Result:=ItemsDef.CheckTable(sTableNumLabelTpl, sl);
  if not Result then Exit;

  // NumLabel
  sl.Clear();
  sl.Add('id=INTEGER NOT NULL PRIMARY KEY');
  sl.Add('project_id=INTEGER');
  sl.Add('ticket_tpl_id=INTEGER');
  sl.Add('numpage_tpl_id=INTEGER');
  sl.Add('numlabel_tpl_id=INTEGER');
  sl.Add('name=VARCHAR(20)');
  sl.Add('pos_x=NUMERIC');
  sl.Add('pos_y=NUMERIC');
  sl.Add('size=NUMERIC');
  sl.Add('angle=NUMERIC');
  sl.Add('color=INTEGER');
  sl.Add('font=TEXT');
  Result:=ItemsDef.CheckTable(sTableNumLabels, sl);
  if not Result then Exit;

  // NumPage
  sl.Clear();
  sl.Add('id=INTEGER NOT NULL PRIMARY KEY');
  sl.Add('project_id=INTEGER');
  sl.Add('page_tpl_id=INTEGER');
  sl.Add('num_order=INTEGER');
  sl.Add('state=VARCHAR(4)');
  Result:=ItemsDef.CheckTable(sTableNumPages, sl);
  if not Result then Exit;

  // NumPlanItem
  sl.Clear();
  sl.Add('id=INTEGER NOT NULL PRIMARY KEY');
  sl.Add('project_id=INTEGER');
  sl.Add('ticket_id=INTEGER');
  sl.Add('page_id=INTEGER');
  sl.Add('num_order=INTEGER');
  sl.Add('state=VARCHAR(4)');
  Result:=ItemsDef.CheckTable(sTableNumPlanItems, sl);
  if not Result then Exit;

  // HallItem
  sl.Clear();
  sl.Add('id=INTEGER NOT NULL PRIMARY KEY');
  sl.Add('project_id=INTEGER');
  sl.Add('numplan_item_id=INTEGER');
  sl.Add('pos_x=INTEGER');
  sl.Add('pos_y=INTEGER');
  sl.Add('color=INTEGER');
  sl.Add('n_row=INTEGER');
  sl.Add('n_place=INTEGER');
  sl.Add('n_sector=INTEGER');
  sl.Add('state=VARCHAR(4)');
  sl.Add('kind=VARCHAR(4)');
  sl.Add('param_text=TEXT');
  Result:=ItemsDef.CheckTable(sTableHallItems, sl);
  if not Result then Exit;

  // NumLabelData
  sl.Clear();
  sl.Add('id=INTEGER NOT NULL PRIMARY KEY');
  sl.Add('project_id=INTEGER');
  sl.Add('numplan_item_id=INTEGER');
  sl.Add('numlabel_tpl_id=INTEGER');
  sl.Add('value=TEXT');
  sl.Add('action=TEXT');
  Result:=ItemsDef.CheckTable(sTableNumLabelData, sl);
  if not Result then Exit;
  SQL:='CREATE INDEX IF NOT EXISTS numplan_item_id ON '
  +sTableNumLabelData+'(numplan_item_id);';
  {$IFDEF DEBUG_SQL}
  DebugMsg(SQL, 'SQL');
  {$ENDIF}
  db.execCmd(SQL);

  // ProjectOptions
  sl.Clear();
  sl.Add('id=INTEGER NOT NULL PRIMARY KEY');
  sl.Add('project_id=INTEGER');
  sl.Add('name=TEXT');
  sl.Add('value=TEXT');
  Result:=ItemsDef.CheckTable(sTableProjectOptions, sl);
  if not Result then Exit;

  sl.Free();
end;


initialization
begin
  NullStrictConvert:=False; // Null=''
  db:=TMkSqlite.Create(nil);
  db.dbName:='serial_print.sqb';
  try
    db.open();
  except
    FreeAndNil(db);
  end;
end;

finalization
begin
  if Assigned(db) then
  begin
    db.close();
    FreeAndNil(db);
  end;
end;

end.
