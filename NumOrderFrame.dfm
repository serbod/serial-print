object frameNumOrder: TframeNumOrder
  Left = 0
  Top = 0
  Width = 709
  Height = 571
  TabOrder = 0
  object tlbNumOrder: TToolBar
    Left = 0
    Top = 0
    Width = 709
    Height = 24
    Caption = 'tlbNumOrder'
    Images = frmMain.Images16
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    object btnOptions: TToolButton
      Left = 0
      Top = 0
      Action = actOptions
    end
    object btnHelp: TToolButton
      Left = 23
      Top = 0
      Action = actHelp
    end
    object btn1: TToolButton
      Left = 46
      Top = 0
      Width = 8
      Caption = 'btn1'
      Style = tbsSeparator
    end
    object btnInvalidate: TToolButton
      Left = 54
      Top = 0
      Action = actInvalidate
    end
    object btnUndo1: TToolButton
      Left = 77
      Top = 0
      Action = actUndo1
    end
    object btn3: TToolButton
      Left = 100
      Top = 0
      Width = 8
      Caption = 'btn3'
      ImageIndex = 6
      Style = tbsSeparator
    end
    object btnZoomPlus: TToolButton
      Left = 108
      Top = 0
      Action = actZoomPlus
    end
    object btnZoomMinus: TToolButton
      Left = 131
      Top = 0
      Action = actZoomMinus
    end
    object btnZoomFit: TToolButton
      Left = 154
      Top = 0
      Action = actZoomFit
    end
    object btnShowArrows: TToolButton
      Left = 177
      Top = 0
      Action = actShowArrows
    end
    object btn2: TToolButton
      Left = 200
      Top = 0
      Width = 8
      Caption = 'btn2'
      ImageIndex = 15
      Style = tbsSeparator
    end
    object btnOK: TToolButton
      Left = 208
      Top = 0
      Action = actOK
    end
    object btnClose: TToolButton
      Left = 231
      Top = 0
      Action = actClose
    end
    object lbCurOrder: TLabel
      Left = 254
      Top = 0
      Width = 64
      Height = 22
      Alignment = taRightJustify
      AutoSize = False
      Caption = #1053#1086#1084#1077#1088' '
      Layout = tlCenter
    end
    object cbbCurNum: TComboBox
      Left = 318
      Top = 0
      Width = 65
      Height = 21
      ImeName = 'Russian'
      ItemHeight = 13
      TabOrder = 0
    end
  end
  object panImage: TPanel
    Left = 0
    Top = 24
    Width = 709
    Height = 547
    Align = alClient
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 1
    object sbPreview: TScrollBox
      Left = 0
      Top = 0
      Width = 709
      Height = 547
      HorzScrollBar.Smooth = True
      HorzScrollBar.Tracking = True
      VertScrollBar.Smooth = True
      VertScrollBar.Tracking = True
      Align = alClient
      TabOrder = 0
      OnMouseWheel = sbPreviewMouseWheel
      object pbPreview: TPaintBox
        Left = 0
        Top = 0
        Width = 705
        Height = 538
        OnMouseMove = pbPreviewMouseMove
        OnPaint = pbPreviewPaint
      end
    end
  end
  object panOptions: TPanel
    Left = 16
    Top = 40
    Width = 297
    Height = 193
    BorderWidth = 2
    ParentBackground = True
    TabOrder = 2
    Visible = False
    object grpOptions: TGroupBox
      Left = 3
      Top = 3
      Width = 291
      Height = 187
      Align = alClient
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
      TabOrder = 0
      object lbPagesInDirection: TLabel
        Left = 192
        Top = 16
        Width = 89
        Height = 33
        AutoSize = False
        Caption = #1051#1080#1089#1090#1086#1074' '#1074' '#1085#1072#1087#1088#1072#1074#1083#1077#1085#1080#1080
        Layout = tlBottom
        WordWrap = True
      end
      object lbMinPageSize: TLabel
        Left = 8
        Top = 88
        Width = 169
        Height = 17
        Alignment = taCenter
        AutoSize = False
        Caption = #1052#1080#1085#1080#1084#1072#1083#1100#1085#1099#1081' '#1088#1072#1079#1084#1077#1088' '#1083#1080#1089#1090#1072
        Layout = tlCenter
      end
      object lbMPSX: TLabel
        Left = 80
        Top = 112
        Width = 25
        Height = 17
        Alignment = taCenter
        AutoSize = False
        Caption = 'X'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
      end
      object lbBetweenPages: TLabel
        Left = 8
        Top = 136
        Width = 169
        Height = 17
        Alignment = taCenter
        AutoSize = False
        Caption = #1056#1072#1089#1089#1090#1086#1103#1085#1080#1077' '#1084#1077#1078#1076#1091' '#1083#1080#1089#1090#1072#1084#1080
        Layout = tlCenter
      end
      object nsePagesInLine: TNxSpinEdit
        Left = 192
        Top = 56
        Width = 89
        Height = 21
        Alignment = taRightJustify
        TabOrder = 0
        Text = '0'
        Increment = 1.000000000000000000
      end
      object rgLayout: TRadioGroup
        Left = 8
        Top = 16
        Width = 169
        Height = 65
        Caption = #1053#1072#1087#1088#1072#1074#1083#1077#1085#1080#1077' '#1088#1072#1089#1082#1083#1072#1076#1072
        Items.Strings = (
          #1057#1074#1077#1088#1093#1091' '#1074#1085#1080#1079
          #1057#1083#1077#1074#1072' '#1085#1072#1087#1088#1072#1074#1086)
        TabOrder = 1
      end
      object nseMinPageSizeX: TNxSpinEdit
        Left = 16
        Top = 112
        Width = 65
        Height = 21
        Alignment = taRightJustify
        TabOrder = 2
        Text = '0'
        Increment = 1.000000000000000000
      end
      object nseMinPageSizeY: TNxSpinEdit
        Left = 104
        Top = 112
        Width = 65
        Height = 21
        Alignment = taRightJustify
        TabOrder = 3
        Text = '0'
        Increment = 1.000000000000000000
      end
      object nseBetweenPages: TNxSpinEdit
        Left = 16
        Top = 160
        Width = 65
        Height = 21
        Alignment = taRightJustify
        TabOrder = 4
        Text = '0'
        Increment = 1.000000000000000000
      end
      object btnOptionsOK: TBitBtn
        Left = 208
        Top = 120
        Width = 75
        Height = 25
        Action = actOptionsOK
        Caption = 'OK'
        TabOrder = 5
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00B8D2B700357F3300C8DCC700FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00B9D8B700398E33002BAE200041963C00D7E9D600FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00BADCB7003C9B330033C3250024CD13002BBB1D004DA44500E5F2
          E400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00BBDDB7003D9F33004ACC3A0029C3180039CC280028C2170031B123005AAD
          5100F0F8EF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00BBDF
          B7003EA4330063DA530033BC220055D145003EA4330034B625002CB81B0036AC
          28006AB86100F7FBF700FF00FF00FF00FF00FF00FF00FF00FF00FF00FF003FA8
          330070E65F0059D048006BE15A003FA8330098D0920043AB37003AB6290032B2
          21003BAB2D007BC37300FDFEFD00FF00FF00FF00FF00FF00FF00FF00FF00BCE1
          B70041AC330074EA630041AC3300BCE1B700FF00FF00B8E0B30040AE330040B7
          2F0038AF270040AE31008CCD8400FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00BCE3B70041AF3300BCE3B700FF00FF00FF00FF00FF00FF009DD6960045B7
          370058CF470056CD450045B53600A3D99C00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FEFFFE0084CD
          7A004DC13D0061D850005FD64F0046B73700B9E3B300FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00F9FD
          F9006DC6610056CC46006BE25A0072E9620043B53300FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00F0F9EF005DC24F0077EE660043B93300BDE6B700FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00E3F5E00044BB3300BDE7B700FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      end
      object btnOptionsCancel: TBitBtn
        Left = 208
        Top = 152
        Width = 75
        Height = 25
        Action = actOptionsCancel
        Caption = #1054#1090#1084#1077#1085#1072
        TabOrder = 6
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00B7B7D20033337F00B7B7D200FF00FF00FF00FF00FF00FF00FF00
          FF00B7B7D20033337F00B7B7D200FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00B7B7D80033338E001111D80033338E00B7B7D800FF00FF00FF00FF00B7B7
          D80033338E001111D80033338E00B7B7D800FF00FF00FF00FF00FF00FF00FF00
          FF0033339B001111D0001111D0001111D00033339B00B7B7DC00B7B7DC003333
          9B001111D0001111D0001111D00033339B00FF00FF00FF00FF00FF00FF00FF00
          FF00B7B7DD0033339F001111C4001111C4001111C40033339F0033339F001111
          C4001111C4001111C40033339F00B7B7DD00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00B7B7DF003333A4001111B8001111B8001111B8001111B8001111
          B8001111B8003333A400B7B7DF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00B7B7E0003333A8001515AF001111AC001111AC001111
          AC003333A800B7B7E000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00B7B7E2003333AC002525B4001111A2001111A2001414
          A5003333AC00B7B7E200FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00B7B7E3003333AF005353DB002E2EB7003D3DC6003131BA001515
          9F001E1EA8003333AF00B7B7E300FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00B7B7E4003333B3006767EF003636BE005E5EE6003333B3003333B3004F4F
          D7003636BE004545CD003333B300B7B7E400FF00FF00FF00FF00FF00FF00FF00
          FF003333B5007676FE004C4CD4007272FA003333B500B7B7E500B7B7E5003333
          B5006262EA004C4CD4005C5CE4003333B500FF00FF00FF00FF00FF00FF00FF00
          FF00B7B7E6003333B9007777FF003333B900B7B7E600FF00FF00FF00FF00B7B7
          E6003333B9007070F8003333B900B7B7E600FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00B7B7E7003333BB00B7B7E700FF00FF00FF00FF00FF00FF00FF00
          FF00B7B7E7003333BB00B7B7E700FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      end
    end
  end
  object actlstNumOrder: TActionList
    Images = frmMain.Images16
    OnExecute = actlstNumOrderExecute
    Left = 400
    Top = 48
    object actOK: TAction
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080' '#1079#1072#1082#1088#1099#1090#1100
      ImageIndex = 32
      OnExecute = DummyAction
    end
    object actClose: TAction
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1073#1077#1079' '#1089#1086#1093#1088#1072#1085#1077#1085#1080#1103
      ImageIndex = 5
      OnExecute = DummyAction
    end
    object actHelp: TAction
      Hint = #1057#1087#1088#1072#1074#1082#1072
      ImageIndex = 53
      OnExecute = DummyAction
    end
    object actZoomPlus: TAction
      Category = 'View'
      Caption = 'Zoom in'
      Hint = #1059#1074#1077#1083#1080#1095#1080#1090#1100
      ImageIndex = 15
      OnExecute = DummyAction
    end
    object actZoomMinus: TAction
      Category = 'View'
      Caption = 'Zoom out'
      Hint = #1059#1084#1077#1085#1100#1096#1080#1090#1100
      ImageIndex = 16
      OnExecute = DummyAction
    end
    object actZoomFit: TAction
      Category = 'View'
      Caption = 'Fit to window'
      Hint = #1048#1089#1093#1086#1076#1085#1099#1081' '#1088#1072#1079#1084#1077#1088
      ImageIndex = 14
      OnExecute = DummyAction
    end
    object actOptions: TAction
      Hint = #1053#1072#1089#1090#1088#1086#1081#1082#1072
      ImageIndex = 49
      OnExecute = DummyAction
    end
    object actOptionsOK: TAction
      Category = 'Options'
      Caption = 'OK'
      ImageIndex = 32
      OnExecute = DummyAction
    end
    object actOptionsCancel: TAction
      Category = 'Options'
      Caption = #1054#1090#1084#1077#1085#1072
      ImageIndex = 5
      OnExecute = DummyAction
    end
    object actShowArrows: TAction
      Category = 'View'
      AutoCheck = True
      Caption = 'actShowArrows'
      Hint = #1055#1086#1082#1072#1079#1072#1090#1100' '#1085#1072#1087#1088#1072#1074#1083#1077#1085#1080#1077
      ImageIndex = 54
      OnExecute = DummyAction
    end
    object actInvalidate: TAction
      AutoCheck = True
      Hint = #1057#1085#1103#1090#1080#1077' '#1086#1090#1084#1077#1090#1082#1080' '#1073#1080#1083#1077#1090#1086#1074' (Shift)'
      ImageIndex = 56
      OnExecute = DummyAction
    end
    object actUndo1: TAction
      Hint = #1054#1090#1084#1077#1085#1080#1090#1100' '#1087#1086#1089#1083#1077#1076#1085#1102#1102' '#1086#1090#1084#1077#1090#1082#1091
      ImageIndex = 57
      OnExecute = DummyAction
    end
  end
end
