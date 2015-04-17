program Update;

{$APPTYPE CONSOLE}

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Registry, ShellAPI;



const
  RegisterPath = 'SOFTWARE\SerialPrint';
  CR_LF = #13#10;
  CR_LF2 = '^';//Chr(3);
var
  fileList: TStringList;
  recCount, i: Integer;
  temp:string;
  Path: string ='';
  findDir: Integer;
  sDir: TSearchRec;
  reg: TRegistry;
  h:HWND;

{$R update.res}

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
      //Reg.WriteString('Path', ExtractFileDir(ParamStr(0))+'\');
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
        //  Reg.WriteString('Path', ExtractFileDir(ParamStr(0)+'\'));
          Result:= False;
        end;
        Reg.CloseKey;
      end;
    end;  
  end;
  Reg.Free;
end;

function ExportResource(AType: PAnsiChar; AName, ePath : string):Boolean;
const
  BlockSize = 65536;
var
  rStream: TResourceStream;
  fStream: TFileStream;
  ElapsedSize, CopySize: Integer;
  max, curr, percent: Integer;
  temp: string;
begin
  Result:= False;
  curr:= 0;
  {эта часть извлекает exe из exe}
  if FindResource(HInstance, PChar(AName), AType) = 0 then
  begin
    writeln(#13+'Progress:  0%              Error: Not found Resource'+#10);
    exit;
  end;

  rStream:= TResourceStream.Create(HInstance, AName, AType);
 // rStream.CopyFrom();
  try
    fStream:= TFileStream.Create(ePath, fmCreate);
    ElapsedSize:= rStream.Size - rStream.Position;
    Max:= rStream.Size;
    try
      while ElapsedSize > 0 do
      begin
        if ElapsedSize < BlockSize then
          CopySize:= ElapsedSize
        else
          CopySize:= BlockSize;
        fStream.CopyFrom(rStream,CopySize);
        ElapsedSize:= rStream.Size - rStream.Position;
        curr:= rStream.Position;
        Application.ProcessMessages;
        percent:= Trunc((curr*100)/max);
        temp:= IntToStr(percent);

        write(#13+'Progress:  '+temp+'%          ');
        Result:= True;
      end;
    finally
      fStream.Free;
    end;
  finally
    rStream.Free;
    writeln('  [ Ok ]    ');
    //lbl1.Caption:= 'Ok';
  end;

end;

procedure Delay(Value: Cardinal);
var
  F, N: Cardinal;
begin
  N := 0;
  while N <= (Value div 10) do
  begin
    SleepEx(1, True);
    Application.ProcessMessages;
    Inc(N);
  end;
  F := GetTickCount;
  repeat
    Application.ProcessMessages;
    N := GetTickCount;
  until (N - F >= (Value mod 10)) or (N < F);
end;

begin
  if not RegisterProgram(RegisterPath) then
    MessageDlg('Not found registration info about program!', mtError, [mbOK], 0)
  else
  begin
    fileList:= TStringList.Create;
    if ParamStr(1) <> '/auto_update' then
    begin
      write(#10+'Press Any Key...'+#10);
      Readln;
    end;
    
    reg:= TRegistry.Create;
    reg.RootKey:= HKEY_LOCAL_MACHINE;
    if reg.OpenKey(RegisterPath, False) then
    begin
      Path:= reg.ReadString('Path');
    end;
    reg.Free;
    //Writeln(PAnsiChar(Path));
   // path:='';

    Writeln(#10+'ListFile');
    ExportResource(RT_RCDATA, 'ListFile', 'ListFile.txt') ;
    findDir:= FindFirst('listfile.txt', faAnyFile, sDir);
    if findDir = 0 then
      fileList.LoadFromFile('listfile.txt');
    fileList.Delimiter:= CR_LF2;
    //fileList.;
    recCount:= fileList.Count;

    for i:= 0 to recCount - 1 do
    begin
      temp:=fileList.Strings[i];

      if Length(temp) > 1 then
      begin
        Writeln(#10+temp+ ':');
        if Length(ExtractFileDir(temp)) > 0 then
        begin
          findDir:= FindFirst(Path+'\'+ExtractFileDir(temp), faDirectory, sDir);
          if findDir <> 0 then
          begin
            {$i-}
            MkDir(Path+ExtractFileDir(temp));
            {$I+}
          end;  
        end;

        ExportResource(RT_RCDATA, temp, Path+'\'+temp) ;
      end;
    end;

    //mmoHelp.Text:=StringReplace(s, CR_LF2, CR_LF, [rfReplaceAll]);


    DeleteFile('ListFile.txt');
    {$WARNINGS OFF}
    If ShellExecute( h, PChar( 'open' ), PChar( Path+'\SerialPrint.exe' ), nil, PChar( Path ), SW_SHOWNORMAL ) <= 32 Then
    //if CreateProcess(PChar( Path+'\SerialPrint.exe' ), SW_SHOW) <=32 then
    begin
      Writeln( 'Error: do not Run SerialPrint');
    end;  ;//DoCannotExecute;

    {$WARNINGS ON}
  end;

 // Readln;

  Delay(1600);
  
end.
