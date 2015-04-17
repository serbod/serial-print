object frmUpdater: TfrmUpdater
  Left = 520
  Top = 156
  BorderStyle = bsSingle
  Caption = 'Serial Print Update Creater'
  ClientHeight = 309
  ClientWidth = 496
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object lbl_Path_Update: TLabel
    Left = 8
    Top = 16
    Width = 107
    Height = 13
    Caption = #1055#1091#1090#1100' '#1082' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1103#1084':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object lbl1: TLabel
    Left = 8
    Top = 232
    Width = 254
    Height = 13
    Caption = #1050#1086#1084#1087#1080#1083#1080#1088#1091#1077#1090#1089#1103' '#1054#1073#1085#1086#1074#1083#1103#1090#1086#1088': '#1055#1086#1078#1072#1083#1091#1081#1089#1090#1072' '#1078#1076#1080#1090#1077'...'
    Visible = False
  end
  object btnCreate: TButton
    Left = 280
    Top = 264
    Width = 91
    Height = 25
    Caption = #1050#1086#1084#1087#1080#1083#1080#1088#1086#1074#1072#1090#1100
    TabOrder = 0
    OnClick = btnCreateClick
  end
  object btnClose: TButton
    Left = 384
    Top = 264
    Width = 75
    Height = 25
    Caption = #1047#1072#1082#1088#1099#1090#1100
    TabOrder = 1
    OnClick = btnCloseClick
  end
  object chklst1: TCheckListBox
    Left = 8
    Top = 48
    Width = 177
    Height = 177
    ImeName = 'Russian'
    ItemHeight = 13
    TabOrder = 2
  end
  object edt_Path: TEdit
    Left = 120
    Top = 12
    Width = 289
    Height = 21
    ImeName = 'Russian'
    TabOrder = 3
    OnKeyPress = edt_PathKeyPress
  end
  object btnBrowse: TButton
    Left = 416
    Top = 8
    Width = 75
    Height = 25
    Caption = #1054#1073#1079#1086#1088
    TabOrder = 4
    OnClick = btnBrowseClick
  end
  object mmo1: TMemo
    Left = 224
    Top = 56
    Width = 185
    Height = 89
    ImeName = 'Russian'
    Lines.Strings = (
      'mmo1')
    TabOrder = 5
    Visible = False
  end
  object pb1: TProgressBar
    Left = 8
    Top = 248
    Width = 481
    Height = 9
    TabOrder = 6
  end
  object mmoHelp: TMemo
    Left = 200
    Top = 48
    Width = 281
    Height = 177
    ImeName = 'Russian'
    Lines.Strings = (
      '  '#1044#1083#1103' '#1082#1086#1084#1087#1080#1083#1080#1088#1086#1074#1072#1085#1080#1103' '#1092#1072#1081#1083#1072' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1103', '
      #1087#1088#1077#1076#1074#1072#1088#1080#1090#1077#1083#1100#1085#1086' '#1091#1082#1072#1078#1080#1090#1077' '#1080#1089#1090#1086#1095#1085#1080#1082' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1103'.'
      '  '#1055#1086#1089#1083#1077' '#1074#1099#1073#1086#1088#1072' '#1080#1089#1090#1086#1095#1085#1080#1082#1072' '#1085#1077#1086#1073#1093#1086#1076#1080#1084' '#1074' '#1089#1087#1080#1089#1082#1077' '
      #1076#1086#1089#1090#1091#1087#1085#1099#1093' '#1092#1072#1081#1083#1086#1074' '#1091#1082#1072#1079#1099#1074#1072#1102#1090' '#1092#1072#1081#1083#1099', '#1082#1086#1090#1086#1088#1099#1077' '
      #1085#1077#1086#1073#1093#1086#1076#1080#1084#1086' '#1074#1082#1083#1102#1095#1080#1090#1100' '#1074' '#1086#1073#1085#1086#1074#1083#1103#1090#1086#1088'.'
      '  '#1057#1083#1077#1076#1091#1102#1097#1080#1084' '#1101#1090#1072#1087#1086#1084' '#1103#1074#1083#1103#1077#1090#1089#1103' '#1089#1072#1084' '#1087#1088#1086#1094#1077#1089#1089' '
      #1082#1086#1084#1087#1080#1083#1103#1094#1080#1080', '#1074' '#1093#1086#1076#1077' '#1082#1086#1090#1086#1088#1086#1075#1086' '#1091#1082#1072#1079#1099#1074#1072#1077#1090#1089#1103' '#1087#1091#1090#1100' '#1080' '
      #1085#1072#1079#1074#1072#1085#1080#1077' '#1092#1072#1081#1083#1072' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1103'.')
    ReadOnly = True
    TabOrder = 7
    OnKeyPress = edt_PathKeyPress
  end
  object dlgSave1: TSaveDialog
    DefaultExt = '*.exe'
    Filter = #1055#1088#1080#1083#1086#1078#1077#1085#1080#1077'(*.exe)|*.exe'
    Left = 216
    Top = 160
  end
end
