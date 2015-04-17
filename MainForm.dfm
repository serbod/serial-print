object frmMain: TfrmMain
  Left = 271
  Top = 88
  Width = 878
  Height = 658
  HelpContext = 1
  Caption = 'Serial Print'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  HelpFile = 'SerialPrint.chm'
  OldCreateOrder = False
  PopupMenu = LangMenu
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object spl1: TSplitter
    Left = 305
    Top = 0
    Height = 605
  end
  object grpSettings: TGroupBox
    Left = 0
    Top = 0
    Width = 305
    Height = 605
    Align = alLeft
    Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072
    TabOrder = 0
    object pgcMain: TPageControl
      Left = 2
      Top = 15
      Width = 301
      Height = 588
      ActivePage = tsProjects
      Align = alClient
      TabOrder = 0
      OnChange = pgcMainChange
      object tsProjects: TTabSheet
        HelpContext = 2
        Caption = #1055#1088#1086#1077#1082#1090#1099
        ImageIndex = 4
        DesignSize = (
          293
          560)
        object grpProjectList: TGroupBox
          Left = 0
          Top = 0
          Width = 289
          Height = 225
          Anchors = [akLeft, akTop, akRight]
          Caption = #1057#1087#1080#1089#1086#1082' '#1087#1088#1086#1077#1082#1090#1086#1074
          TabOrder = 0
          DesignSize = (
            289
            225)
          object tvProjects: TTreeView
            Left = 8
            Top = 16
            Width = 273
            Height = 193
            HelpContext = 1
            Anchors = [akLeft, akTop, akRight]
            Indent = 19
            PopupMenu = pmProjects
            ReadOnly = True
            TabOrder = 0
            OnChange = tvProjectsChange
            OnDeletion = tvProjectsDeletion
          end
        end
        object grpProjectDetails: TGroupBox
          Left = 0
          Top = 232
          Width = 289
          Height = 200
          Anchors = [akLeft, akTop, akRight, akBottom]
          Caption = #1055#1086#1076#1088#1086#1073#1085#1086#1089#1090#1080' '#1087#1088#1086#1077#1082#1090#1072
          TabOrder = 1
          DesignSize = (
            289
            200)
          object lblProjName: TLabel
            Left = 8
            Top = 24
            Width = 48
            Height = 13
            Caption = #1053#1072#1079#1074#1072#1085#1080#1077
          end
          object memoProjectDesc: TMemo
            Left = 8
            Top = 56
            Width = 273
            Height = 136
            HelpContext = 1
            Anchors = [akLeft, akTop, akRight, akBottom]
            ImeName = 'Russian'
            ScrollBars = ssVertical
            TabOrder = 0
          end
          object edProjName: TEdit
            Left = 64
            Top = 24
            Width = 217
            Height = 21
            HelpContext = 1
            Anchors = [akLeft, akTop, akRight]
            ImeName = 'Russian'
            TabOrder = 1
            OnChange = edProjNameChange
          end
        end
        object grpNumPlan: TGroupBox
          Left = 0
          Top = 432
          Width = 289
          Height = 120
          Anchors = [akLeft, akRight, akBottom]
          Caption = #1055#1083#1072#1085' '#1085#1091#1084#1077#1088#1072#1094#1080#1080
          TabOrder = 2
          DesignSize = (
            289
            120)
          object memoSummary: TMemo
            Left = 8
            Top = 16
            Width = 273
            Height = 97
            HelpContext = 1
            Anchors = [akLeft, akTop, akRight]
            ImeName = 'Russian'
            TabOrder = 0
          end
        end
      end
      object tsTemplates: TTabSheet
        HelpContext = 3
        Caption = #1052#1072#1082#1077#1090#1099
        ImageIndex = 3
        DesignSize = (
          293
          560)
        object grpPagesTpl: TGroupBox
          Left = 0
          Top = 336
          Width = 289
          Height = 145
          HelpContext = 3
          Anchors = [akLeft, akTop, akRight]
          Caption = #1052#1072#1082#1077#1090#1099' '#1083#1080#1089#1090#1086#1074
          TabOrder = 0
          DesignSize = (
            289
            145)
          object lvPagesTpl: TListView
            Left = 8
            Top = 16
            Width = 273
            Height = 118
            HelpContext = 3
            Anchors = [akLeft, akTop, akRight]
            Columns = <
              item
                Caption = #1053#1072#1079#1074#1072#1085#1080#1077
                MinWidth = 70
                Width = 125
              end
              item
                Caption = #1056#1072#1079#1084#1077#1088
                MinWidth = 50
                Width = 70
              end
              item
                Caption = #1041#1080#1083#1077#1090#1086#1074
                MinWidth = 40
                Width = 70
              end>
            GridLines = True
            ReadOnly = True
            RowSelect = True
            PopupMenu = pmPagesTpl
            ShowWorkAreas = True
            TabOrder = 0
            ViewStyle = vsReport
            OnDblClick = lvPagesTplDblClick
          end
        end
        object grpTicketsTpl: TGroupBox
          Left = 0
          Top = 200
          Width = 289
          Height = 129
          HelpContext = 3
          Anchors = [akLeft, akTop, akRight]
          Caption = #1052#1072#1082#1077#1090#1099' '#1073#1080#1083#1077#1090#1086#1074
          TabOrder = 1
          DesignSize = (
            289
            129)
          object lvTicketsTpl: TListView
            Left = 8
            Top = 16
            Width = 273
            Height = 105
            HelpContext = 3
            Anchors = [akLeft, akTop, akRight]
            Columns = <
              item
                Caption = #1053#1072#1079#1074#1072#1085#1080#1077
                MinWidth = 70
                Width = 125
              end
              item
                Caption = #1056#1072#1079#1084#1077#1088
                MinWidth = 50
                Width = 70
              end
              item
                Caption = #1057#1074#1086#1081#1089#1090#1074#1072
                MinWidth = 50
                Width = 70
              end>
            GridLines = True
            ReadOnly = True
            RowSelect = True
            PopupMenu = pmTicketsTpl
            ShowWorkAreas = True
            TabOrder = 0
            ViewStyle = vsReport
            OnChange = lvTicketsTplChange
            OnDblClick = lvTicketsTplDblClick
            OnDeletion = lvTicketsTplDeletion
          end
        end
        object grpNumLabelsTpl: TGroupBox
          Left = 0
          Top = 0
          Width = 289
          Height = 193
          HelpContext = 3
          Anchors = [akLeft, akTop, akRight]
          Caption = #1053#1091#1084#1077#1088#1072#1090#1086#1088#1099
          TabOrder = 2
          DesignSize = (
            289
            193)
          object lvNumerators: TListView
            Left = 8
            Top = 16
            Width = 273
            Height = 169
            HelpContext = 3
            Anchors = [akLeft, akTop, akRight]
            Columns = <
              item
                Caption = #1053#1072#1079#1074#1072#1085#1080#1077
                MinWidth = 70
                Width = 125
              end
              item
                Caption = #1053#1072#1095'.'#1079#1085#1072#1095
                MinWidth = 70
                Width = 70
              end
              item
                Caption = #1044#1077#1081#1089#1090#1074#1080#1077
                MinWidth = 50
                Width = 70
              end>
            GridLines = True
            RowSelect = True
            PopupMenu = pmNumLabels
            ShowWorkAreas = True
            TabOrder = 0
            ViewStyle = vsReport
            OnClick = lvNumeratorsClick
            OnEdited = lvNumeratorsEdited
          end
        end
      end
      object tsData: TTabSheet
        HelpContext = 7
        Caption = #1044#1072#1085#1085#1099#1077
        ImageIndex = 1
        object tlbData: TToolBar
          Left = 0
          Top = 0
          Width = 293
          Height = 36
          AutoSize = True
          ButtonHeight = 30
          ButtonWidth = 31
          Caption = 'tlbData'
          Color = clBtnFace
          EdgeBorders = [ebTop, ebBottom]
          Images = Images24
          ParentColor = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          object btnNumPlanCreate: TToolButton
            Left = 0
            Top = 2
            Action = actNumPlanCreate
          end
          object btnSep2: TToolButton
            Left = 31
            Top = 2
            Width = 8
            Caption = 'btnSep2'
            ImageIndex = 6
            Style = tbsSeparator
          end
          object btnNumTable: TToolButton
            Left = 39
            Top = 2
            Action = actNumPlanEdit
          end
          object btnHallPlan: TToolButton
            Left = 70
            Top = 2
            Action = actHallEdit
          end
          object btnPagesOrder: TToolButton
            Left = 101
            Top = 2
            Action = actPagesOrder
          end
          object btnSep1: TToolButton
            Left = 132
            Top = 2
            Width = 8
            Caption = 'btnSep1'
            ImageIndex = 3
            Style = tbsSeparator
          end
          object btnNumPreview: TToolButton
            Left = 140
            Top = 2
            Action = actNumPlanPreview
          end
          object btnPageAdjust: TToolButton
            Left = 171
            Top = 2
            Action = actPageAdjust
          end
        end
        object panTicketsList: TPanel
          Left = 0
          Top = 36
          Width = 293
          Height = 524
          Align = alClient
          BevelOuter = bvNone
          Ctl3D = True
          ParentBackground = False
          ParentCtl3D = False
          TabOrder = 1
          DesignSize = (
            293
            524)
          object grpTickets: TGroupBox
            Left = 0
            Top = 8
            Width = 289
            Height = 201
            Anchors = [akLeft, akTop, akRight]
            Caption = #1041#1080#1083#1077#1090#1099
            TabOrder = 0
            DesignSize = (
              289
              201)
            object lvTickets: TListView
              Left = 8
              Top = 16
              Width = 273
              Height = 177
              Anchors = [akLeft, akTop, akRight]
              Columns = <
                item
                  Caption = #1041#1080#1083#1077#1090
                end
                item
                  Caption = #1051#1080#1089#1090
                end
                item
                  AutoSize = True
                  Caption = #1052#1072#1082#1077#1090' '#1073#1080#1083#1077#1090#1072
                  MinWidth = 50
                end
                item
                  AutoSize = True
                  Caption = #1052#1072#1082#1077#1090' '#1083#1080#1089#1090#1072
                  MinWidth = 50
                end>
              FlatScrollBars = True
              GridLines = True
              HideSelection = False
              ReadOnly = True
              RowSelect = True
              TabOrder = 0
              ViewStyle = vsReport
              OnSelectItem = lvTicketsSelectItem
            end
          end
          object grpNumerators: TGroupBox
            Left = 0
            Top = 216
            Width = 289
            Height = 233
            Anchors = [akLeft, akTop, akRight]
            Caption = #1053#1091#1084#1077#1088#1072#1090#1086#1088#1099
            TabOrder = 1
            DesignSize = (
              289
              233)
            object ngNum: TNextGrid
              Left = 8
              Top = 16
              Width = 273
              Height = 209
              Anchors = [akLeft, akTop, akRight]
              Options = [goGrid, goHeader]
              TabOrder = 0
              TabStop = True
              OnAfterEdit = ngNumAfterEdit
              object nxtxtclmnTextCol1: TNxTextColumn
                DefaultWidth = 98
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                Header.Caption = #1053#1091#1084#1077#1088#1072#1090#1086#1088
                ParentFont = False
                Position = 0
                SortType = stAlphabetic
                Width = 98
              end
              object nxtxtclmnTextCol2: TNxTextColumn
                DefaultWidth = 126
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                Header.Caption = #1047#1085#1072#1095#1077#1085#1080#1077
                Options = [coCanClick, coCanInput, coCanSort, coEditing, coPublicUsing, coShowTextFitHint]
                ParentFont = False
                Position = 1
                SortType = stAlphabetic
                Width = 126
              end
            end
          end
        end
      end
      object tsPrint: TTabSheet
        HelpContext = 14
        Caption = #1055#1077#1095#1072#1090#1100
        DesignSize = (
          293
          560)
        object grpPrinters: TGroupBox
          Left = 0
          Top = 0
          Width = 289
          Height = 113
          Anchors = [akLeft, akTop, akRight]
          Caption = #1055#1088#1080#1085#1090#1077#1088#1099
          TabOrder = 0
          DesignSize = (
            289
            113)
          object chklstPrinters: TCheckListBox
            Left = 8
            Top = 16
            Width = 273
            Height = 89
            Anchors = [akLeft, akTop, akRight]
            ImeName = 'Russian'
            ItemHeight = 13
            TabOrder = 0
            OnClick = chklstPrintersClick
          end
        end
        object grpPrinterInfo: TGroupBox
          Left = 0
          Top = 120
          Width = 289
          Height = 177
          Anchors = [akLeft, akTop, akRight]
          Caption = #1057#1074#1086#1081#1089#1090#1074#1072' '#1087#1088#1080#1085#1090#1077#1088#1072
          TabOrder = 1
          DesignSize = (
            289
            177)
          object lstPrinterInfo: TListBox
            Left = 8
            Top = 16
            Width = 273
            Height = 153
            Anchors = [akLeft, akTop, akRight]
            ImeName = 'Russian'
            ItemHeight = 13
            TabOrder = 0
          end
        end
        object grpPrintGrid: TGroupBox
          Left = 0
          Top = 304
          Width = 289
          Height = 161
          Anchors = [akLeft, akTop, akRight]
          Caption = #1050#1072#1083#1080#1073#1088#1086#1074#1086#1095#1085#1072#1103' '#1089#1077#1090#1082#1072
          TabOrder = 2
          object lb1: TLabel
            Left = 56
            Top = 56
            Width = 58
            Height = 13
            Caption = #1096#1072#1075' '#1084#1077#1083#1082#1080#1081
          end
          object lb2: TLabel
            Left = 56
            Top = 80
            Width = 66
            Height = 13
            Caption = #1096#1072#1075' '#1082#1088#1091#1087#1085#1099#1081
          end
          object lbEq: TLabel
            Left = 168
            Top = 56
            Width = 8
            Height = 13
            Caption = '='
          end
          object lbPp: TLabel
            Left = 144
            Top = 40
            Width = 30
            Height = 13
            Caption = #1090#1086#1095#1077#1082
          end
          object lbMm: TLabel
            Left = 160
            Top = 72
            Width = 12
            Height = 13
            Caption = #1084#1084
          end
          object lbPpm: TLabel
            Left = 136
            Top = 96
            Width = 35
            Height = 39
            AutoSize = False
            Caption = #1090#1086#1095#1077#1082' '#1085#1072' '#1084#1084':'
            WordWrap = True
          end
          object lbStep3: TLabel
            Left = 56
            Top = 104
            Width = 48
            Height = 13
            Caption = #1096#1072#1075' '#1094#1080#1092#1088
          end
          object lbSizeX: TLabel
            Left = 184
            Top = 24
            Width = 40
            Height = 13
            Caption = #1064#1080#1088#1080#1085#1072
          end
          object lbSizeY: TLabel
            Left = 240
            Top = 24
            Width = 37
            Height = 13
            Caption = #1042#1099#1089#1086#1090#1072
          end
          object btnGridPrint: TButton
            Left = 88
            Top = 128
            Width = 73
            Height = 25
            Caption = #1055#1077#1095#1072#1090#1072#1090#1100
            TabOrder = 0
          end
          object rbGridInPixels: TRadioButton
            Left = 8
            Top = 16
            Width = 113
            Height = 17
            Caption = #1074' '#1090#1086#1095#1082#1072#1093
            TabOrder = 1
            OnClick = rbGridInMmClick
          end
          object rbGridInMm: TRadioButton
            Left = 8
            Top = 32
            Width = 113
            Height = 17
            Caption = #1074' '#1084#1080#1083#1083#1080#1084#1077#1090#1088#1072#1093
            TabOrder = 2
            OnClick = rbGridInMmClick
          end
          object edStep1: TEdit
            Left = 8
            Top = 56
            Width = 41
            Height = 21
            ImeName = 'Russian'
            TabOrder = 3
            OnKeyPress = edNumKeyPress
          end
          object edStep2: TEdit
            Left = 8
            Top = 80
            Width = 41
            Height = 21
            ImeName = 'Russian'
            TabOrder = 4
            OnKeyPress = edNumKeyPress
          end
          object edPpX: TEdit
            Left = 184
            Top = 40
            Width = 41
            Height = 21
            ImeName = 'Russian'
            TabOrder = 5
            OnChange = edMmXChange
            OnKeyPress = edNumKeyPress
          end
          object edMmX: TEdit
            Left = 184
            Top = 72
            Width = 41
            Height = 21
            ImeName = 'Russian'
            TabOrder = 6
            OnChange = edMmXChange
            OnKeyPress = edNumKeyPress
          end
          object edPpmX: TEdit
            Left = 184
            Top = 104
            Width = 41
            Height = 21
            ImeName = 'Russian'
            TabOrder = 7
            OnKeyPress = edNumKeyPress
          end
          object edStep3: TEdit
            Left = 8
            Top = 104
            Width = 41
            Height = 21
            ImeName = 'Russian'
            TabOrder = 8
          end
          object btnGridPreview: TButton
            Left = 8
            Top = 128
            Width = 75
            Height = 25
            Caption = #1055#1088#1086#1089#1084#1086#1090#1088
            TabOrder = 9
            OnClick = btnGridPreviewClick
          end
          object edPpY: TEdit
            Left = 240
            Top = 40
            Width = 41
            Height = 21
            ImeName = 'Russian'
            TabOrder = 10
            OnChange = edMmYChange
            OnKeyPress = edNumKeyPress
          end
          object edMmY: TEdit
            Left = 240
            Top = 72
            Width = 41
            Height = 21
            ImeName = 'Russian'
            TabOrder = 11
            OnChange = edMmYChange
            OnKeyPress = edNumKeyPress
          end
          object edPpmY: TEdit
            Left = 240
            Top = 104
            Width = 41
            Height = 21
            ImeName = 'Russian'
            TabOrder = 12
            OnKeyPress = edNumKeyPress
          end
        end
        object btnPrint: TBitBtn
          Left = 224
          Top = 472
          Width = 65
          Height = 57
          Caption = #1055#1077#1095#1072#1090#1100
          TabOrder = 3
          OnClick = btnPrintClick
        end
        object btnPrintSet: TBitBtn
          Left = 8
          Top = 472
          Width = 129
          Height = 25
          Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1087#1088#1080#1085#1090#1077#1088#1072
          TabOrder = 4
          OnClick = btnPrintSetClick
        end
        object btnPageSet: TBitBtn
          Left = 8
          Top = 504
          Width = 129
          Height = 25
          Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1089#1090#1088#1072#1085#1094#1099
          TabOrder = 5
          OnClick = btnPageSetClick
        end
        object btnPreview: TBitBtn
          Left = 152
          Top = 472
          Width = 65
          Height = 57
          Caption = #1055#1088#1086#1089#1084#1086#1090#1088
          TabOrder = 6
          OnClick = btnPreviewClick
        end
      end
      object tsOptions: TTabSheet
        Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
        ImageIndex = 2
        DesignSize = (
          293
          560)
        object grpAbout: TGroupBox
          Left = 0
          Top = 392
          Width = 289
          Height = 161
          Anchors = [akLeft, akRight, akBottom]
          Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
          TabOrder = 0
          DesignSize = (
            289
            161)
          object lblAftors: TLabel
            Left = 8
            Top = 72
            Width = 43
            Height = 13
            Caption = #1040#1074#1090#1086#1088#1099':'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lbl2: TLabel
            Left = 56
            Top = 72
            Width = 87
            Height = 13
            Caption = #1041#1086#1076#1088#1086#1074' '#1057#1077#1088#1075#1077#1081
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl3: TLabel
            Left = 8
            Top = 24
            Width = 104
            Height = 13
            Caption = 'Serial Print ver.0.1'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl4: TLabel
            Left = 8
            Top = 40
            Width = 273
            Height = 33
            Anchors = [akLeft, akTop, akRight]
            AutoSize = False
            Caption = 
              #1055#1088#1086#1075#1088#1072#1084#1084#1072' '#1076#1083#1103' '#1087#1077#1095#1072#1090#1080' '#1089#1077#1088#1080#1081#1085#1099#1093' '#1085#1086#1084#1077#1088#1086#1074' '#1080' '#1087#1088#1086#1095#1077#1081' '#1087#1077#1088#1077#1084#1077#1085#1085#1086#1081' '#1080#1085#1092#1086#1088#1084 +
              #1072#1094#1080#1080
            WordWrap = True
          end
          object lbProgramKey: TLabel
            Left = 8
            Top = 120
            Width = 78
            Height = 13
            Caption = #1050#1086#1076' '#1087#1088#1086#1075#1088#1072#1084#1084#1099
          end
          object lbProtectionKey: TLabel
            Left = 152
            Top = 120
            Width = 63
            Height = 13
            Caption = #1050#1086#1076' '#1079#1072#1097#1080#1090#1099
          end
          object lb3: TLabel
            Left = 56
            Top = 88
            Width = 82
            Height = 13
            Caption = #1058#1091#1089#1086#1074' '#1045#1074#1075#1077#1085#1080#1081
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lb4: TLabel
            Left = 56
            Top = 104
            Width = 102
            Height = 13
            Caption = #1057#1082#1088#1103#1073#1080#1085' '#1043#1088#1080#1075#1086#1088#1080#1081
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object edProgramKey: TEdit
            Left = 8
            Top = 136
            Width = 121
            Height = 21
            ImeName = 'Russian'
            ReadOnly = True
            TabOrder = 0
          end
          object edProtectionKey: TEdit
            Left = 152
            Top = 136
            Width = 121
            Height = 21
            ImeName = 'Russian'
            TabOrder = 1
            OnChange = edProtectionKeyChange
            OnKeyDown = edProtectionKeyKeyDown
          end
          object btnUpdate: TBitBtn
            Left = 168
            Top = 22
            Width = 89
            Height = 17
            Caption = #1054#1073#1085#1086#1074#1083#1077#1085#1080#1077
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            OnClick = btnUpdateClick
          end
        end
        object grpHelpList: TGroupBox
          Left = 0
          Top = 0
          Width = 289
          Height = 384
          Anchors = [akLeft, akTop, akRight, akBottom]
          Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080' '#1089#1080#1089#1090#1077#1084#1099
          TabOrder = 1
          DesignSize = (
            289
            384)
          object tvOptions: TTreeView
            Left = 8
            Top = 16
            Width = 273
            Height = 360
            Anchors = [akLeft, akTop, akRight, akBottom]
            Indent = 19
            TabOrder = 0
            Items.Data = {
              010000002B0000000000000000000000FFFFFFFFFFFFFFFF0000000000000000
              12CEF1EDEEE2EDFBE520EDE0F1F2F0EEE9EAE8}
          end
        end
      end
    end
  end
  object pan1: TPanel
    Left = 308
    Top = 0
    Width = 562
    Height = 605
    Align = alClient
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 1
    object pgcViews: TPageControl
      Left = 0
      Top = 0
      Width = 562
      Height = 605
      ActivePage = tsDebug
      Align = alClient
      MultiLine = True
      PopupMenu = pmViews
      TabOrder = 0
      object tsDebug: TTabSheet
        Caption = 'tsDebug'
        TabVisible = False
        object memoDebug: TMemo
          Left = 0
          Top = 0
          Width = 554
          Height = 595
          Align = alClient
          ImeName = 'Russian'
          ScrollBars = ssBoth
          TabOrder = 0
        end
      end
    end
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 605
    Width = 870
    Height = 19
    Panels = <
      item
        Text = 'OK'
        Width = 500
      end>
  end
  object dlgPageSetup: TPageSetupDialog
    MinMarginLeft = 0
    MinMarginTop = 0
    MinMarginRight = 0
    MinMarginBottom = 0
    MarginLeft = 0
    MarginTop = 0
    MarginRight = 0
    MarginBottom = 0
    PageWidth = 21000
    PageHeight = 29700
    Units = pmMillimeters
    Left = 190
    Top = 223
  end
  object dlgPrint: TPrintDialog
    Left = 46
    Top = 223
  end
  object dlgPrintSet: TPrinterSetupDialog
    Left = 118
    Top = 223
  end
  object xpmnfst: TXPManifest
    Left = 806
    Top = 559
  end
  object pmPagesTpl: TPopupMenu
    Images = Images16
    Left = 446
    Top = 359
    object actPageAdd1: TMenuItem
      Action = actPageAdd
    end
    object actPageDel1: TMenuItem
      Action = actPageDel
    end
    object actPageEdit1: TMenuItem
      Action = actPageEdit
    end
  end
  object pmTicketsTpl: TPopupMenu
    Images = Images16
    Left = 446
    Top = 415
    object actTicketAdd1: TMenuItem
      Action = actTicketAdd
    end
    object actTicketDel1: TMenuItem
      Action = actTicketDel
    end
    object actTicketEdit1: TMenuItem
      Action = actTicketEdit
    end
  end
  object alSettings: TActionList
    Images = Images16
    OnExecute = alSettingsExecute
    Left = 446
    Top = 303
    object actPageAdd: TAction
      Category = 'PagesTpl'
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      ImageIndex = 7
      OnExecute = DummyAction
    end
    object actPageDel: TAction
      Category = 'PagesTpl'
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 8
      OnExecute = DummyAction
    end
    object actPageEdit: TAction
      Category = 'PagesTpl'
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      ImageIndex = 13
      OnExecute = DummyAction
    end
    object actTicketAdd: TAction
      Category = 'TicketTpl'
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      ImageIndex = 25
      OnExecute = DummyAction
    end
    object actTicketDel: TAction
      Category = 'TicketTpl'
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 26
      OnExecute = DummyAction
    end
    object actTicketEdit: TAction
      Category = 'TicketTpl'
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      ImageIndex = 27
      OnExecute = DummyAction
    end
    object actNumLabelAdd: TAction
      Category = 'NumLabels'
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1091#1084#1077#1088#1072#1090#1086#1088
      ImageIndex = 43
      OnExecute = DummyAction
    end
    object actNumLabelDel: TAction
      Category = 'NumLabels'
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1085#1091#1084#1077#1088#1072#1090#1086#1088
      ImageIndex = 44
      OnExecute = DummyAction
    end
    object actNumLabelEdit: TAction
      Category = 'NumLabels'
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1085#1091#1084#1077#1088#1072#1090#1086#1088
      ImageIndex = 42
      OnExecute = DummyAction
    end
  end
  object alProjects: TActionList
    Images = Images16
    OnExecute = alProjectsExecute
    Left = 366
    Top = 303
    object actProjectAdd: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      ImageIndex = 28
      OnExecute = DummyAction
    end
    object actProjectAddSub: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1086#1076#1095#1080#1085#1077#1085#1085#1086#1075#1086
      ImageIndex = 29
      OnExecute = DummyAction
    end
    object actProjectDel: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 30
      OnExecute = DummyAction
    end
    object actProjectEdit: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      ImageIndex = 31
      OnExecute = DummyAction
    end
    object actProjectToFile: TAction
      Caption = #1069#1082#1089#1087#1086#1088#1090' '#1074' '#1092#1072#1081#1083
      ImageIndex = 45
      OnExecute = actProjectToFileExecute
    end
    object actProjectFromFile: TAction
      Caption = #1048#1084#1087#1086#1088#1090' '#1080#1079' '#1092#1072#1081#1083#1072
      ImageIndex = 46
      OnExecute = actProjectFromFileExecute
    end
    object actProjectListToBase: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1074#1089#1077
      OnExecute = DummyAction
    end
    object actProjectListToFile: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1074#1089#1077' '#1074' '#1092#1072#1081#1083
      OnExecute = DummyAction
    end
    object actProjectListFromBase: TAction
      Caption = #1055#1088#1086#1095#1080#1090#1072#1090#1100' '#1074#1089#1077
      OnExecute = DummyAction
    end
    object actProjectListFromFile: TAction
      Caption = #1055#1088#1086#1095#1080#1090#1072#1090#1100' '#1074#1089#1077' '#1080#1079' '#1092#1072#1081#1083#1072
      OnExecute = DummyAction
    end
    object actProjectCheck: TAction
      Caption = #1055#1088#1086#1074#1077#1088#1080#1090#1100' '#1085#1072' '#1086#1096#1080#1073#1082#1080
      OnExecute = DummyAction
    end
  end
  object pmProjects: TPopupMenu
    Images = Images16
    Left = 366
    Top = 359
    object actProjectAdd1: TMenuItem
      Action = actProjectAdd
    end
    object actProjectGroupAdd1: TMenuItem
      Action = actProjectAddSub
    end
    object actProjectDel1: TMenuItem
      Action = actProjectDel
    end
    object actProjectEdit1: TMenuItem
      Action = actProjectEdit
    end
    object miProjectCheck: TMenuItem
      Action = actProjectCheck
    end
    object N4: TMenuItem
      Action = actProjectToFile
    end
    object N8: TMenuItem
      Action = actProjectFromFile
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object N2: TMenuItem
      Action = actProjectListFromBase
    end
    object N3: TMenuItem
      Action = actProjectListToBase
    end
  end
  object pmViews: TPopupMenu
    Images = Images16
    Left = 432
    Top = 56
    object N5: TMenuItem
      Action = actClose
    end
    object N6: TMenuItem
      Action = actHide
    end
    object N7: TMenuItem
      Action = actDetach
    end
  end
  object alViews: TActionList
    Images = Images16
    OnExecute = alViewsExecute
    Left = 368
    Top = 56
    object actClose: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      ImageIndex = 6
      OnExecute = DummyAction
    end
    object actHide: TAction
      Caption = #1057#1087#1088#1103#1090#1072#1090#1100
    end
    object actDetach: TAction
      Caption = #1054#1090#1089#1086#1077#1076#1080#1085#1080#1090#1100
    end
  end
  object Images24: TImageList
    Height = 24
    Width = 24
    Left = 376
    Top = 152
    Bitmap = {
      494C010108000900040018001800FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      000000000000360000002800000060000000480000000100200000000000006C
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FEFCFA000000000000000000FDFAFA00EACFBD00DBB39A00DAB29C00ECD8
      CF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BFDABF007FB87F007FB67F007FB6
      7F00BFDABF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E7E7E700C5C6C500C4C4
      C400C4C4C400C3C4C400C3C4C400C2C2C200BFBFBE00BBB8B600BBB8B600BBB8
      B600D3B49200E2B88B00E0B89300D7791700DB750000DB750000D26C0000B54F
      0000B9714D00CDC9C800E3E3E3000000000000000000E7E7E700C5C6C500C4C4
      C400C4C4C400C3C4C400C3C4C400C2C2C200BFBFBE00BBB8B600BBB8B600BBB8
      B600BAB8B500B9B7B400B8B6B400BBBBBB00BEBEBF00BDBEBE00BDBEBE00C9CA
      CA00C1C1C100D5D6D600EEEEEE000000000000000000E6E7E700C3C4C400C2C2
      C200C2C2C200C1C2C200C0C2C200C0C1C100BFC0C000BEBEBE00BEBEBE00BDBE
      BE00BDBEBE00BBBCBC00BBBCBC00BBBBBB006DA76D0047D6700032CB5A002AC3
      4E00649C6500B8BABA00E3E3E300000000000000000000000000000000000000
      00000000000000000000FCFCFC00B3B3B3009B9B9B00A1A1A100AAAAAA00BABA
      BA00D0D0D000E6E6E600F9F9F900000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C3C4C400E8D1D100F0D8
      D800F0D8D800F0D8D800F0D8D800F0DADA00C3B8B800E9D2D200E9D2D200E9D2
      D200EABF9800E4861800ED8E1600FF9C0800F8930000E0790000C9722E00D99F
      8400EABFB500E6C1C000B8BABA000000000000000000C3C4C400E8D1D100F0D8
      D800F0D8D800F0D8D800F0D8D800F0DADA00C3B8B800E9D2D200E9D2D200E9D2
      D200E9D0D000E9D0D000E9CFCF00C3B3B200EFD0D000EFCECE00EFCDCD00AEAE
      E4008391B0009E9E9D00B4B4B4000000000000000000C5C6C500E9D2D200F5DC
      DC00F5DCDC00F5DCDC00F5DCDC00F5DCDC00C5BCBC00F6E2E200F4DCDC00F4DB
      DB00F4D8D800F4D8D800F5DCDC00C3B7B7007DB074005FE3880042DB750033CC
      5C007BA46C00E5BEBE00BCBDBD00000000000000000000000000000000000000
      000000000000F4F4F500A8A8A800D8D8D800BABABA00B4B4B400B7B7B700B6B6
      B600ACACAC00A1A1A100979797009C9C9C00A3A3A300ACACAC00C3C3C300D8D8
      D800F0F0F00000000000000000000000000000000000C3C4C400F5DCDC00FFE4
      E400FFE6E600FFE6E600FFE6E600FFE6E600CDC0BF00FFE8E800FFE8E800FFE6
      E600F6C79B00F8A94600FFAE4200FFA62600E5830900E7AD8700FFDEDE00FFD6
      D600FFD4D400F4CACA00B8BABA000000000000000000C3C4C400F5DCDC00FFE4
      E400FFE6E600FFE6E600FFE6E600FFE6E600CDC0BF00FFE8E800FFE8E800FFE6
      E600FFE4E400FFE4E400FFE2E200CEBCBA00FFDCDC00FFDCDC00B8B7EE003176
      FE005BB6F900C5D4DC00B2B1B1000000000000000000C4C5C500F1DBDB00FFE6
      E600FFE6E600FFE6E600FFE6E600FFE6E600CAC3C300FDEBEB00FFE6E600FFE4
      E400FFE4E400BFD4B4007FB8790071AD6E0040993B0061E68A0045DE780035CE
      5E004091390079A36A00669E6600BFDABF000000000000000000000000000000
      0000E6E6E600AAAAAA00E3E3E300E6E6E600BCBCBC00AB9A8C00B38F6F00B8A4
      9200B9BABA00BBBCBD00BEC0C200C1C2C200C4C4C400C4C4C400B9B9B900AAAA
      AA0094949400D0D0D000000000000000000000000000C4C4C400F5E1E100FFE8
      E800FFEAEA00FFEAEA00FFEAEA00FFEAEA00CDC2C200FFECEC00FFEAEA00FFEA
      EA00F8C99700FBB56200FFB96100F7A53B00E5A05E00FFE2E200FFDDDD00FFDE
      DE00FFDEDE00F6D8D700CDC7BC00FFF9F10000000000C4C4C400F5E1E100FFE8
      E800FFEAEA00FFEAEA00FFEAEA00FFEAEA00CDC2C200FFECEC00FFEAEA00FFEA
      EA00FFE8E800FFE6E600FFE4E400CEBCBA00FFE1E100B5B7F1003278FF005ABA
      FF005FC2FF003D87F400A2A4AF000000000000000000C5C5C400F1DFDF00FFEA
      EA00FFEAEA00FFEAEA00FFEAEA00FFEAEA00CAC4C400FDEDED00FFEAEA00FFE9
      E900FFE6E60080BA790053E27C003ED766003ED766004BE47E0048E17B003FD8
      6C0035CE5E0033CC5C002AC34E007FB67F00000000000000000000000000D2D2
      D200B5B5B500E9E9E900DCD0C700E5C7AE00BDBDBD00A6846900B8500000BC5B
      0A00B8BCBE00AB8A6F00B8692800BE916D00C2C3C400B6A59700BFB4AA00C4C4
      C400B8B8B800C6C6C600000000000000000000000000C4C4C400F5E4E400FFEC
      EC00FFECEC00FFEEEE00FFEEEE00FFEEEE00CDC2C200FFF0F000FFEEEE00FFEC
      EC00FBCC9300F8A63D00F7A13900F29D3600E7943700FBD4BD00FBD1BB00E793
      3900F39E3900F7A23A00F7A43C00FBD49D0000000000C4C4C400F5E4E400FFEC
      EC00FFECEC00FFEEEE00FFEEEE00FFEEEE00CDC2C200FFF0F000FFEEEE00FFEC
      EC00FFECEC00FFEAEA00FFE8E800CCC0BD00ABABCC003074F1005BBCFD005EC0
      FF003785FF0093A0ED00C5C6C5000000000000000000C6C6C600F1E2E200FFEE
      EE00FFEEEE00FFEEEE00FFEEEE00FFEEEE00CAC4C400FDF0F000FFECEC00FFEC
      EC00FFEAEA0080BD7A006BEF940052EB850051EA84004EE781004BE47E0048E1
      7B0045DE780042DB750032CB5A007FB67F000000000000000000D8D8D800C1C1
      C100EAEBEC00E0C0A900D2BBAC00D7B09500BFBFBF009F7E6700AE470000B352
      0800B7BABD00A7826700B44E0000B8713B00C0C3C500AC673300BC530000C0A1
      8400B6B6B600C6C6C600000000000000000000000000C5C5C500F5E7E700FFF0
      F000FFF0F000FFF2F200FFF2F200FFF2F200CDC6C500FFF2F200FFF2F200FFF0
      F000FFEDE300FFEBDE00FFEEEE00D8CDCB00FFE8E800FFE4E400FFE4E400E49D
      5A00F7A43C00FFBA6300FAB56200F8D2A30000000000C5C5C500F5E7E700FFF0
      F000FFF0F000FFF2F200FFF2F200FFF2F200CDC6C500FFF2F200FFF2F200DCD4
      D400B8B3B300B7B1B100DCD1D100CCC6C4009F9E9C0069A3CB005BBCFD003683
      FF009FA9F200F4D3D300BABBBB000000000000000000C6C6C600F2E5E500FFF0
      F000FFF2F200FFF2F200FFF2F200FFF2F200CAC6C600FDF3F300FFF0F000FFF0
      F000FFEEEE0080C07B007AF59E006EF397006CF195005DEC8B004EE781004BE4
      7E0061E68A005FE3880047D670007FB87F000000000000000000CACACA00D4D0
      CC00E9D7C800C88A5E00C7AFA100C8987C00C0C0C000988174009A461400A94B
      0800B4B7B900A07A6300AB440000AF673400C0C3C500A15B2C00B04A0000BA9C
      8500B4B4B400C4C4C400000000000000000000000000C5C5C500F6EAEA00FFF2
      F200FFF4F400FFF4F400FFF6F600FFF6F600CDC8C600FFF6F600FFF6F600FFF4
      F400FFF2F200FFF0F000FFEEEE00CEC3C100FFE8E800FFE8E800E7B08A00E482
      0A00FFA62800FFAE4200F8A94600F6D3A90000000000C5C5C500F6EAEA00FFF2
      F200FFF4F400FFF4F400FFF6F600FFF6F600CDC8C700F0EAEA009C9B9A00B7A5
      8A00DDC29900DFC49B00B9A78C0075747500B2B2B200D2D2D2004474C500A3AC
      F100FFDFDF00F4D3D300BABBBB000000000000000000C7C7C700F2E9E900FFF4
      F400FFF6F600FFF6F600FFF6F600FFF6F600CAC8C800FDF6F600FFF4F400FFF2
      F200FFF0F000BFDCB9007FC27B0071B56F0040A33D006CF1950051EA84003ED7
      660040993B007BAF73006EA86E00BFDABF000000000000000000CACACA00C9B7
      AB00DDBAA200AE643800CBC3C000E2DEDD00C0C0C000B0B1B100B2B4B500AFB2
      B400B5B5B500A89F9B00A5826D00AA897200BEC0C2008F573700A3440400B396
      8000B2B2B200C4C4C400000000000000000000000000C5C6C500C4C1C100C8C4
      C400C8C4C400C8C4C400C8C6C600C8C6C600B1B0AF00CDC9C800CDC9C800CDC8
      C600CDC6C500CDC6C500D1C8C800C8B3A800D3A48A00C8743100DF790000F893
      0000FE9C0A00ED8E1600E5871900F4D3AF0000000000C5C6C500C4C1C100C8C4
      C400C8C4C400C8C4C400C8C6C600C8C6C600C3C2C1009C999400E1C39000EBCA
      9000EBC99100ECCA9400EDCD9C00E5C49200817F7C0090909000A9A8A700CBC1
      C100C8BBBB00C3B7B700BBBCBC000000000000000000C5C5C400C6C2C000CEC8
      C600CEC8C600CEC8C600CEC8C600CEC8C600B4B1AE00CDC8C600CEC6C400CEC6
      C400CEC6C400CEC5C300CDC5C300B3ADAB0073B670006EF3970052EB85003ED7
      660073AD6D00C3B3B200BBBBBB00000000000000000000000000CACACA00C4B0
      A400CDA28800C2B0A700EDEEEF00ECEDED00C1C1C100A89E9600B1896600B69A
      8100B4B4B400B2B4B500B6B9BC00B8BABC00BABABA00BEBFC000B8BCBE00B9BA
      BA00B2B2B200C4C4C400000000000000000000000000C7C7C700F7F3F300FDF8
      F800FDF8F800FDFAFA00FDFAFA00FDFAFA00CCCAC900FFFCFC00FFFCFC00FFFA
      FA00FFF8F800FFF6F600FBECEA00AE633C00B54F0000D36D0000DD770000DC76
      0000D8781500E7B59000CD9F7000F3D4B50000000000C7C7C700F7F3F300FDF8
      F800FDF8F800FDFAFA00FDFAFA00FDFAFA00BEBEBF00D7C09A00F1D5A100F1D5
      A100F0D29E00EFD09900EECB9100EED0A200DCC19900B3AEAF00FDECEC00FDE7
      E700FDE5E500F5DCDC00BBBCBC000000000000000000C5C2C00054B3F30050BA
      FF0052BCFF0053BEFF0054BFFF0055C0FF002994E70055BFFF0050BAFF004EB8
      FF004BB5FF0048B3FF0049B3FF001F87E6004EB080007AF59E006BEF940053E2
      7C004AA580003897F000B8B6B400000000000000000000000000CACACA00C5BB
      B500E0D9D600EEEEEE00E0CFC100EACFB900C2C2C200A28F7F00B8500000BC53
      0000B3B3B300A98C7200BA5D0F00BE814D00B8BABC00AE907400B8977800BCB3
      AA00B0B1B100C4C4C400000000000000000000000000C7C8C800F6F2F200FFFC
      FC0000000000000000000000000000000000CDCCCB000000000000000000FFFC
      FC00FFFAFA00FFF8F800FFF6F600CFC8C600EBCDC300D8A99100DAA88D00EAC2
      AE00FDE5E300F4D8D800BCBDBD00FEFCFA0000000000C7C8C800F6F2F200FFFC
      FC0000000000000000000000000000000000A9A7A100F5DCAC00F4DEB100F4DE
      B100F3DDAE00F2D8A700F0D29E00ECCA9300F0CE9A00A5A19F00FFEAEA00FFE6
      E600FFE2E200F4D8D800BCBDBD000000000000000000C6C2C00059B4F20056BC
      FF0058BEFF005AC0FF005AC0FF005BC1FF002B94E5005BC1FF0055BBFF0053B9
      FF0050B6FF004DB3FF004DB3FF001F87E30076C2BF004EAE80004DAB80004CA8
      800071B9BF003C98EF00B9B7B400000000000000000000000000CACACA00E3E3
      E400EEEEEE00DDAD8700D4B8A500DEBBA400C3C3C3009D877900AE470000B44C
      0000AFB0B100A3836C00B44C0000B66A2F00B7BABD00A8643100BA530000BA94
      7200AEAEAE00C4C4C400000000000000000000000000C8C8C800F6F5F5000000
      000000000000000000000000000000000000CCCCCB0000000000000000000000
      0000FFFCFC00FFFAFA00FFF8F800CEC6C400FFF0F000FFEEEE00FFEAEA00FFE6
      E600FFE4E400F4D8D800BDBEBE000000000000000000C8C8C800F6F5F5000000
      000000000000000000000000000000000000ADA89C00F7E5BB00F9ECC900F8ED
      CA00F7E7C000F5E0B400F2D9A800ECCD9600F1D19F00A69D9400FFEEEE00FFE6
      E600FFE4E400F4D8D800BDBEBE000000000000000000C7C4C2005BB6F20058BE
      FF005AC0FF005DC3FF005EC4FF005FC5FF002C95E4005EC4FF0058BEFF0055BB
      FF0052B8FF004FB5FF004FB5FF001F88E30047ADFF0043A9FF0040A6FF003DA3
      FF00399FFF003D98EF00B9B8B500000000000000000000000000CCCCCC00D4C5
      BA00E9C9B000C4845A00C7A89700D0A68D00C4C4C400938075009F3C0200AD44
      0000ABABAC009C7A6500AA430000AD632F00B5B9BB009E572A00B04A0000B28E
      7100ACACAC00C4C4C400000000000000000000000000C8C8C800F6F6F6000000
      000000000000000000000000000000000000CDCCCB0000000000000000000000
      000000000000FFFCFC00FFFAFA00CEC6C400FFF2F200FFF0F000FFECEC00FFE8
      E800FFE4E400F4DBDB00BDBEBE000000000000000000C8C8C800F6F6F6000000
      000000000000000000000000000000000000B0ADA900FBEFCA00FBF6DF00FCF7
      E300FAF0D000F7E8C100F3DEB000EDD19D00F2D29C00A3A09D00FFEEEE00FFE8
      E800FFE4E400F4DBDB00BDBEBE000000000000000000C7C4C2005CB8F20059BF
      FF005DC3FF005FC5FF0061C7FF0063C9FF002D95E40060C6FF0059BFFF0056BC
      FF0053B9FF0050B6FF0050B6FF002088E30047ADFF0043A9FF0040A6FF003DA3
      FF003AA0FF003D99F000BAB8B500000000000000000000000000CCCCCC00CBB7
      AB00DAB39A00AB5F3400C9BAB200E3DAD500C4C4C400A8A8A800A4A7A800A3A3
      A300ACACAC009F9691009E7A6500A5846E00B2B4B5008E593D00A0491200AB8A
      7300AAAAAA00C4C4C400000000000000000000000000C9C9C800F6F6F6000000
      000000000000000000000000000000000000CDCCCB0000000000000000000000
      00000000000000000000FFFAFA00CEC6C400FFF4F400FFF0F000FFECEC00FFEA
      EA00FFE6E600F4DCDC00BEBFBF000000000000000000C9C9C800F6F6F6000000
      000000000000000000000000000000000000CFCFD000DDD6BD00FDFBE900FEFE
      F500FCF6DB00F9ECC900F4E0B400EDD3A000D7C09A00BBB7B800FFECEC00FFEA
      EA00FFE6E600F4DCDC00BEBEBF000000000000000000C8C5C3005DB9F2005AC0
      FF005DC3FF0060C6FF0064CAFF0065CBFF002D95E40061C7FF005AC0FF0056BC
      FF0053B9FF0050B6FF0050B6FF002088E30047ADFF0043A9FF0040A6FF003DA3
      FF003AA0FF003E99F000BBB8B600000000000000000000000000CCCCCC00C4AD
      A100CBA18900D4CCC700F4F4F500F2F3F400C4C4C400A39F9A00A79D9500AAAA
      AA00AAAAAA00ACACAC00ADAFB000AFAFB000AEAEAE00B1B2B300B1B4B600B0B1
      B100A8A8A800C4C4C400000000000000000000000000C9C9C800F7F7F700FDFC
      FC00FDFCFC00FDFCFC00FDFCFC00FDFCFC00CCCAC90000000000000000000000
      00000000000000000000FFFCFC00CDC8C600FDF6F600FDF3F300FDF0F000FDED
      ED00FDEBEB00F6E2E200BEBFBF000000000000000000C9C9C800F7F7F700FDFC
      FC00FDFCFC00FDFCFC00FDFCFC00FDFCFC00E0DFDE00B8B7B300EEEBD400FDFB
      E900FCF6DD00F8EBC600F5E0B300E3CC9E009B999500F7F0F000FDF0F000FDEC
      EC00FDEBEB00F6E2E200BEBEBF000000000000000000C8C6C5005AB9F40057C1
      FF005AC4FF005DC7FF005FC9FF0060CAFF002B94E5005DC8FF0056C1FF0053BD
      FF0050BAFF004CB7FF004CB7FF001F87E60044AEFF003FAAFF003CA7FF0039A3
      FF0036A0FF003A99F100BBB8B600000000000000000000000000CCCCCC00DDDC
      DB00F5F7F700F3F1F000E4D2C400EED4BF00C4C4C400A0856F00BC530000C258
      0000ABADAF00A3866C00B6682700BB845600ADAFB000A98C7200B2907000B3A8
      9D00A6A6A600C3C3C300000000000000000000000000CACACA00C5C6C500CACA
      CA00CACACA00CACACA00CACACA00CACACA00B3B2B100CDCCCC00CDCCCC00CDCC
      CC00CDCCCC00CDCCCC00CDCBCB00B4B1AE00CAC8C800CAC6C600CAC4C400CAC4
      C400CAC3C300C5BCBC00BFC0C0000000000000000000CACACA00C5C6C500CACA
      CA00CACACA00CACACA00CACACA00CACACA00B3B2B100E2E2E200B9B9B700BFBA
      A800D5CCB000D6C8A900B7AD9700A09F9E00D6D5D500CAC6C600CAC4C400CAC4
      C400CAC3C300C5BCBC00BFC0C0000000000000000000C8C8C800C5C6C500CDCC
      CB00CDCCCB00CCCCCB00CCCCCB00CCCCCB00B3B2B100CCCAC900CDCCCB00CDCC
      CB00CCCCCB00CDCCCB00CCCAC900B1B0AF00CDC8C600CDC6C500CDC2C200CDC2
      C200CDC0BF00C3B8B800BEBEBE00000000000000000000000000CCCCCC00E8E7
      E600F2EDE800DBA77E00D8BAA700E0C0A900C5C6C6009A816F00B24A0000B750
      0000A7A9AB009F7D6200B44E0000B7662400ABAEB100A8643100BA530000B68A
      6400A4A4A400C3C3C300000000000000000000000000CBCBCB00F6F6F6000000
      000000000000000000000000000000000000CCCCCB0000000000000000000000
      00000000000000000000FFFCFC00CEC8C600FFF6F600FFF2F200FFEEEE00FFEA
      EA00FFE6E600F5DCDC00C0C1C1000000000000000000CBCBCB00F6F6F6000000
      000000000000000000000000000000000000CCCCCB000000000000000000E9E9
      E900D1D1D200CDCDCD00E3E2E200D8D4D300FFF6F600FFF2F200FFEEEE00FFEA
      EA00FFE6E600F5DCDC00C0C1C1000000000000000000CBCBCB00F3F3F3000000
      000000000000000000000000000000000000CACACA00FDFCFC00000000000000
      00000000000000000000FDFAFA00C8C6C500FFF6F600FFF2F200FFEEEE00FFEA
      EA00FFE6E600F0DADA00C2C2C200000000000000000000000000CECECE00D9C5
      B700E8CEB900C4845A00CBA69100D5AE9700C6C6C600937C6D00A9400000B148
      0000A3A4A50097745E00AB440000AE5E2500A9ADAF009D5A2E00B04A0000AD86
      6600A3A3A300C4C4C400000000000000000000000000CCCCCC00F7F7F7000000
      000000000000000000000000000000000000CCCCCB0000000000000000000000
      00000000000000000000FFFCFC00CEC8C600FFF6F600FFF2F200FFEEEE00FFEA
      EA00FFE6E600F5DCDC00C1C2C2000000000000000000CCCCCC00F7F7F7000000
      000000000000000000000000000000000000CCCCCB0000000000000000000000
      00000000000000000000FFFCFC00CEC8C600FFF6F600FFF2F200FFEEEE00FFEA
      EA00FFE6E600F5DCDC00C1C2C2000000000000000000CDCDCD00F3F3F3000000
      000000000000000000000000000000000000CACACA00FDFCFC00000000000000
      00000000000000000000FDFAFA00C8C6C500FFF6F600FFF2F200FFEEEE00FFEA
      EA00FFE6E600F0D8D800C3C3C300000000000000000000000000CECECE00CEB6
      A800D8B8A400AB613700C5AD9F00DDCCC100C6C6C60096929000947A6B009F79
      5F00A1A1A100937F7500975A3900A0694500A8AAAC008A4E2D00A4410200A780
      6300A1A1A100C3C3C300000000000000000000000000CCCCCC00F7F7F7000000
      000000000000000000000000000000000000CCCCCB0000000000000000000000
      00000000000000000000FFFCFC00CEC8C600FFF6F600FFF2F200FFEEEE00FFEA
      EA00FFE6E600F5DCDC00C1C2C2000000000000000000CCCCCC00F7F7F7000000
      000000000000000000000000000000000000CCCCCB0000000000000000000000
      00000000000000000000FFFCFC00CEC8C600FFF6F600FFF2F200FFEEEE00FFEA
      EA00FFE6E600F5DCDC00C1C2C2000000000000000000CDCDCD00F3F3F3000000
      000000000000000000000000000000000000CACACA00FDFCFC00000000000000
      00000000000000000000FDFAFA00C8C4C400FFF4F400FFF2F200FFEEEE00FFEA
      EA00FFE6E600F0D8D800C3C4C400000000000000000000000000CCCCCC00C2A7
      9900D0B2A300D6C7BE00FCFCFC00F9F9F900D0D0D000A6A6A6009F9F9F009C9C
      9C009F9F9F00A1A1A100A2A3A400A3A4A500A4A4A400A4A7A800A0A4A600A2A3
      A4009F9F9F00C1C1C100000000000000000000000000CCCCCC00F7F7F7000000
      000000000000000000000000000000000000CDCCCB0000000000000000000000
      00000000000000000000FFFAFA00CEC8C600FFF6F600FFF2F200FFEEEE00FFEA
      EA00FFE6E600F5DCDC00C2C2C2000000000000000000CCCCCC00F7F7F7000000
      000000000000000000000000000000000000CDCCCB0000000000000000000000
      00000000000000000000FFFAFA00CEC8C600FFF6F600FFF2F200FFEEEE00FFEA
      EA00FFE6E600F5DCDC00C2C2C2000000000000000000CDCDCD00F3F3F3000000
      000000000000000000000000000000000000CACACA00FDFCFC00000000000000
      00000000000000000000FDF8F800C8C4C400FFF4F400FFF0F000FFECEC00FFEA
      EA00FFE6E600F0D8D800C3C4C400000000000000000000000000CECECE00F1F2
      F300FEFEFE00FCFCFC00F2F2F200E6E6E600E3E3E300D6D6D600CECECE00D2D2
      D200D2D2D200D2D2D200D0D0D000CECECE00CACACA00C3C3C300BABABA00B4B4
      B400A3A3A300C1C1C100000000000000000000000000CDCCCC00F7F7F7000000
      000000000000000000000000000000000000CDCCCB0000000000000000000000
      000000000000FFFCFC00FFFAFA00CEC8C600FFF4F400FFF0F000FFEEEE00FFEA
      EA00FFE6E600F5DCDC00C2C2C2000000000000000000CDCDCD00F7F7F7000000
      000000000000000000000000000000000000CDCCCB0000000000000000000000
      000000000000FFFCFC00FFFAFA00CEC8C600FFF4F400FFF0F000FFEEEE00FFEA
      EA00FFE6E600F5DCDC00C2C2C2000000000000000000CECECE00F3F3F3000000
      000000000000000000000000000000000000CACACA00FDFCFC00000000000000
      000000000000FFFDFD00FDF8F800C8C4C400FFF2F200FFF0F000FFECEC00FFE9
      E900FFE4E400F0D8D800C4C5C500000000000000000000000000CECECE00E9E9
      E900E3E3E300D8D8D800E6E6E600EDEDED00EEEEEE00DADADA00C1C1C100BFBF
      BF00BDBDBD00BCBCBC00BABABA00BABABA00C1C1C100CACACA00C1C1C100B4B4
      B400B6B6B600EEEEEE00000000000000000000000000CFCFCF00ECECEC00F3F3
      F300F3F3F300F3F3F300F3F3F300F3F3F300C5C6C500EDEDED00EDEDED00EDED
      ED00ECEAEA00ECEAEA00ECE7E700C6C2C100F2E9E900F2E5E500F1E2E200F1DF
      DF00F1DBDB00E9D2D200C4C4C4000000000000000000CFCFCF00ECECEC00F3F3
      F300F3F3F300F3F3F300F3F3F300F3F3F300C5C6C500EDEDED00EDEDED00EDED
      ED00ECEAEA00ECEAEA00ECE7E700C6C2C100F2E9E900F2E5E500F1E2E200F1DF
      DF00F1DBDB00E9D2D200C4C4C4000000000000000000CFCFCF00ECECEC00F7F7
      F700F7F7F700F7F7F700F7F7F700F6F6F600C5C6C500F7F7F700F6F6F600F6F6
      F600F6F5F500F6F2F200F7F3F300C4C1C100F6EAEA00F5E7E700F5E4E400F5E1
      E100F5DCDC00E8D1D100C5C6C500000000000000000000000000EDEDED00C3C3
      C300BDBDBD00B3B3B300EAEAEA00E0E0E000DCDCDC00DDDDDD00E2E2E200E7E7
      E700EBEBEB00F0F0F000F6F6F600EBEBEB00C4C4C400A8A8A800D5D5D5000000
      00000000000000000000000000000000000000000000EBEBEB00CFCFCF00CECE
      CE00CDCCCC00CDCCCC00CDCCCC00CCCCCC00C9C9C800C9C6C400C8C5C300C8C5
      C300C7C4C200C6C2C100C6C2C100C5C5C500C7C7C700C6C6C600C6C6C600C5C6
      C500C5C6C500C5C6C500E6E7E7000000000000000000EBEBEB00CFCFCF00CECE
      CE00CDCDCD00CDCDCD00CDCDCD00CCCCCC00C9C9C800C9C6C400C8C5C300C8C5
      C300C7C4C200C6C2C100C6C2C100C5C5C500C7C7C700C6C6C600C6C6C600C5C6
      C500C5C6C500C5C6C500E6E7E7000000000000000000EBEBEB00CFCFCF00CDCD
      CD00CCCCCC00CCCCCC00CCCCCC00CBCBCB00CACACA00C9C9C900C9C9C900C8C8
      C800C8C8C800C7C8C800C6C6C600C5C5C400C5C5C400C5C5C400C4C5C500C3C4
      C400C2C4C400C2C4C400E7E7E700000000000000000000000000000000000000
      000000000000E4E4E400C8C8C800C0C0C000BCBCBC00B9B9B900B7B7B700B4B4
      B400B2B2B200B4B4B400B6B6B600C8C8C800EBEBEB00FEFEFE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DCDDF500BBBEEC00FCFC
      FE00000000000000000000000000E7E7F500F4F4FB0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000D0D0D000ACACAC00ABABAB00AAAAAA00A9A9A900A8A8A800A6A6
      A600D0D0D00000000000000000000000000000000000E7E7E700C5C6C500C4C4
      C400C4C4C400C3C4C400C3C4C400C2C2C200BFBFBE00BBB8B600BBB8B600BBB8
      B600BAB8B500B9B7B400B8B6B400BBBBBB00BEBFBF00BDBEBE00BDBEBE00BCBD
      BD00BBBCBC00BCBDBD00E3E3E30000000000F2F2FC00203AD8001130C7003543
      C600C1C3E000C5C6C500C1C3DB002132C4001827B3006E71C900C9C8C600BBB8
      B500BAB8B500B9B7B400B8B6B400BBBBBB00BEBFBF00BDBEBE00BDBEBE00BCBD
      BD00BBBCBC00BCBDBD00E3E3E3000000000000000000E7E7E700C5C6C600C4C4
      C400C4C4C400C3C4C400C3C4C400C2C2C200BFBFBE00BBB8B600BBB8B600BBB8
      B600BAB8B500B9B7B400B8B6B400BBBBBB00BEBFBF00BDBEBE00BDBEBE00BCBD
      BD00BBBCBC00BCBDBD00E3E3E3000000000000000000E7E7E700C5C6C500C4C4
      C400C4C4C400C3C4C400C3C4C400C2C2C200BFBFBE00BBB8B600BBB8B600BBB8
      B600C9C6C40092929200EFEFEF00EEEEEE00D9CDC600DBDBDB00EDEDED00EEEE
      EE0084848400C9CACA00E3E3E3000000000000000000C3C4C400E8D1D100F0D8
      D800F0D8D800F0D8D800F0D8D800F0DADA00C3B8B800E9D2D200E9D2D200E9D2
      D200E9D0D000E9D0D000E9CFCF00C3B3B200EFD0D000EFCECE00EFCCCC00EECA
      CA00EEC7C700E5BEBE00B8BABA0000000000BEC2F1001841E100265EFF001D48
      DB00172BB9009591D2002032CB00164BFE001144F2000826BC008B85C900E9D2
      D200E9D0D000E9D0D000E9CFCF00C3B3B200EFD0D000EFCECE00EFCCCC00EECA
      CA00EEC7C700E5BEBE00B8BABA000000000000000000C3C4C400E8D1D100F0D8
      D800F0D8D800F0D8D800F0D8D800F0DADA00C3B8B800E9D2D200E9D2D200E9D2
      D200E9D0D000E9D0D000E9CFCF00C3B3B200EFD0D000EFCECE00EFCCCC00EECA
      CA00EEC7C700E5BEBE00B8BABA000000000000000000C3C4C400E8D1D100F0D8
      D800F0D8D800F0D8D800F0D8D800F0DADA00C3B8B800E9D2D200E9D2D200E9D2
      D200EEDBDB00A1A0A00000000000FAF2ED00B2561B00BFB2AA00FEFEFE000000
      000093919100E8C9C900B8BABA000000000000000000C3C4C400F5DCDC00FFE4
      E400FFE6E600FFE6E600FFE6E600FFE6E600CDC0BF00FFE8E800FFE8E800FFE6
      E600FFE4E400FFE4E400FFE2E200CEBCBA00FFDDDD00FFDBDB00FFD9D900FFD6
      D600FFD4D400F4CACA00B8BABA0000000000000000002C4CE2002F68FF00295E
      FF002251E9000F2DC3001F54FE001B51FF00174EFF000E3CEC006060C500FFE8
      E800FFE4E400FFE4E400FFE2E200CEBCBA00FFDDDD00FFDBDB00FFD9D900FFD6
      D600FFD4D400F4CACA00B8BABA000000000000000000C3C4C400F5DCDC00FFE4
      E400FFE6E600FFE6E600FFE6E600FFE6E600CDC0BF00FFE8E800FFE8E800FFE6
      E600FFE4E400FFE4E400FFE2E200CEBCBA00FFDDDD00FFDBDB00FFD9D900FFD6
      D600FFD4D400F4CACA00B8BABA000000000000000000C3C4C400F5DCDC00FFE5
      E500FFE6E600FFE6E600FFE6E600FFE6E600CDC0BF00FFE8E800FFE8E800FFE6
      E600FFEAEA00A3A2A200FEFEFE00CE8F6400AD470000B56B3600D9D9D900FEFE
      FE0095939300F4D3D300B8BABA000000000000000000C4C4C400F5E1E100FFE8
      E800FFEAEA00FFEAEA00FFEAEA00FFEAEA00CDC2C200FFECEC00FFEAEA00FFEA
      EA00FFE8E800FFE6E600FFE4E400CEBCBA00FFE0E000FFDEDE00FFDBDB00FFD9
      D900FFD6D600F4CDCD00B8BABA0000000000000000007682DD00244DE3003672
      FF002C61FF00275CFE002459FF001F56FF00133AE6006E6FCE00FAEAED00FFEA
      EA00FFE8E800FFE6E600FFE4E400CEBCBA00FFE0E000FFDEDE00FFDBDB00FFD9
      D900FFD6D600F4CDCD00B8BABA000000000000000000C4C4C400F5E1E100FFE8
      E800FFEAEA00FFEAEA00FFEAEA00FFEAEA00CDC2C200FFECEC00FFEAEA00FFEA
      EA00FFE8E800FFE6E600FFE4E400CEBCBA00FFE0E000FFDEDE00FFDBDB00FFD9
      D900FFD6D600F4CDCD00B8BABA000000000000000000C4C4C400F5E1E100FFE8
      E800FFEAEA00FFEAEA00FFEAEA00FFEAEA00CDC2C200FFECEC00FFEAEA00FFEA
      EA00FFEEEE00A5A5A500E8CCB800B44E0200B5500400B8510000B8927500EFEF
      EF0095939300F4D5D500B8BABA000000000000000000C4C4C400F5E4E400FFEC
      EC00FFECEC00FFEEEE00FFEEEE00FFEEEE00CDC2C200FFF0F000FFEEEE00FFEC
      EC00FFECEC00FFEAEA00FFE8E800CEBFBC00FFE2E200FFE0E000FFDEDE00FFDB
      DB00FFD9D900F3CFCF00B9BBBB000000000000000000CACACA00C8C3E7002E46
      D7003670FE002D62FF00285DFF00173EDE006065C300FFF0F000FFEEEE00FFEC
      EC00FFECEC00FFEAEA00FFE8E800CEBFBC00FFE2E200FFE0E000FFDEDE00FFDB
      DB00FFD9D900F3CFCF00B9BBBB000000000000000000C4C4C400F5E4E400FFEC
      EC00FFECEC00FFEEEE00FFEEEE00FFEEEE00CDC2C200FFF0F000FFEEEE00FFEC
      EC00FFECEC00FFEAEA00FFE8E800CEBFBC00FFE2E200FFE0E000FFDEDE00FFDB
      DB00FFD9D900F3CFCF00B9BBBB000000000000000000C4C4C400F5E4E400FFEC
      EC00FFECEC00FFEEEE00FFEEEE00FFEEEE00CDC2C200FFF0F000FFEEEE00FFEC
      EC00FFF0F000A79E9700C2671C00BD5A0900D8BDA700C05D0700C2620D00C0B6
      AD0094929200F3D6D600B9BBBB000000000000000000C5C5C500F5E7E700FFF0
      F000FFF0F000FFF2F200FFF2F200FFF2F200CDC6C500FFF2F200FFF2F200FFF0
      F000FFEEEE00FFECEC00FFEAEA00CEC0BE00FFE4E400FFE2E200FFE0E000FFDE
      DE00FFDBDB00F4D1D100BABBBB000000000000000000C5C5C500F1E6EA00304C
      DF00386EFF003368FF002E65FF00204CDC002837BC00F6EDF400FFF2F200FFF0
      F000FFEEEE00FFECEC00FFEAEA00CEC0BE00FFE4E400FFE2E200FFE0E000FFDE
      DE00FFDBDB00F4D1D100BABBBB000000000000000000C5C5C500F5E7E700FFF0
      F000FFF0F000FFF2F200FFF2F200FFF2F200CDC6C500FFF2F200FFF2F200FFF0
      F000FFEEEE00FFECEC00FFEAEA00CEC0BE00FFE4E400FFE2E200FFE0E000FFDE
      DE00FFDBDB00F4D1D100BABBBB000000000000000000C5C5C500F5E7E700FFF0
      F000FFF0F000FFF2F200FFF2F200FFF2F200CDC6C500FFF2F200FFF2F200FFF0
      F000FFF2F200AD632300C15B0000D3A68000F2F2F200E0AD7F00C6600000C57B
      340078767600F4D8D800BABBBB000000000000000000C5C5C500F6EAEA00FFF2
      F200FFF4F400FFF4F400FFF6F600FFF6F600CDC8C600FFF6F600FFF6F600FFF4
      F400FFF2F200FFF0F000FFEEEE00CEC3C100FFE8E800FFE4E400FFE2E200FFE0
      E000FFDDDD00F4D3D300BABBBB000000000000000000C5C6C500A7AAE6003161
      F2003B6EFF00244CEC00285CED002D64FF00183CC9006F75D700FFF6F600FFF4
      F400FFF2F200FFF0F000FFEEEE00CEC3C100FFE8E800FFE4E400FFE2E200FFE0
      E000FFDDDD00F4D3D300BABBBB000000000000000000C5C5C500F6EAEA00FFF2
      F200FFF4F400FFF4F400FFF6F600FFF6F600CDC8C600FFF6F600FFF6F600FFF4
      F400FFF2F200FFF0F000FFEEEE00CEC3C100FFE8E800FFE4E400FFE2E200FFE0
      E000FFDDDD00F4D3D300BABBBB000000000000000000C5C5C500F6EAEA00FFF2
      F200FFF4F400FFF4F400FFF6F600FFF6F600CDC8C600FFF6F600FFF6F600FFF4
      F400ECC7A900C55F0000B36A2600A3A2A200A1A0A0009D9B9900BA691700D069
      00009E6D3E00E1CACA00BABBBB000000000000000000C5C6C500C4C1C100C8C4
      C400C8C4C400C8C4C400C8C6C600C8C6C600B1B0AF00CDC9C800CDC9C800CDC8
      C600CDC6C500CDC6C500CDC4C400B3ADAB00C8C0C000C8BFBF00C8BCBC00C8BC
      BC00C8BBBB00C3B7B700BBBCBC000000000000000000D1D1D1004E65E400497F
      FF003867F8004B5BD1006B74D000285CED00275CF9000F2ABB00AFB0DC00CDC8
      C800CDC6C500CDC6C500CDC4C400B3ADAB00C8C0C000C8BFBF00C8BCBC00C8BC
      BC00C8BBBB00C3B7B700BBBCBC000000000000000000C5C6C600C4C1C100C8C4
      C400C8C4C400C8C4C400C8C6C600C8C6C600B1B0AF00CDC9C800CDC9C800CDC8
      C600CDC6C500CDC6C500CDC4C400B3ADAB00C8C0C000C8BFBF00C8BCBC00C8BC
      BC00C8BBBB00C3B7B700BBBCBC000000000000000000C5C6C500C4C1C100C8C4
      C400C8C4C400C8C4C400C8C6C600C8C6C600B1B0AF00CDC9C800CDC9C800CDC8
      C600D6C2B000CD741C00CEC3BC00BEBAB800CAC4C400CAC4C400D3BEAC00D574
      0900DA750500B3977C00C3C4C4000000000000000000C7C7C700F7F3F300FDF8
      F800FDF8F800FDFAFA00FDFAFA00FDFAFA00CCCAC900FFFCFC00FFFCFC00FFFA
      FA00FFF8F800FFF6F600FFF2F200CDC5C300FDEEEE00FDECEC00FDE9E900FDE7
      E700FDE5E500F5DCDC00BBBCBC000000000000000000D8D8D8003E5EF1004C85
      FC002648E500E5E6F900FDFCFC006E7AE0002860F3001E4EEC003A48CC00FFFA
      FA00FFF8F800FFF6F600FFF2F200CDC5C300FDEEEE00FDECEC00FDE9E900FDE7
      E700FDE5E500F5DCDC00BBBCBC000000000000000000C7C7C700F7F3F300FDF8
      F800FDF8F800FDFAFA00FDFAFA00FDFAFA00CCCAC900FFFCFC00FFFCFC00FFFA
      FA00FFF8F800FFF6F600FFF2F200CDC5C300FDEEEE00FDECEC00FDE9E900FDE7
      E700FDE5E500F5DCDC00BBBCBC000000000000000000C7C7C700F7F3F300FDF8
      F800FDF8F800FDFAFA00FDFAFA00FDFAFA00CCCAC900FFFCFC00FFFCFC00FFFA
      FA00FFF6F600FCE7D800FFF2F200CDC5C300FDEEEE00FDECEC00FDEAEA00F4C4
      9500DE790000E2810F00B6A69300F7F7F70000000000C7C8C800F6F2F200FFFC
      FC0000000000000000000000000000000000CDCCCB000000000000000000FFFC
      FC00FFFAFA00FFF8F800FFF6F600CEC5C300FFEEEE00FFECEC00FFE8E800FFE6
      E600FFE2E200F4D8D800BCBDBD000000000000000000C7C8C800E6E6F5008192
      F00098A6F4000000000000000000FCFCFE005B69D8007C85E000E4E5F900FFFC
      FC00FFFAFA00FFF8F800FFF6F600CEC5C300FFEEEE00FFECEC00FFE8E800FFE6
      E600FFE2E200F4D8D800BCBDBD000000000000000000C7C8C800F6F2F200FFFC
      FC0000000000000000000000000000000000CDCCCB000000000000000000FFFC
      FC00FFFAFA00FFF8F800FFF6F600CEC5C300FFEEEE00FFECEC00FFE8E800FFE6
      E600FFE2E200F4D8D800BCBDBD000000000000000000C7C8C800F6F2F200FFFC
      FC0000000000000000000000000000000000CDCCCB000000000000000000FFFC
      FC00FFFAFA00FFF8F800FFF6F600CEC5C300FFEEEE00FFECEC00FFE8E800FFE8
      E800EFAA5800E7810000E4902500E4E4E40000000000C8C8C800F6F5F5000000
      000000000000000000000000000000000000CCCCCB0000000000000000000000
      0000FFFCFC00FFFAFA00FFF8F800CEC6C400FFF0F000FFEEEE00FFEAEA00FFE6
      E600FFE4E400F4D8D800BDBEBE000000000000000000C8C8C800F6F5F5000000
      000000000000000000000000000000000000D5D5D40000000000000000000000
      0000FFFCFC00FFFAFA00FFF8F800CEC6C400FFF0F000FFEEEE00FFEAEA00FFE6
      E600FFE4E400F4D8D800BDBEBE000000000000000000C8C8C800F6F5F5000000
      000000000000000000000000000000000000CCCCCB0000000000000000000000
      0000FFFCFC00FFFAFA00FFF8F800CEC6C400FFF0F000FFEEEE00FFEAEA00FFE6
      E600FFE4E400F4D8D800BDBEBE000000000000000000C8C8C800F6F5F5000000
      000000000000000000000000000000000000CCCCCB0000000000000000000000
      0000FFFCFC00FFFAFA00FFF8F800CEC6C400FFF0F000FFEEEE00FFEAEA00FFE6
      E600FFE5DF00F49F3100ED931800E2E2E20000000000C8C8C800F6F6F6000000
      000000000000000000000000000000000000CDCCCB0000000000000000000000
      000000000000FFFCFC00FFFAFA00CEC6C400FFF2F200FFF0F000FFECEC00FFE8
      E800FFE4E400F4DBDB00BDBEBE000000000000000000C8C8C800F6F6F6000000
      000000000000000000000000000000000000CDCCCB0000000000000000000000
      000000000000FFFCFC00FFFAFA00CEC6C400FFF2F200FFF0F000FFECEC00FFE8
      E800FFE4E400F4DBDB00BDBEBE000000000000000000C8C8C800F6F6F6000000
      0000FBFCFF00F5F7FF00F5F7FF00FBFCFF00CDCCCB0000000000000000000000
      000000000000FFFCFC00FFFAFA00CEC6C400FFF2F200FFF0F000FFECEC00FFE8
      E800FFE4E400F4DBDB00BDBEBE000000000000000000C8C8C800F6F6F6000000
      000000000000000000000000000000000000CDCCCB0000000000000000000000
      000000000000FFFCFC00FFFAFA00CEC6C400FFF2F200FFF0F000FFECEC00FFE8
      E800FFE5E500FADFCF00F2A42D00E6E6E60000000000C9C9C800F6F6F6000000
      000000000000000000000000000000000000CDCCCB0000000000000000000000
      00000000000000000000FFFAFA00CEC6C400FFF4F400FFF0F000FFECEC00FFEA
      EA00FFE6E600F4DCDC00BEBFBF000000000000000000C9C9C800F6F6F6000000
      000000000000000000000000000000000000CDCCCB0000000000000000000000
      00000000000000000000FFFAFA00CEC6C400FFF4F400FFF0F000FFECEC00FFEA
      EA00FFE6E600F4DCDC00BEBFBF000000000000000000C9C9C900F2F3F600E1E7
      FF00C7D2FF00BBC8FF00BACEFF00C5D9FF00B3B8CF00FBFCFF00000000000000
      00000000000000000000FFFAFA00CEC6C400FFF4F400FFF0F000FFECEC00FFEA
      EA00FFE6E600F4DCDC00BEBFBF000000000000000000C9C9C800F6F6F6000000
      000000000000000000000000000000000000CDCCCB0000000000000000000000
      00000000000000000000FFFAFA00CEC6C400FFF4F400FFF0F000FFECEC00FFEA
      EA00FFE6E600F4DCDC00C9C2B2000000000000000000C9C9C800F7F7F700FDFC
      FC00FDFCFC00FDFCFC00FDFCFC00FDFCFC00CCCAC90000000000000000000000
      00000000000000000000FFFCFC00CDC8C600FDF6F600FDF3F300FDF0F000FDEC
      EC00FDEBEB00F6E2E200BEBFBF000000000000000000C9C9C800F7F7F700FDFC
      FC00FDFCFC00FDFCFC00FDFCFC00FDFCFC00CCCBCA0000000000000000000000
      00000000000000000000FFFCFC00CDC8C600FDF6F600FDF3F300FDF0F000FDEC
      EC00FDEBEB00F6E2E200BEBFBF000000000000000000C7C8CC00CBDEF800A5B7
      FD00708CFE005378FF0079B7FF006F8AFE008394DA00D3DBFF00FBFCFF000000
      00000000000000000000FFFCFC00CDC8C600FDF6F600FDF3F300FDF0F000FDEC
      EC00FDEBEB00F6E2E200BEBFBF000000000000000000C9C9C800F7F7F700FDFC
      FC00FDFCFC00FDFCFC00FDFCFC00FDFCFC00CCCAC90000000000000000000000
      00000000000000000000FFFCFC00CDC8C600FDF6F600FDF3F300FDF0F000FDEC
      EC00FDEAEA00F6E2E200BEBFBF000000000000000000CACACA00C5C6C500CACA
      CA00CACACA00CACACA00CACACA00CACACA00B3B2B100CDCCCC00CDCCCC00CDCC
      CC00CDCCCC00CDCCCC00CDCBCB00B4B1AE00CAC8C800CAC6C600CAC4C400CAC4
      C400CAC3C300C5BCBC00BFC0C0000000000000000000CACACA00C5C6C500CACA
      CA00CACACA00CACACA00CACACA00CACACA00B3B2B100CDCCCC00CDCCCC00CDCC
      CC00CDCCCC00CDCCCC00CDCBCB00B4B1AE00CAC8C800CAC6C600CAC4C400CAC4
      C400CAC3C300C5BCBC00BFC0C0000000000000000000B4BAD4007C8ED80072B9
      F600306AF5004FA0F80064D2FC002A64F500355BE5008193DB00B1B7D000CDCC
      CC00CDCCCC00CDCCCC00CDCBCB00B4B1AE00CAC8C800CAC6C600CAC4C400CAC4
      C400CAC3C300C5BCBC00BFC0C0000000000000000000CACACA00C5C6C500CACA
      CA00CACACA00CACACA00CACACA00CACACA00B3B2B100CDCCCC00CDCCCC00CDCC
      CC00CDCCCC00CDCCCC00CDCBCB00B4B1AE00CAC8C800CAC6C600CAC4C400CAC4
      C400CAC3C300C5BCBC00BFC0C0000000000000000000CBCBCB00F6F6F6000000
      000000000000000000000000000000000000CCCCCB0000000000000000000000
      00000000000000000000FFFCFC00CEC8C600FFF6F600FFF2F200FFEEEE00FFEA
      EA00FFE6E600F5DCDC00C0C1C1000000000000000000CBCBCB00F6F6F6000000
      000000000000000000000000000000000000CCCCCB0000000000000000000000
      00000000000000000000FFFCFC00CEC8C600FFF6F600FFF2F200FFEEEE00FFEA
      EA00FFE6E600F5DCDC00C0C1C10000000000F9FAFF009DA9DA006583FA003C79
      FF0053DAFF005EE5FF0047DCFF0058C2FF002865F500759EFF00C2D5FF00FAFB
      FF000000000000000000FFFCFC00CEC8C600FFF6F600FFF2F200FFEEEE00FFEA
      EA00FFE6E600F5DCDC00C0C1C1000000000000000000CBCBCB00F6F6F6000000
      000000000000000000000000000000000000CCCCCB0000000000000000000000
      00000000000000000000FFFCFC00CEC8C600FFF6F600FFF2F200FFEEEE00FFEA
      EA00FFE6E600F5DCDC00C0C1C1000000000000000000CCCCCC00F7F7F7000000
      000000000000000000000000000000000000CCCCCB0000000000000000000000
      00000000000000000000FFFCFC00CEC8C600FFF6F600FFF2F200FFEEEE00FFEA
      EA00FFE6E600F5DCDC00C1C2C2000000000000000000CCCCCC00F7F7F7000000
      000000000000000000000000000000000000CCCCCB0000000000000000000000
      00000000000000000000FFFCFC00CEC8C600FFF6F600FFF2F200FFEEEE00FFEA
      EA00FFE6E600F5DCDC00C1C2C20000000000F2F4FF0093A1DE00486FFC0053A7
      FF004ADEFF0000CCFF0003CDFF0055E3FF0060C5FB005E90FF00B4C2FF00F3F5
      FF000000000000000000FFFCFC00CEC8C600FFF6F600FFF2F200FFEEEE00FFEA
      EA00FFE6E600F5DCDC00C1C2C2000000000000000000CCCCCC00F7F7F7000000
      000000000000000000000000000000000000CCCCCB0000000000000000000000
      00000000000000000000FFFCFC00CEC8C600FFF6F600FFF2F200FFEEEE00FFEA
      EA00FFE6E600F5DCDC00C1C2C2000000000000000000CCCCCC00F7F7F7000000
      000000000000000000000000000000000000CCCCCB0000000000000000000000
      00000000000000000000FFFCFC00CEC8C600FFF6F600FFF2F200FFEEEE00FFEA
      EA00FFE6E600F5DCDC00C1C2C2000000000000000000CCCCCC00F7F7F7000000
      000000000000000000000000000000000000CCCCCB0000000000000000000000
      00000000000000000000FFFCFC00CEC8C600FFF6F600FFF2F200FFEEEE00FFEA
      EA00FFE6E600F5DCDC00C1C2C20000000000F2F4FF0092A0DE005F93FC0061CC
      FF0048E2FF0000CCFF0003CDFF005EE0FF003D8FF7004A73FF00B4C2FF00F3F5
      FF000000000000000000FFFCFC00CEC8C600FFF6F600FFF2F200FFEEEE00FFEA
      EA00FFE6E600F5DCDC00C1C2C2000000000000000000CCCCCC00F7F7F7000000
      000000000000000000000000000000000000CCCCCB0000000000000000000000
      00000000000000000000FFFCFC00CEC8C600FFF6F600FFF2F200FFEEEE00FFEA
      EA00FFE6E600F5DCDC00C1C2C2000000000000000000CCCCCC00F7F7F7000000
      000000000000000000000000000000000000CDCCCB0000000000000000000000
      00000000000000000000FFFAFA00CEC8C600FFF6F600FFF2F200FFEEEE00FFEA
      EA00FFE6E600F5DCDC00C2C2C2000000000000000000CCCCCC00F7F7F7000000
      000000000000000000000000000000000000CDCCCB0000000000000000000000
      00000000000000000000FFFAFA00CEC8C600FFF6F600FFF2F200FFEEEE00FFEA
      EA00FFE6E600F5DCDC00C2C2C20000000000F9FAFF00A4BCE300709BFB003373
      FF0061D2FF0050E5FF004BDEFF0055D3FF002562F5006786FF00C1CDFF00FAFB
      FF000000000000000000FFFAFA00CEC8C600FFF6F600FFF2F200FFEEEE00FFEA
      EA00FFE6E600F5DCDC00C2C2C2000000000000000000CCCCCC00F7F7F7000000
      000000000000000000000000000000000000CDCCCB0000000000000000000000
      00000000000000000000FFFAFA00CEC8C600FFF6F600FFF2F200FFEEEE00FFEA
      EA00FFE6E600F5DCDC00C2C2C2000000000000000000CDCCCC00F7F7F7000000
      000000000000000000000000000000000000CDCCCB0000000000000000000000
      000000000000FFFCFC00FFFAFA00CEC8C600FFF4F400FFF0F000FFEEEE00FFEA
      EA00FFE6E600F5DCDC00C2C2C2000000000000000000CDCCCC00F7F7F7000000
      000000000000000000000000000000000000CDCCCB0000000000000000000000
      000000000000FFFCFC00FFFAFA00CEC8C600FFF4F400FFF0F000FFEEEE00FFEA
      EA00FFE6E600F5DCDC00C2C2C2000000000000000000B5BBD7009BADF9004F78
      FF003577FF0060C9FF0057AEFF00458CFF0065A3F100A1B3FF00DDE3FF000000
      000000000000FFFCFC00FFFAFA00CEC8C600FFF4F400FFF0F000FFEEEE00FFEA
      EA00FFE6E600F5DCDC00C2C2C2000000000000000000CDCCCC00F7F7F7000000
      000000000000000000000000000000000000CDCCCB0000000000000000000000
      000000000000FFFCFC00FFFAFA00CEC8C600FFF4F400FFF0F000FFEEEE00FFEA
      EA00FFE6E600F5DCDC00C2C2C2000000000000000000CFCFCF00ECECEC00F3F3
      F300F3F3F300F3F3F300F3F3F300F3F3F300C5C6C500EDEDED00EDEDED00EDED
      ED00ECEAEA00ECEAEA00ECE7E700C6C2C100F2E9E900F2E5E500F1E2E200F1DF
      DF00F1DBDB00E9D2D200C4C4C4000000000000000000CFCFCF00ECECEC00F3F3
      F300F3F3F300F3F3F300F3F3F300F3F3F300C5C6C500EDEDED00EDEDED00EDED
      ED00ECEAEA00ECEAEA00ECE7E700C6C2C100F2E9E900F2E5E500F1E2E200F1DF
      DF00F1DBDB00E9D2D200C4C5C5000000000000000000CCCCD100C0C9EF009AAC
      F600719CFA006195FB004970FA006380F800839CDE00BFCEF000E8E9ED00EDED
      ED00ECEAEA00ECEAEA00ECE7E700C6C2C100F2E9E900F2E5E500F1E2E200F1DF
      DF00F1DBDB00E9D2D200C4C4C4000000000000000000CFCFCF00ECECEC00F3F3
      F300F3F3F300F3F3F300F3F3F300F3F3F300C5C6C500EDEDED00EDEDED00EDED
      ED00ECEAEA00ECEAEA00ECE7E700C6C2C100F2E9E900F2E5E500F1E2E200F1DF
      DF00F1DBDB00E9D2D200C4C4C4000000000000000000EBEBEB00CFCFCF00CECE
      CE00CDCCCC00CDCCCC00CDCCCC00CCCCCC00C9C9C800C9C6C400C8C5C300C8C5
      C300C7C4C200C6C2C100C6C2C100C5C5C500C7C7C700C6C6C600C6C6C600C5C6
      C500C5C6C500C5C6C500E6E7E7000000000000000000EBEBEB00CFCFCF00CECE
      CE00CDCCCC00CDCCCC00CDCCCC00CCCCCC00C9C9C800C9C6C400C8C5C300C8C5
      C300C7C4C200C6C2C100C6C2C100C5C5C500C7C7C700C6C6C600C6C6C600C5C6
      C500C5C6C500C5C6C500E6E7E7000000000000000000EBEBEB00CCCCD100B6BC
      D700A6C3E40095A3DE0096A4DE009FAADB00B3B9D200C6C4C600C8C5C300C8C5
      C300C7C4C200C6C2C100C6C2C100C5C5C500C7C7C700C6C6C600C6C6C600C5C6
      C600C5C6C600C5C6C600E6E7E7000000000000000000EBEBEB00CFCFCF00CECE
      CE00CDCCCC00CDCCCC00CDCCCC00CCCCCC00C9C9C800C9C6C400C8C5C300C8C5
      C300C7C4C200C6C2C100C6C2C100C5C5C500C7C7C700C6C6C600C6C6C600C5C6
      C500C5C6C500C5C6C500E6E6E600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F9FAFF00F3F5FF00F3F5FF00FAFBFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000060000000480000000100010000000000600300000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFF60FFFFFFFFFFF07FFFFFF80000180
      0001800001FC01FF800001800001800001F80007800001800001800000F00003
      800000800001800000E00003800000800001800000C000038000008000018000
      00C00003800000800001800000C00003800000800001800001C0000380000080
      0001800001C000038F60008F0001800001C000039F70019F0001800001C00003
      9F78019F0001800001C000039F7C019F0001800001C00003807C018000018000
      01C00003800001800001800001C000039F7C019F60019F3C01C000039F7C019F
      7C019F3C01C000039F7C019F7C019F3C01C000039F7C019F7C019F3C01C00003
      9F78019F78019F3801C00003800001800001800001C0001F8000018000018000
      01F8003FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8E7FFFFFFFFFFFF80780000100
      0001800001800001800001000001800001800211800001800001800001800001
      8000018000018000018000018000018000018000018000018000018000018000
      0180000180000180000180000180000180000180000180000180000180000180
      00018000018000008F60018600018F60018F60009F70019F70019F70019F7000
      9F78019F78019078019F78009F7C019F7C01803C019F7C01807C01807C01801C
      01807C018000018000018000018000019F7C019F7C01000C019F7C019F7C019F
      7C01000C019F7C019F7C019F7C01000C019F7C019F7C019F7C01000C019F7C01
      9F78019F78018018019F78018000018000018000018000018000018000018000
      01800001FFFFFFFFFFFFF0FFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object Images16: TImageList
    Left = 440
    Top = 152
    Bitmap = {
      494C01013A003B00040010001000FFFFFFFFFF00FFFFFFFFFFFFFFFF424D3600
      000000000000360000002800000040000000F0000000010020000000000000F0
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D3D3D3009D9D
      9D009B9B9B009999990099999900D0D0D0000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D7D7D700A5A5A500DFDF
      DF00CECECE00CECECE00CECECE009B9B9B00D0D0D00000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DDDDDD00B1B1B100F0F0F000E1E1
      E100E1E1E100BFBFBF00C0C0C000D1D1D1009F9F9F00D2D2D200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E2CDB800C295680000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BCBCBC00F0F0F000E3E3E300E3E3
      E300E3E3E300E3E3E300C2C2C200C4C4C400D4D4D400A3A3A300D4D4D4000000
      000000000000000000000000000000000000000000000000000000000000E4CF
      B900B2763900B276390000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0C000F0F0F000E6E6E600E6E6
      E600E6E6E600E6E6E600E6E6E600C6C6C600C8C8C800D8D8D800A8A8A800D6D6
      D600000000000000000000000000000000000000000000000000E6D0BA00B77B
      3D00FFC33200B77B3D0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E3E3E300C3C3C300F1F1F100E9E9
      E900E9E9E900E9E9E900E9E9E900E9E9E900CACACA00CCCCCC00DCDCDC00AEAE
      AE00C2BAE30000000000000000000000000000000000E8D3BC00BF834300FACC
      6C00FCBD2C00BF834300BF834300BF834300BF834300C5905700D2A97D00EEDE
      CE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E5E5E500C5C5C500F3F3
      F300ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00CECECE00D0D0D0009F8E
      E3007D6BC400C4BCE4000000000000000000EBD6BE00C78B4800FAD68A00EEB2
      6600F1B86700F0B95600ECB24000EBAF3B00EAAD3800E5A93A00DA9F4200CB90
      4800DDBA9200FCF9F60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E6E6E600C8C8
      C800F4F4F400EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF008E7DD200907F
      D400A392E7007F6EC600C5BDE50000000000CE924E00FDDF9300EFB46800EFB4
      6800EFB46800EFB46800EBB06100E3A75400DA9E4900D5984300D2954100D69E
      4C00D29A5200E2BE960000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E7E7
      E700CBCBCB00F6F6F600F2F2F200F2F2F200F2F2F200AE9DE800B09FE9009280
      D6009483D900A695EA008270C800C6BEE600F0DBC200D69A5300FFE39700F4BE
      7200F6C67A00F8CE8200F8CC8000F8CC8000F7CB7F00F7C87C00F6C47800F5C0
      7400F3C17500DBA25B00F4E5D200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E8E8E800CDCDCD00F8F8F800F5F5F500AE9DE800B09FE900B2A1E900B3A2
      EA009584D9009786DB00A998ED008473CB0000000000F2DDC400DDA15900FFE5
      9900FCD78B00DDA15900DDA15900DDA15900DEA25A00E0A65E00E4AD6300E9B6
      6B00F3C57A00EEBE7300E7BE8C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E9E9E900CFCFCF00C1B0F900B09FE900B2A1E900B3A2EA00B5A4
      EB00B6A5EC009887DC00AA99EE008776CE000000000000000000F5DFC600E3A7
      5E00FFE59900E3A75E000000000000000000FEFDFB00FCF7F100F9EDDF00F4E0
      C600ECC28F00E9B36B00E6B16F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000CEC6ED009280D600C4B3FB00B3A2EA00B5A4EB00B6A5
      EC00B8A7EC00CAB9FE008B7AD100CAC2EA00000000000000000000000000F7E1
      C700E9AD6200E9AD620000000000000000000000000000000000000000000000
      000000000000F1CDA100E9AD6200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000CEC6ED009381D800C6B5FC00B6A5EC00B8A7
      EC00CAB9FE00907FD400CCC4EB00000000000000000000000000000000000000
      0000F8E3C800F1C48B0000000000000000000000000000000000000000000000
      00000000000000000000F1C48B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CFC7EE009483D900C9B8FD00CAB9
      FE009381D800CEC6ED0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D0C8EF009684DA009483
      D900CFC7EE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E3E3E300AEAEAE00909090007D7D7D007D7D7D0090909000AEAEAE00E3E3
      E300000000000000000000000000000000000000000000000000000000000000
      000000000000000000006A91B800386C9F006A91B80000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C2C2
      C200404040002525250025252500252525002525250025252500252525002525
      2500252525001E1E1E0040404000BCBCBC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F7F7F700B7B7
      B7008F8E8E00BCB2B200EBDADA00EBDADA00EBDADA00EBDADA00BCB2B2008F8E
      8E00B7B7B700F7F7F70000000000000000000000000000000000000000000000
      000000000000000000004277AB0085B8EB004277AB0000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C4C4
      C400FDFDFD00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FFFFFF00FFFFFF00AFAFAF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F7F7F700B0B0B000A7A3
      A300E4D6D600C6968900AD644E009433120094331200AD644E00C6968900E3D6
      D600A7A3A300B0B0B000F7F7F700000000000000000000000000000000000000
      000000000000000000004F84B90083B6E8004F84B90000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C600FDFDFD004D4DFF009E9EFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FFFFFF00FFFFFF00B1B1B10000000000D1B19100D1B191000000
      0000D1B19100D1B19100D1B1910000000000D1B19100D1B1910000000000D1B1
      9100D1B1910000000000D1B19100D1B1910000000000C4C4C400AAA7A700DBD1
      D100AC573C00B6461F00D6592A00E5623000E5623000D6592A00B6461F00AC57
      3C00DACFCF00AAA6A600C4C4C400000000000000000000000000000000000000
      00000000000000000000578CC1006699CC00578CC10000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C600FDFDFD00D3D3FC008C8CFD00B0B0FD00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00FBFBFB00FDFDFD00FDFDFD00B1B1B10000000000D1B19100000000000000
      0000D1B19100D1B19100D1B191000000000000000000D1B1910000000000D1B1
      91000000000000000000D1B1910000000000EBEBEB00A4A3A300D4CECE00B35F
      4400C9572F00E1613200D3592D00EEEEEE00EEEEEE00D3592D00E15F3000C853
      2A00B35F4400D0C9C900A3A3A300EBEBEB0000000000C2D4E7004B7FB5004B7F
      B5004B7FB5004B7FB5003366990033669900336699004B7FB5004B7FB5004B7F
      B5007AA2CA00000000000000000000000000000000000000000000000000C6C6
      C600FDFDFD00FCFCFC00FCFCFC007B7BFE00D3D3FC00AFAFFD00AFAFFC009B9B
      FB008989FB007A7AFD00FAFAFA00B1B1B10000000000D1B19100000000000000
      0000D1B19100D1B19100000000000000000000000000D1B19100D1B19100D1B1
      91000000000000000000D1B1910000000000C7C7C700B9B7B700C0978900BF56
      3100D85F3300D55A2D00CB542A00EEEEEE00EEEEEE00CB542A00D55A2D00D55A
      2D00BC4F2900BF958800B0AEAE00C7C7C700C6D9EB005C91C700A4D7FC009DD0
      F8009ACDF60096C9F30092C5F1008EC1EF008ABDED0087BAEA0084B7E80086B9
      EB005C91C700000000000000000000000000000000000000000000000000C6C6
      C600FDFDFD00FCFCFC00FCFCFC00E6E6FB005959FD00BFBFFA004B4BFD00BEBE
      F900ABABF900D2D2FB00FAFAFA00B1B1B10000000000D1B19100000000000000
      0000D1B19100D1B19100D1B19100000000000000000000000000D1B191000000
      00000000000000000000D1B1910000000000B4B4B400D0CFCF00B9745D00CF64
      3E00C9542A00C9542A00C9542A00BB4D2700BB4D2700C9542A00C9542A00C954
      2A00C5542C00B9745D00C2C0C000B4B4B400669BCF00AADDFF0097CAF50094C7
      F30091C4F0008DC0ED0089BCEA0035689B0081B4E5007EB1E2007BAEE00081B4
      E600669BCF00000000000000000000000000000000000000000000000000C6C6
      C600FDFDFD00FBFBFB00F9F9F900F8F8F8006969FC003C3CFD00F7F7F700F7F7
      F700F7F7F700FAFAFA00F8F8F800B1B1B10000000000D1B19100000000000000
      0000D1B19100D1B19100D1B191000000000000000000D1B19100D1B19100D1B1
      91000000000000000000D1B1910000000000ABABAB00CCCCCC00B9573700D571
      4D00BF502A00BD4E2700B94B2600DBDBDB00DBDBDB00B94C2600BD4E2700BD4E
      2700C1542E00B9573700C0C0C000ABABAB00CBDEF0006FA2D600A3D6FB009ACD
      F60094C7F2008EC1ED0087BAE80081B4E4007CAFE00077AADC0073A6D90075A8
      DA006FA2D600000000000000000000000000000000000000000000000000C6C6
      C600FAFAFA00F7F7F700F7F7F700F7F7F700ACACF900ACACF900F7F7F700F7F7
      F700F6F6F600F7F7F700F7F7F700B1B1B10000000000D1B19100000000000000
      0000D1B19100D1B19100D1B191000000000000000000D1B19100D1B19100D1B1
      91000000000000000000D1B1910000000000AEAEAE00CFCFCF00BC5B3B00DD7D
      5B00C9624000BD533000B44A2600BC725900D1CFCF00C7AEA500B2482400B349
      2500BD553200BC5B3B00C3C3C300AEAEAE0000000000CEE0F200578DC2004B80
      B5004B80B5004B80B5004B80B5004B80B5004B80B5004B80B5004B80B5004B80
      B5004B7FB500C2D4E7000000000000000000000000000000000000000000C6C6
      C600F9F9F900F7F7F700F7F7F700F7F7F7006868FB00CECEF700F7F7F700F6F6
      F600F3F3F300F4F4F400F4F4F400B6B6B600D1B19100D1B19100D1B191000000
      000000000000D1B191000000000000000000D1B19100D1B1910000000000D1B1
      9100D1B1910000000000D1B19100D1B19100BBBBBB00DBDCDC00C07C6500DF80
      5E00CF694700CF694700CA644200C0593700C2877500CCCCCC00BC887700AD46
      2400C3603E00C07C6500CBCCCC00BBBBBB0000000000000000005C91C70085B8
      EA0083B6E80086B9E90089BCEC008CBFEE0090C3F00094C7F20098CBF5009BCE
      F700A2D5FB005C91C700C6D9EB0000000000000000000000000000000000C6C6
      C600F8F8F800F5F5F500F5F5F500F5F5F5007777FA00CFCFF600F3F3F300F2F2
      F200EFEFEF00EEEEEE00D2D2D200BBBBBB0000000000D1B19100000000004444
      44003C3C3C00424C5500323C4400565657000000000000000000000000000000
      00000000000000000000D1B1910000000000CFCFCF00C8C9C900C9A29500D574
      5200E2815F00D26C4A00D5A29100D5A29100E6C2B60000000000E0AD9C00DF7C
      5A00D16E4C00C7A19400BEBFBF00CFCFCF000000000000000000669BCF0080B3
      E6007AADDF007DB0E10080B3E4004477AA0087BAE9008BBEEC008FC2EF0092C5
      F10095C8F400A9DCFF00669BCF00000000000000860000007100000070000000
      6E0000006C000000690000006700000064000000610000006400EEEEEE00E8E8
      E800E3E3E300C7C7C70093939300C1C1C10000000000D1B19100000000004343
      4300FFFFFF00FFFFFF00FFFFFF00313B46000000000000000000000000000000
      00000000000000000000D1B1910000000000EEEEEE00B7B7B700DFE0E000C875
      5A00E2836100DC7A580000000000000000000000000000000000E2987F00DF7E
      5C00C8755A00D8D8D800B6B6B600EEEEEE0000000000000000006FA2D60089BC
      EE008BBEF0008EC1F10091C4F30094C7F50098CBF6009CCFF800A0D3FA00A3D6
      FC00A6D9FD006FA2D600CBDEF000000000000000B3000909DA000B0BDC000B0B
      DC000909DB000606D6000202D1000000C8000000BB0000008B00A0A0A0008888
      88008888880094949400A2A2A200D8D8D8000000000000000000000000004040
      400092929200FFFFFF00FFFFFF00314F65000000000000000000000000000000
      00000000000000000000000000000000000000000000D3D3D300C0C0C000DFDF
      DF00CB795E00DB7A5800EE906E00F4967400F4957300ED8E6C00DA785600CB79
      5E00DBDCDC00BEBEBE00D3D3D30000000000000000000000000097BEE40076A9
      DC0076A9DC0076A9DC0076A9DC004A94D90076A9DC0076A9DC0076A9DC0076A9
      DC0076A9DC00CEE0F20000000000000000000000D3002121FA002525FD001E1E
      F5001717ED001010E4000909DB000101D0000000C3000000A00088888800FBFB
      FB00FBFBFB00DFDFDF00AEAEAE00EBEBEB000000000000000000494949006767
      6700FFFFFF0094949400FFFFFF003F6571000000000000000000000000000000
      00000000000000000000000000000000000000000000FAFAFA00CACACA00C2C2
      C200E6E6E600D7B0A300D08C7500CD6C4B00CD6C4B00D08C7500D6AFA200E3E4
      E400C1C1C100CACACA00FAFAFA00000000000000000000000000000000000000
      0000000000000000000073A6DA00A1D4FA0073A6DA0000000000000000000000
      0000000000000000000000000000000000000000D8000000DF000000E0000000
      DB000000D3000000CB000000C2000000BB000000B2000000A900A5A5A500FBFB
      FB00DFDFDF00AAAAAA00E0E0E0000000000000000000000000004A4A4A00C7C7
      C7006A6A6A0044444400434443004B6166000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FAFAFA00D5D5
      D500BDBDBD00D1D1D100EAEAEA00E6E6E600E6E6E600EAEAEA00D0D0D000BCBC
      BC00D5D5D500FAFAFA0000000000000000000000000000000000000000000000
      0000000000000000000075A8DB00A6D9FD0075A8DB0000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C3C3
      C300FAFAFA00F5F5F500F3F3F300F0F0F000ECECEC00E6E6E600C0C0C000DFDF
      DF00AEAEAE00E1E1E100000000000000000000000000000000004B4B4B004A4B
      4B004A4A4A000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F0F0F000D5D5D500C6C6C600BDBDBD00BDBDBD00C6C6C600D5D5D500F0F0
      F000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000098BEE50076A9DC0098BEE50000000000000000000000
      000000000000000000000000000000000000000000000000000000000000DADA
      DA00B3B3B300AFAFAF00AEAEAE00AFAFAF00AEAEAE00AEAEAE00AEAEAE00B1B1
      B100E7E7E70000000000000000000000000000000000B74F0100B74F0100B74F
      0100B74F0100000000000000000000000000000000000000000000000000B74F
      0100B74F0100B74F0100B74F010000000000F0F0F00079797900A7A7A7000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007A7AC9003333AC00A3A3D800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B74F0100CA681100B74F0100C35E
      0100DE9A4600B74F010000000000000000000000000000000000B74F0100DE9A
      4600C35E0200B7510200CB691000B74F01007C7C7C00EBDCDC0083818100A9A9
      A900000000000000000000000000000000000000000000000000000000007A7A
      CC003333B0008888FF003434AE0000000000000000000000000000000000777F
      9500000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B74F0100B8530400000000000000
      0000DD723000DE9A4600B74F01000000000000000000B74F0100DE9A4600DD72
      30000000000000000000B9540400B74F0100ACACAC0087848400E6D8D8008684
      8400ADADAD0000000000000000000000000000000000000000007A7ACF003333
      B4008282FD003C3CBE007F7FD30000000000000000000000000000000000777F
      9500395A81000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B74F0100C45F0200000000000000
      000000000000C0580000DE9A4600B74F0100B74F0100DE9A4600BF5800000000
      00000000000000000000C35D0200B74F010000000000AFAFAF008A888800DDD2
      D20089888800AFAFAF000000000000000000000000007A7AD2003333BA007A7A
      FA004343CE008484DE0000000000000000000000000098989800989898009898
      9800347AAF005762710098989800989898009898980098989800989898009898
      9800989898009898980000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B74F0100DF763100CF680F00E160
      6900C3582D00C25C0000CD571800DE9A4600DE9A4600E66F1800BF580000C257
      2D00E1606900CF680F00DF753100B74F01000000000000000000B2B2B2008E8C
      8C00D4CBCB008D8D8D00B3B3B300000000007A7AD5003333BF007070F7004848
      D6008787E40000000000000000000000000000000000ADADAD00EEEEEE00EEEE
      EE009CABB7007D849000D1D1D100EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEE
      EE00EEEEEE00ADADAD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B74F0100B74F0100D269
      2200D0631500CC650000BD570000DC750000D9710000CC670000D36B0000D364
      1300D1682200B74F0100B74F010000000000000000000000000000000000B5B5
      B50092919100CBC6C600919191009595B3003333C3006666F4004B4BDD008989
      E8000000000000000000000000000000000000000000ADADAD00EEEEEE00C4C4
      C400C2C2C200A19F9D007D7A7800C4C4C400C4C4C400C4C4C400C4C4C400C4C4
      C400EEEEEE00ADADAD0000000000000000000000000000000000000000000000
      0000E2CDB900D1B19100D1B19100D1B19100D1B19100D1B19100D1B19100D1B1
      9100E2CDB900000000000000000000000000000000000000000000000000B74F
      0100B74F0100E65B3B00D1670000D5832600C8752600D56A0000E56D3400B74F
      0100B74F01000000000000000000000000000000000000000000000000000000
      0000B9B9B90096969600605FC0001D1D95005454E8004E4EE3008B8BEC000000
      00000000000000000000000000000000000000000000ADADAD00FFFFFF00C4C4
      C400E868C200A9A9A9009F9C9B00838389006029D600C4C4C40000009900C4C4
      C400FFFFFF00ADADAD0000000000000000000000000000000000000000000000
      0000DCC0A300F1E5D900F9F1EA00F4E9DD00F1E3D600F1E1D200EFDFD000EBD9
      C700DCC0A3000000000000000000000000000000000000000000000000000000
      000000000000B74F0100BF792300DE9A4600D9944400DF8C2200B74F01000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B7B7B7001F1FB7008888FF001E1EB7009B9BC500000000000000
      00000000000000000000000000000000000000000000ADADAD00EEEEEE00C4C4
      C400C4C4C400C4C4C40078A1B9004985D300AEAEAF00C4C4C400C4C4C400C4C4
      C400EEEEEE00ADADAD0000000000000000000000000000000000000000000000
      0000E1C6AB00F9F2EC00F7EDE500F4E9DE00EFDECE00EDDBCA00ECD9C600EFDF
      CE00E1C6AB000000000000000000000000000000000000000000000000000000
      0000808080009896A600A1A09B00CDA36A00EBBF8300CCC6BE00808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000989898008787AE003535CE006F70D300909090007E7E7E007E7E
      7E0087878700A6A6A600E9E9E9000000000000000000ADADAD00FFFFFF00C4C4
      C400FCF89700C4C4C4005BAC860060BFFF001A748C00C4C4C4000099FF00C4C4
      C400FFFFFF00ADADAD0000000000000000000000000000000000000000004444
      4400797067006A70740051585E006C6B6A00F4E8DC00F1E1D200EFE0D000EDDC
      CA00E4CBB2000000000000000000000000000000000000000000000000000000
      000080808000BCBCBC00D0D2D200ACAFB300D7DADF00DDDFDF00C9C9C9008080
      8000000000000000000000000000000000000000000000000000000000000000
      000098989800BDBDBD009F9F9F00BCBCBC00A5A5A500BABBBB00C5C6C600CACC
      CC00CCCDCD00B1B1B10098989800EBEBEB0000000000ADADAD00EEEEEE00C4C4
      C400C4C4C400C4C4C400C4C4C40073A3C0004987D600B6B6B600C4C4C400C4C4
      C400EEEEEE00ADADAD0000000000000000000000000000000000000000004343
      4300FFFFFF00FFFFFF00FFFFFF0066666600E7CEB600E7CEB600E7CEB600E7CE
      B600EFE0D0000000000000000000000000000000000000000000000000008080
      8000ADADAD00D4D4D400DFDFDF008080800080808000E5E5E500DDDDDD00BFBF
      BF00808080000000000000000000000000000000000000000000000000009999
      9900C3C3C300A5A5A50000000000FEFEFE00A9A9A900C5C6C600B8BABA00CACB
      CB0095959500D9DADA00BEBEBE00B9B9B90000000000ADADAD00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00D5D9DB005FBAFF00959EB000FFFFFF00FFFF
      FF00FFFFFF00ADADAD0000000000000000000000000000000000000000004040
      400092929200FFFFFF00FFFFFF00314F65000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000D0D0D000E6E6E60080808000000000000000000080808000EEEEEE00DDDD
      DD0080808000000000000000000000000000000000000000000099999900CBCB
      CB00ABABAB00000000000000000000000000AEAEAE00CACBCB00CACBCB008E8F
      8F00CCCCCC00A9AAAA00E5E5E500AFAFAF0000000000ADADAD00C5C5C500C5C5
      C500C5C5C500C5C5C500C5C5C500C5C5C50077A0B9004987CD00BABABA00C5C5
      C500C5C5C500ADADAD0000000000000000000000000000000000494949006767
      6700FFFFFF0094949400FFFFFF003F6571000000000000000000000000000000
      000000000000000000000000000000000000000000000000000080808000C3C3
      C300EBEBEB00B8B5B80080808000000000000000000080808000BCB9BC00F4F4
      F400D0D0D000808080000000000000000000B2B2B2009A9A9A00D1D1D100B1B1
      B10000000000000000000000000000000000B6B6B600D0D2D20095969600CCCC
      CC0000000000EBEBEB00B1B1B100B9B9B90000000000ADADAD00E5E5E5003366
      FF00E5E5E50033CCFF00E5E5E50036DC7100CDD0D10056B5FD009097A500E5E5
      E500E5E5E500ADADAD00000000000000000000000000000000004A4A4A00C7C7
      C7006A6A6A0044444400434443004B6166000000000000000000000000000000
      000000000000000000000000000000000000000000000000000080808000EDED
      ED00C8C8C800808080000000000000000000000000000000000080808000CCCC
      CC00F6F6F60080808000000000000000000099999900EDEDED00B7B7B7000000
      000000000000000000000000000000000000CBCBCB00C6C7C700D9DADA009090
      9000E5E5E50000000000EBEBEB00EDEDED0000000000ADADAD00DFDFDF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0091B3C7004E8CCA00F4F4
      F400DFDFDF00ADADAD00000000000000000000000000000000004B4B4B004A4B
      4B004A4A4A000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000080808000E3E3
      E300808080000000000000000000000000000000000000000000000000008080
      8000E7E7E700808080000000000000000000C5C5C500BABABA00CBCBCB000000
      000000000000000000000000000000000000F2F2F200BFBFBF00CCCDCD00E6E6
      E600A0A0A000E5E5E50000000000000000000000000000000000ADADAD00ADAD
      AD00ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00639BC4009EA0
      A300ADADAD000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000808080008080800000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F2F2F200CFCFCF00BFBF
      BF00BFBFBF00E5E5E50000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000095B0E300235C
      C2000543BC001F59C10086A6DD000000000000000000CC666600CC666600CC66
      6600CC666600CC666600CC666600CC666600CC666600CC666600CC6666000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CC666600CC666600CC666600CC666600CC666600CC666600CC66
      6600CC666600CC666600CC666600CC6666000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008CABE1002866CA002177
      E6000579EA000164DD00074FBE0086A6DD00CC666600E19C8C00E19C8C00E19C
      8C00E19C8C00E19C8C00E19C8C00E19C8C00E19C8C00E19C8C00CC6666000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CC666600E19C8C00E19C8C00E19C8C00E19C8C00E19C8C00E19C
      8C00E19C8C00E19C8C00E19C8C00CC6666000000000000000000000000000000
      00000000000000000000E2CDB900D1B19100D1B19100D1B19100D1B19100D1B1
      9100D1B19100D1B19100E2CDB900000000000000000000000000000000000000
      000000000000000000000000000000000000000000001F59C100639DF400187F
      FF000076F8000076EE000368E1001E59C000CC666600EDC8C800FFFAF300FFF4
      E300FFF0D900FFEDD000FFE9C700FFE6BF00FFE4B900E19C8C00CC6666000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CC666600EDC8C800FFFAF3007A756C00FFF0D900FFEDD000FFE9
      C700FFE6BF00FFE4B900E19C8C00CC6666000000000000000000000000000000
      00000000000000000000DCC0A300F1E5D900F9F1EA00F4E9DD00F1E3D600F1E1
      D200EFDFD000EBD9C700DCC0A300000000000000000000000000000000000000
      000000000000000000000000000000000000000000000543BC00AECDFE000000
      00000000000000000000187FEF000543BC00CC666600EDC8C800FFFCF700FFF6
      E700FFF2DE00FFEFD500FFEBCC00FFE8C300FFE5BA00E19C8C00CC6666000000
      0000075466000000000000000000000000000000000000000000000000000000
      000000000000CC666600EDC8C800FFFCF70000526600817B7000FFEFD500FFEB
      CC00FFE8C300FFE5BA00E19C8C00CC6666000000000000000000000000000000
      00000000000000000000E1C6AB00F9F2EC00F7EDE500F4E9DE00EFDECE00EDDB
      CA00ECD9C600EFDFCE00E1C6AB0000000000E8E8E800E8E8E800E8E8E800E8E8
      E800E8E8E800E8E8E800E8E8E800E8E8E800E8E8E800225ABF008DB5F6004D92
      FF001177FF002186FF00408AEB002159BF00CC666600EDC8C800FFFDFA00FFF7
      EC00BCB4A700FFF0D900BCAF9A00BCAD9300FFE6BF0092665B00CC6666000000
      0000075466000754660000000000000000000000000000000000000000000000
      000000000000CC6666009A828200FFFDFA00005266000052660081796E00FFED
      D200FFEAC700FFE6BF00E19C8C00CC6666000000000000000000000000000000
      00000000000000000000E4CBB200F3E8DC00F9F1EA00F7EFE600F4E8DC00F1E1
      D200EFE0D000EDDCCA00E4CBB20000000000C9C9C900FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC0094AFE2003D76D2008DB5
      F700B8D6FE0072A8F5002F6DCC0087A1D400CC666600EDC8C800FFFEFD00FFF9
      EF0007546600FFF2DE000754660007546600FFE8C30007546600075466000754
      660016697A002DDBFF0007546600000000000754660000000000075466000754
      66000000000007546600125866001258660016697A002DDBFF00125866008178
      6C00FFEBCC00FFE8C300E19C8C00CC6666000000000000000000000000000000
      00000000000000000000EFE0D000E7CEB600E7CEB600E7CEB600E7CEB600E7CE
      B600E7CEB600E7CEB600EFE0D00000000000C9C9C900FCFCFC00C9C9C900FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC0094AFE2002A62
      C7000543BC001F5AC10087A6DC00E8E8E800CC666600EDC8C800FFFFFF00B2B2
      B20007546600B2B2B200075466004CA8B300FFE9C700075466006BF0FF006BF0
      FF006BF0FF006CF0FF006BF0FF00075466000754660000000000075466000754
      660000000000075466006BF0FF006BF0FF006BF0FF006CF0FF006BF0FF002B60
      6600B2B2B200FFE9C700E19C8C00CC666600000000000000000000000000E2CD
      B900D1B19100D1B19100D1B19100D1B19100D1B19100D1B19100D1B19100E2CD
      B90000000000000000000000000000000000C9C9C900FCFCFC00C9C9C900FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00E8E8E800CC666600EDC8C800FFFFFF00FFFC
      F70007546600FFF6E7000754660007546600FFEBCC0007546600075466000754
      6600497A7A0099FFFF0007546600000000000754660000000000075466000754
      660000000000075466003D6666003D666600497A7A0099FFFF003D6666008A84
      7900FFEFD500FFEBCC00E19C8C00CC666600000000000000000000000000DCC0
      A300F1E5D900F9F1EA00F4E9DD00F1E3D600F1E1D200EFDFD000EBD9C700DCC0
      A30000000000000000000000000000000000C9C9C900FCFCFC00C9C9C900FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00E8E8E800CC666600EDC8C800FFFFFF00B2B2
      B200B2B2B200B2B2B200B2B2B200B2B2B200FFEDD000E19C8C00CC6666000000
      0000075466000754660000000000000000000000000000000000000000000000
      000000000000CC666600EDC8C800FFFFFF003D6666003D66660060606000B2B2
      B200B2B2B200FFEDD000E19C8C00CC666600000000000000000000000000E1C6
      AB00F9F2EC00F7EDE500F4E9DE00EFDECE00EDDBCA00ECD9C600EFDFCE00E1C6
      AB0000000000000000000000000000000000C9C9C900FCFCFC00C9C9C900FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00E8E8E800CC666600EDC8C800FFFFFF00FFFE
      FD00FFFCF700EDC8C800EDC8C800EDC8C800EDC8C800E19C8C00CC6666000000
      0000075466000000000000000000000000000000000000000000000000000000
      000000000000CC666600EDC8C800FFFFFF003D6666008A888600EDC8C800EDC8
      C800EDC8C800EDC8C800E19C8C00CC666600000000000000000000000000E4CB
      B200F3E8DC00F9F1EA00F7EFE600F4E8DC00F1E1D200EFE0D000EDDCCA00E4CB
      B20000000000000000000000000000000000C9C9C900FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00E8E8E800CC666600EDC8C800FFFFFF00FFFF
      FF00FFFDFA00CC666600CC666600CC666600CC666600CC666600CC6666000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CC666600EDC8C800FFFFFF0097979700FFFDFA00CC666600CC66
      6600CC666600CC666600CC666600CC666600000000000000000000000000EFE0
      D000E7CEB600E7CEB600E7CEB600E7CEB600E7CEB600E7CEB600E7CEB600EFE0
      D00000000000000000000000000000000000C9C9C900C9C9C900C9C9C900C9C9
      C900C9C9C900C9C9C900C9C9C900C9C9C900C9C9C900C9C9C900C9C9C900C9C9
      C900C9C9C900C9C9C900C9C9C900C9C9C900CC666600EDC8C800FFFFFF00FFFF
      FF00FFFEFD00CC666600DC912800DC912800DC912800CC666600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CC666600EDC8C800FFFFFF00FFFFFF00FFFEFD00CC666600DC91
      2800DC912800DC912800CC66660000000000E2CDB900D1B19100D1B19100D1B1
      9100D1B19100D1B19100D1B19100D1B19100E2CDB90000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CC666600EDC8C800FFFFFF00FFFF
      FF00FFFFFF00CC666600EABE8400E5AE6500CC66660000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CC666600EDC8C800FFFFFF00FFFFFF00FFFFFF00CC666600EABE
      8400E5AE6500CC6666000000000000000000DCC0A300F1E5D900F9F1EA00F4E9
      DD00F1E3D600F1E1D200EFDFD000EBD9C700DCC0A30000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CC666600EDC8C800FFFFFF00FFFF
      FF00FFFFFF00CC666600EABE8400CC6666000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CC666600EDC8C800FFFFFF00FFFFFF00FFFFFF00CC666600EABE
      8400CC666600000000000000000000000000E1C6AB00F9F2EC00F7EDE500F4E9
      DE00EFDECE00EDDBCA00ECD9C600EFDFCE00E1C6AB0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CC666600EDC8C800EDC8C800EDC8
      C800EDC8C800CC666600CC666600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CC666600EDC8C800EDC8C800EDC8C800EDC8C800CC666600CC66
      660000000000000000000000000000000000E4CBB200F3E8DC00F9F1EA00F7EF
      E600F4E8DC00F1E1D200EFE0D000EDDCCA00E4CBB20000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CC666600CC666600CC666600CC66
      6600CC666600CC66660000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CC666600CC666600CC666600CC666600CC666600CC6666000000
      000000000000000000000000000000000000EFE0D000E7CEB600E7CEB600E7CE
      B600E7CEB600E7CEB600E7CEB600E7CEB600EFE0D00000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084B094002573
      4100196B37002573410084B09400000000000000000052525200181818000000
      0000181818001818180000000000181818001818180000000000181818001818
      1800000000001818180052525200000000000000000052525200181818000000
      0000181818001818180000000000181818001818180000000000181818001818
      1800000000001818180052525200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000088B29700288C530064BA
      8D0095D2B20064BA8D00288C530081AE91000000000024242400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000024242400000000000000000024242400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000024242400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000022713F0062BA8B0060BA
      87000000000060B9870067BC8F0020703D000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000317B4C009CD4B6000000
      0000000000000000000095D2B200196B37000000000037373700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000037373700000000000000000037373700000000000000
      0000373737009B9B9B0037373700000000000000000000000000000000000000
      000000000000000000003737370000000000E8E8E800E8E8E800E8E8E800E8E8
      E800E8E8E800E8E8E800E8E8E800E8E8E800E8E8E800E8E8E800E8E8E800E8E8
      E800E8E8E800E8E8E800E8E8E800E8E8E800E8E8E800E8E8E800E8E8E800E8E8
      E800E8E8E800E8E8E800E8E8E800E8E8E800E8E8E800498A610090D3B10092D6
      B1000000000065BC8C0067BC8F001F6F3D00000000003B3B3B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000003B3B3B0000000000000000003B3B3B00000000000000
      0000000000003B3B3B0000000000000000000000000000000000000000000000
      000000000000000000003B3B3B0000000000C9C9C900FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00E8E8E800C9C9C900FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00A6C5B20061AB810095D4
      B400BAE6D0006ABB8F002D8F570076A387000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000003F3F3F0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C9C9C900FCFCFC00C9C9C900FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00E8E8E800C9C9C900FCFCFC00C9C9C900FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00ADC9B7006099
      75004F8E66004A8A610098BCA500E8E8E8000000000042424200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000042424200000000000000000042424200000000000000
      0000000000004242420000000000000000000000000000000000000000000000
      000000000000000000004242420000000000C9C9C900FCFCFC00C9C9C900FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00E8E8E800C9C9C900FCFCFC00C9C9C900FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00E8E8E8000000000045454500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000045454500000000000000000045454500000000000000
      0000000000004545450000000000000000000000000000000000000000000000
      000000000000000000004545450000000000C9C9C900FCFCFC00C9C9C900FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00E8E8E800C9C9C900FCFCFC00C9C9C900FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00E8E8E8000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004848480000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C9C9C900FCFCFC00C9C9C900FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00E8E8E800C9C9C900FCFCFC00C9C9C900FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00E8E8E800000000004B4B4B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000004B4B4B0000000000000000004B4B4B00000000000000
      0000000000004B4B4B0000000000000000000000000000000000000000000000
      000000000000000000004B4B4B0000000000C9C9C900FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00E8E8E800C9C9C900FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00E8E8E800000000004E4E4E00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000004E4E4E0000000000000000004E4E4E00000000000000
      00004E4E4E00A6A6A6004E4E4E00000000000000000000000000000000000000
      000000000000000000004E4E4E0000000000C9C9C900C9C9C900C9C9C900C9C9
      C900C9C9C900C9C9C900C9C9C900C9C9C900C9C9C900C9C9C900C9C9C900C9C9
      C900C9C9C900C9C9C900C9C9C900C9C9C900C9C9C900C9C9C900C9C9C900C9C9
      C900C9C9C900C9C9C900C9C9C900C9C9C900C9C9C900C9C9C900C9C9C900C9C9
      C900C9C9C900C9C9C900C9C9C900C9C9C9000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000052525200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000052525200000000000000000052525200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000052525200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007F7F7F00545454000000
      0000545454005454540000000000545454005454540000000000545454005454
      540000000000545454007F7F7F0000000000000000007F7F7F00545454000000
      0000545454005454540000000000545454005454540000000000545454005454
      540000000000545454007F7F7F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E2CDB900DCC0
      A300E1C6AB00E4CBB200EFE0D000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E9634100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D1B19100EBDA
      C900F0E1D200EEDDCC00E7CEB600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000019191900000000000000
      0000191919000000000000000000191919000000000000000000191919000000
      00000000000019191900000000000000000000000000E05F3D0000000000E2CD
      B900D1B19100D1B19100D1B19100D1B19100D1B19100D1B19100D1B19100D1B1
      9100D1B19100D1B19100D1B19100E2CDB9000000000000000000D1B19100F0E1
      D200EDDBC900F0E1D200E7CEB600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E05F3D0000000000DCC0
      A300F2E5D900F9F1EB00F8F1E900F2E5D800F2E4D600F2E3D500F1E2D400F0E2
      D300F0E1D300F0E1D200EBDAC900DCC0A3000000000000000000D1B19100F0E1
      D300EDDBC900F0E1D300E7CEB600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E05F3D0000000000E1C6
      AB00F9F2EC00F7EFE600F6EDE400EFE0D000EFDECE00EEDDCD00EEDCCA00EDDC
      CA00EDDBC900EDDBC900F0E1D200E1C6AB000000000000000000D1B19100F0E2
      D300EDDCCA00F0E2D300E7CEB60000000000E2CDB900DCC0A300E1C6AB00E4CB
      B200EFE0D000000000000000000000000000E8E8E800E8E8E800E8E8E800E8E8
      E800E8E8E800E8E8E800E8E8E800E8E8E80062626200959595006E6E6E00E8E8
      E800E8E8E800E8E8E800E8E8E800E8E8E8000000000039393900000000000000
      0000393939000000000000000000393939000000000000000000393939000000
      00000000000039393900000000000000000000000000E05F3D0000000000E4CB
      B200F4E8DC00F9F1EB00F8F1E900F2E6D900F2E4D600F2E3D500F1E2D400F0E2
      D300F0E1D300F0E1D200EEDDCC00E4CBB2000000000000000000D1B19100F1E2
      D400EEDCCA00F1E2D400E7CEB60000000000D1B19100EBD9C700EFDFCE00EDDC
      CA00E7CEB600000000000000000000000000C9C9C900FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC0062626200FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00E8E8E8000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E05F3D0000000000EFE0
      D000E7CEB600E7CEB600E7CEB600E7CEB600E7CEB600E7CEB600E7CEB600E7CE
      B600E7CEB600E7CEB600E7CEB600EFE0D0000000000000000000D1B19100F2E3
      D500EEDDCD00F2E3D500E7CEB60000000000D1B19100EFDFD000ECD9C600EFE0
      D000E7CEB600000000000000000000000000C9C9C900FCFCFC00C38F6C00C391
      6D00C3916E00C2926F00C2937000C1937100FCFCFC0062626200FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00E8E8E8000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D0573500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D1B19100F2E4
      D600EFDECE00F2E4D600E7CEB60000000000D1B19100F1E1D200EDDBCA00F1E1
      D200E7CEB600000000000000000000000000C9C9C900FCFCFC00C38F6B00D99B
      7300D69B7300D69D7600D6A17B00C2937000FCFCFC0062626200FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00E8E8E8000000000044444400000000000000
      0000444444000000000000000000444444000000000000000000444444000000
      00000000000044444400000000000000000000000000E05F3D0000000000E2CD
      B900D1B19100D1B19100D1B19100D1B19100D1B19100D1B19100D1B19100E2CD
      B900000000000000000000000000000000000000000000000000D1B19100F2E5
      D800EFE0D000F2E6D900E7CEB60000000000D1B19100F1E3D600EFDECE00F4E8
      DC00E7CEB600000000000000000000000000C9C9C900FCFCFC00C38F6B00D998
      7200D8997200D69B7400D79F7900C2926F00FCFCFC0062626200FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00E8E8E8000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E05F3D0000000000DCC0
      A300F1E5D900F9F1EA00F4E9DD00F1E3D600F1E1D200EFDFD000EBD9C700DCC0
      A300000000000000000000000000000000000000000000000000D1B19100F8F1
      E900F6EDE400F8F1E900E7CEB60000000000D1B19100F4E9DD00F4E9DE00F7EF
      E600E7CEB600000000000000000000000000C9C9C900FCFCFC00C38F6B00C490
      6C00C38F6C00C3906D00C3916D00C3916E00FCFCFC0062626200FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00E8E8E8000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E05F3D0000000000E1C6
      AB00F9F2EC00F7EDE500F4E9DE00EFDECE00EDDBCA00ECD9C600EFDFCE00E1C6
      AB00000000000000000000000000000000000000000000000000D1B19100F9F1
      EB00F7EFE600F9F1EB00E7CEB60000000000D1B19100F9F1EA00F7EDE500F9F1
      EA00E7CEB600000000000000000000000000C9C9C900FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC006C6C6C00FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00E8E8E800000000004D4D4D00000000000000
      00004D4D4D0000000000000000004D4D4D0000000000000000004D4D4D000000
      0000000000004D4D4D00000000000000000000000000E05F3D0000000000E4CB
      B200F3E8DC00F9F1EA00F7EFE600F4E8DC00F1E1D200EFE0D000EDDCCA00E4CB
      B200000000000000000000000000000000000000000000000000D1B19100F2E5
      D900F9F2EC00F4E8DC00E7CEB60000000000D1B19100F1E5D900F9F2EC00F3E8
      DC00E7CEB600000000000000000000000000C9C9C900C9C9C900C9C9C900C9C9
      C900C9C9C900C9C9C900C9C9C900C9C9C9006B6B6B008E8E8E0075757500C9C9
      C900C9C9C900C9C9C900C9C9C900C9C9C9000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E05F3D0000000000EFE0
      D000E7CEB600E7CEB600E7CEB600E7CEB600E7CEB600E7CEB600E7CEB600EFE0
      D000000000000000000000000000000000000000000000000000E2CDB900DCC0
      A300E1C6AB00E4CBB200EFE0D00000000000E2CDB900DCC0A300E1C6AB00E4CB
      B200EFE0D0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E1684600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000054545400000000000000
      0000545454000000000000000000545454000000000000000000545454000000
      00000000000054545400000000000000000000000000ED876500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E9634100E05F3D00E05F
      3D00E05F3D00E05F3D00E05F3D00D0573500E05F3D00E05F3D00E05F3D00E05F
      3D00E05F3D00E1684600ED876500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B7B7B70085858500C3C3C3000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E8E8E8009595950000000000898989000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B8D2B700357F3300C8DCC7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000B8C6D2003357790033567800B7C3CF00000000000000
      000000000000000000000000000000000000000000000000000000000000A3A3
      A300D4D4D4000000000000000000B2B2B200D3D3D300F5F5F5009B9B9B000000
      000000000000000000000000000000000000F8CCC100EC775A00E9634100E963
      4100E9634100E9634100E9634100E9634100E9634100E9634100E9634100E963
      4100E9634100E9634100EC775A00F8CCC1000000000000000000000000000000
      0000B9D8B700398E33002BAE200041963C00D7E9D60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B7C3CF00335577005494B70034679A00355B7C00B7C4D0000000
      0000000000000000000000000000000000000000000000000000000000008B8B
      8B0092929200D7D7D700EAEAEA009D9D9D0000000000B0B0B000D3D3D3000000
      000000000000000000000000000000000000E1725400F0A79300F6C4B700EB97
      8100F4C1B500FBE9E800FCECEC00FCECEC00FCECEC00FCECEC00FCECEC00FCEC
      EC00FCECEC00FCECEC00F3C3B900E1725400000000000000000000000000BADC
      B7003C9B330033C3250024CD13002BBB1D004DA44500E5F2E400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BED2DE00457B9D003A719F00386F9D005F9FC0004578AB0039648600B9C8
      D300000000000000000000000000000000000000000000000000000000009191
      9100EEEEEE0097979700ACACAC00D6D6D600F6F6F600A6A6A600F9F9F9000000
      000000000000000000000000000000000000CF553300F3C3B600F2C1B400E18B
      7300F5E4E300F5E7E700F5E7E700F5E7E700F5E7E700F5E7E700FBF4F400F5E7
      E700F5E7E700F5E7E700F5E7E700CF5533000000000000000000BBDDB7003D9F
      33004ACC3A0029C3180039CC280028C2170031B123005AAD5100F0F8EF000000
      000000000000000000000000000000000000000000000000000000000000B7C3
      CF00335577004F8DB30068ACC8004880AC005087B3006AAAC8005588BB003E6F
      9100BBCCD7000000000000000000000000000000000000000000000000009898
      980000000000EEEEEE00B1B1B10000000000B8B8B800D7D7D700000000000000
      000000000000000000000000000000000000C14D2B00EFC4B700EDBEB100D786
      6E00ECE2E200ECE2E200ECE2E200ECE2E200ECE2E200ECE2E200EE664400F7F1
      F100ECE2E200ECE2E200ECE2E200C14D2B0000000000BBDFB7003EA4330063DA
      530033BC220055D145003EA4330034B625002CB81B0036AC28006AB86100F7FB
      F700000000000000000000000000000000000000000000000000C0D5E1004A86
      A8005FA1C0003F79A3004278A70066A6C500619DC2005E95C10074B4D1006598
      CB0055555500C3C3C30000000000000000000000000000000000000000009D9D
      9D00000000000000000000000000F7F7F700A0A0A0009D9D9D009D9D9D009D9D
      9D00B6B6B600000000000000000000000000B5472500F0C7BA00ECC1B300CE81
      6900E3DCDC00F2EEEE00F2EEEE00F2EEEE00F2EEEE00F2EEEE00B5472500EE66
      4400F2EEEE00E3DCDC00E3DCDC00B5472500000000003FA8330070E65F0059D0
      48006BE15A003FA8330098D0920043AB37003AB6290032B221003BAB2D007BC3
      7300FDFEFD0000000000000000000000000000000000B7C3CF00335577003368
      9800508CB30069ABC80067A7C6004D80B30071B1CE006EA9CD006CA3CE006D6D
      6D00AA9999005B5B5B00BDD1DD0000000000000000000000000000000000A2A2
      A20000000000000000000000000000000000000000000000000000000000A7A7
      A700D9D9D900000000000000000000000000AD442200F1C8BB00EEC5B800CB82
      6B00DDD8D800EE664400EE664400EE664400EE664400EE664400AD442200AD44
      2200EE664400EEEBEB00DCD7D700AD44220000000000BCE1B70041AC330074EA
      630041AC3300BCE1B70000000000B8E0B30040AE330040B72F0038AF270040AE
      31008CCD8400000000000000000000000000C1D8E4004F8FB1006AAEC90066A8
      C5005692B8004B80AF005D97BF0077B9D200669DC8007BBAD5007E7E7E00CEC0
      C000797979005588BB005A8CAB0000000000000000000000000000000000A6A6
      A600000000000000000000000000000000000000000000000000AAAAAA00DBDB
      DB0000000000000000000000000000000000AB452300F2C9BC00EFC6B800CD85
      6E00EBEBEB00AB452300AB452300AB452300AB452300AB452300AB452300AB45
      2300AB452300EE664400D6D4D400AB4523000000000000000000BCE3B70041AF
      3300BCE3B7000000000000000000000000009DD6960045B7370058CF470056CD
      450045B53600A3D99C0000000000000000007DAEC8005496B7005498B800599B
      BA0068ABC60076BAD2006EACCC00669DC80083C7DA0088888800D3CACA008383
      830060A4C60063A7C9005B90AE0000000000000000000000000000000000A9A9
      A9000000000000000000000000000000000000000000ADADAD00DCDCDC000000
      000000000000000000000000000000000000B04C2A00F3CBBD00F0C7BA00D08A
      7200F1F1F100B04C2A00B04C2A00B04C2A00B04C2A00B04C2A00B04C2A00B04C
      2A00B04C2A00D4C7C300E4E4E400B04C2A000000000000000000000000000000
      000000000000000000000000000000000000FEFFFE0084CD7A004DC13D0061D8
      50005FD64F0046B73700B9E3B30000000000FAFCFD00EBF3F700D7E6EE00BED7
      E30088B5CC005F9CBB0064A9C4007BBAD50091919100D9D4D4008D8D8D0068AC
      CE0074B8D4004C89AA00BFD5E10000000000000000000000000000000000ADAD
      AD0000000000000000000000000000000000B1B1B100DEDEDE00000000000000
      000000000000000000000000000000000000BA573500F5CCBF00F2C9BC00D690
      7800F4F4F400F4F4F400F4F4F400F4F4F400F4F4F400F4F4F400BA573500BA57
      3500EDE0DC00F4F4F400F6F6F600BA5735000000000000000000000000000000
      00000000000000000000000000000000000000000000F9FDF9006DC6610056CC
      46006BE25A0072E9620043B53300000000000000000000000000000000000000
      000000000000EFF5F80092BCD10096969600DDDCDC009494940070B4D60080C4
      DB004E8DAF0033488200B7BCD00000000000000000000000000000000000B0B0
      B000000000000000000000000000B4B4B400DFDFDF0000000000000000000000
      000000000000000000000000000000000000C8644200F7CEC000F4CCBE00DE98
      8000F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800C8644200F2E6
      E100F8F8F800F8F8F800FAFAFA00C86442000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F0F9EF005DC2
      4F0077EE660043B93300BDE6B700000000000000000000000000000000000000
      0000000000000000000000000000DBDBDB009898980088CCDD0087CBDD005192
      B400335999003F72B60033529000B7C1D700000000000000000000000000B3B3
      B3000000000000000000B6B6B600E1E1E1000000000000000000000000000000
      000000000000000000000000000000000000D7725000F8CFC200F7CEC000E69F
      8800FCF9F800FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FDFDFD00D77250000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E3F5
      E00044BB3300BDE7B70000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6D1D70064A1BF0064A0BE00C1D9
      E500B7C7DE00335EA0005285C90033589800000000000000000000000000B7B7
      B70000000000B9B9B900E1E1E100000000000000000000000000000000000000
      000000000000000000000000000000000000E78F7100F3B8A500F8CFC200EFAC
      9500F7D5CA00FEFCFB0000000000000000000000000000000000000000000000
      00000000000000000000F8DAD100E78F71000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B7C9E0003363A500B7C7DE00000000000000000000000000B8B8
      B800BBBBBB00E3E3E30000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F9D8CD00EF977900ED876500ED87
      6500ED876500ED876500ED876500ED876500ED876500ED876500ED876500ED87
      6500ED876500ED876500EF977900F9D8CD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CCCC
      CC00E3E3E3000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E2DEDE008E7E7E008E7E7E008E7E
      7E008E7E7E008E7E7E008E7E7E0093838300938383008E7E7E003A6930001A67
      13002F5F2400DAD5D5000000000000000000E2DEDE008E7E7E008E7E7E008E7E
      7E008E7E7E008E7E7E008E7E7E0093838300938383008E7E7E00837373008655
      2A0079533A00DAD5D5000000000000000000E2DEDE008E7E7E008E7E7E008E7E
      7E008E7E7E008E7E7E008E7E7E0093838300938383008E7E7E00837373007664
      64006C5A5A00DAD5D5000000000000000000E2DEDE008E7E7E008E7E7E008E7E
      7E008E7E7E008E7E7E00000000003260710071757A008E7E7E00837272007664
      64006C5A5A00DAD5D5000000000000000000000000009A898900DBCACA00D4C3
      C300806F6F00AB9A9A009A898900D4C3C300DBCACA00B4A3A3002D8921002BDF
      1A00217D1400000000000000000000000000000000009A898900DBCACA00D4C3
      C300806F6F00AB9A9A009A898900D4C3C300DBCACA00B4A3A300B4A3A300AA6B
      2C009D5E1F00E0C5A8000000000000000000000000009A898900DBCACA00D4C3
      C300806F6F00AB9A9A009A898900D4C3C300DBCACA00B4A3A300B4A3A300B8A7
      A70076646400000000000000000000000000000000009A898900DBCACA00D4C3
      C300806F6F00AB9A9A004E7B8D00D9F4FF003891A20086999E00B4A3A300B8A7
      A7007664640000000000000000000000000000000000A8979700D8C7C700CCBB
      BB0093838300887777009A898900CCBBBB005DA34E002E8F1F002E8F1F003DE2
      2C00258616003EA333006EBB66000000000000000000A8979700D8C7C700CCBB
      BB0093838300887777009A898900C08C5B00BC7C3B00B4753300B4753300B475
      3300FFC53800C4884600E5CAAC000000000000000000A8979700D8C7C700CCBB
      BB0093838300887777009A898900CCBBBB00554E9C00231F8500231F85002521
      87001A167C00333399006666B5000000000000000000A8979700D8C7C700CCBB
      BB00948383008877770085888E003DA3B40079E6F7002D8596007F929800B4A3
      A3008372720000000000000000000000000000000000B7A8A800DBCACA00D4C3
      C300D4C3C300D4C3C300D4C3C300D4C3C30039A0290052E7410052E7410052E7
      410052E7410052E7410040AA33000000000000000000B7A8A800DBCACA00D4C3
      C300D4C3C300D4C3C300D4C3C300C6874200FFE49500FFD56A00FFD15D00FFD1
      5D00FFD15D00FFD87300CF944F000000000000000000B7A8A800DBCACA00D4C3
      C300D4C3C300D4C3C300D4C3C300D4C3C3002C29A2005E5EF7005E5EF7005E5E
      F7005E5EF7005E5EF7003333AD000000000000000000B7A8A800DBCACA00D4C3
      C300D4C3C300D4C3C300D4C3C3009FB8BF0041A6B70079E6F7002D859600889B
      A1009483830000000000000000000000000000000000B4A3A300C3B2B200AB9A
      9A00BCABAB00AB9A9A00BCABAB00A594940055A144002E9B1B002E9B1B0066EB
      55002B96190041B1330071C466000000000000000000B4A3A300C3B2B200AB9A
      9A00BCABAB00AB9A9A00BCABAB00C08C5700CA8A4400CA8A4400C6874200CA8A
      4400FFE49500DB9F5800EED3B3000000000000000000B4A3A300C3B2B200AB9A
      9A00BCABAB00AB9A9A00BCABAB00A59494004A44A700211EA4001E1AA000211E
      A4001D199E003333B9006666CA000000000000000000B4A3A300C3B2B200AB9A
      9A00BCABAB00AB9A9A00BCABAB00A59494008BA5AB003095A60079E6F7002D85
      96006C72760000000000000000000000000000000000BCABAB00E0CFCF00D4C3
      C300D4C3C300D4C3C300D4C3C300D4C3C300E0CFCF00B4A3A30034A4210075EE
      64002E9B1B0000000000000000000000000000000000BCABAB00E0CFCF00D4C3
      C300D4C3C300D4C3C300D4C3C300D4C3C300E0CFCF00B4A3A300B4A3A300D99A
      4F00D1924900F3D8B700000000000000000000000000BCABAB00E0CFCF00D4C3
      C300D4C3C300D4C3C300D4C3C300D4C3C300E0CFCF00B4A3A300B4A3A300BCAB
      AB009A89890000000000000000000000000000000000BCABAB00E0CFCF00D4C3
      C300D4C3C300D4C3C300D4C3C300D4C3C300E0CFCF008BA5AB00369BAD0079E6
      F70060585800D4D4D400000000000000000000000000B8A7A700C3B2B200B4A3
      A300C3B2B200AB9A9A00BCABAB00AB9A9A00C3B2B200A59494004B9D380033A6
      1F00498E340000000000000000000000000000000000B8A7A700C3B2B200B4A3
      A300C3B2B200AB9A9A00BCABAB00AB9A9A00C3B2B200A49494009A898900CF9B
      6200AA85670000000000000000000000000000000000B8A7A700C3B2B200B4A3
      A300C3B2B200AB9A9A00BCABAB00AB9A9A00C3B2B200A59494009A898900AB9A
      9A009383830000000000000000000000000000000000B8A7A700C3B2B200B4A3
      A300C3B2B200AB9A9A00BCABAB00AB9A9A00C3B2B200A5949400769096008279
      7900F7F7F7007F7F9800B9B9E5000000000000000000C3B2B200E4D3D300DBCA
      CA00DBCACA00DBCACA00DBCACA00DBCACA00E4D3D300BCABAB00BCABAB00C3B2
      B200A594940000000000000000000000000000000000C3B2B200E4D3D300DBCA
      CA00DBCACA00DBCACA00DBCACA00DBCACA00E4D3D300BCABAB00BCABAB00C3B2
      B200A494940000000000000000000000000000000000C3B2B200E4D3D300DBCA
      CA00DBCACA00DBCACA00DBCACA00DBCACA00E4D3D300BCABAB00BCABAB00C3B2
      B200A594940000000000000000000000000000000000C3B2B200E4D3D300DBCA
      CA00DBCACA00DBCACA00DBCACA00DBCACA00E4D3D300BCABAB00BCABAB00B4A3
      A3006B6283008080FF003F3FC4000000000000000000BCABAB00CCBBBB00BCAB
      AB00C8B7B700B4A3A300C3B2B200B4A3A300CCBBBB00AB9A9A00A5949400B4A3
      A3009A89890000000000000000000000000000000000BCABAB00CCBBBB00BCAB
      AB00C8B7B700B4A3A300C3B2B200B4A3A300CCBBBB00AB9A9A00A4949400B4A3
      A3009A89890000000000000000000000000000000000BCABAB00CCBBBB00BCAB
      AB00C8B7B700B4A3A300C3B2B200B4A3A300CCBBBB00AB9A9A00A5949400B4A3
      A3009A89890000000000000000000000000000000000BCABAB00CCBBBB00BCAB
      AB00C8B7B700B4A3A300C3B2B200B4A3A300CCBBBB00AB9A9A00A5949400B4A3
      A3007C6C90005151E800BFBFF1000000000000000000C7B8B800EDDCDC00E4D3
      D300E4D3D300E4D3D300E4D3D300E4D3D300EDDCDC00C3B2B200C3B2B200CCBB
      BB00A594940000000000000000000000000000000000C7B8B800EDDCDC00E4D3
      D300E4D3D300E4D3D300E4D3D300E4D3D300EDDCDC00C3B2B200C3B2B200CCBB
      BB00A494940000000000000000000000000000000000C7B8B800EDDCDC00E4D3
      D300E4D3D300E4D3D300E4D3D300E4D3D300EDDCDC00C3B2B200C3B2B200CCBB
      BB00A594940000000000000000000000000000000000C7B8B800EDDCDC00E4D3
      D300E4D3D300E4D3D300E4D3D300E4D3D300EDDCDC00C3B2B200C3B2B200CCBB
      BB00A594940000000000000000000000000000000000C3B2B200D4C3C300C0AF
      AF00CCBBBB00BCABAB00CCBBBB00BCABAB00D0BFBF00B4A3A300AB9A9A00B8A7
      A700A08E8E0000000000000000000000000000000000C3B2B200D4C3C300C0AF
      AF00CCBBBB00BCABAB00CCBBBB00BCABAB00D0BFBF00B4A3A300AB9A9A00B8A7
      A700A08E8E0000000000000000000000000000000000C3B2B200D4C3C300C0AF
      AF00CCBBBB00BCABAB00CCBBBB00BCABAB00D0BFBF00B4A3A300AB9A9A00B8A7
      A700A08E8E0000000000000000000000000000000000C3B2B200D4C3C300C0AF
      AF00CCBBBB00BCABAB00CCBBBB00BCABAB00D0BFBF00B4A3A300AB9A9A00B8A7
      A700A08E8E0000000000000000000000000000000000CCBBBB00F6E5E500F0DF
      DF00F0DFDF00F0DFDF00F0DFDF00F0DFDF00F6E5E500CCBBBB00CCBBBB00D4C3
      C300AB9A9A0000000000000000000000000000000000CCBBBB00F6E5E500F0DF
      DF00F0DFDF00F0DFDF00F0DFDF00F0DFDF00F6E5E500CCBBBB00CCBBBB00D4C3
      C300AB9A9A0000000000000000000000000000000000CCBBBB00F6E5E500F0DF
      DF00F0DFDF00F0DFDF00F0DFDF00F0DFDF00F6E5E500CCBBBB00CCBBBB00D4C3
      C300AB9A9A0000000000000000000000000000000000CCBBBB00F6E5E500F0DF
      DF00F0DFDF00F0DFDF00F0DFDF00F0DFDF00F6E5E500CCBBBB00CCBBBB00D4C3
      C300AB9A9A0000000000000000000000000000000000D5C8C800C3B2B200AB9A
      9A00CCBBBB00CCBBBB00CCBBBB00CCBBBB00A8979700AB9A9A0088777700A594
      9400BCABAB0000000000000000000000000000000000D5C8C800C3B2B200AB9A
      9A00CCBBBB00CCBBBB00CCBBBB00CCBBBB00A8979700AB9A9A0088777700A494
      9400BCABAB0000000000000000000000000000000000D5C8C800C3B2B200AB9A
      9A00CCBBBB00CCBBBB00CCBBBB00CCBBBB00A8979700AB9A9A0088777700A594
      9400BCABAB0000000000000000000000000000000000D5C8C800C3B2B200AB9A
      9A00CCBBBB00CCBBBB00CCBBBB00CCBBBB00A8979700AB9A9A0088777700A594
      9400BCABAB00000000000000000000000000000000000000000000000000CCBB
      BB00F6E5E500EDDCDC00EDDCDC00F6E5E500CCBBBB00D4C3C300A59494000000
      000000000000000000000000000000000000000000000000000000000000CCBB
      BB00F6E5E500EDDCDC00EDDCDC00F6E5E500CCBBBB00D4C3C300A49494000000
      000000000000000000000000000000000000000000000000000000000000CCBB
      BB00F6E5E500EDDCDC00EDDCDC00F6E5E500CCBBBB00D4C3C300A59494000000
      000000000000000000000000000000000000000000000000000000000000CCBB
      BB00F6E5E500EDDCDC00EDDCDC00F6E5E500CCBBBB00D4C3C300A59494000000
      000000000000000000000000000000000000000000000000000000000000CCBB
      BB00FBEAEA00F6E5E500F6E5E500FBEAEA00D4C3C300DBCACA00A89797000000
      000000000000000000000000000000000000000000000000000000000000CCBB
      BB00FBEAEA00F6E5E500F6E5E500FBEAEA00D4C3C300DBCACA00A89797000000
      000000000000000000000000000000000000000000000000000000000000CCBB
      BB00FBEAEA00F6E5E500F6E5E500FBEAEA00D4C3C300DBCACA00A89797000000
      000000000000000000000000000000000000000000000000000000000000CCBB
      BB00FBEAEA00F6E5E500F6E5E500FBEAEA00D4C3C300DBCACA00A89797000000
      000000000000000000000000000000000000000000000000000000000000DBCA
      CA00CCBBBB00CCBBBB00CCBBBB00CCBBBB00C3B2B200B4A3A300BFB2B2000000
      000000000000000000000000000000000000000000000000000000000000DBCA
      CA00CCBBBB00CCBBBB00CCBBBB00CCBBBB00C3B2B200B4A3A300BFB2B2000000
      000000000000000000000000000000000000000000000000000000000000DBCA
      CA00CCBBBB00CCBBBB00CCBBBB00CCBBBB00C3B2B200B4A3A300BFB2B2000000
      000000000000000000000000000000000000000000000000000000000000DBCA
      CA00CCBBBB00CCBBBB00CCBBBB00CCBBBB00C3B2B200B4A3A300BFB2B2000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BDC5CD006C7D8F00CCD2D800000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C2CA
      D20078899A00D3E3F40078899A00CDD4DC000000000000000000000000003DA1
      32002BDF1A003DA1320000000000000000000000000000000000000000000000
      0000000000009BABBC007A828A00D2E0EE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C0CAD000697A8C00CDD4DB00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C2CA
      D20078899A00D1E1F10078899A00CFD5DC000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000889A
      AB00D3E3F400C4D5E600D3E3F400889AAB00D6DDE50070C166003DA132003DA1
      32003DE22C003DA132003DA1320070C166000000000000000000000000000000
      0000D2E0EE007A828A00D2E0EE007A828A00D2E0EE0000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C0CA
      D00081899800D3E3F40081899800CDD4DB000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008496
      A800D1E1F100C1D2E300D4E3F2008496A800D4DBE10000000000000000000000
      00000000000000000000000000000000000000000000CDD4DC00889AAB006677
      8800CBDBEC00C4D5E600C4D5E600D3E3F400889AAB003DA1320052E7410052E7
      410052E7410052E7410052E7410041B133000000000000000000000000000000
      00007A828A00D2E0EE00D2E0EE00D2E0EE007A828A00D2E0EE005F5FE3003233
      A7003233A7003233A7003233A7003233A7000000000000000000000000007F98
      AB00D3E3F400C3D5E500D3E3F4007F98AB00D5DBE30000000000000000000000
      00000000000000000000000000000000000000000000CBD3DB008B9DAF006677
      8800CADAEA00C3D4E500C4D5E600D6E5F3008B9DAF00D6DCE300000000000000
      000000000000000000000000000000000000CDD4DC0091A3B400D3E3F400CBDB
      EC00C7D8E900C4D5E600C4D5E600C7D8E900D9E7F500479C50003BB02D0041B1
      330066EB550041B1330041B1330070C166000000000000000000D2E0EE009BAB
      BC007A828A00D2E0EE00D2E0EE00D2E0EE00D2E0EE009BABBC003233A7005F5F
      E3005F5FE3005F5FE3005F5FE3005F5FE30000000000CDD4DB008C9EAF00697A
      8C00C9DAEB00C3D5E500C3D5E500D3E3F4008C9EAF00D5DBE300000000000000
      000000000000000000000000000000000000CCD4DD008FA1B200D1E1F100CADA
      EA00C7D8E800C4D5E600C5D6E700C7D8E900D9E7F5008FA1B200D7DEE4000000
      00000000000000000000000000000000000091A3B400D3E3F400C4D5E600C4D5
      E600C4D5E600C4D5E600C7D8E900CBDBEC00CBDBEC00DBE9F80091A3B4003BB0
      2D0075EE640041B13300000000000000000000000000D2E0EE009BABBC00D2E0
      EE00D2E0EE00D2E0EE00D2E0EE00D2E0EE00D2E0EE00D2E0EE003233A7003233
      A7003233A7003233A7003233A7003233A700CDD4DB008C9EAF00D3E3F400C9DA
      EB00C9DAEB00C3D5E500C3D5E500C9DAEB00DAE8F5008C9EAF00D5DBE3000000
      00000000000000000000000000000000000092A4B500D1E1F100C1D2E300C3D4
      E500C4D5E600C5D6E700C7D8E900C8D9EA00CADBEC00DCE9F60092A4B500D9DF
      E50000000000000000000000000000000000DCE2E80099AABC00D3E3F400C4D5
      E600C4D5E600C7D8E900CBDBEC00CBDBEC00CBDBEC00CBDBEC00DBE9F800479C
      50003BB02D0070C166000000000000000000000000009BABBC00D2E0EE00D2E0
      EE00D2E0EE00D2E0EE00D2E0EE00D2E0EE00D2E0EE00D2E0EE00D2E0EE009BAB
      BC00D2E0EE0000000000000000000000000096A4B700D3E3F400C3D5E500C3D5
      E500C3D5E500C3D5E500C9DAEB00C9DAEB00C9DAEB00DAE8F50096A4B700D5DB
      E30000000000000000000000000000000000DAE0E60096A7B900D4E3F200C4D5
      E600C5D6E700C7D8E900C8D9EA00CADBEC00CBDCED00CDDEEF00DFEBF80096A7
      B900DAE0E60000000000000000000000000000000000DCE2E80099AABC00D3E3
      F400C7D8E900CBDBEC00CBDBEC00CBDBEC00CBDBEC00CEDFF000D3E3F400E2EE
      FA0099AABC00DCE2E800000000000000000000000000D2E0EE009BABBC00D2E0
      EE00D2E0EE00D2E0EE00D2E0EE00D2E0EE00D2E0EE00D2E0EE00D2E0EE00D2E0
      EE009BABBC00D2E0EE000000000000000000DDE3E90096A4B700D3E3F400C3D5
      E500C3D5E500C9DAEB00C9DAEB00C9DAEB00C9DAEB00C9DAEB00DDECFA0096A4
      B700DDE3E90000000000000000000000000000000000DBE1E70098AABB00D6E5
      F300C7D8E900C8D9EA00CADBEC00CBDCED00CDDEEF00CEDFF000D0E1F200E2ED
      F90098AABB00DBE1E70000000000000000000000000000000000DCE2E80099AA
      BC00D9E7F500CBDBEC00CBDBEC00CBDBEC00CEDFF000D3E3F400D3E3F400889A
      AB00E2EEFA0099AABC00DCE2E800000000000000000000000000D2E0EE009BAB
      BC00D2E0EE00D2E0EE00D2E0EE00D2E0EE00D2E0EE00D2E0EE00D2E0EE00D2E0
      EE00D2E0EE009BABBC00D2E0EE000000000000000000DDE3E9009AACBD00D3E3
      F400C9DAEB00C9DAEB00A3B8C900447D940000000000C9DAEB00D3E3F400DDEC
      FA009AACBD00DDE3E90000000000000000000000000000000000DBE2E8009BAC
      BE00D9E7F500CADBEC00CBDCED00CDDEEF00CEDFF000D0E1F200D1E2F3008A9B
      AC00E5EFFB009BACBE00DBE2E80000000000000000000000000000000000DCE2
      E800A1B3C400DBE9F800CBDBEC00CEDFF000D3E3F400D3E3F40091A3B400D3E3
      F400D3E3F400E9F2FD00A1B3C400DCE2E800000000000000000000000000D2E0
      EE009BABBC00D2E0EE00D2E0EE00D2E0EE00D2E0EE00D2E0EE00D2E0EE00D2E0
      EE009BABBC00000000009BABBC00D2E0EE000000000000000000DDE3E9009AAC
      BD00DAE8F500A3B8C9003A9AAD00DDECFA0068A6C000D3E3F400D3E3F4008C9E
      AF00DDECFA009AACBD00DDE3E90000000000000000000000000000000000DCE3
      E9009EAFC000DCE9F600CDDEEF00CEDFF000D0E1F200D1E2F3008FA0B100D4E5
      F600D5E6F700E8F1FC009EAFC000DCE3E9000000000000000000000000000000
      0000DCE2E800A1B3C400DBE9F800D3E3F400D3E3F40091A3B400D3E3F400D3E3
      F400DBE9F800DBE9F800E9F2FD00A1B3C4000000000000000000000000000000
      0000D2E0EE009BABBC00D2E0EE00D2E0EE00D2E0EE00D2E0EE00D2E0EE009BAB
      BC00D2E0EE00D2E0EE00000000009BABBC00000000000000000000000000DDE3
      E9007F98AB003A9AAD0079E6F70043B0C400A8D2E500D3E3F4008C9EAF00D3E3
      F400D3E3F400E9F2FD009AACBD00DDE3E9000000000000000000000000000000
      0000DEE4EA00A0B1C200DFEBF800D0E1F200D1E2F30095A6B700D4E5F600D5E6
      F700D7E8F900D8E9FA00EAF3FD00A0B1C2000000000000000000000000000000
      000000000000DCE2E800A1B3C400E2EEFA0099AABC00D3E3F400D3E3F400DBE9
      F800E2EEFA00E9F2FD00A1B3C400D6DDE5000000000000000000000000000000
      000000000000D2E0EE009BABBC00D2E0EE00D2E0EE00D2E0EE009BABBC00D2E0
      EE00D2E0EE00D2E0EE00D2E0EE0000000000000000000000000000000000C3D5
      E5003A9AAD0079E6F70043B0C400A8D2E500D3E3F40096A4B700D3E3F400D3E3
      F400DDECFA00DDECFA00E9F2FD00A3B8C9000000000000000000000000000000
      000000000000DEE4EA00A2B4C500E2EDF90099AABB00D4E5F600D5E6F700DBEA
      F900E0EDFB00EAF3FD00A2B4C500D4DCE4000000000000000000000000000000
      00000000000000000000DCE2E800A1B3C400E2EEFA00D3E3F400DBE9F800E2EE
      FA00889AAB00A1B3C400D6DDE500000000000000000000000000000000000000
      00000000000000000000D2E0EE009BABBC00D2E0EE009BABBC00D2E0EE00D2E0
      EE00D2E0EE00D2E0EE00000000009BABBC000000000000000000C0CAD0003A9A
      AD0079E6F70043B0C4007DABBF00DDECFA009AACBD00D3E3F400D3E3F400DDEC
      FA00DDECFA00E9F2FD00A3B8C900D5DBE3000000000000000000000000000000
      00000000000000000000DFE5EB00A5B6C700E5EFFB00D5E6F700D7E8F900E0ED
      FB008899AA00A5B6C700D7DEE600000000000000000000000000000000000000
      0000000000000000000000000000E0E6EC00A8B9CA00E9F2FD00DBE9F800E9F2
      FD00A8B9CA000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000D2E0EE009BABBC0000000000D2E0EE00D2E0
      EE00D2E0EE009BABBC009BABBC00D2E0EE0000000000D5DBE3008189980079E6
      F70043B0C400C0E8EE00DDE3E900A3B8C900DDECFA00D3E3F400DDECFA00DDEC
      FA008C9EAF00A3B8C900D5DBE300000000000000000000000000000000000000
      0000000000000000000000000000E0E6EC00A7B8C900E8F1FC00D8E9FA00EAF3
      FD00A7B8C9000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E0E6EC00A8B9CA00E9F2FD00A8B9
      CA00D6DDE5000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D2E0EE009BABBC0000000000D2E0
      EE00000000009BABBC000000000000000000BCBCEB008189980000000000B2B2
      B200C0E8EE000000000000000000DDE3E900A3B8C900E9F2FD00DDECFA00E9F2
      FD00A3B8C9000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E0E6EC00A8B9CA00EAF3FD00A8B9
      CA00D8DFE7000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E0E6EC00A8B9CA00DCE2
      E800000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D2E0EE009BABBC000000
      00009BABBC00D2E0EE0000000000000000003F3FC4008080FF0096A4B700DDE3
      E90000000000000000000000000000000000DDE3E900A3B8C900E9F2FD00A3B8
      C900D5DBE3000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E1E7ED00A9BACB00D8E0
      E700000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D2E0EE009BAB
      BC00D2E0EE00000000000000000000000000BCBCEB005151E800D5DBE3000000
      00000000000000000000000000000000000000000000DDE3E900A3B8C900DDE3
      E900000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000ABAB
      9F008E8E7E008E8E7E008E8E7E008E8E7E008E8E7E008E8E7E008E8E7E008E8E
      7E00ABAB9F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009A9A
      890000000000000000000000000000000000FEFEFD00FEFEFD00FDFDFB00FEFE
      FB009A9A890000000000000000000000000000000000000000006A92B900386C
      A100386CA1006A92B90000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000006A92B900386CA1004A6A
      9900386CA1004A6A9900386CA1004A6A9900386CA1004A6A9900386CA1004A6A
      9900386CA1004A6A9900386CA1006A92B900666B940033396E0033396E003339
      6E0033396E0033396E0033396E0033396E0033396E0033396E0033396E003339
      6E0033396E0033396E0033396E00666B9400A4A4A40083838300838383007979
      790000000000FF964B00FFC79E00D6C8A6006380410087673000A8754200FCFC
      F800797979008383830083838300A4A4A40000000000000000004479AD0086B9
      EB0081B4E6004479AD0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004479AD0086B9EB00679A
      CD0081B4E600679ACD0081B4E600679ACD0081B4E600679ACD0081B4E600679A
      CD0081B4E6006C9FD1005C91C500608DB90033447D00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE0033447D0099999900C5BDBD00C5BABA005959
      5900595959005959590059595900595959005959590059595900595959005959
      590059595900CCBBBB00CCBBBB009999990000000000000000005576A4006FA2
      D4007BAEE0005186BC0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000005578A6006FA2D4007BAE
      E00083B6E80083B6E80083B6E80083B6E80083B6E80083B6E80083B6E8007BAE
      E0007FB2E4006399CE006B98C600EDF2F800334E8A00FBFBFB009A673400A06D
      3A00A7744100B07D4A00BA875400C4915E00CF9C6900DAA77400E4B17E00EDBA
      8700F5C28F00FCC99600FBFBFB00334E8A00A1A1A100C4C2C200B8B0B0006F6B
      6B00968A8A009588880096878700968787009687870097878700978787009787
      870071696900CCBBBB00CCBBBB00A1A1A1000000000000000000578DC20086B9
      EA007DB0E200578DC20000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000578DC20086B9EA007DB0
      E200578DC200578DC200578DC200578DC200578DC2005A8FC40075AADC0082B5
      E600669CD100709ECB00EEF3F9000000000033518E00F7F7F7009A673400A06D
      3A00A7744100B17E4B00BD8B5800CA9A6700D8AB7800E5BC8900F0CB9800F8D9
      A600FDE4B100FFEBB800F7F7F70033518E00ABABAB00B8B8B800A5A5A5002020
      2000605454005A4D4D005A4D4D005A4D4D005A4D4D005A4D4D005A4D4D005A4D
      4D00202020009D9D9D00AFAFAF00ABABAB0000000000000000005B7FAD0072A5
      D70080B3E4005B91C50000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000005B81B00072A5D70080B3
      E4005B91C5000000000000000000B6CEE5005E93C80078ACDE0085B8E8006AA0
      D30073A1CE00EEF4F900000000000000000033559300F3F3F300564E12005A51
      1600625A1E00746C30007D743900887E440094895000A0955C00ADA16900BBAE
      7800D5C39500F0D8B600F3F3F30033559300BDBDBD00CFCFCF00BEBEBE003131
      31005C5656004D4444004D4444004D4444004D4444004D4444004D4444004E46
      46003131310066FF6600BFB4B400BDBDBD0000000000000000005F94C8008CBF
      ED0083B6E6005F94C80000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000005F94C8008CBFED0083B6
      E6005F94C80000000000B7CFE7006196CB007CB0E00088BBE9006DA2D60077A4
      D000EEF4F90000000000000000000000000033589700EFEFEF003B5D19004B6C
      29005C7C3A00A1AD8200BFC29F00DCD4B800EDE2CE00F5E8D700FFF0E300FFF0
      E400FFF6EE00FFFBF700EFEFEF0033589700D1D1D100C2C2C200C9C9C9004444
      44006766660049464600403C3C003F3B3B003F3B3B003F3B3B003F3B3B004844
      440044444400BBB1B100B0ABAB00D1D1D10000000000000000005F86B40076A9
      D90086B9E8006297CB0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000005F88B60076A9D90086B9
      E9006297CB00B8D0E8006399CD007EB2E4008BBEEC0070A5D9007AA7D300EFF4
      FA0000000000000000000000000000000000335A9B00EBEBEB0061813F006B89
      4900BCBA9100FFE5D100FFE7D500FFEBDB00FFEADA00FFE5D100FFEFE300FFEC
      DE00FFF0E400FFF5EE00EBEBEB00335A9B00E2E2E200BBBBBB00DADADA005858
      580076767600666666005F5F5F0052515100444343003C3B3B00373636004A49
      490058585800BFB9B900B2B2B200E2E2E2000000000000000000669BCF0092C5
      F10089BCEA00669BCF0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000669BCF0093C6F2008ABD
      EB00669BCF00689DD10081B6E5008FC2EE0073A9DC007DAAD600EFF5FA000000
      000000000000000000000000000000000000335D9E00E7E7E700C4B38300E5CC
      A900FFD7BA00FFD6B900FFD7B900FFE4D000FFD6B800FFD0AF00FFD3B300FFDB
      C100FFE7D500FFEEE100E7E7E700335D9E00F1F1F100BDBDBD00E8E8E8006868
      6800838383007D7D7D007D7D7D007D7D7D007D7D7D007D7D7D007C7C7C008080
      800068686800E4E4E400BCBCBC00F1F1F1000000000000000000628CBB007AAD
      DC008CBFED00699DD20000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000628EBD007BAEDD008DC0
      EE006A9ED40085B8E80092C5F10075ABDD007FABD800EFF5FA00000000000000
      0000000000000000000000000000000000003360A200E3E3E300FFA86900FFAC
      6F00FFB57E00FFC09200FFB27A00FFB78300FFC09200FFC09100FFB68100FFD0
      AD00FFEBDC00FFE5D200E3E3E3003360A200FEFEFE00CBCBCB00BABABA007474
      7400757575007575750075757500757575007575750075757500757575007575
      750074747400BABABA00CBCBCB00FEFEFE007DA5CD004F84B900236DB60098CB
      F5008FC2EF00236DB6004F84B9004F84B9004F84B9004F84B9004F84B9004F84
      B9004F84B9004F84B9004F84B9007DA5CD00000000006BA0D30099CCF60090C3
      F00087BBEA0095C8F30078AEE00081AEDA00F0F5FB0000000000000000000000
      0000000000000000000000000000000000003362A500E0E0E000FF8C3A00FF8D
      3C00FF904100FF934500FF8F3F00FF8E3E00FF974C00FF9F5A00FFA15E00FFB5
      8000FFCEAB00FFCCA700E0E0E0003362A500000000000000000000000000C5C5
      B400FAFAF400F5F5ED00F2F2EA00EEEEE200E8E8D900E6E6D500E5E5D400F2F2
      E100C5C5B4000000000000000000000000006297CB008CBFED003475B6007DB0
      DE0092C5F1003A84CB0083B6E60083B6E60083B6E60083B6E60083B6E60083B6
      E60083B6E60083B6E6008CBFED006297CB00000000006592C1007EB1DF0093C6
      F20098CBF4007BB0E20084B0DC00F0F5FB000000000000000000000000000000
      0000000000000000000000000000000000003365A800DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE003365A800000000000000000000000000C7C7
      B600FAFAF300F2F2EA00EEEEE200E8E8D900E6E6D500A4A49300A4A49300A4A4
      9300A6A695000000000000000000000000006DA1D500A3D6FB004791D5009ED1
      F80095C8F3004791D5009ED1F8007EB1DF009ED1F8007EB1DF009ED1F8007EB1
      DF009ED1F8007EB1DF00A3D6FB006DA1D5000000000070A4D8009FD2F9009ACD
      F6007DB3E40086B2DE00F0F6FB00000000000000000000000000000000000000
      000000000000000000000000000000000000668CBF003366AA003366AA003366
      AA003366AA003366AA003366AA003366AA003366AA003366AA003366AA003366
      AA003366AA003366AA003366AA00668CBF00000000000000000000000000C9C9
      B800F9F9F000EEEEE200E8E8D900E6E6D500E5E5D400B6B6A50000000000C9C9
      B800EDEDE80000000000000000000000000098BEE40075A8DC003073B60080B3
      E00097CAF5003681CA0075A8DC006599CC0075A8DC006599CC0075A8DC006599
      CC0075A8DC006599CC0075A8DC0098BEE400000000006796C50085B8E3007FB4
      E50088B4E000F0F6FB0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CACA
      BA00FBFBEF00F4F4E500F3F3E200F2F2E100F2F2E100C2C2B100CACABA00ECEC
      E60000000000000000000000000000000000000000000000000075A8DC00A6D9
      FD00A1D4FA0075A8DC0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000075A8DC0081B6E6008AB5
      E100F1F6FB000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D8D8
      CC00CCCCBB00CCCCBB00CCCCBB00CCCCBB00CCCCBB00CCCCBB00EDEDE7000000
      000000000000000000000000000000000000000000000000000099BFE50076A9
      DD0076A9DD0099BFE50000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000099BFE5008BB6E200F1F6
      FB00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009865FF009663FF009461
      FF00925FFF00905DFF008D5AFF008A57FF008855FF008552FF00824FFF00804D
      FF007E4BFF007C49FF007A47FF009973FF0000000000DDDDDD0085858500A5A5
      A500000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007E7E7E00858585008585850085858500858585007E7E7E000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009966FF009865FF009663FF009461
      FF00925FFF00905DFF008D5AFF008A57FF008855FF008552FF00824FFF00804D
      FF007E4BFF007C49FF007A47FF007845FF0000000000A4A4A400EADADA008B88
      8800BCBCBC000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008A8A8A00C7C7C700D1D1D100D5D5D500CCCCCC008A8A8A000000
      000000000000000000000000000000000000000000000000000000000000CAD8
      E6006D93BA004777A8003B6FA2003C6FA3005582AF007498BD00A3BCD400E1E9
      F10000000000000000000000000000000000000000009865FF009663FF009461
      FF00925FFF00905DFF008D5AFF008A57FF008855FF008552FF00824FFF00804D
      FF007E4BFF007C49FF007A47FF009973FF0000000000C6C6C600A7A5A500DDD1
      D10085848400CDCDCD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000099999900ACACAC00ACACAC00ACACAC00ACACAC00999999000000
      0000000000000000000000000000000000000000000000000000000000005283
      B60072A6D2008FC2EA0098CCF10095C8EF008ABEE50075AAD5005E93C3004A7F
      B300779EC600D2DFED000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000D4D4D400A5A4
      A400CCC4C40086858500DBDBDB00000000000000000000000000000000000000
      000000000000000000000000000000000000B7B7B7009E9E9E009E9E9E009E9E
      9E009E9E9E009E9E9E009F9F9F009F9F9F009F9F9F009F9F9F009E9E9E009E9E
      9E009E9E9E009E9E9E009E9E9E00B7B7B7000000000000000000000000005586
      B80095C8ED008EC1ED008EC1EC0092C5EF0096C9F10093C6EF0094C7F00097CA
      F00072A8D6005A8EC200A7C3DE0000000000FFFFFF00FFFFFF00FFFFFF00CBD9
      E7006E94BA004777A8003B6FA2003D70A3005582AF007498BD00A3BCD400E2EA
      F200FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000DFDF
      DF00A6A5A500BCB8B80087878700E1CFCA00F09F8A00EA775900E7664500EA77
      5900F09F8A00FBE6E1000000000000000000A2A2A200CCCCCC00CBCBCB00CECE
      CE00D2D2D200D5D5D500D8D8D800D9D9D900DADADA00D9D9D900D6D6D600D3D3
      D300D0D0D000CDCDCD00CDCDCD00A2A2A20000000000000000000000000086A8
      CA005D91C10098CAF10091C4EE008BBFE70084B7E10087BBE50090C3EE008BBE
      EB0090C3EE0092C6ED005F94C700C6D9EB00FFFFFF00FFFFFF00FFFFFF005686
      B80070A4D1008FC2EA0098CBF10095C8EF0089BEE50075AAD5005F94C5004C81
      B500789FC600D3E0ED00FFFFFF00FFFFFF000000000000000000000000000000
      0000E7E7E700A7A7A700BC938800D4674A00EBAA9700F6DDD400F9F1EB00F6DD
      D500EDAD9B00DF725400F2CABF0000000000A5A5A500CDCDCD00C18C4800CF93
      4300D69A4800DCA04E00E2A65400E9AD5900EDB15E00F2B66200F5B96500F7BB
      6600F7BB6600EEB97200CDCDCD00A5A5A500000000000000000000000000F7F9
      FB00769BC1005C90BF009DD0F5005184B600000000004F82B50093C6EF0089BC
      E90093A2AD009E6B38008296A60078A4D000FFFFFF00FFFFFF00FFFFFF0089AB
      CD006093C30099CBF1008DC0EC0091C4EE0096C9F10092C5EF0094C7EF0096CA
      F00073A9D7005B8FC300A8C3DF00FFFFFF000000000000000000000000000000
      000000000000DDD4D200C8634400E6C2B100F5EBE100F8F0E900F8F0E900F8F0
      E900F8F2EB00EECCC000D0694D00F6E4DE00A8A8A800D0D0D000BB7F3100D094
      4200D69A4700DCA04C00E2A65100E9AD5500EEB25900F3B75D00F8BC6100FCC0
      6400FEC26600F7BB6600D0D0D000A8A8A800C4D4E4005583B1005784B20095B2
      CF00C4D4E4004477AA0097CAF2006599C8004275A8006296C6008BBEEA0086B9
      E700B8855200BE8B5800A8754200738AA100FFFFFF00FFFFFF00FFFFFF00F7F9
      FB00769CC1005D90BF0099CCF3008BBEE70083B7E10087BAE50090C3EE008BBE
      EB0098A8B1009E6B38006A819800C6D9EB000000000000000000000000000000
      000000000000D38F7A00D89E8800EFDFCE00F7EDE600F8F0E900F8F0E900F8F0
      E900F8F0E900F8F0E800D99F8C00D38F7A00ABABAB00D3D3D300B67A2E00C98D
      4000C68A3C00CA8E3E00D0944200D69A4700DCA04C00E2A65100E9AD5500EEB2
      5900F3B75D00F1B56100D3D3D300ABABAB006997C5007DB1DC008EC2EC0070A4
      D2005C8EC1006B9FCF008FC1ED0089BCE9008EC1ED0089BCE90083B6E50083B6
      E500CE9B6800F7C49100F6C39000B5824F00C4D4E4005583B1005784B20095B2
      CF00C4D4E4004477AA009DD0F5005084B600FFFFFF004F82B50092C5EF0088BB
      E900B8855200BE8B5800A87542008296AA000000000000000000000000000000
      000000000000B75B3E00E7CAB900F1E4D500FBF7F200FBF7F300FBF7F300FBF7
      F300FBF7F300FAF3EE00E8CEBE00B75B3E00AEAEAE00D7D7D700B2762A00CD91
      4500CA8E4200C3873B00C1853800C5893B00CA8E3E00D0944200D69A4700DCA0
      4C00E2A65100E6AA5800D7D7D700AEAEAE0074A4D60092C6F00080B3E40087BA
      E8008EC1ED008CBFEC0080B3E40080B3E40080B3E40080B3E40080B3E40080B3
      E400A0AFBD00D9A67300D3A06D00869CB3006795C3007CAFDB008FC2EC006EA2
      D1005A8DBF006A9DCC0094C7F0006599C8004275A8006296C6008ABDEA0085B7
      E600CE9B6800F7C49100F6C39000B5824F000000000000000000000000000000
      000000000000AD4A2800EDDBCA00F5ECE100AB462400AB462400AB462400AB46
      2400AB462400FBF7F200EFDFD000AD4A2800B0B0B000DADADA00B1752900D397
      4B00D3974B00D3974B00CF934700C98D4100C4883C00C3873A00C5893B00CA8E
      3F00D1954400D99D4E00DADADA00B0B0B00081AEDA007FB4E5008ABDEA007EB1
      E2007EB1E2005C7DD3001616AF00597AD0007EB1E2007EB1E2005BA6CC00158C
      9D0059A3C9007FB2E30085BAE80089B3DD0074A4D50093C6F00081B4E40088BA
      E8008FC1ED008DBFEC0081B4E40087BAE8008DC0EC0087BAE80081B4E40081B4
      E400A1B0BD00D9A67300D3A06D00859CB2000000000000000000000000000000
      000000000000BC644600E7CBB900F1E4D500F5ECE100F5ECE100F5ECE100F5EC
      E100F5ECE100F1E4D500E7CEBD00BC644600B3B3B300DEDEDE00B4782C00DEA2
      5600DEA25600DEA25600DEA25600DEA25600DEA25600DEA25600DEA25600DEA2
      5600DEA25600D99D5100DEDEDE00B3B3B300E0EBF60078A9D9007DB3E3008FC2
      EE007EB1E2003030C9003A3ACC002020B9005A7CD1007BAEE00029A0B10035A9
      BA001C93A40065AFD20075ABDE00B3CFEA0080ADDA007FB5E5008ABDEA007EB1
      E2007EB1E2005D7ED3001616AF00597AD0007EB1E2007EB1E2005CA6CC00158C
      9D0059A4C9007FB2E30085BAE80088B3DC000000000000000000000000000000
      000000000000D89B8600DBA68E00EEDDCC00F4E9DE00F8F0E900F8F0E900F8F0
      E900F8F0E900F5EADF00DBA79100D89B8600B5B5B500E1E1E100B97D3100E9AD
      6100E9AD6100E9AD6100E9AD6100E9AD6100E9AD6100E9AD6100E9AD6100E9AD
      6100E9AD6100D99D5100E1E1E100B5B5B50000000000E5EFF8008BB5E00074A9
      DC0085BBEA004646DF007E7EF9007C7CF8002D2DC60079ACDF0039B0C1007CE5
      F6007BE4F500279EAF007BABDC00F0F6FB00E0EBF60076A8D9007EB3E30090C2
      EE007FB2E2003030C9003A3ACC002020B9005B7CD2007CAFE00029A0B10035A9
      BA001C93A40065B0D20075AADE00B2CEE9000000000000000000000000000000
      000000000000F7E8E200D7806200E9C7B300F0E1D200F8F0E800F8F0E900F8F0
      E900F8F0E800EBCAB900D7806300F7E8E200B8B8B800E4E4E400AC783500BB7F
      3300BB7F3300BC803400BE823600C0843800C3873B00C68A3E00C98D4100CC90
      4400D0944800CC985500E4E4E400B8B8B8000000000000000000FCFDFE00C2D9
      EF0082B0DF00658BDF005151EA004B4BE4007495E7008ABEEB0072BDE10041B8
      C9003DB4C50063A9D300DEEAF60000000000FFFFFF00E5EFF8008BB5E00074A9
      DC0085BBEA004646DF007E7EF9007C7CF8002D2DC6007AADDF0039B0C1007CE5
      F6007BE4F500279EAF007AAADB00F0F6FB000000000000000000000000000000
      00000000000000000000F5D5CA00E58D7000EBB49D00F2D8C900F6ECE400F5DF
      D300EEB9A500E58D7000F5D5CA0000000000BABABA00EAEAEA00E5E5E500E5E5
      E500E5E5E500E5E5E500E5E5E500E5E5E500E5E5E500E5E5E500E5E5E500E5E5
      E500E5E5E500E5E5E500EAEAEA00BABABA000000000000000000000000000000
      0000FBFDFE00D1E2F300A5C7E90087B4E10077AADD0076A9DD0083B1E00093BB
      E400BAD4EE00F4F8FC000000000000000000FFFFFF00FFFFFF00FCFDFE00C2D9
      EF0082B0DF00658BDF005151EA004B4BE4007495E7008ABEEB0072BDE10041B8
      C9003DB4C50063A9D300DEEAF600FFFFFF000000000000000000000000000000
      0000000000000000000000000000FCECE600F3B5A000EE957700EC886700EE95
      7700F3B5A000FCECE6000000000000000000CCCCCC00BBBBBB00BBBBBB00BBBB
      BB00BBBBBB00BBBBBB00BBBBBB00BBBBBB00BBBBBB00BBBBBB00BBBBBB00BBBB
      BB00BBBBBB00BBBBBB00BBBBBB00CCCCCC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FBFDFE00D1E2F300A5C7E90087B4E10077AADD0076A9DD0083B1E00093BB
      E400BAD4EE00F4F8FC00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000ADAD9F008E8E7E008E8E
      7E008E8E7E008E8E7E00000000002F636F006E7F76008E8E7E008E8E7E008E8E
      7E00ADAD9F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000CDCDC600ACACA1000000000000000000000000000000
      000000000000000000000000000000000000000000009A9A8900000000000000
      0000000000000000000080B6C700D9F4FF00419EAD00BADBDD00000000000000
      00009A9A890000000000000000000000000000000000DDDDDD0085858500A5A5
      A500000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DDDDDD0085858500A5A5
      A500000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CDCDC60091918100919181000000000000000000000000000000
      00000000000000000000000000000000000000000000A5A59400000000000000
      00000000000000000000D7E9EE0049B4C40079E6F700419EAD00B6D6D800FAFA
      F500A5A5940000000000000000000000000000000000A4A4A400EADADA008B88
      8800BCBCBC000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A4A4A400EADADA008B88
      8800BCBCBC000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CDCDC60091918100FFFFFD00919181000000000000000000000000000000
      00000000000000000000000000000000000000000000ADAD9F00000000000000
      0000000000000000000000000000BEE4E80049B4C40079E6F700419EAD00BADB
      DD00ADAD9F0000000000000000000000000000000000C6C6C600A7A5A500DDD1
      D10085848400CDCDCD0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C6C600A7A5A500DDD1
      D10085848400CDCDCD0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D0D0
      C90094948300FFFFFD00FDFDFB00949483009494830094948300949483009494
      83009494830094948300B1B1A4000000000000000000B4B4A300000000000000
      0000000000000000000000000000FAFAF500BCE2E40049B4C40079E6F700419E
      AD00899E93000000000000000000000000000000000000000000D4D4D400A5A4
      A400CCC4C40086858500DBDBDB00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D4D4D400A5A4
      A400CCC4C40086858500DBDBDB00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D9D9D100AAAA
      9900FFFFFD00FBFBF900FCFCF800FCFCF800FCFCF700FBFBF600FAFAF400FAFA
      F300F9F9F200FCFCF300AAAA99000000000000000000B4B4A300000000000000
      00000000000000000000FAFAF500FAFAF500F7F7F100BCE2E40049B4C40079E6
      F7006D6D6500D4D4D4000000000000000000000000000000000000000000DFDF
      DF00A6A5A500BCB8B80087878700E1CFCA00F09F8A00EA775900E7664500EA77
      5900F09F8A00FBE6E1000000000000000000000000000000000000000000DFDF
      DF00A6A5A500BCB8B80087878700E1CFCA00F09F8A00EA775900E7664500EA77
      5900F09F8A00FBE6E100000000000000000000000000DDDDD500B3B3A100FFFF
      FD00FBFBF900FAFAF700F9F9F500F8F8F400F7F7F200F6F6F000F5F5EE00F4F4
      EC00F2F2E900F7F7EC00B3B3A1000000000000000000B8B8A700000000000000
      000000000000FAFAF500FAFAF500F7F7F100F7F7F100F5F5ED00BADBDD00AFAF
      AA00F7F7F1007F7F9800B9B9E500000000000000000000000000000000000000
      0000E7E7E700A7A7A700BC938800D4674A00EBAA9700F6DDD400F9F1EB00F6DD
      D500EDAD9B00DF725400F2CABF00000000000000000000000000000000000000
      0000E7E7E700A7A7A700BC938800D4674A00EBAA9700F6DDD400F9F1EB00F6DD
      D500EDAD9B00DF725400F2CABF0000000000DFDFD800B8B8A700FFFFFD00FBFB
      F900FAFAF700F9F9F500F8F8F400F7F7F200F6F6F000F5F5EE00F4F4EC00F2F2
      E900EEEEE200F5F5E700B8B8A7000000000000000000BDBDAB00000000000000
      0000FAFAF500FAFAF500F7F7F100F7F7F100F5F5ED00F5F5ED00F2F2E400DEDE
      D4007A7A91008080FF003F3FC400000000000000000000000000000000000000
      000000000000DDD4D200C8634400E9C5B900FAF4EE00FBF7F300FBF7F300FBF7
      F300FBF9F500EFCDC100D0694D00F6E4DE000000000000000000000000000000
      000000000000DDD4D200C8634400E6C2B100F5EBE100FAF4EE00FBF7F300FAF4
      EE00F8F2EB00EECCC000D0694D00F6E4DE00BDBDAC00FFFFFD00FBFBF900FAFA
      F700F9F9F500F8F8F400F7F7F200F6F6F000F5F5EE00F4F4EC00F2F2E900EEEE
      E200EAEADC00F4F4E300BDBDAC000000000000000000BDBDAB0000000000FAFA
      F500FAFAF500F7F7F100F7F7F100F5F5ED00F5F5ED00F2F2E400EAEADC00F2F2
      E4009B9BAF005151E800BFBFF100000000000000000000000000000000000000
      000000000000D38F7A00D89E8800F6EDE400B8492700B8492700F8EDEA00B849
      2700B8492700FAF6F100D99F8C00D38F7A000000000000000000000000000000
      000000000000D38F7A00D89E8800EFDFCE00F7EDE600FBF7F300B8492700FBF7
      F300F8F0E900F8F0E800D99F8C00D38F7A00E3E3DB00C1C1B000FFFFFC00F9F9
      F500F8F8F400F7F7F200F6F6F000F5F5EE00F4F4EC00F2F2E900EEEEE200A4A4
      9300A4A49300A4A49300A6A695000000000000000000C1C1AF0000000000FAFA
      F500F7F7F100F7F7F100F5F5ED00F5F5ED00F2F2E400EAEADC00EAEADC00F2F2
      E400C1C1AF000000000000000000000000000000000000000000000000000000
      000000000000B75B3E00E7CAB900F5ECE100AD442200FDFBF900FBF7F300FDFB
      F900AD442200FBF7F200E8CEBE00B75B3E000000000000000000000000000000
      000000000000B75B3E00E7CAB900F1E4D500FBF7F200FDFBF900AD442200FDFB
      F900FBF7F300FAF3EE00E8CEBE00B75B3E0000000000E5E5DD00C6C6B500FFFF
      FB00F7F7F200F6F6F000F5F5EE00F4F4EC00F2F2E900EEEEE200EAEADC00B6B6
      A50000000000C6C6B500E5E5DD000000000000000000C4C4B300FAFAF500F7F7
      F100F7F7F100F5F5ED00F5F5ED00F2F2E400EAEADC00EAEADC00E6E6D500F2F2
      E400C4C4B3000000000000000000000000000000000000000000000000000000
      000000000000AD4A2800EDDBCA00F5ECE100F7EDE900FBF7F300F8F0E900FBF7
      F300F7EDE900FBF7F200EFDFD000AD4A28000000000000000000000000000000
      000000000000AD4A2800EDDBCA00F5ECE100AB462400AB462400AB462400AB46
      2400AB462400FBF7F200EFDFD000AD4A28000000000000000000E6E6DF00C9C9
      B800FFFFF900F5F5EE00F7F7EF00F9F9F000F7F7EC00F5F5E700F3F3E300C2C2
      B100C9C9B800E6E6DF00000000000000000000000000C4C4B300FAFAF500F7F7
      F100F5F5ED00F5F5ED00F2F2E400EAEADC00EAEADC00E6E6D500E6E6D500F2F2
      E400C4C4B3000000000000000000000000000000000000000000000000000000
      000000000000BC644600E7CBB900F5ECE100B24E2C00FAF5EF00F5ECE100FAF5
      EF00B24E2C00F5ECE100E7CEBD00BC6446000000000000000000000000000000
      000000000000BC644600E7CBB900F1E4D500F5ECE100FAF5EF00B24E2C00FAF5
      EF00F5ECE100F1E4D500E7CEBD00BC644600000000000000000000000000E7E7
      DF00CBCBBA00FFFFF800F9F9F000CBCBBA00CBCBBA00CBCBBA00CBCBBA00CBCB
      BA00E7E7DF0000000000000000000000000000000000C4C4B300FAFAF500F5F5
      ED00F5F5ED00F2F2E400EAEADC00EAEADC00E6E6D500A5A59400A5A59400A5A5
      9400A5A594000000000000000000000000000000000000000000000000000000
      000000000000D89B8600DBA68E00F5ECE100C05C3A00C05C3A00F9EFEC00C05C
      3A00C05C3A00F8EFE700DBA79100D89B86000000000000000000000000000000
      000000000000D89B8600DBA68E00EEDDCC00F4E9DE00FBF7F300C05C3A00FBF7
      F300F8F0E900F5EADF00DBA79100D89B86000000000000000000000000000000
      0000E7E7E000CCCCBB00FFFFF400CCCCBB000000000000000000000000000000
      00000000000000000000000000000000000000000000CBCBBA00FAFAF500F5F5
      ED00F2F2E400EAEADC00EAEADC00E6E6D500E6E6D500B4B4A30000000000CBCB
      BA00ECECE6000000000000000000000000000000000000000000000000000000
      000000000000F7E8E200D7806200ECCABA00F6EDE400FAF6F100FBF7F300FBF7
      F300FAF6F100EDCCBC00D7806300F7E8E2000000000000000000000000000000
      000000000000F7E8E200D7806200E9C7B300F0E1D200F9F3EC00FBF7F300FAF4
      EE00F8F0E800EBCAB900D7806300F7E8E2000000000000000000000000000000
      000000000000E7E7E000CCCCBB00CCCCBB000000000000000000000000000000
      00000000000000000000000000000000000000000000CBCBBA00FAFAF500F9F9
      EF00F5F5ED00F2F2E400F2F2E400F2F2E400F2F2E400C4C4B300CBCBBA00ECEC
      E600000000000000000000000000000000000000000000000000000000000000
      00000000000000000000F5D5CA00E58D7000EBB49D00F2D8C900F6ECE400F5DF
      D300EEB9A500E58D7000F5D5CA00000000000000000000000000000000000000
      00000000000000000000F5D5CA00E58D7000EBB49D00F2D8C900F6ECE400F5DF
      D300EEB9A500E58D7000F5D5CA00000000000000000000000000000000000000
      00000000000000000000E7E7E000D8D8CC000000000000000000000000000000
      00000000000000000000000000000000000000000000D8D8CC00CBCBBA00CBCB
      BA00CBCBBA00CBCBBA00CBCBBA00CBCBBA00CBCBBA00CBCBBA00ECECE6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FCECE600F3B5A000EE957700EC886700EE95
      7700F3B5A000FCECE60000000000000000000000000000000000000000000000
      0000000000000000000000000000FCECE600F3B5A000EE957700EC886700EE95
      7700F3B5A000FCECE600000000000000000000000000ACAC9F008E8E7E008E8E
      7E008E8E7E008E8E7E008E8E7E008E8E7E008E8E7E008E8E7E008E8E7E008E8E
      7E00ACAC9F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009A9A8900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00009A9A8900000000000000000000000000ACAC9F008F8F7E00ACAC9F000000
      000000000000000000000000000000000000CDCDC600ACACA100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000A5A59900C9C9C1000000000000000000000000000000
      000000000000ACAC9F008F8F7E00ACAC9F000000000000000000000000000000
      000000000000000000000000000000000000A5A59900C9C9C100000000000000
      00000000000000000000000000000000000000000000A5A59400000000000000
      0000000000000000000000000000000000006666B40032329700323297003333
      990021218400333399006666B400000000009B9B8A00F9F9F5009D9D8B000000
      0000000000000000000000000000CDCDC6009191810091918100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008888770088887700C9C9C10000000000000000000000
      0000000000009D9D8B00F9F9F5009B9B8A000000000000000000000000000000
      0000000000000000000000000000000000008888770088887700C9C9C1000000
      00000000000000000000000000000000000000000000ACAC9F00000000000000
      0000000000000000000000000000000000003333AC005E5EF7005E5EF7005E5E
      F7005E5EF7005E5EF7003333AC0000000000AAAA9900F4F4EC00ACAC9B000000
      00000000000000000000CDCDC60091918100FFFFFD0091918100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000088887700FFFFFC0088887700C9C9C100000000000000
      000000000000ACAC9B00F4F4EC00AAAA99000000000000000000000000000000
      00000000000000000000000000000000000088887700FFFFFD0088887700C9C9
      C1000000000000000000000000000000000000000000B5B5A400000000000000
      0000000000000000000000000000FAFAF5006464C5003131B6003131B6003131
      B6002323A6003333B9006666CA0000000000B0B09E00F5F5EE00B4B4A3000000
      000000000000D0D0C90094948300FFFFFD00FDFDFA0094948300949483009494
      8300949483009494830094948300B1B1A400B1B1A40094948300949483009494
      8300949483009494830094948300FDFDFA00FFFFFC0094948300D0D0C9000000
      000000000000B4B4A300F5F5EE00B0B09E0000000000B1B1A400949483009494
      83009494830094948300949483009494830094948300FDFDFA00FFFFFD009494
      8300D0D0C90000000000000000000000000000000000B5B5A400000000000000
      00000000000000000000FAFAF500FAFAF500F6F6F100F6F6F100F5F5ED00FAFA
      F500B5B5A400000000000000000000000000B3B3A200F6F6EF00B9B9A8000000
      0000D9D9D100AAAA9900FFFFFD00FBFBF800FBFBF700FCFCF800FBFBF600FBFB
      F500FAFAF400FAFAF200FCFCF400AAAA9900AAAA9900FCFCF300F9F9F200FAFA
      F300FAFAF400FBFBF600FCFCF700FBFBF700FAFAF700FFFFFC00AAAA9900D9D9
      D10000000000B9B9A800F6F6EF00B3B3A20000000000AAAA9900FCFCF200F9F9
      F100FAFAF200FAFAF400FBFBF500FBFBF600FCFCF800FBFBF700FBFBF800FFFF
      FD00AAAA9900D9D9D100000000000000000000000000B8B8A700000000000000
      000000000000FAFAF500FAFAF500F6F6F100F6F6F100F5F5ED00F5F5ED00F9F9
      EF00B8B8A700000000000000000000000000B6B6A500F7F7F100BDBDAC00DDDD
      D500B3B3A100FFFFFD00FBFBF800FAFAF600F9F9F500F8F8F300F7F7F100F5F5
      EF00F4F4ED00F3F3EB00F9F9EE00B3B3A100B3B3A100F7F7EC00F2F2E900F4F4
      EC00F5F5EE00F6F6F000F7F7F200F8F8F400F9F9F500FAFAF700FFFFFC00B3B3
      A100DDDDD500BDBDAC00F7F7F100B6B6A50000000000B3B3A100F6F6E900F0F0
      E600F3F3EB00F4F4ED00F5F5EF00F7F7F100F8F8F300F9F9F500FAFAF600FBFB
      F800FFFFFD00B3B3A100DDDDD5000000000000000000BDBDAB00000000000000
      0000FAFAF500FAFAF500F6F6F100F6F6F100F5F5ED00F5F5ED00F2F2E400F5F5
      ED00BDBDAB00000000000000000000000000B9B9A800F8F8F100C1C1AF00B8B8
      A700FFFFFD00FBFBF800FAFAF600F9F9F500F8F8F300F7F7F100F5F5EF00F4F4
      ED00F3F3EB00F0F0E600F6F6E900B8B8A700B8B8A700F5F5E700EEEEE200F2F2
      E900F4F4EC00F5F5EE00F6F6F000F7F7F200F8F8F400F9F9F500FAFAF700FFFF
      FC00B8B8A700C1C1AF00F8F8F100B9B9A80000000000B8B8A700F4F4E500EBEB
      DF00F0F0E600F3F3EB00F4F4ED00F5F5EF00F7F7F100F8F8F300F9F9F500FAFA
      F600FBFBF800FFFFFD00B8B8A700DFDFD80000000000BDBDAB0000000000FAFA
      F500FAFAF500F6F6F100F6F6F100F5F5ED00F5F5ED00F2F2E400EAEADC00F2F2
      E400BDBDAB00000000000000000000000000BCBCAB00F9F9ED00C3C3B300FFFF
      FD00FBFBF800FAFAF600F9F9F500F8F8F300F7F7F100F5F5EF00F4F4ED00F3F3
      EB00F0F0E600EBEBDF00F4F4E500BDBDAC00BDBDAC00F4F4E300EAEADC00EEEE
      E200F2F2E900F4F4EC00F5F5EE00F6F6F000F7F7F200F8F8F400F9F9F500FAFA
      F700FFFFFC00C3C3B300F9F9ED00BCBCAB0000000000BDBDAC00F3F3E200E8E8
      D900EBEBDF00F0F0E600F3F3EB00F4F4ED00F5F5EF00F7F7F100F8F8F300F9F9
      F500FAFAF600FBFBF800FFFFFD00BDBDAC0000000000C1C1AF0000000000FAFA
      F500F6F6F100F6F6F100F5F5ED00F5F5ED00F2F2E400EAEADC00EAEADC00F2F2
      E400C1C1AF00000000000000000000000000BFBFAE00FBFBEF00C5C5B600C1C1
      B000FFFFFC00F9F9F500F8F8F300F7F7F100F5F5EF00F4F4ED00F3F3EB00F0F0
      E600A4A49300A4A49300A4A49300A6A69500A6A69500A4A49300A4A49300A4A4
      9300EEEEE200F2F2E900F4F4EC00F5F5EE00F6F6F000F7F7F200F8F8F400FFFF
      FB00C1C1B000C5C5B600FBFBEF00BFBFAE0000000000A6A69500A4A49300A4A4
      9300A4A49300EBEBDF00F0F0E600F3F3EB00F4F4ED00F5F5EF00F7F7F100F8F8
      F300F9F9F500FFFFFC00C1C1B000E3E3DB0000000000C4C4B300FAFAF500F6F6
      F100F6F6F100F5F5ED00F5F5ED00F2F2E400EAEADC00EAEADC00E6E6D500F2F2
      E400C4C4B300000000000000000000000000C1C1B000FCFCF100C7C7B800E5E5
      DD00C6C6B500FFFFFA00F7F7F100F5F5EF00F4F4ED00F3F3EB00F0F0E600EBEB
      DF00B6B6A50000000000C6C6B500E5E5DD00E5E5DD00C6C6B50000000000B6B6
      A500EAEADC00EEEEE200F2F2E900F4F4EC00F5F5EE00F6F6F000FFFFFA00C6C6
      B500E5E5DD00C7C7B800FCFCF100C1C1B00000000000E5E5DD00C6C6B5000000
      0000B6B6A500E8E8D900EBEBDF00F0F0E600F3F3EB00F4F4ED00F5F5EF00F7F7
      F100FFFFFA00C6C6B500E5E5DD000000000000000000C4C4B300FAFAF500F6F6
      F100F5F5ED00F5F5ED00F2F2E400EAEADC00EAEADC00E6E6D500E6E6D500F2F2
      E400C4C4B300000000000000000000000000C4C4B300FDFDF300C9C9B9000000
      0000E6E6DF00C9C9B800FFFFF900F4F4ED00F6F6EE00F8F8EF00F6F6E900F4F4
      E500C2C2B100C9C9B800E6E6DF000000000000000000E6E6DF00C9C9B800C2C2
      B100F3F3E300F5F5E700F7F7EC00F6F6ED00F4F4EC00FFFFF800C9C9B800E6E6
      DF0000000000C9C9B900FDFDF300C4C4B3000000000000000000E6E6DF00C9C9
      B800C2C2B100F3F3E200F4F4E500F6F6E900F8F8EF00F6F6EE00F4F4ED00FFFF
      F900C9C9B800E6E6DF00000000000000000000000000C4C4B300FAFAF500F5F5
      ED00F5F5ED00F2F2E400EAEADC00EAEADC00E6E6D500A5A59400A5A59400A5A5
      9400A5A59400000000000000000000000000C6C6B500FEFEF400CACABA000000
      000000000000E7E7DF00CBCBBA00FFFFF700F9F9EE00CBCBBA00CBCBBA00CBCB
      BA00CBCBBA00E7E7DF0000000000000000000000000000000000E7E7DF00CBCB
      BA00CBCBBA00CBCBBA00CBCBBA00F7F7EC00FFFFF700CBCBBA00E7E7DF000000
      000000000000CACABA00FEFEF400C6C6B500000000000000000000000000E7E7
      DF00CBCBBA00CBCBBA00CBCBBA00CBCBBA00CBCBBA00F9F9EE00FFFFF700CBCB
      BA00E7E7DF0000000000000000000000000000000000CBCBBA00FAFAF500F5F5
      ED00F2F2E400EAEADC00EAEADC00E6E6D500E6E6D500B5B5A40000000000CBCB
      BA00ECECE600000000000000000000000000C9C9B800FFFFF600CACABA000000
      00000000000000000000E7E7E000CCCCBB00FFFFF300CCCCBB00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000CCCCBB00FFFFF200CCCCBB00E7E7E000000000000000
      000000000000CACABA00FFFFF600C9C9B8000000000000000000000000000000
      000000000000000000000000000000000000CCCCBB00FFFFF300CCCCBB00E7E7
      E0000000000000000000000000000000000000000000CBCBBA00FAFAF500F9F9
      EF00F5F5ED00F2F2E400F2F2E400F2F2E400F2F2E400C4C4B300CBCBBA00ECEC
      E60000000000000000000000000000000000CACABA00FFFFF200CBCBBA000000
      0000000000000000000000000000E7E7E000CCCCBB00CCCCBB00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000CCCCBB00CCCCBB00E7E7E00000000000000000000000
      000000000000CBCBBA00FFFFF200CACABA000000000000000000000000000000
      000000000000000000000000000000000000CCCCBB00CCCCBB00E7E7E0000000
      00000000000000000000000000000000000000000000D8D8CC00CBCBBA00CBCB
      BA00CBCBBA00CBCBBA00CBCBBA00CBCBBA00CBCBBA00CBCBBA00ECECE6000000
      000000000000000000000000000000000000D8D8CC00CCCCBB00D8D8CC000000
      000000000000000000000000000000000000E7E7E000D8D8CC00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000D8D8CC00E7E7E0000000000000000000000000000000
      000000000000D8D8CC00CCCCBB00D8D8CC000000000000000000000000000000
      000000000000000000000000000000000000D8D8CC00E7E7E000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000ADAD9F008E8E7E008E8E
      7E008E8E7E008E8E7E008E8E7E008E8E7E008E8E7E008E8E7E003D7432002070
      1A00589652000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F3F3F8008C8CB6004545
      890033337D0033337D0033337D0033337D0033337D0033337D0033337D003333
      7D00454589008C8CB600F3F3F80000000000000000009A9A8900000000000000
      00000000000000000000000000000000000000000000000000003C9B32002BDF
      1A0028871C000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B7B7
      D20033337F00B7B7D20000000000000000000000000000000000B7B7D2003333
      7F00B7B7D200000000000000000000000000000000008C8CBD002929A1001616
      CD001111D9001111D9001111D9001111D9001111D9001111D9001111D9001111
      D9001515CD002828A1008C8CBD000000000000000000A5A59400000000000000
      0000000000000000000000000000000000006EBA65003DA232003DA232003DE2
      2C002C911E003DA232006EBA6500000000009090900000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007A7A7A00000000000000000000000000B7B7D8003333
      8E001111D80033338E00B7B7D8000000000000000000B7B7D80033338E001111
      D80033338E00B7B7D8000000000000000000000000004545A0001B1BCC001111
      D1001111D1001111B6001111D1001111D1001111D1001111D1001111B6001111
      D1001111D1001515C9004545A0000000000000000000ADAD9F00000000000000
      0000000000000000000000000000000000003FAD310052E7410052E7410052E7
      410052E7410052E7410040AD3200000000001313130048484800353535002F2F
      2F003B3B3B000F0F0F003B3B3B002F2F2F003B3B3B000F0F0F003B3B3B002F2F
      2F0035353500484848000000000000000000000000000000000033339B001111
      D0001111D0001111D00033339B00B7B7DC00B7B7DC0033339B001111D0001111
      D0001111D00033339B0000000000000000000000000033339D001C1CCE001111
      C8001111B200DCDCDC001111B2001111C8001111C8001111B200EEEEEE001111
      B2001111C8001111C80033339D000000000000000000B4B4A300000000000000
      0000000000000000000000000000FAFAF5006EC2620040AD32003FAD310066EB
      550031A11F0041B3320071C46600000000001B1B1B00353535009A9A9A000000
      0000A4A4A40000000000A4A4A40000000000A4A4A40000000000A4A4A4000000
      00009A9A9A003535350000000000000000000000000000000000B7B7DD003333
      9F001111C4001111C4001111C40033339F0033339F001111C4001111C4001111
      C40033339F00B7B7DD000000000000000000000000003333A1002222C8001111
      BE00D1D1D100D6D6D600DCDCDC001111AD001111AD00EAEAEA00EEEEEE00EEEE
      EE001111BE001212BE003333A1000000000000000000B4B4A300000000000000
      00000000000000000000FAFAF500FAFAF500F6F6F100F6F6F10041B3320075EE
      640034A821000000000000000000000000001F1F1F003A3A3A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000292929000000000000000000000000000000000000000000B7B7
      DF003333A4001111B8001111B8001111B8001111B8001111B8001111B8003333
      A400B7B7DF00000000000000000000000000000000003333A4003434C7001212
      B4001111B400D1D1D100D6D6D600DCDCDC00E2E2E200E6E6E600EAEAEA001111
      B4001111B4001414B6003333A4000000000000000000B8B8A700000000000000
      000000000000FAFAF500FAFAF500F6F6F100F6F6F100F5F5ED006EC75E0043B9
      30005CAA48000000000000000000000000002222220040404000151515000000
      000000000000000000001E1E1E000000000000000000000000001E1E1E000000
      0000000000002626260000000000000000000000000000000000000000000000
      0000B7B7E0003333A8001515AF001111AC001111AC001111AC003333A800B7B7
      E00000000000000000000000000000000000000000003333A8004646CE002626
      B5001414AB001111AA00D1D1D100D6D6D600DCDCDC00E2E2E2001111AA001111
      AA001111AA001818B0003333A8000000000000000000BDBDAB00000000000000
      0000FAFAF500FAFAF500F6F6F100F6F6F100F5F5ED00F5F5ED00F2F2E400F5F5
      ED00BDBDAB000000000000000000000000002626260043434300AAAAAA000000
      00000000000000000000B3B3B300000000000000000000000000B3B3B3000000
      0000000000002929290000000000000000000000000000000000000000000000
      0000B7B7E2003333AC002525B4001111A2001111A2001414A5003333AC00B7B7
      E20000000000000000000000000000000000000000003333AB004A4AD2003333
      BB002E2EB80013139F00CECECE00D1D1D100D6D6D600DCDCDC0011119E001111
      A1001111A1001D1DAC003333AB000000000000000000BDBDAB0000000000FAFA
      F500FAFAF500F6F6F100F6F6F100F5F5ED00F5F5ED00F2F2E400EAEADC00F2F2
      E400BDBDAB000000000000000000000000002929290038383800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000002E2E2E000000000000000000000000000000000000000000B7B7
      E3003333AF005353DB002E2EB7003D3DC6003131BA0015159F001E1EA8003333
      AF00B7B7E300000000000000000000000000000000003333AE005050D8003737
      BF002323AB0000000000F7F7F700E8E8E800DEDEDE00DBDBDB00DDDDDD001111
      9B001616A0002B2BB5003333AE000000000000000000C1C1AF0000000000FAFA
      F500F6F6F100F6F6F100F5F5ED00F5F5ED00F2F2E400EAEADC00EAEADC00F2F2
      E400C1C1AF000000000000000000000000002C2C2C003C3C3C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000003C3C3C0000000000000000000000000000000000B7B7E4003333
      B3006767EF003636BE005E5EE6003333B3003333B3004F4FD7003636BE004545
      CD003333B300B7B7E4000000000000000000000000003333B1005A5AE2004242
      CA000000000000000000000000004242CA004242CA0000000000000000000000
      00004242CA004E4ED6003333B1000000000000000000C4C4B300FAFAF500F6F6
      F100F6F6F100F5F5ED00F5F5ED00F2F2E400EAEADC00EAEADC00E6E6D500F2F2
      E400C4C4B3000000000000000000000000002E2E2E0051515100B7B7B7000000
      0000BFBFBF0001010100BFBFBF0000000000BFBFBF0001010100BFBFBF000000
      0000B7B7B70051515100000000000000000000000000000000003333B5007676
      FE004C4CD4007272FA003333B500B7B7E500B7B7E5003333B5006262EA004C4C
      D4005C5CE4003333B5000000000000000000000000003333B5006262EA004F4F
      D7004F4FD700000000004F4FD7004F4FD7004F4FD7004F4FD700000000004F4F
      D7004F4FD7005A5AE2003333B5000000000000000000C4C4B300FAFAF500F6F6
      F100F5F5ED00F5F5ED00F2F2E400EAEADC00EAEADC00E6E6D500E6E6D500F2F2
      E400C4C4B300000000000000000000000000303030006A6A6A00525252004C4C
      4C005858580039393900585858004C4C4C005858580039393900585858004C4C
      4C00525252006A6A6A0000000000000000000000000000000000B7B7E6003333
      B9007777FF003333B900B7B7E6000000000000000000B7B7E6003333B9007070
      F8003333B900B7B7E6000000000000000000000000004545BD006464EC005B5B
      E3005B5BE3005B5BE3005B5BE3005B5BE3005B5BE3005B5BE3005B5BE3005B5B
      E3005B5BE3005F5FE8004545BD000000000000000000C4C4B300FAFAF500F5F5
      ED00F5F5ED00F2F2E400EAEADC00EAEADC00E6E6D500A5A59400A5A59400A5A5
      9400A5A59400000000000000000000000000A2A2A20000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000009090900000000000000000000000000000000000B7B7
      E7003333BB00B7B7E70000000000000000000000000000000000B7B7E7003333
      BB00B7B7E700000000000000000000000000000000008C8CD8004646CE006767
      EF006D6DF5006D6DF5006D6DF5006D6DF5006D6DF5006D6DF5006D6DF5006C6C
      F4006666EE004646CD008C8CD8000000000000000000CBCBBA00FAFAF500F5F5
      ED00F2F2E400EAEADC00EAEADC00E6E6D500E6E6D500B4B4A30000000000CBCB
      BA00ECECE6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F3F3FB008C8CD9004545
      C1003333BB003333BB003333BB003333BB003333BB003333BB003333BB003333
      BB004545C1008C8CD900F3F3FB000000000000000000CBCBBA00FAFAF500F9F9
      EF00F5F5ED00F2F2E400F2F2E400F2F2E400F2F2E400C4C4B300CBCBBA00ECEC
      E600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D8D8CC00CBCBBA00CBCB
      BA00CBCBBA00CBCBBA00CBCBBA00CBCBBA00CBCBBA00CBCBBA00ECECE6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FDECE800EE66
      4400FDECE800000000000000000000000000F4B8A900E7634100E7634100E763
      4100E7634100E7634100E7634100E7634100E7634100E7634100E7634100E763
      4100E7634100E7634100F4B8A900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EE664400EE66
      4400EE664400000000000000000000000000D95A3800424242003D3D3D003D3D
      3D003D3D3D00212121003D3D3D003D3D3D003D3D3D0021212100999999003D3D
      3D009999990042424200D95A3800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009090900006060600060606000606
      0600060606000606060006060600060606000606060006060600060606000606
      0600060606000606060090909000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C8512F004141410084848400DFDF
      DF00848484002020200084848400DFDFDF0084848400202020007C7C7C00CCCC
      CC007C7C7C0041414100C8512F00000000009090900006060600060606000606
      0600060606000606060006060600060606000606060006060600060606000606
      06000606060006060600909090000000000013131300424242003D3D3D003D3D
      3D003D3D3D00212121003D3D3D003D3D3D003D3D3D0021212100999999003D3D
      3D0099999900424242001313130000000000F4B8A900E7634100E7634100E763
      4100E7634100E7634100E7634100E7634100E7634100E7634100E7634100E763
      4100E7634100E7634100F4B8A90000000000B849270045454500E4E4E4003C3C
      3C00E4E4E40025252500E4E4E4003C3C3C00E4E4E400252525003C3C3C003C3C
      3C003C3C3C0045454500B84927000000000013131300424242003D3D3D003D3D
      3D003D3D3D00212121003D3D3D003D3D3D003D3D3D00212121003D3D3D003D3D
      3D003D3D3D004242420013131300000000001B1B1B004141410084848400DFDF
      DF00848484002020200084848400DFDFDF0084848400202020007C7C7C00CCCC
      CC007C7C7C00414141001B1B1B0000000000D95A3800424242003D3D3D003D3D
      3D003D3D3D00212121003D3D3D003D3D3D003D3D3D0021212100999999003D3D
      3D009999990042424200D95A380000000000AD4422004A4A4A00414141004141
      4100EAEAEA002B2B2B004141410041414100EAEAEA002B2B2B008D8D8D00EAEA
      EA008D8D8D004A4A4A00AD442200000000001B1B1B004141410084848400DFDF
      DF00848484002020200084848400DFDFDF00848484002020200084848400DFDF
      DF0084848400414141001B1B1B00000000001F1F1F0045454500E4E4E4003C3C
      3C00E4E4E40025252500E4E4E4003C3C3C00E4E4E400252525003C3C3C003C3C
      3C003C3C3C00454545001F1F1F0000000000C8512F004141410084848400DFDF
      DF00848484002020200084848400DFDFDF0084848400202020007C7C7C00CCCC
      CC007C7C7C0041414100C8512F0000000000AB4624004E4E4E0067676700F0F0
      F0009B9B9B00313131009B9B9B0045454500F0F0F00031313100F0F0F0004545
      4500F0F0F0004E4E4E00AB462400000000001F1F1F0045454500E4E4E4003C3C
      3C00E4E4E40025252500E4E4E4003C3C3C00E4E4E40025252500E4E4E4003C3C
      3C00E4E4E400454545001F1F1F0000000000222222004A4A4A00414141004141
      4100EAEAEA002B2B2B004141410041414100EAEAEA002B2B2B008D8D8D00EAEA
      EA008D8D8D004A4A4A002222220000000000B849270045454500E4E4E4003C3C
      3C00E4E4E40025252500E4E4E4003C3C3C00E4E4E400252525003C3C3C003C3C
      3C003C3C3C0045454500B849270000000000B24E2C00535353004A4A4A004A4A
      4A00F6F6F60037373700F6F6F600F6F6F6009898980037373700F6F6F6004A4A
      4A00F6F6F60053535300B24E2C0000000000222222004A4A4A00EAEAEA004141
      4100EAEAEA002B2B2B00EAEAEA0041414100EAEAEA002B2B2B00EAEAEA004141
      4100EAEAEA004A4A4A002222220000000000262626004E4E4E0067676700F0F0
      F0009B9B9B00313131009B9B9B0045454500F0F0F00031313100F0F0F0004545
      4500F0F0F0004E4E4E002626260000000000AD4422004A4A4A00414141004141
      4100EAEAEA002B2B2B004141410041414100EAEAEA002B2B2B008D8D8D00EAEA
      EA008D8D8D004A4A4A00AD44220000000000C05C3A0057575700FBFBFB004E4E
      4E00FBFBFB003C3C3C00FBFBFB004E4E4E004E4E4E003C3C3C00A5A5A500FBFB
      FB00A5A5A50057575700C05C3A0000000000262626004E4E4E00F0F0F0004545
      4500F0F0F00031313100F0F0F00045454500F0F0F00031313100F0F0F0004545
      4500F0F0F0004E4E4E00262626000000000029292900535353004A4A4A004A4A
      4A00F6F6F60037373700F6F6F600F6F6F6009898980037373700F6F6F6004A4A
      4A00F6F6F600535353002929290000000000AB4624004E4E4E0067676700F0F0
      F0009B9B9B00313131009B9B9B0045454500F0F0F00031313100F0F0F0004545
      4500F0F0F0004E4E4E00AB46240000000000D16C4A005B5B5B00A0A0A0000000
      0000A0A0A0004040400000000000000000000000000040404000CCCCCC005252
      5200CCCCCC005B5B5B00D16C4A00000000002929290053535300F6F6F6004A4A
      4A00F6F6F60037373700F6F6F6004A4A4A00F6F6F60037373700F6F6F6004A4A
      4A00F6F6F6005353530029292900000000002C2C2C0057575700FBFBFB004E4E
      4E00FBFBFB003C3C3C00FBFBFB004E4E4E004E4E4E003C3C3C00A5A5A500FBFB
      FB00A5A5A500575757002C2C2C0000000000B24E2C00535353004A4A4A004A4A
      4A00F6F6F60037373700F6F6F600F6F6F6009898980037373700F6F6F6004A4A
      4A00F6F6F60053535300B24E2C0000000000E17B5900626262005D5D5D005D5D
      5D005D5D5D00484848005D5D5D005D5D5D005D5D5D0048484800999999005D5D
      5D009999990062626200E17B5900000000002C2C2C0057575700FBFBFB004E4E
      4E00FBFBFB003C3C3C00FBFBFB004E4E4E00FBFBFB003C3C3C00FBFBFB004E4E
      4E00FBFBFB00575757002C2C2C00000000002E2E2E005B5B5B00A0A0A0000000
      0000A0A0A0004040400000000000000000000000000040404000CCCCCC005252
      5200CCCCCC005B5B5B002E2E2E0000000000C05C3A0057575700FBFBFB004E4E
      4E00FBFBFB003C3C3C00FBFBFB004E4E4E004E4E4E003C3C3C00A5A5A500FBFB
      FB00A5A5A50057575700C05C3A0000000000F6C8B900EC866400EC866400EC86
      6400EC866400EC866400EC866400EC866400EC866400EC866400EC866400EC86
      6400EC866400EC866400F6C8B900000000002E2E2E005B5B5B00A0A0A0000000
      0000A0A0A00040404000A0A0A00000000000A0A0A00040404000A0A0A0000000
      0000A0A0A0005B5B5B002E2E2E000000000030303000626262005D5D5D005D5D
      5D005D5D5D00484848005D5D5D005D5D5D005D5D5D0048484800999999005D5D
      5D0099999900626262003030300000000000D16C4A005B5B5B00A0A0A0000000
      0000A0A0A0004040400000000000000000000000000040404000CCCCCC005252
      5200CCCCCC005B5B5B00D16C4A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000030303000626262005D5D5D005D5D
      5D005D5D5D00484848005D5D5D005D5D5D005D5D5D00484848005D5D5D005D5D
      5D005D5D5D00626262003030300000000000A2A2A20032323200323232003232
      3200323232003232320032323200323232003232320032323200323232003232
      32003232320032323200A2A2A20000000000E17B5900626262005D5D5D005D5D
      5D005D5D5D00484848005D5D5D005D5D5D005D5D5D0048484800999999005D5D
      5D009999990062626200E17B5900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EE886600EE88
      6600EE886600000000000000000000000000A2A2A20032323200323232003232
      3200323232003232320032323200323232003232320032323200323232003232
      32003232320032323200A2A2A200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F6C8B900EC866400EC866400EC86
      6400EC866400EC866400EC866400EC866400EC866400EC866400EC866400EC86
      6400EC866400EC866400F6C8B900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FDF0EC00EE88
      6600FDF0EC000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000F00000000100010000000000800700000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFF00000000C0FFFFFF00000000
      807FFFFF00000000003FF3FF00000000001FE3FF00000000000FC3FF00000000
      0007800F000000008003000300000000C001000300000000E000000100000000
      F000800100000000F800C30100000000FC00E3F900000000FE01F3FD00000000
      FF03FFFF00000000FF87FFFF00000000FFFFF00FFC7FE000FFFFC003FC7FE000
      FFFF8001FC7FE00091248001FC7FE000B1AD00008007E000B38D00000007E000
      B1DD00000007E000B18D00000007E000B18D00008003E0001B240000C001E000
      A0FD0040C0010000A0FD03C0C0010000E0FF8001C0030000C0FF8001FC7F0001
      C0FFC003FC7FE003C7FFF00FFC7FE00787E11FF1FFFFFFFF03C00FE1EFFFFFFF
      318C07C1E7FFFFFF381C83838003FFFF0000C1078003FFFF8001E00F8003F007
      E007F01F8003F007F81FF83F8003F007F01FF8018003E007F00FF0008003E007
      E007E2008003E0FFE187C7008003C0FFC1830F088003C0FFC3C31F048003C7FF
      C7E31F03C007FFFFCFF3FF83FFFFFFFFFFC1801FF800FFFFFF80001FF800FC01
      FF80001FF800FC01FF9C0017F800FC0100000013F800FC01000000014800FC01
      000000004800E00F000000014800E00F00000013F800E00F00000017F800E00F
      0000001FF800E00F0000003FF801007FFFFF007FF803007FFFFF00FFF807007F
      FFFF01FFF80F007FFFFF03FFF81F007FFFFFFFFFFFFFFFC192499249FFFFFF80
      BFFDBFFDFFFFFF88FFFFFFFFFFFFFF9CBFFDB1FD00000008BFFDBBFD00000000
      FFFFFBFF00000000BFFDBBFD00000000BFFDBBFD00000000FFFFFBFF00000000
      BFFDBBFD00000000BFFDB1FD00000000FFFFFFFFFFFFFFFFBFFDBFFDFFFFFFFF
      92499249FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC1FFFFFFFFFFBFFFC1FFFFFF
      B6DBA000C1FFFFFFFFFFA000C1FFFFFFFFFFA000C1070000B6DBA000C1070000
      FFFFA000C1070000FFFFBFFFC1070000B6DBA00FC1070000FFFFA00FC1070000
      FFFFA00FC1070000B6DBA00FC1070000FFFFA00FC107FFFFFFFFBFFFFFFFFFFF
      B6DBBFFF8001FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1FFFFFFFFFFFFFFE5FFFFF
      F8FFFC3FE61F0000F07FF81FE09F0000E03FF00FE01F0000C01FE007E93F0000
      800FC003EE07000080078001EFE7000082070001EFCF0000C7030001EF9F0000
      FF010001EF3F0000FF81F801EE7F0000FFC1FE00ECFF0000FFE3FF00E9FF03FC
      FFFFFFF8E3FF0000FFFFFFFFE7FFFFFF00030003000300038007800380078007
      8001800180018007800180018001800780018001800180078007800380078003
      8007800780078001800780078007800180078007800780018007800780078007
      800780078007800780078007800780078007800780078007E01FE01FE01FE01F
      E01FE01FE01FE01FE01FE01FE01FE01FF1FFE0E3F8FFF1FFE0FFE000F07FE0FF
      E07F8000F000E07F803F0000C000803F001F00038000001F000F00038007000F
      00078003800300078003C001C0018003C001E000E004C001E000F000F002E000
      F000F800F801E000F800FC01FC02C000FC01FE07FE408001FE07FF07FF2B2607
      FF07FF8FFF930F07FF8FFFFFFFC71F8FFFFFE007FFFFFFFFFFFFEF07C3FF8000
      00000800C3FF800000000000C3FF800000000000C3FF800100000000C3FF8603
      00000000C3FF840700000000C3FF800F00000000C3FF801F00000000C3FF803F
      000000000000807F0000E007000080FF0000E007000081FF0000E027000083FF
      FFFFE00FC3FF87FFFFFFE01FC3FF8FFFFFFFFFFFFFFF80008FFFF81FFFFF0000
      87FFF81FE00F800083FFF81FE0030000C1FF0000E0010000E0030000E0000000
      F0010000E0800000F800000000000000F800000000000000F800000000000000
      F800000000000000F800000000000000F800000080000000F8000000C0010000
      FC010000F0030000FE030000FFFF0000FFFF8007FFFFFFFFFCFFBC378FFF8FFF
      F8FFBC0787FF87FFF0FFBE0783FF83FFE001BE07C1FFC1FFC001BC03E003E003
      8001B801F001F0010001B001F800F8000001A001F800F8000001A007F800F800
      80098007F800F800C0038007F800F800E0078007F800F800F0FF8027F800F800
      F8FF800FFC01FC01FCFF801FFE03FE038007FFFFFFFFFFFFBFF71F3FFCF8FF3F
      BF011E3FFC78FF1FBF011C3FFC38FF0FBE01180000188007BC07100000088003
      B807000000008001B007000000008000A007000000008000A007000000008000
      8007000420009001800710018008C00380071803C018E00780271C3FFC38FF0F
      800F1E3FFC78FF1F801F1F3FFCF8FF3FFFFFFFFFFFFF8007FFFFFFFF8001BFC7
      FFFFE3C78001BF010001C1838001BF010001C0038001BE011111C0038001BC07
      2AA9E0078001B8070889F00F8001B0071999F00F8001A0072AA9E0078401A007
      2AA9C0038E7180071111C003842180070001C183800180070001E3C780018027
      FFFFFFFF8001800FFFFFFFFFFFFF801FFFFFFFFFFFFFFFFFFFFFFFC70001FFFF
      FFFFFFC70001FFFF0001FFFF0001000100010001000100010001000100010001
      0001000100010001000100010001000100010001000100010001000113810001
      0001000100010001138100010001111100011381FFFF000100010001FFC70001
      FFFF0001FFC7FFFFFFFFFFFFFFFFFFFF}
  end
  object alData: TActionList
    Images = Images24
    Left = 520
    Top = 304
    object actNumPlanCreate: TAction
      Caption = #1057#1086#1079#1076#1072#1090#1100
      Hint = #1053#1072#1089#1090#1088#1086#1080#1090#1100' '#1089' '#1080#1089#1087#1086#1083#1100#1079#1086#1074#1072#1085#1080#1077#1084' '#1084#1072#1089#1090#1077#1088#1072' '#1085#1072#1089#1090#1088#1086#1081#1082#1080
      ImageIndex = 2
      OnExecute = btnNumPlanCreateClick
    end
    object actNumPlanEdit: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1090#1072#1073#1083#1080#1094#1091' '#1085#1091#1084#1077#1088#1072#1090#1086#1088#1086#1074
      ImageIndex = 0
      OnExecute = btnNumTableEditClick
    end
    object actNumPlanPreview: TAction
      Caption = #1055#1088#1077#1076#1087#1088#1086#1089#1084#1086#1090#1088
      Hint = #1055#1088#1077#1076#1074#1072#1088#1080#1090#1077#1083#1100#1085#1099#1081' '#1087#1088#1086#1089#1084#1086#1090#1088' '#1088#1077#1079#1091#1083#1100#1090#1072#1090#1072
      ImageIndex = 5
      OnExecute = btnNumPlanPreviewClick
    end
    object actHallEdit: TAction
      Caption = #1055#1083#1072#1085' '#1079#1072#1083#1072
      Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1087#1083#1072#1085' '#1084#1077#1089#1090' '#1074' '#1079#1072#1083#1077
      ImageIndex = 7
      OnExecute = btnHallEditClick
    end
    object actPagesOrder: TAction
      Caption = 'actPagesOrder'
      Hint = #1053#1072#1089#1090#1088#1086#1080#1090#1100' '#1087#1086#1088#1103#1076#1086#1082' '#1086#1073#1093#1086#1076#1072' '#1083#1080#1089#1090#1086#1074' '#1080' '#1073#1080#1083#1077#1090#1086#1074
      ImageIndex = 3
      OnExecute = actPagesOrderExecute
    end
    object actPageAdjust: TAction
      Caption = 'actPageAdjust'
      Hint = #1070#1089#1090#1080#1088#1086#1074#1082#1072' '#1083#1080#1089#1090#1072
      ImageIndex = 4
      OnExecute = actPageAdjustExecute
    end
  end
  object Timer10ms: TTimer
    Interval = 10
    OnTimer = Timer10msTimer
    Left = 532
    Top = 152
  end
  object pmNumLabels: TPopupMenu
    Images = Images16
    Left = 444
    Top = 472
    object miNumLabelAdd: TMenuItem
      Action = actNumLabelAdd
    end
    object miNumLabelDel: TMenuItem
      Action = actNumLabelDel
    end
    object miNumLabelEdit: TMenuItem
      Action = actNumLabelEdit
    end
  end
  object tmrHlpMtr: TTimer
    Interval = 50
    OnTimer = tmrHlpMtrTimer
    Left = 684
    Top = 152
  end
  object LangMenu: TPopupMenu
    Left = 572
    Top = 64
    object language1: TMenuItem
      Caption = #1071#1079#1099#1082
    end
    object miDebug1: TMenuItem
      Caption = 'Debug'
      OnClick = miDebug1Click
    end
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = 'xml'
    Filter = 'XML files|*.xml'
    Left = 460
    Top = 232
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'xml'
    Filter = 'XML files (*.xml)|*.xml|Any files (*.*)|*.*'
    Options = [ofOverwritePrompt, ofEnableSizing]
    Left = 388
    Top = 232
  end
  object AppEvents: TApplicationEvents
    OnException = AppEventsException
    Left = 804
    Top = 512
  end
end
