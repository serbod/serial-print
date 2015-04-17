object frmPageAdjust: TfrmPageAdjust
  Left = 0
  Top = 0
  Width = 456
  Height = 370
  TabOrder = 0
  OnResize = FrameResize
  object toolbarPageAdjust: TToolBar
    Left = 0
    Top = 0
    Width = 456
    Height = 26
    ButtonHeight = 24
    ButtonWidth = 24
    Caption = 'toolbarPageAdjust'
    Images = frmMain.Images16
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    object btnPrintPage: TToolButton
      Left = 0
      Top = 2
      Action = actPrintPage
    end
    object btnPrevPage: TToolButton
      Left = 24
      Top = 2
      Action = actPrevPage
    end
    object btnNextPage: TToolButton
      Left = 48
      Top = 2
      Action = actNextPage
    end
    object btnCalibrate: TToolButton
      Left = 72
      Top = 2
      Action = actCalibrate
    end
    object btnSetBase: TToolButton
      Left = 96
      Top = 2
      Action = actSetBase
    end
    object btnHelp: TToolButton
      Left = 120
      Top = 2
      Action = actHelp
    end
  end
  object pan1: TPanel
    Left = 0
    Top = 26
    Width = 456
    Height = 344
    Align = alClient
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 1
    object imgPageAdjust: TImage
      Left = 0
      Top = 0
      Width = 456
      Height = 344
      Align = alClient
      OnMouseDown = imgPageAdjustMouseDown
      OnMouseMove = imgPageAdjustMouseMove
    end
  end
  object actlstPageAdjust: TActionList
    Images = frmMain.Images16
    Left = 312
    Top = 176
    object actPrintPage: TAction
      Caption = #1055#1077#1095#1072#1090#1072#1090#1100
      Hint = #1055#1077#1095#1072#1090#1072#1090#1100
      ImageIndex = 21
    end
    object actNextPage: TAction
      Caption = 'actNextPage'
      Hint = #1057#1083#1077#1076'. '#1089#1090#1088#1072#1085#1080#1094#1072
      ImageIndex = 11
    end
    object actPrevPage: TAction
      Caption = 'actPrevPage'
      Hint = #1055#1088#1077#1076'. '#1089#1090#1088#1072#1085#1080#1094#1072
      ImageIndex = 12
    end
    object actCalibrate: TAction
      Caption = 'actCalibrate'
      Hint = #1050#1072#1083#1080#1073#1088#1086#1074#1072#1090#1100
      ImageIndex = 23
      OnExecute = actCalibrateExecute
    end
    object actSetBase: TAction
      Caption = 'actSetBase'
      Hint = #1041#1072#1079#1086#1074#1072#1103' '#1090#1086#1095#1082#1072' '#1102#1089#1090#1080#1088#1086#1074#1082#1080
      ImageIndex = 22
      OnExecute = actSetBaseExecute
    end
    object actHelp: TAction
      Caption = 'actHelp'
      Hint = #1057#1087#1088#1072#1074#1082#1072
      ImageIndex = 53
      OnExecute = actHelpExecute
    end
  end
end
