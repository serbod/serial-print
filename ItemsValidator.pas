unit ItemsValidator;

interface
uses SysUtils, Classes, ItemsDef, Forms;

type
  TItemsValidator = class
  private
    CurProject: TNumProject;
    CheckedItems: TStringList;
    MaxCount: integer;
    CurCount: Integer;
    procedure CheckNumLabelTpl(Item: TNumLabelTpl);
    procedure CheckNumPlanItem(Item: TNumPlanItem);
    procedure CheckHallItem(Item: THallItem);
    procedure CheckTicketTpl(Item: TTicketTpl);
    procedure CheckNumPageTpl(Item: TNumPageTpl);
    procedure CheckNumLabel(Item: TNumLabel);
    procedure CheckNumLabelData(Item: TNumLabelData);
    procedure CheckTicket(Item: TTicket);
    procedure CheckNumPage(Item: TNumPage);
    procedure UpdateProgress();
  public
    ErrList: TStringList;
    ProgressText: PWideString;
    constructor Create();
    destructor Destroy; override;
    procedure CheckProject(Item: TNumProject);
  end;

var
  DBItemsValidator: TItemsValidator;

implementation
uses Core;

constructor TItemsValidator.Create();
begin
  ErrList:=TStringList.Create();
  CheckedItems:=TStringList.Create();
  ProgressText:=nil;
end;

destructor TItemsValidator.Destroy;
begin
  FreeAndNil(CheckedItems);
  FreeAndNil(ErrList);
  inherited Destroy();
end;

procedure TItemsValidator.UpdateProgress();
var
  s: string;
begin
  if (CurCount div 10) <> 0 then Exit;
  s:='['+IntToStr(CurCount)+' / '+IntToStr(MaxCount)+']';
  Core.Cmd('STATUS '+s);
  Application.ProcessMessages();
end;

procedure TItemsValidator.CheckNumLabelTpl(Item: TNumLabelTpl);
begin
  if CheckedItems.IndexOfObject(Item) <> -1 then Exit;
  CheckedItems.AddObject('', Item);
  if not Assigned(Item.Project) then ErrList.AddObject('Empty project', Item)
  else if Item.Project <> CurProject then ErrList.AddObject('Wrong project', Item);

  if Trim(Item.Name)='' then ErrList.AddObject('Empty name', Item);
  if Trim(Item.BaseValue)=''  then ErrList.AddObject('Empty base value', Item);
  if Trim(Item.Action)=''  then ErrList.AddObject('Empty action', Item);
end;

procedure TItemsValidator.CheckNumLabel(Item: TNumLabel);
var
  TicketTplAssigned: boolean;
  NumPageTplAssigned: boolean;
begin
  if CheckedItems.IndexOfObject(Item) <> -1 then Exit;
  CheckedItems.AddObject('', Item);
  if not Assigned(Item.Project) then ErrList.AddObject('Empty project', Item)
  else if Item.Project <> CurProject then ErrList.AddObject('Wrong project', Item);
  if Trim(Item.Name)='' then ErrList.AddObject('Empty name', Item);
  if (Item.Size = 0) then ErrList.AddObject('Wrong size', Item);
  //Item.Position
  //Item.Angle
  //Item.Font
  //Item.Color

  // Object fields
  if not Assigned(Item.NumLabelTpl) then ErrList.AddObject('Not assigned NumLabelTpl', Item)
  else CheckNumLabelTpl(Item.NumLabelTpl);
  // Owner
  TicketTplAssigned:=Assigned(Item.TicketTpl);
  NumPageTplAssigned:=Assigned(Item.NumPageTpl);
  if (not TicketTplAssigned) and (not NumPageTplAssigned) then
    ErrList.AddObject('Not assigned owner TicketTpl and NumPageTpl', Item)
  else if (TicketTplAssigned) and (NumPageTplAssigned) then
    ErrList.AddObject('Assigned owner TicketTpl and NumPageTpl', Item)
  else
  begin
    if TicketTplAssigned then CheckTicketTpl(Item.TicketTpl);
    if NumPageTplAssigned then CheckNumPageTpl(Item.NumPageTpl);
  end;
end;

procedure TItemsValidator.CheckNumLabelData(Item: TNumLabelData);
begin
  if CheckedItems.IndexOfObject(Item) <> -1 then Exit;
  CheckedItems.AddObject('', Item);
  if not Assigned(Item.Project) then ErrList.AddObject('Empty project', Item)
  else if Item.Project <> CurProject then ErrList.AddObject('Wrong project', Item);

  if Trim(Item.Value)='' then ErrList.AddObject('Empty Value', Item);
  if Trim(Item.Action)='' then ErrList.AddObject('Empty Action', Item);
  //Item.ValueType

  // Object fields
  if not Assigned(Item.NumLabelTpl) then ErrList.AddObject('Not assigned NumLabelTpl', Item)
  else CheckNumLabelTpl(Item.NumLabelTpl);
  // Owner
  if not Assigned(Item.NumPlanItem) then  ErrList.AddObject('Not assigned owner NumPlanItem', Item)
  else CheckNumPlanItem(Item.NumPlanItem);
end;

procedure TItemsValidator.CheckNumPlanItem(Item: TNumPlanItem);
var
  i: Integer;
begin
  if CheckedItems.IndexOfObject(Item) <> -1 then Exit;
  CheckedItems.AddObject('', Item);
  if not Assigned(Item.Project) then ErrList.AddObject('Empty project', Item)
  else if Item.Project <> CurProject then ErrList.AddObject('Wrong project', Item);
  //Item.Order
  //Item.State

  // Object fields
  if not Assigned(Item.Ticket) then ErrList.AddObject('Not assigned Ticket', Item)
  else CheckTicket(Item.Ticket);

  if not Assigned(Item.NumPage) then ErrList.AddObject('Not assigned NumPage', Item)
  else CheckNumPage(Item.NumPage);

  // Subitems
  // NumLabelDataList list
  if Item.NumLabelDataList.Count=0 then ErrList.AddObject('Empty NumLabelDataList list', Item);
  for i:=0 to Item.NumLabelDataList.Count-1 do
  begin
    CheckNumLabelData(Item.NumLabelDataList[i]);
  end;
end;

procedure TItemsValidator.CheckHallItem(Item: THallItem);
var
  i: Integer;
begin
  if CheckedItems.IndexOfObject(Item) <> -1 then Exit;
  CheckedItems.AddObject('', Item);
  if not Assigned(Item.Project) then ErrList.AddObject('Empty project', Item)
  else if Item.Project <> CurProject then ErrList.AddObject('Wrong project', Item);
  //Item.Order
  //Item.State
  //Item.Position
  //Item.Kind
  //Item.ParamsText
  //Item.Color
  //Item.Row
  //Item.Place
  //Item.Sector

  // Object fields
  if Assigned(Item.NumPlanItem) then CheckNumPlanItem(Item.NumPlanItem);
end;

procedure TItemsValidator.CheckTicket(Item: TTicket);
begin
  if CheckedItems.IndexOfObject(Item) <> -1 then Exit;
  CheckedItems.AddObject('', Item);
  if not Assigned(Item.Project) then ErrList.AddObject('Empty project', Item)
  else if Item.Project <> CurProject then ErrList.AddObject('Wrong project', Item);
  if Trim(Item.Name)='' then ErrList.AddObject('Empty name', Item);
  //Item.Position

  // Object fields
  if not Assigned(Item.Tpl) then  ErrList.AddObject('Not assigned TicketTpl', Item)
  else CheckTicketTpl(Item.Tpl);
  // Owner
  if not Assigned(Item.NumPageTpl) then ErrList.AddObject('Not assigned owner NumPageTpl', Item)
  else CheckNumPageTpl(Item.NumPageTpl);
end;

procedure TItemsValidator.CheckNumPage(Item: TNumPage);
begin
  if CheckedItems.IndexOfObject(Item) <> -1 then Exit;
  CheckedItems.AddObject('', Item);
  if not Assigned(Item.Project) then ErrList.AddObject('Empty project', Item)
  else if Item.Project <> CurProject then ErrList.AddObject('Wrong project', Item);
  //Item.Order
  //Item.State

  // Object fields
  if not Assigned(Item.NumPageTpl) then ErrList.AddObject('Not assigned NumPageTpl', Item)
  else CheckNumPageTpl(Item.NumPageTpl);
end;

procedure TItemsValidator.CheckTicketTpl(Item: TTicketTpl);
var
  i: Integer;
begin
  if CheckedItems.IndexOfObject(Item) <> -1 then Exit;
  CheckedItems.AddObject('', Item);
  if not Assigned(Item.Project) then ErrList.AddObject('Empty project', Item)
  else if Item.Project <> CurProject then ErrList.AddObject('Wrong project', Item);
  if Trim(Item.Name)='' then ErrList.AddObject('Empty name', Item);
  if (Item.Size.X < 1) or (Item.Size.Y < 1) then ErrList.AddObject('Wrong size', Item);

  // Numlabels list
  if Item.NumLabels.Count=0 then ErrList.AddObject('Empty NumLabels list', Item);
  for i:=0 to Item.NumLabels.Count-1 do
  begin
    CheckNumLabel(Item.NumLabels[i]);
  end;
end;

procedure TItemsValidator.CheckNumPageTpl(Item: TNumPageTpl);
var
  i: Integer;
begin
  if CheckedItems.IndexOfObject(Item) <> -1 then Exit;
  CheckedItems.AddObject('', Item);
  if not Assigned(Item.Project) then ErrList.AddObject('Empty project', Item)
  else if Item.Project <> CurProject then ErrList.AddObject('Wrong project', Item);
  if Trim(Item.Name)='' then ErrList.AddObject('Empty name', Item);
  if (Item.Size.X < 1) or (Item.Size.Y < 1) then ErrList.AddObject('Wrong size', Item);

  if (Item.Tickets.Count=0) and (Item.NumLabels.Count=0) then ErrList.AddObject('Empty subitems list', Item);

  // Tickets list
  //if Item.Tickets.Count=0 then ErrList.AddObject('Empty Tickets list', Item);
  for i:=0 to Item.Tickets.Count-1 do
  begin
    CheckTicket(Item.Tickets[i]);
  end;
  // Numlabels list
  //if Item.NumLabels.Count=0 then ErrList.AddObject('Empty NumLabels list', Item);
  for i:=0 to Item.NumLabels.Count-1 do
  begin
    CheckNumLabel(Item.NumLabels[i]);
  end;
end;

procedure TItemsValidator.CheckProject(Item: TNumProject);
var
  i: integer;
begin
  CheckedItems.Clear();
  if not Assigned(ErrList) then ErrList:=TStringList.Create();
  CurProject:=Item;

  if Trim(Item.Name)='' then
  begin
    ErrList.AddObject('Empty name', Item);
  end;

  // parent ?

  // For progress indicator
  MaxCount := Item.NumLabelsTpl.Count + Item.TicketTplList.Count + Item.PagesTpl.Count
  + Item.Tickets.Count + Item.Pages.Count + Item.NumPlanItems.Count + Item.HallPlan.Count;
  CurCount:=0;

  // NumLabelTpl List
  if Item.NumLabelsTpl.Count=0 then ErrList.AddObject('Empty NumLabelsTpl list', Item);
  for i:=0 to Item.NumLabelsTpl.Count-1 do
  begin
    CheckNumLabelTpl(Item.NumLabelsTpl[i]);
    Inc(CurCount);
    UpdateProgress();
  end;

  // TicketTplList
  if Item.TicketTplList.Count=0 then ErrList.AddObject('Empty TicketTplList', Item);
  for i:=0 to Item.TicketTplList.Count-1 do
  begin
    CheckTicketTpl(Item.TicketTplList[i]);
    Inc(CurCount);
    UpdateProgress();
  end;

  // PagesTpl List
  if Item.PagesTpl.Count=0 then ErrList.AddObject('Empty PagesTpl list', Item);
  for i:=0 to Item.PagesTpl.Count-1 do
  begin
    CheckNumPageTpl(Item.PagesTpl[i]);
    Inc(CurCount);
    UpdateProgress();
  end;

  // Tickets List
  if Item.Tickets.Count=0 then ErrList.AddObject('Empty Tickets list', Item);
  for i:=0 to Item.Tickets.Count-1 do
  begin
    CheckTicket(Item.Tickets[i]);
    Inc(CurCount);
    UpdateProgress();
  end;

  // Pages List
  if Item.Pages.Count=0 then ErrList.AddObject('Empty Pages list', Item);
  for i:=0 to Item.Pages.Count-1 do
  begin
    CheckNumPage(Item.Pages[i]);
    Inc(CurCount);
    UpdateProgress();
    // Check pages order
    // !!!
  end;

  // NumPlanItems List
  if Item.NumPlanItems.Count=0 then ErrList.AddObject('Empty NumPlanItems list', Item);
  for i:=0 to Item.NumPlanItems.Count-1 do
  begin
    CheckNumPlanItem(Item.NumPlanItems[i]);
    Inc(CurCount);
    UpdateProgress();
    // Check items order
    // !!!
  end;

  // HallPlan List
  if Item.HallPlan.Count=0 then ErrList.AddObject('Empty HallPlan list', Item);
  for i:=0 to Item.HallPlan.Count-1 do
  begin
    CheckHallItem(Item.HallPlan[i]);
    Inc(CurCount);
    UpdateProgress();
    // Check items order
    // !!!
  end;
  Core.AddCmd('STATUS Check finished');

  CheckedItems.Clear();
end;


end.
