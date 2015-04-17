object frmNumPlanMaster: TfrmNumPlanMaster
  Left = 0
  Top = 0
  Width = 390
  Height = 495
  HelpContext = 8
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  ParentFont = False
  TabOrder = 0
  object grp1: TGroupBox
    Left = 8
    Top = 8
    Width = 161
    Height = 105
    Caption = #1054#1073#1097#1080#1077' '#1087#1072#1088#1072#1084#1077#1090#1088#1099
    TabOrder = 0
    object lbl1: TLabel
      Left = 16
      Top = 16
      Width = 119
      Height = 13
      Caption = #1057#1082#1086#1083#1100#1082#1086' '#1074#1089#1077#1075#1086' '#1073#1080#1083#1077#1090#1086#1074
    end
    object lbl2: TLabel
      Left = 16
      Top = 56
      Width = 112
      Height = 13
      Caption = #1057#1082#1086#1083#1100#1082#1086' '#1074#1089#1077#1075#1086' '#1083#1080#1089#1090#1086#1074
    end
    object edTicketsCount: TEdit
      Left = 16
      Top = 32
      Width = 121
      Height = 21
      ImeName = 'Russian'
      TabOrder = 0
      Text = 'edTicketsCount'
      OnChange = edTicketsCountChange
    end
    object edPagesCount: TEdit
      Left = 16
      Top = 72
      Width = 121
      Height = 21
      ImeName = 'Russian'
      TabOrder = 1
      Text = 'edPagesCount'
    end
  end
  object grp2: TGroupBox
    Left = 184
    Top = 8
    Width = 193
    Height = 105
    Caption = #1055#1086#1089#1083#1077#1076#1086#1074#1072#1090#1077#1083#1100#1085#1086#1089#1090#1100' '#1083#1080#1089#1090#1086#1074
    TabOrder = 1
    object lbl3: TLabel
      Left = 8
      Top = 16
      Width = 158
      Height = 13
      Caption = #1053#1077#1095#1077#1090#1085#1099#1077' '#1083#1080#1089#1090#1099' (1, 3, 5 '#1080#1090#1076'..)'
    end
    object lbl4: TLabel
      Left = 8
      Top = 56
      Width = 146
      Height = 13
      Caption = #1063#1077#1090#1085#1099#1077' '#1083#1080#1089#1090#1099' (2, 4, 6 '#1080#1090#1076'..)'
    end
    object cbbOddPages: TComboBox
      Left = 8
      Top = 32
      Width = 169
      Height = 21
      ImeName = 'Russian'
      ItemHeight = 13
      TabOrder = 0
      Text = 'cbbOddPages'
    end
    object cbbEvenPages: TComboBox
      Left = 8
      Top = 72
      Width = 169
      Height = 21
      ImeName = 'Russian'
      ItemHeight = 13
      TabOrder = 1
      Text = 'cbbEvenPages'
    end
  end
  object grp3: TGroupBox
    Left = 8
    Top = 120
    Width = 369
    Height = 153
    Caption = #1053#1072#1095#1072#1083#1100#1085#1099#1077' '#1079#1085#1072#1095#1077#1085#1080#1103' '#1085#1091#1084#1077#1088#1072#1090#1086#1088#1086#1074
    TabOrder = 2
    object ngLabels: TNextGrid
      Left = 8
      Top = 16
      Width = 353
      Height = 129
      Options = [goGrid, goHeader]
      TabOrder = 0
      TabStop = True
      object nxTextCol1: TNxTextColumn
        DefaultWidth = 100
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Header.Caption = #1053#1091#1084#1077#1088#1072#1090#1086#1088
        ParentFont = False
        Position = 0
        SortType = stAlphabetic
        Width = 100
      end
      object nxTextCol2: TNxTextColumn
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Header.Caption = #1053#1072#1095'.'#1079#1085#1072#1095#1077#1085#1080#1077
        Options = [coCanClick, coCanInput, coCanSort, coEditing, coPublicUsing, coShowTextFitHint]
        ParentFont = False
        Position = 1
        SortType = stAlphabetic
      end
      object nxCBox1: TNxComboBoxColumn
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Header.Caption = #1053#1072#1095'.'#1076#1077#1081#1089#1090#1074#1080#1077
        Options = [coCanClick, coCanInput, coCanSort, coEditing, coPublicUsing, coShowTextFitHint]
        ParentFont = False
        Position = 2
        SortType = stAlphabetic
      end
      object nxCBox2: TNxComboBoxColumn
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Header.Caption = #1044#1077#1081#1089#1090#1074#1080#1077' '#1080#1090#1076'.'
        Options = [coCanClick, coCanInput, coCanSort, coEditing, coPublicUsing, coShowTextFitHint]
        ParentFont = False
        Position = 3
        SortType = stAlphabetic
      end
    end
  end
  object btnOK: TBitBtn
    Left = 16
    Top = 432
    Width = 177
    Height = 25
    Caption = #1057#1086#1079#1076#1072#1090#1100' '#1087#1083#1072#1085' '#1085#1091#1084#1077#1088#1072#1094#1080#1080
    TabOrder = 3
    OnClick = btnOKClick
  end
  object pbProgress: TProgressBar
    Left = 16
    Top = 464
    Width = 353
    Height = 17
    TabOrder = 4
    Visible = False
  end
  object grpRows: TGroupBox
    Left = 8
    Top = 280
    Width = 369
    Height = 145
    Caption = #1057#1087#1080#1089#1086#1082' '#1088#1103#1076#1086#1074
    TabOrder = 5
    object lbRowCount: TLabel
      Left = 168
      Top = 64
      Width = 89
      Height = 13
      AutoSize = False
      Caption = #1042#1089#1077#1075#1086' '#1088#1103#1076#1086#1074':'
    end
    object lbPlacesInRow: TLabel
      Left = 168
      Top = 88
      Width = 89
      Height = 13
      AutoSize = False
      Caption = #1052#1077#1089#1090' '#1074' '#1088#1103#1076#1091
    end
    object lbRow: TLabel
      Left = 168
      Top = 16
      Width = 77
      Height = 13
      Caption = #1053#1091#1084#1077#1088#1072#1090#1086#1088' '#1088#1103#1076
    end
    object lbPlace: TLabel
      Left = 168
      Top = 40
      Width = 87
      Height = 13
      Caption = #1053#1091#1084#1077#1088#1072#1090#1086#1088' '#1084#1077#1089#1090#1086
    end
    object ngRows: TNextGrid
      Left = 8
      Top = 16
      Width = 153
      Height = 121
      Options = [goGrid, goHeader]
      TabOrder = 0
      TabStop = True
      OnAfterEdit = ngRowsAfterEdit
      object nncRowNumber: TNxNumberColumn
        DefaultValue = '0'
        DefaultWidth = 38
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Header.Caption = #1056#1103#1076
        Header.Alignment = taCenter
        ParentFont = False
        Position = 0
        SortType = stNumeric
        Width = 38
        EditOptions = []
        Increment = 1.000000000000000000
        Precision = 0
      end
      object nncRowPlaces: TNxNumberColumn
        DefaultValue = '0'
        DefaultWidth = 51
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Header.Caption = #1052#1077#1089#1090
        Header.Alignment = taCenter
        Options = [coCanClick, coCanInput, coCanSort, coEditing, coPublicUsing]
        ParentFont = False
        Position = 1
        SortType = stNumeric
        Width = 51
        Increment = 1.000000000000000000
        Precision = 0
      end
    end
    object nseRowCount: TNxSpinEdit
      Left = 264
      Top = 64
      Width = 97
      Height = 21
      Alignment = taRightJustify
      TabOrder = 1
      Text = '0'
      Increment = 1.000000000000000000
    end
    object nsePlacesInRow: TNxSpinEdit
      Left = 264
      Top = 88
      Width = 97
      Height = 21
      Alignment = taRightJustify
      TabOrder = 2
      Text = '0'
      Increment = 1.000000000000000000
    end
    object cbbRow: TComboBox
      Left = 264
      Top = 16
      Width = 97
      Height = 21
      ImeName = 'Russian'
      ItemHeight = 13
      TabOrder = 3
    end
    object cbbPlace: TComboBox
      Left = 264
      Top = 40
      Width = 97
      Height = 21
      ImeName = 'Russian'
      ItemHeight = 13
      TabOrder = 4
    end
    object btnCreateRowList: TButton
      Left = 168
      Top = 112
      Width = 193
      Height = 25
      Caption = #1057#1086#1079#1076#1072#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1088#1103#1076#1086#1074
      TabOrder = 5
      OnClick = btnCreateRowListClick
    end
  end
end
