object frmNumPlanPreview: TfrmNumPlanPreview
  Left = 0
  Top = 0
  Width = 776
  Height = 590
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  ParentFont = False
  TabOrder = 0
  object tlbNumPlanPreview: TToolBar
    Left = 0
    Top = 0
    Width = 776
    Height = 28
    AutoSize = True
    Caption = 'tlbNumPlanPreview'
    EdgeBorders = [ebTop, ebBottom]
    Images = frmMain.Images16
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    object btnModeValues: TToolButton
      Left = 0
      Top = 0
      Action = actModeValues
    end
    object btnModeActions: TToolButton
      Left = 23
      Top = 0
      Action = actModeActions
    end
    object btnModeNames: TToolButton
      Left = 46
      Top = 0
      Action = actModeNames
    end
    object btn1: TToolButton
      Left = 69
      Top = 0
      Width = 8
      Caption = 'btn1'
      ImageIndex = 0
      Style = tbsSeparator
    end
    object btnEditPageTpl: TToolButton
      Left = 77
      Top = 0
      Action = actEditPageTpl
    end
    object btnEditTicketTpl: TToolButton
      Left = 100
      Top = 0
      Action = actEditTicketTpl
    end
    object btn2: TToolButton
      Left = 123
      Top = 0
      Width = 8
      Caption = 'btn2'
      ImageIndex = 28
      Style = tbsSeparator
    end
    object btnPageFirst: TToolButton
      Left = 131
      Top = 0
      Action = actPageFirst
    end
    object btnPagePrev: TToolButton
      Left = 154
      Top = 0
      Action = actPagePrev
    end
    object btnPageNext: TToolButton
      Left = 177
      Top = 0
      Action = actPageNext
    end
    object btnPageLast: TToolButton
      Left = 200
      Top = 0
      Action = actPageLast
    end
    object btn3: TToolButton
      Left = 223
      Top = 0
      Width = 8
      Caption = 'btn3'
      ImageIndex = 11
      Style = tbsSeparator
    end
    object btnZoomFit: TToolButton
      Left = 231
      Top = 0
      Action = actZoomFit
    end
    object btnZoomMinus: TToolButton
      Left = 254
      Top = 0
      Action = actZoomMinus
    end
    object btnZoomPlus: TToolButton
      Left = 277
      Top = 0
      Action = actZoomPlus
    end
    object btn4: TToolButton
      Left = 300
      Top = 0
      Width = 8
      Caption = 'btn4'
      ImageIndex = 16
      Style = tbsSeparator
    end
    object btnHelp: TToolButton
      Left = 308
      Top = 0
      Action = actHelp
    end
    object btnClose: TToolButton
      Left = 331
      Top = 0
      Action = actClose
    end
  end
  object pan1: TPanel
    Left = 0
    Top = 28
    Width = 776
    Height = 562
    Align = alClient
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 1
    object pan2: TPanel
      Left = 0
      Top = 0
      Width = 776
      Height = 562
      Align = alClient
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 0
      object pbPreview: TPaintBox
        Left = 108
        Top = 0
        Width = 668
        Height = 562
        Align = alClient
        OnMouseDown = imgPreviewMouseDown
        OnPaint = pan2Resize
      end
      object spl1: TSplitter
        Left = 105
        Top = 0
        Height = 562
      end
      object ngPagesList: TNextGrid
        Left = 0
        Top = 0
        Width = 105
        Height = 562
        Align = alLeft
        AppearanceOptions = [aoHighlightSlideCells, aoIndicateSortedColumn]
        Options = [goGrid, goHeader, goSelectFullRow]
        TabOrder = 0
        TabStop = True
        OnSelectCell = ngPagesListSelectCell
        object ntcOrder: TNxNumberColumn
          DefaultValue = '0'
          DefaultWidth = 30
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Header.Caption = #8470
          Header.Alignment = taCenter
          Options = [coCanClick, coCanInput, coCanSort, coPublicUsing, coShowTextFitHint]
          ParentFont = False
          Position = 0
          SortType = stNumeric
          Width = 30
          Increment = 1.000000000000000000
          Precision = 0
        end
        object ncbNumPageTpl: TNxListColumn
          DefaultValue = '0'
          DefaultWidth = 73
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Header.Caption = #1052#1072#1082#1077#1090
          Header.Alignment = taCenter
          Options = [coAutoSize, coCanClick, coCanInput, coCanSort, coEditing, coPublicUsing, coShowTextFitHint]
          ParentFont = False
          Position = 1
          SortType = stNumeric
          Width = 73
        end
      end
    end
  end
  object actlstNumPlanPreview: TActionList
    Images = frmMain.Images16
    OnExecute = actlstNumPlanPreviewExecute
    Left = 328
    Top = 104
    object actModeNames: TAction
      Category = 'Mode'
      AutoCheck = True
      Caption = 'actModeNames'
      GroupIndex = 1
      Hint = #1048#1084#1077#1085#1072
      ImageIndex = 42
      OnExecute = actDummyExecute
    end
    object actModeValues: TAction
      Category = 'Mode'
      AutoCheck = True
      Caption = 'actModeValues'
      Checked = True
      GroupIndex = 1
      Hint = #1047#1085#1072#1095#1077#1085#1080#1103
      ImageIndex = 0
      OnExecute = actDummyExecute
    end
    object actModeActions: TAction
      Category = 'Mode'
      AutoCheck = True
      Caption = 'actModeActions'
      GroupIndex = 1
      Hint = #1044#1077#1081#1089#1090#1074#1080#1103
      ImageIndex = 2
      OnExecute = actDummyExecute
    end
    object actPageFirst: TAction
      Category = 'Pages'
      Hint = #1055#1077#1088#1074#1072#1103' '#1089#1090#1088#1072#1085#1080#1094#1072
      ImageIndex = 9
      OnExecute = actDummyExecute
    end
    object actPagePrev: TAction
      Category = 'Pages'
      Hint = #1055#1088#1077#1076#1099#1076#1091#1097#1072#1103' '#1089#1090#1088#1072#1085#1080#1094#1072
      ImageIndex = 12
      OnExecute = actDummyExecute
    end
    object actPageNext: TAction
      Category = 'Pages'
      Hint = #1057#1083#1077#1076#1091#1102#1097#1072#1103' '#1089#1090#1088#1072#1085#1080#1094#1072
      ImageIndex = 11
      OnExecute = actDummyExecute
    end
    object actPageLast: TAction
      Category = 'Pages'
      Hint = #1055#1086#1089#1083#1077#1076#1085#1103#1103' '#1089#1090#1088#1072#1085#1080#1094#1072
      ImageIndex = 10
      OnExecute = actDummyExecute
    end
    object actEditPageTpl: TAction
      Category = 'Edit'
      Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1096#1072#1073#1083#1086#1085' '#1083#1080#1089#1090#1072
      ImageIndex = 13
      OnExecute = actDummyExecute
    end
    object actEditTicketTpl: TAction
      Category = 'Edit'
      Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1096#1072#1073#1083#1086#1085' '#1073#1080#1083#1077#1090#1072
      ImageIndex = 27
      OnExecute = actDummyExecute
    end
    object actZoomFit: TAction
      Category = 'Zoom'
      Hint = #1048#1089#1093#1086#1076#1085#1099#1081' '#1088#1072#1079#1084#1077#1088
      ImageIndex = 14
      OnExecute = actDummyExecute
    end
    object actZoomPlus: TAction
      Category = 'Zoom'
      Hint = #1055#1088#1080#1073#1083#1080#1079#1080#1090#1100
      ImageIndex = 15
      OnExecute = actDummyExecute
    end
    object actZoomMinus: TAction
      Category = 'Zoom'
      Hint = #1054#1090#1076#1072#1083#1080#1090#1100
      ImageIndex = 16
      OnExecute = actDummyExecute
    end
    object actClose: TAction
      Hint = #1047#1072#1082#1088#1099#1090#1100
      ImageIndex = 6
      OnExecute = actDummyExecute
    end
    object actDummy: TAction
      Caption = 'actDummy'
      OnExecute = actDummyExecute
    end
    object actHelp: TAction
      Caption = 'actHelp'
      Hint = #1057#1087#1088#1072#1074#1082#1072
      ImageIndex = 53
      OnExecute = actDummyExecute
    end
  end
end
