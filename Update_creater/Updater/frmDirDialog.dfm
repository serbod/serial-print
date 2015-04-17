object DirDialog: TDirDialog
  Left = 239
  Top = 172
  BorderStyle = bsSingle
  Caption = 'DirDialog'
  ClientHeight = 291
  ClientWidth = 270
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object tv1: TShellTreeView
    Left = 0
    Top = 0
    Width = 270
    Height = 248
    ObjectTypes = [otFolders]
    Root = 'rfMyComputer'
    UseShellImages = True
    Align = alClient
    AutoRefresh = False
    Indent = 19
    ParentColor = False
    RightClickSelect = True
    ShowRoot = False
    TabOrder = 0
  end
  object pnl1: TPanel
    Left = 0
    Top = 248
    Width = 270
    Height = 43
    Align = alBottom
    ParentBackground = False
    TabOrder = 1
    object btnCancel: TButton
      Left = 184
      Top = 8
      Width = 75
      Height = 25
      Caption = 'btnCancel'
      TabOrder = 0
      OnClick = btnCancelClick
    end
    object btnOk: TButton
      Left = 96
      Top = 8
      Width = 75
      Height = 25
      Caption = 'btnOk'
      TabOrder = 1
      OnClick = btnOkClick
    end
  end
end
