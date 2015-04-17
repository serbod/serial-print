object frmNumPlan: TfrmNumPlan
  Left = 0
  Top = 0
  Width = 521
  Height = 610
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  ParentFont = False
  TabOrder = 0
  object grpNumPlan: TGroupBox
    Left = 0
    Top = 29
    Width = 521
    Height = 581
    Align = alClient
    Caption = #1055#1083#1072#1085' '#1085#1091#1084#1077#1088#1072#1094#1080#1080
    TabOrder = 0
    object ngNumPlan: TNextGrid
      Left = 2
      Top = 15
      Width = 517
      Height = 564
      Align = alClient
      AppearanceOptions = [aoAlphaBlendedSelection, aoHideSelection, aoHighlightSlideCells]
      FixedCols = 1
      Options = [goGrid, goHeader, goIndicator, goInplaceEditEvents]
      TabOrder = 0
      TabStop = True
      OnAfterEdit = ngNumPlanAfterEdit
      object nxIncColNumber: TNxIncrementColumn
        DefaultWidth = 40
        DrawingOptions = doCustom
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Header.Caption = #1041#1080#1083#1077#1090
        Options = [coCanClick, coCanInput, coEditorAutoSelect, coPublicUsing]
        ParentFont = False
        Position = 0
        SortType = stAlphabetic
        Width = 40
      end
    end
  end
  object tlbNumPlan: TToolBar
    Left = 0
    Top = 0
    Width = 521
    Height = 29
    Caption = 'tlbNumPlan'
    Images = frmMain.Images16
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    object btnActions: TToolButton
      Left = 0
      Top = 2
      Action = actActions
    end
    object btnValues: TToolButton
      Left = 23
      Top = 2
      Action = actValues
    end
    object btn1: TToolButton
      Left = 46
      Top = 2
      Width = 8
      Caption = 'btn1'
      ImageIndex = 7
      Style = tbsSeparator
    end
    object btnHelp: TToolButton
      Left = 54
      Top = 2
      Hint = #1057#1087#1088#1072#1074#1082#1072
      Action = actHelp
    end
    object btnClose: TToolButton
      Left = 77
      Top = 2
      Action = actClose
    end
  end
  object actlstNumPlan: TActionList
    Images = frmMain.Images16
    OnExecute = actlstNumPlanExecute
    Left = 160
    Top = 96
    object actClose: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Hint = #1047#1072#1082#1088#1099#1090#1100
      ImageIndex = 6
      OnExecute = DummyAction
    end
    object actActions: TAction
      Caption = 'actActions'
      GroupIndex = 1
      Hint = #1044#1077#1081#1089#1090#1074#1080#1103
      ImageIndex = 2
      OnExecute = DummyAction
    end
    object actValues: TAction
      Caption = 'actValues'
      Checked = True
      GroupIndex = 1
      Hint = #1047#1085#1072#1095#1077#1085#1080#1103
      ImageIndex = 39
      OnExecute = DummyAction
    end
    object actHelp: TAction
      Caption = 'actHelp'
      ImageIndex = 53
      OnExecute = DummyAction
    end
  end
end
