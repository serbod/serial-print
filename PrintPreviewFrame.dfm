object frmPrintPreview: TfrmPrintPreview
  Left = 0
  Top = 0
  Width = 646
  Height = 547
  TabOrder = 0
  object tlbPrintPreview: TToolBar
    Left = 0
    Top = 0
    Width = 646
    Height = 29
    ButtonHeight = 24
    ButtonWidth = 24
    Images = frmMain.Images16
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    object btnPrint: TToolButton
      Left = 0
      Top = 0
      Action = actPrint
    end
    object btnPrintOnePage: TToolButton
      Left = 24
      Top = 0
      Action = actPrintOnePage
    end
    object btnSavePDF: TToolButton
      Left = 48
      Top = 0
      Action = actSavePDF
    end
    object btnPageAdjust: TToolButton
      Left = 72
      Top = 0
      Action = actPageAdjust
    end
    object btn1: TToolButton
      Left = 96
      Top = 0
      Width = 8
      Caption = 'btn1'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object btnZoomFit: TToolButton
      Left = 104
      Top = 0
      Action = actZoomFit
    end
    object btnZoomPlus: TToolButton
      Left = 128
      Top = 0
      Action = actZoomPlus
    end
    object btnZoomMinus: TToolButton
      Left = 152
      Top = 0
      Action = actZoomMinus
    end
    object btn2: TToolButton
      Left = 176
      Top = 0
      Width = 8
      Caption = 'btn2'
      ImageIndex = 6
      Style = tbsSeparator
    end
    object btnPageFirst: TToolButton
      Left = 184
      Top = 0
      Action = actPageFirst
    end
    object btnPagePrev: TToolButton
      Left = 208
      Top = 0
      Action = actPagePrev
    end
    object btnPageNext: TToolButton
      Left = 232
      Top = 0
      Action = actPageNext
    end
    object btnPageLast: TToolButton
      Left = 256
      Top = 0
      Action = actPageLast
    end
    object cbbPageNum: TComboBox
      Left = 280
      Top = 1
      Width = 50
      Height = 21
      ImeName = 'Russian'
      ItemHeight = 13
      TabOrder = 0
      OnSelect = cbbPageNumSelect
    end
    object btn3: TToolButton
      Left = 330
      Top = 0
      Width = 8
      Caption = 'btn3'
      ImageIndex = 11
      Style = tbsSeparator
    end
    object btnShowTickets: TToolButton
      Left = 338
      Top = 0
      Action = actShowTickets
    end
    object btnClose: TToolButton
      Left = 362
      Top = 0
      Action = actClose
    end
  end
  object panPrintPreview: TPanel
    Left = 0
    Top = 29
    Width = 646
    Height = 518
    Align = alClient
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 1
  end
  object alPrintPreview: TActionList
    Images = frmMain.Images16
    OnExecute = alPrintPreviewExecute
    Left = 280
    Top = 240
    object actPrint: TAction
      Category = 'Print'
      Caption = #1055#1077#1095#1072#1090#1100
      Hint = #1055#1077#1095#1072#1090#1072#1090#1100
      ImageIndex = 21
      OnExecute = DummyAction
    end
    object actPrintOnePage: TAction
      Category = 'Print'
      Caption = #1055#1077#1095#1072#1090#1100' '#1089#1090#1088'.1'
      Hint = #1055#1077#1095#1072#1090#1100' '#1090#1077#1082#1091#1097#1077#1081' '#1089#1090#1088#1072#1085#1080#1094#1099
      ImageIndex = 21
      OnExecute = actPrintOnePageExecute
    end
    object actZoomFit: TAction
      Category = 'Zoom'
      Caption = 'actZoomFit'
      Hint = #1055#1086' '#1088#1072#1079#1084#1077#1088#1091' '#1086#1082#1085#1072
      ImageIndex = 14
      OnExecute = DummyAction
    end
    object actZoomPlus: TAction
      Category = 'Zoom'
      Caption = 'actZoomPlus'
      Hint = #1059#1074#1077#1083#1080#1095#1080#1090#1100
      ImageIndex = 15
      OnExecute = DummyAction
    end
    object actZoomMinus: TAction
      Category = 'Zoom'
      Caption = 'actZoomMinus'
      Hint = #1059#1084#1077#1085#1100#1096#1080#1090#1100
      ImageIndex = 16
      OnExecute = DummyAction
    end
    object actPageFirst: TAction
      Category = 'Page'
      Caption = 'actPageFirst'
      Hint = #1055#1077#1088#1074#1072#1103' '#1089#1090#1088#1072#1085#1080#1094#1072
      ImageIndex = 9
      OnExecute = DummyAction
    end
    object actPagePrev: TAction
      Category = 'Page'
      Caption = 'actPagePrev'
      Hint = #1055#1088#1077#1076#1091#1076#1091#1097#1072#1103' '#1089#1090#1088#1072#1085#1080#1094#1072
      ImageIndex = 12
      OnExecute = DummyAction
    end
    object actPageNext: TAction
      Category = 'Page'
      Caption = 'actPageNext'
      Hint = #1057#1083#1077#1076#1091#1102#1097#1072#1103' '#1089#1090#1088#1072#1085#1080#1094#1072
      ImageIndex = 11
      OnExecute = DummyAction
    end
    object actPageLast: TAction
      Category = 'Page'
      Caption = 'actPageLast'
      Hint = #1055#1086#1089#1083#1077#1076#1085#1103#1103' '#1089#1090#1088#1072#1085#1080#1094#1072
      ImageIndex = 10
      OnExecute = DummyAction
    end
    object actPageAdjust: TAction
      Category = 'Print'
      Caption = 'actPageAdjust'
      Hint = #1070#1089#1090#1080#1088#1086#1074#1082#1072' '#1083#1080#1089#1090#1072
      ImageIndex = 22
      OnExecute = DummyAction
    end
    object actShowTickets: TAction
      Hint = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1073#1080#1083#1077#1090#1099
      ImageIndex = 24
      OnExecute = DummyAction
    end
    object actClose: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Hint = #1047#1072#1082#1088#1099#1090#1100
      ImageIndex = 6
      OnExecute = DummyAction
    end
    object actSavePDF: TAction
      Category = 'Print'
      Caption = 'actSavePDF'
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1074' PDF'
      ImageIndex = 55
      OnExecute = DummyAction
    end
  end
end
