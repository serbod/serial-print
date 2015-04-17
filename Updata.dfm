object frmUpdata: TfrmUpdata
  Left = 0
  Top = 0
  Width = 436
  Height = 235
  Anchors = [akTop, akRight, akBottom]
  BiDiMode = bdRightToLeft
  ParentBiDiMode = False
  TabOrder = 0
  OnResize = FrameResize
  DesignSize = (
    436
    235)
  object grpUpdataProduct: TGroupBox
    Left = 8
    Top = 8
    Width = 422
    Height = 153
    Anchors = [akLeft, akTop, akRight]
    Caption = #1054#1073#1085#1086#1074#1083#1077#1085#1080#1077' '#1087#1088#1080#1083#1086#1078#1077#1085#1080#1103':'
    TabOrder = 0
    DesignSize = (
      422
      153)
    object lbAuthor: TLabel
      Left = 16
      Top = 40
      Width = 41
      Height = 13
      Caption = #1040#1074#1090#1086#1088#1099':'
    end
    object lbProductName: TLabel
      Left = 16
      Top = 24
      Width = 102
      Height = 13
      Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1087#1088#1086#1076#1091#1082#1090#1072':'
    end
    object lbEmail: TLabel
      Left = 16
      Top = 56
      Width = 32
      Height = 13
      Caption = 'E-Mail:'
    end
    object lbYourVersion: TLabel
      Left = 16
      Top = 80
      Width = 87
      Height = 13
      Caption = #1058#1077#1082#1091#1097#1072#1103' '#1074#1077#1088#1089#1080#1103':'
    end
    object lbWebVersion: TLabel
      Left = 16
      Top = 96
      Width = 142
      Height = 13
      Caption = #1042#1077#1088#1089#1080#1103' '#1076#1086#1089#1090#1091#1087#1085#1072#1103' '#1085#1072' '#1089#1072#1081#1090#1077':'
    end
    object Bevel: TBevel
      Left = 8
      Top = 112
      Width = 403
      Height = 9
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
    end
    object lb_File: TLabel
      Left = 10
      Top = 116
      Width = 3
      Height = 13
    end
    object pb1: TProgressBar
      Left = 8
      Top = 132
      Width = 403
      Height = 9
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
    end
  end
  object btnFindUpdata: TBitBtn
    Left = 144
    Top = 168
    Width = 105
    Height = 25
    Caption = #1055#1086#1080#1089#1082' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1103
    TabOrder = 1
    OnClick = btnFindUpdata1Click
  end
  object btnDownload: TBitBtn
    Left = 260
    Top = 168
    Width = 82
    Height = 25
    Caption = #1054#1073#1085#1086#1074#1080#1090#1100
    Enabled = False
    TabOrder = 2
    OnClick = btnDownload1Click
  end
  object btnCancel: TBitBtn
    Left = 352
    Top = 168
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 3
    OnClick = btnCancel1Click
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFB7B7D233337FB7B7D2FFFFFFFFFFFFFFFFFFFFFFFFB7B7D233337FB7B7
      D2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB7B7D833338E1111D833338EB7B7D8FF
      FFFFFFFFFFB7B7D833338E1111D833338EB7B7D8FFFFFFFFFFFFFFFFFFFFFFFF
      33339B1111D01111D01111D033339BB7B7DCB7B7DC33339B1111D01111D01111
      D033339BFFFFFFFFFFFFFFFFFFFFFFFFB7B7DD33339F1111C41111C41111C433
      339F33339F1111C41111C41111C433339FB7B7DDFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFB7B7DF3333A41111B81111B81111B81111B81111B81111B83333A4B7B7
      DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB7B7E03333A81515AF11
      11AC1111AC1111AC3333A8B7B7E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFB7B7E23333AC2525B41111A21111A21414A53333ACB7B7E2FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB7B7E33333AF5353DB2E2EB73D
      3DC63131BA15159F1E1EA83333AFB7B7E3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      B7B7E43333B36767EF3636BE5E5EE63333B33333B34F4FD73636BE4545CD3333
      B3B7B7E4FFFFFFFFFFFFFFFFFFFFFFFF3333B57676FE4C4CD47272FA3333B5B7
      B7E5B7B7E53333B56262EA4C4CD45C5CE43333B5FFFFFFFFFFFFFFFFFFFFFFFF
      B7B7E63333B97777FF3333B9B7B7E6FFFFFFFFFFFFB7B7E63333B97070F83333
      B9B7B7E6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB7B7E73333BBB7B7E7FFFFFFFF
      FFFFFFFFFFFFFFFFB7B7E73333BBB7B7E7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
  end
  object mxwbpdt1: TmxWebUpdate
    TagInfo.Author = 'mxAuthor'
    TagInfo.Email = 'mxEmail'
    TagInfo.ClientFileName = 'mxClientSideName'
    TagInfo.Download = 'mxDownload'
    TagInfo.ProductName = 'mxProduct'
    TagInfo.Redirection = 'mxRedirection'
    TagInfo.RunParameters = 'mxRunParameters'
    TagInfo.Version = 'mxVersion'
    ProductInfo.URL = 'http://'
    ProductInfo.Version = '1.0'
    InfoCaption.OkButton = '&OK'
    InfoCaption.CancelButton = '&Cancel'
    InfoCaption.CheckForUpdate = 'C&heck for updates in the future'
    Options = [uoRunUpdate, uoTerminate]
    Version = '1.21'
    HTTPPort = 80
    OnBeforeDownload = mxwbpdt1BeforeDownload
    OnAfterDownload = mxwbpdt1AfterDownload
    Left = 16
    Top = 160
  end
end
