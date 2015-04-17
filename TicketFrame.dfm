object frmTicketTemplate: TfrmTicketTemplate
  Left = 0
  Top = 0
  Width = 514
  Height = 518
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  ParentFont = False
  TabOrder = 0
  OnMouseWheel = FrameMouseWheel
  OnResize = FrameResize
  DesignSize = (
    514
    518)
  object grpPreview: TGroupBox
    Left = 176
    Top = 8
    Width = 329
    Height = 217
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = #1057#1093#1077#1084#1072' '#1073#1080#1083#1077#1090#1072
    TabOrder = 0
    object imgTicket: TImage
      Left = 2
      Top = 15
      Width = 325
      Height = 200
      Align = alClient
      PopupMenu = pmPreview
      OnMouseDown = imgTicketMouseDown
      OnMouseMove = imgTicketMouseMove
    end
  end
  object grpNumLabels: TGroupBox
    Left = 8
    Top = 240
    Width = 217
    Height = 265
    Anchors = [akLeft, akRight, akBottom]
    Caption = #1052#1077#1090#1082#1080', '#1085#1091#1084#1077#1088#1072#1090#1086#1088#1099
    TabOrder = 1
    DesignSize = (
      217
      265)
    object lvLabels: TListView
      Left = 8
      Top = 16
      Width = 201
      Height = 241
      Anchors = [akLeft, akTop, akRight]
      Columns = <
        item
          Caption = #1053#1072#1079#1074#1072#1085#1080#1077
          Width = 120
        end
        item
          Caption = #1044#1077#1081#1089#1090#1074#1080#1077
          Width = 70
        end>
      GridLines = True
      HotTrack = True
      HotTrackStyles = [htUnderlineHot]
      ReadOnly = True
      RowSelect = True
      PopupMenu = pmListNL
      TabOrder = 0
      ViewStyle = vsReport
      OnSelectItem = lvLabelsSelectItem
    end
  end
  object grpLabel: TGroupBox
    Left = 232
    Top = 240
    Width = 273
    Height = 265
    Anchors = [akRight, akBottom]
    Caption = #1057#1074#1086#1081#1089#1090#1074#1072' '#1084#1077#1090#1082#1080' '#1080#1083#1080' '#1085#1091#1084#1077#1088#1072#1090#1086#1088#1072
    TabOrder = 2
    object lbFont: TLabel
      Left = 8
      Top = 232
      Width = 257
      Height = 25
      AutoSize = False
      Caption = 'Arial, 12, bold'
    end
    object lbNumLabelTpl: TLabel
      Left = 16
      Top = 64
      Width = 73
      Height = 26
      AutoSize = False
      Caption = #1064#1072#1073#1083#1086#1085' '#1085#1091#1084#1077#1088#1072#1090#1086#1088#1072
      WordWrap = True
    end
    object btnFontSelect: TBitBtn
      Left = 8
      Top = 200
      Width = 73
      Height = 25
      Caption = #1064#1088#1080#1092#1090
      TabOrder = 0
      OnClick = btnFontSelectClick
    end
    object lbedNLName: TLabeledEdit
      Left = 8
      Top = 32
      Width = 129
      Height = 21
      EditLabel.Width = 48
      EditLabel.Height = 13
      EditLabel.Caption = #1053#1072#1079#1074#1072#1085#1080#1077
      ImeName = 'Russian'
      TabOrder = 1
      OnChange = lbedNLNameChange
    end
    object lbedNLPosX: TLabeledEdit
      Left = 152
      Top = 32
      Width = 49
      Height = 21
      EditLabel.Width = 28
      EditLabel.Height = 13
      EditLabel.Caption = #1055#1086#1079'.'#1061
      ImeName = 'Russian'
      TabOrder = 2
      OnChange = lbedNLPosXChange
      OnKeyDown = lbedPosKeyDown
      OnKeyPress = edNumKeyPress
    end
    object lbedNLPosY: TLabeledEdit
      Left = 208
      Top = 32
      Width = 49
      Height = 21
      EditLabel.Width = 28
      EditLabel.Height = 13
      EditLabel.Caption = #1055#1086#1079'.Y'
      ImeName = 'Russian'
      TabOrder = 3
      OnChange = lbedNLPosYChange
      OnKeyDown = lbedPosKeyDown
      OnKeyPress = edNumKeyPress
    end
    object vleNLData: TValueListEditor
      Left = 8
      Top = 96
      Width = 249
      Height = 97
      Strings.Strings = (
        'Action=+1'
        'ValueType='
        'DefValue=0')
      TabOrder = 4
      TitleCaptions.Strings = (
        #1055#1072#1088#1072#1084#1077#1090#1088
        #1047#1085#1072#1095#1077#1085#1080#1077)
      OnStringsChange = vleNLDataStringsChange
      ColWidths = (
        104
        139)
    end
    object cbbNumLabelsTpl: TComboBox
      Left = 96
      Top = 64
      Width = 161
      Height = 21
      ImeName = 'Russian'
      ItemHeight = 13
      TabOrder = 5
      Text = 'cbbNumLabelsTpl'
      OnSelect = cbbNumLabelsTplSelect
    end
    object lbedAngle: TLabeledEdit
      Left = 216
      Top = 200
      Width = 41
      Height = 21
      EditLabel.Width = 37
      EditLabel.Height = 13
      EditLabel.Caption = #1053#1072#1082#1083#1086#1085
      ImeName = 'Russian'
      LabelPosition = lpLeft
      TabOrder = 6
      OnChange = lbedAngleChange
      OnKeyDown = lbedPosKeyDown
      OnKeyPress = edNumKeyPress
    end
    object lbedFontSize: TLabeledEdit
      Left = 128
      Top = 200
      Width = 33
      Height = 21
      EditLabel.Width = 35
      EditLabel.Height = 13
      EditLabel.Caption = #1056#1072#1079#1084#1077#1088
      ImeName = 'Russian'
      LabelPosition = lpLeft
      TabOrder = 7
      OnChange = lbedFontSizeChange
      OnKeyDown = lbedPosKeyDown
      OnKeyPress = edNumKeyPress
    end
  end
  object grpTicketProps: TGroupBox
    Left = 8
    Top = 8
    Width = 161
    Height = 217
    Anchors = [akLeft, akTop, akBottom]
    Caption = #1057#1074#1086#1081#1089#1090#1074#1072' '#1096#1072#1073#1083#1086#1085#1072
    TabOrder = 3
    DesignSize = (
      161
      217)
    object lbHeight: TLabel
      Left = 88
      Top = 56
      Width = 37
      Height = 13
      Caption = #1042#1099#1089#1086#1090#1072
    end
    object lbName: TLabel
      Left = 8
      Top = 16
      Width = 48
      Height = 13
      Caption = #1053#1072#1079#1074#1072#1085#1080#1077
    end
    object lbWidth: TLabel
      Left = 8
      Top = 56
      Width = 40
      Height = 13
      Caption = #1064#1080#1088#1080#1085#1072
    end
    object edHeight: TEdit
      Left = 88
      Top = 76
      Width = 65
      Height = 21
      ImeName = 'Russian'
      TabOrder = 0
      OnChange = edHeightChange
      OnKeyPress = edNumKeyPress
    end
    object edWidth: TEdit
      Left = 8
      Top = 76
      Width = 65
      Height = 21
      ImeName = 'Russian'
      TabOrder = 1
      OnChange = edWidthChange
      OnKeyPress = edNumKeyPress
    end
    object edName: TEdit
      Left = 8
      Top = 32
      Width = 145
      Height = 21
      ImeName = 'Russian'
      TabOrder = 2
    end
    object btnOK: TBitBtn
      Left = 8
      Top = 184
      Width = 65
      Height = 25
      Action = actBtnOK
      Anchors = [akLeft, akBottom]
      Caption = 'OK'
      TabOrder = 3
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
    object btnCancel: TBitBtn
      Left = 88
      Top = 184
      Width = 65
      Height = 25
      Action = actBtnCancel
      Anchors = [akLeft, akBottom]
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 4
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
  object dlgFont: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Left = 240
    Top = 176
  end
  object pmListNL: TPopupMenu
    Images = frmMain.Images16
    Left = 72
    Top = 344
    object N1: TMenuItem
      Action = actAddItem
    end
    object N2: TMenuItem
      Action = actDelItem
    end
  end
  object actlst: TActionList
    Images = frmMain.Images16
    OnExecute = actlstExecute
    Left = 144
    Top = 344
    object actAddItem: TAction
      Category = 'ItemsList'
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      ImageIndex = 43
      OnExecute = DummyAction
    end
    object actDelItem: TAction
      Category = 'ItemsList'
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 44
      OnExecute = DummyAction
    end
    object actUpdateList: TAction
      Category = 'ItemsList'
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100' '#1089#1087#1080#1089#1086#1082
      OnExecute = DummyAction
    end
    object actSaveList: TAction
      Category = 'ItemsList'
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1089#1087#1080#1089#1086#1082
      OnExecute = DummyAction
    end
    object actBtnOK: TAction
      Category = 'Buttons'
      Caption = 'OK'
      ImageIndex = 32
      OnExecute = btnOKClick
    end
    object actBtnCancel: TAction
      Category = 'Buttons'
      Caption = #1054#1090#1084#1077#1085#1072
      ImageIndex = 5
      OnExecute = btnCancelClick
    end
    object actBtnFont: TAction
      Category = 'Buttons'
      Caption = 'actBtnFont'
    end
    object actBtnColor: TAction
      Category = 'Buttons'
      Caption = 'actBtnColor'
    end
    object actImageFromFile: TAction
      Category = 'Preview'
      Caption = #1048#1079#1086#1073#1088#1072#1078#1077#1085#1080#1077' '#1080#1079' '#1092#1072#1081#1083#1072
      ImageIndex = 20
      OnExecute = DummyAction
    end
    object actImageFromClipboard: TAction
      Category = 'Preview'
      Caption = #1048#1079#1086#1073#1088#1072#1078#1077#1085#1080#1077' '#1080#1079' '#1073#1091#1092#1077#1088#1072' '#1086#1073#1084#1077#1085#1072
      ImageIndex = 20
      OnExecute = DummyAction
    end
    object actImageClear: TAction
      Category = 'Preview'
      Caption = #1059#1073#1088#1072#1090#1100' '#1080#1079#1086#1073#1088#1072#1078#1077#1085#1080#1077
      ImageIndex = 33
      OnExecute = DummyAction
    end
  end
  object pmPreview: TPopupMenu
    Images = frmMain.Images16
    Left = 288
    Top = 96
    object miImageFromClipboard: TMenuItem
      Action = actImageFromClipboard
    end
    object miImageRemove: TMenuItem
      Action = actImageClear
    end
  end
end
