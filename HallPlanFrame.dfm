object frmHallPlan: TfrmHallPlan
  Left = 0
  Top = 0
  Width = 803
  Height = 553
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  ParentFont = False
  TabOrder = 0
  object spl1: TSplitter
    Left = 185
    Top = 33
    Height = 501
  end
  object tlbHallPlan: TToolBar
    Left = 0
    Top = 0
    Width = 803
    Height = 33
    HelpContext = 10
    ButtonHeight = 48
    ButtonWidth = 42
    Caption = 'tlbHallPlan'
    Images = frmMain.Images16
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    object btnTypeView: TToolButton
      Left = 0
      Top = 2
      Action = actTypePaint
    end
    object btnSettings: TToolButton
      Left = 42
      Top = 2
      Action = actSettings
    end
    object btnFillItems: TToolButton
      Left = 84
      Top = 2
      Action = actFillItems
    end
    object btnNewPlace: TToolButton
      Left = 126
      Top = 2
      Action = actNewPlace
    end
    object btnNewText: TToolButton
      Left = 168
      Top = 2
      Action = actNewText
    end
    object btnClearItems: TToolButton
      Left = 210
      Top = 2
      Action = actClearItems
      DropdownMenu = ppmClearItems
      Style = tbsDropDown
    end
    object btn1: TToolButton
      Left = 267
      Top = 2
      Width = 8
      Caption = 'btn1'
      ImageIndex = 4
      Style = tbsSeparator
    end
    object btnSelectSingle: TToolButton
      Left = 275
      Top = 2
      Action = actSelectSingle
    end
    object btnSelectRow: TToolButton
      Left = 317
      Top = 2
      Action = actSelectRow
    end
    object btnSelectRegion: TToolButton
      Left = 359
      Top = 2
      Action = actSelectRegion
    end
    object btnDrawGrid: TToolButton
      Left = 401
      Top = 2
      Action = actDrawGrid
    end
    object btn2: TToolButton
      Left = 0
      Top = 2
      Width = 8
      Caption = 'btn2'
      ImageIndex = 0
      Wrap = True
      Style = tbsSeparator
    end
    object btnAlignSelectedX: TToolButton
      Left = 0
      Top = 55
      Action = actAlignSelectedX
    end
    object btnAlignSelectedY: TToolButton
      Left = 42
      Top = 55
      Action = actAlignSelectedY
    end
    object btnAlignSelectedAlong: TToolButton
      Left = 84
      Top = 55
      Action = actAlignSelectedAlong
      ImageIndex = 47
    end
    object btn3: TToolButton
      Left = 126
      Top = 55
      Width = 8
      Caption = 'btn3'
      ImageIndex = 0
      Style = tbsSeparator
    end
    object btnColorSelect: TToolButton
      Left = 134
      Top = 55
      Action = actColorSelect
    end
    object btnSaveToFile: TToolButton
      Left = 176
      Top = 55
      Action = actSaveToFile
    end
    object btnSaveToBase: TToolButton
      Left = 218
      Top = 55
      Action = actSaveToBase
    end
    object btnPrint: TToolButton
      Left = 260
      Top = 55
      Action = actPrint
    end
    object btn4: TToolButton
      Left = 302
      Top = 55
      Width = 8
      Caption = 'btn4'
      ImageIndex = 22
      Style = tbsSeparator
    end
    object btnZoom100: TToolButton
      Left = 310
      Top = 55
      Action = actZoom100
    end
    object btnZoomPlus: TToolButton
      Left = 352
      Top = 55
      Action = actZoomPlus
    end
    object btnZoomMinus: TToolButton
      Left = 394
      Top = 55
      Action = actZoomMinus
    end
    object btnHelp: TToolButton
      Left = 436
      Top = 55
      Action = actHelp
    end
  end
  object grpProps: TGroupBox
    Left = 0
    Top = 33
    Width = 185
    Height = 501
    Align = alLeft
    Caption = ' '#1057#1074#1086#1081#1089#1090#1074#1072' '
    TabOrder = 1
    object Splitter1: TSplitter
      Left = 2
      Top = 184
      Width = 181
      Height = 3
      Cursor = crVSplit
      Align = alBottom
    end
    object lvPlaces: TListView
      Left = 2
      Top = 15
      Width = 181
      Height = 169
      Align = alClient
      Columns = <
        item
          Caption = #1056#1103#1076
        end
        item
          Caption = #1052#1077#1089#1090#1086
        end
        item
          Caption = #1057#1077#1082#1090#1086#1088
        end>
      GridLines = True
      OwnerData = True
      ReadOnly = True
      RowSelect = True
      TabOrder = 0
      ViewStyle = vsReport
      OnData = lvPlacesData
      OnSelectItem = lvPlacesSelectItem
    end
    object lvProps: TListView
      Left = 2
      Top = 187
      Width = 181
      Height = 312
      Align = alBottom
      Columns = <
        item
          Caption = #1057#1074#1086#1081#1089#1090#1074#1086
          Width = 80
        end
        item
          Caption = #1047#1085#1072#1095#1077#1085#1080#1077
          Width = 80
        end>
      GridLines = True
      ReadOnly = True
      RowSelect = True
      SmallImages = FImageListSmall
      TabOrder = 1
      ViewStyle = vsReport
      OnCustomDrawSubItem = lvPropsCustomDrawSubItem
      OnExit = lvPropsExit
      OnKeyUp = lvPropsKeyUp
      OnMouseDown = lvPropsMouseDown
      OnSelectItem = lvPropsSelectItem
    end
  end
  object grpHall: TGroupBox
    Left = 188
    Top = 33
    Width = 615
    Height = 501
    Align = alClient
    Caption = ' '#1055#1083#1072#1085' '#1079#1072#1083#1072' '
    TabOrder = 2
    object ScrollBox1: TScrollBox
      Left = 2
      Top = 15
      Width = 611
      Height = 484
      Align = alClient
      BorderStyle = bsNone
      TabOrder = 0
      object pbHall: TPaintBox
        Left = 0
        Top = 0
        Width = 611
        Height = 484
        Align = alClient
        PopupMenu = pmHall
        OnMouseDown = imgHallMouseDown
        OnMouseMove = imgHallMouseMove
        OnMouseUp = imgHallMouseUp
        OnPaint = pbHallPaint
      end
    end
  end
  object pSettings: TPanel
    Left = 272
    Top = 383
    Width = 347
    Height = 115
    ParentBackground = False
    TabOrder = 3
    Visible = False
    DesignSize = (
      347
      115)
    object grpPlaceProps: TGroupBox
      Left = 8
      Top = 5
      Width = 162
      Height = 70
      Caption = ' '#1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1084#1077#1089#1090#1072' '
      TabOrder = 0
      object lbHeightPlace: TLabel
        Left = 88
        Top = 18
        Width = 37
        Height = 13
        Caption = #1042#1099#1089#1086#1090#1072
      end
      object lbWidthPlace: TLabel
        Left = 8
        Top = 18
        Width = 40
        Height = 13
        Caption = #1064#1080#1088#1080#1085#1072
      end
      object seWidthPlace: TSpinEdit
        Left = 8
        Top = 38
        Width = 65
        Height = 22
        MaxValue = 0
        MinValue = 0
        TabOrder = 0
        Value = 0
        OnKeyUp = seWidthPlaceKeyUp
      end
      object seHeightPlace: TSpinEdit
        Left = 88
        Top = 38
        Width = 65
        Height = 22
        MaxValue = 0
        MinValue = 0
        TabOrder = 1
        Value = 0
        OnKeyUp = seWidthPlaceKeyUp
      end
    end
    object btnCancel: TBitBtn
      Left = 272
      Top = 81
      Width = 67
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 1
      OnClick = btnCancelClick
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
    object btnOK: TBitBtn
      Left = 197
      Top = 81
      Width = 65
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = 'OK'
      TabOrder = 2
      OnClick = btnOKClick
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
    object grpHallProps: TGroupBox
      Left = 176
      Top = 5
      Width = 162
      Height = 70
      Caption = ' '#1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1079#1072#1083#1072' '
      TabOrder = 3
      object lbHeightHall: TLabel
        Left = 88
        Top = 18
        Width = 37
        Height = 13
        Caption = #1042#1099#1089#1086#1090#1072
      end
      object lbWidthHall: TLabel
        Left = 8
        Top = 18
        Width = 40
        Height = 13
        Caption = #1064#1080#1088#1080#1085#1072
      end
      object seWidthHall: TSpinEdit
        Left = 8
        Top = 38
        Width = 65
        Height = 22
        MaxValue = 0
        MinValue = 0
        TabOrder = 0
        Value = 0
        OnKeyUp = seWidthPlaceKeyUp
      end
      object seHeightHall: TSpinEdit
        Left = 88
        Top = 38
        Width = 65
        Height = 22
        MaxValue = 0
        MinValue = 0
        TabOrder = 1
        Value = 0
        OnKeyUp = seWidthPlaceKeyUp
      end
    end
  end
  object pHallPosition: TPanel
    Left = 272
    Top = 264
    Width = 154
    Height = 97
    ParentBackground = False
    TabOrder = 4
    Visible = False
    DesignSize = (
      154
      97)
    object grpHallPosition: TGroupBox
      Left = 7
      Top = 5
      Width = 139
      Height = 53
      Anchors = [akLeft, akRight, akBottom]
      Caption = ' '#1055#1086#1079#1080#1094#1080#1103' '
      TabOrder = 0
      object lPosY: TLabel
        Left = 77
        Top = 22
        Width = 6
        Height = 13
        Caption = 'Y'
      end
      object lPosX: TLabel
        Left = 8
        Top = 22
        Width = 6
        Height = 13
        Caption = 'X'
      end
      object sePosHallX: TSpinEdit
        Left = 19
        Top = 18
        Width = 42
        Height = 22
        MaxValue = 0
        MinValue = 0
        TabOrder = 0
        Value = 0
        OnChange = sePosHallYChange
      end
      object sePosHallY: TSpinEdit
        Left = 88
        Top = 18
        Width = 42
        Height = 22
        MaxValue = 0
        MinValue = 0
        TabOrder = 1
        Value = 0
        OnChange = sePosHallYChange
      end
    end
    object btnOkPos: TBitBtn
      Left = 7
      Top = 64
      Width = 63
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = 'OK'
      TabOrder = 1
      OnClick = btnOkPosClick
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
    object btnCancelPos: TBitBtn
      Left = 79
      Top = 64
      Width = 67
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 2
      OnClick = btnOkPosClick
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
  object StatusBar: TStatusBar
    Left = 0
    Top = 534
    Width = 803
    Height = 19
    Panels = <
      item
        Text = #1042#1099#1073#1088#1072#1085#1086
        Width = 300
      end
      item
        Width = 50
      end>
  end
  object actlstHallPlan: TActionList
    Images = frmMain.Images16
    OnExecute = actlstHallPlanExecute
    Left = 224
    Top = 144
    object actTypePaint: TAction
      AutoCheck = True
      Caption = 'actTypePaint'
      Checked = True
      Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077
      ImageIndex = 50
      OnExecute = DummyAction
    end
    object actSettings: TAction
      Caption = 'actSettings'
      Hint = #1053#1072#1089#1090#1088#1086#1081#1082#1080
      ImageIndex = 49
      OnExecute = DummyAction
    end
    object actFillItems: TAction
      Caption = 'actFillItems'
      Hint = #1047#1072#1087#1086#1083#1085#1080#1090#1100' '#1084#1077#1089#1090#1072
      ImageIndex = 35
      OnExecute = DummyAction
    end
    object actClearItems: TAction
      Caption = #1042#1089#1077
      Hint = #1059#1073#1088#1072#1090#1100' '#1074#1089#1077' '#1084#1077#1089#1090#1072
      ImageIndex = 33
      OnExecute = DummyAction
    end
    object actClearItemsSelect: TAction
      Caption = #1059#1073#1088#1072#1090#1100' '#1074#1099#1076#1077#1083#1077#1085#1085#1099#1077' '#1084#1077#1089#1090#1072
      Hint = #1059#1073#1088#1072#1090#1100' '#1074#1099#1076#1077#1083#1077#1085#1085#1099#1077' '#1084#1077#1089#1090#1072
      ImageIndex = 48
      OnExecute = DummyAction
    end
    object actSelectSingle: TAction
      Caption = 'actSelectSingle'
      Hint = #1042#1099#1073#1088#1072#1090#1100' '#1086#1076#1085#1086' '#1084#1077#1089#1090#1086
      ImageIndex = 34
      OnExecute = DummyAction
    end
    object actSelectRow: TAction
      Caption = 'actSelectRow'
      Hint = #1042#1099#1073#1088#1072#1090#1100' '#1088#1103#1076' (Shift+'#1050#1083#1080#1082')'
      ImageIndex = 41
      OnExecute = DummyAction
    end
    object actSelectRegion: TAction
      Caption = 'actSelectRegion'
      Hint = #1042#1099#1073#1088#1072#1090#1100' '#1088#1077#1075#1080#1086#1085
      ImageIndex = 40
      OnExecute = DummyAction
    end
    object actDrawGrid: TAction
      AutoCheck = True
      Caption = 'actDrawGrid'
      Hint = #1055#1086#1082#1072#1079#1072#1090#1100' '#1089#1077#1090#1082#1091
      ImageIndex = 36
      OnExecute = DummyAction
    end
    object actAlignSelectedX: TAction
      Caption = 'actAlignSelectedX'
      Hint = #1042#1099#1088#1086#1074#1085#1103#1090#1100' '#1087#1086' '#1075#1086#1088#1080#1079#1086#1085#1090#1072#1083#1080
      ImageIndex = 38
      OnExecute = DummyAction
    end
    object actAlignSelectedY: TAction
      Caption = 'actAlignSelectedY'
      Hint = #1042#1099#1088#1086#1074#1085#1103#1090#1100' '#1087#1086' '#1074#1077#1088#1090#1080#1082#1072#1083#1080
      ImageIndex = 37
      OnExecute = DummyAction
    end
    object actAlignSelectedAlong: TAction
      Caption = 'actAlignSelectedAlong'
      Hint = #1042#1099#1088#1086#1074#1085#1080#1090#1100' '#1074#1076#1086#1083#1100' '#1083#1080#1085#1080#1080
      OnExecute = DummyAction
    end
    object actColorSelect: TAction
      Caption = 'actColorSelect'
      Hint = #1042#1099#1073#1088#1072#1090#1100' '#1094#1074#1077#1090
      ImageIndex = 18
      OnExecute = DummyAction
    end
    object actZoom100: TAction
      Caption = 'actZoom100'
      Hint = #1054#1073#1099#1095#1085#1099#1081' '#1088#1072#1079#1084#1077#1088
      ImageIndex = 14
      OnExecute = DummyAction
    end
    object actZoomPlus: TAction
      Caption = 'actZoomPlus'
      Hint = #1055#1088#1080#1073#1083#1080#1079#1080#1090#1100
      ImageIndex = 15
      OnExecute = DummyAction
    end
    object actZoomMinus: TAction
      Caption = 'actZoomMinus'
      Hint = #1054#1090#1076#1072#1083#1080#1090#1100
      ImageIndex = 16
      OnExecute = DummyAction
    end
    object actSaveToFile: TAction
      Caption = 'actSaveToFile'
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1074' '#1092#1072#1081#1083
      ImageIndex = 20
      OnExecute = DummyAction
    end
    object actSaveToBase: TAction
      Caption = 'actSaveToBase'
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
      ImageIndex = 32
      OnExecute = DummyAction
    end
    object actPrint: TAction
      Caption = 'actPrint'
      Hint = #1053#1072#1087#1077#1095#1072#1090#1072#1090#1100
      ImageIndex = 21
      OnExecute = DummyAction
    end
    object actNewPlace: TAction
      AutoCheck = True
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1084#1077#1089#1090#1086
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1084#1077#1089#1090#1086
      ImageIndex = 51
      OnExecute = DummyAction
    end
    object actNewText: TAction
      AutoCheck = True
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1072#1076#1087#1080#1089#1100
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1072#1076#1087#1080#1089#1100
      ImageIndex = 52
      OnExecute = DummyAction
    end
    object actNewRow: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1088#1103#1076
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1088#1103#1076
    end
    object actHelp: TAction
      Caption = 'actHelp'
      Hint = #1057#1087#1088#1072#1074#1082#1072
      ImageIndex = 53
      OnExecute = DummyAction
    end
  end
  object dlgColor: TColorDialog
    Color = clInfoBk
    Left = 312
    Top = 144
  end
  object FImageListSmall: TImageList
    Height = 20
    Width = 20
    Left = 72
    Top = 344
  end
  object dlgSave: TSavePictureDialog
    Filter = 
      'All (*.jpg;*.jpeg;*.bmp)|*.jpg;*.jpeg;*.bmp|JPEG Image File (*.j' +
      'pg)|*.jpg|JPEG Image File (*.jpeg)|*.jpeg|Bitmaps (*.bmp)|*.bmp'
    Left = 360
    Top = 144
  end
  object ppmClearItems: TPopupMenu
    Images = frmMain.Images16
    Left = 128
    Top = 32
    object N1: TMenuItem
      Tag = 1
      Caption = #1042#1099#1076#1077#1083#1077#1085#1085#1099#1077
      Hint = #1059#1073#1088#1072#1090#1100' '#1074#1099#1076#1077#1083#1077#1085#1085#1099#1077' '#1084#1077#1089#1090#1072
      ImageIndex = 48
      OnClick = ClearItemAction
    end
    object N2: TMenuItem
      Tag = 2
      Caption = #1042#1089#1077
      Hint = #1059#1073#1088#1072#1090#1100' '#1074#1089#1077' '#1084#1077#1089#1090#1072
      ImageIndex = 33
      OnClick = ClearItemAction
    end
  end
  object pmHall: TPopupMenu
    Images = frmMain.Images16
    Left = 408
    Top = 144
    object miAddLabel: TMenuItem
      Action = actNewText
      AutoCheck = True
    end
    object miAddSeat: TMenuItem
      Action = actNewPlace
      AutoCheck = True
    end
    object miAddRow: TMenuItem
      Action = actNewRow
    end
    object miN3: TMenuItem
      Caption = '-'
    end
    object miDeleteSelected: TMenuItem
      Action = actClearItemsSelect
    end
  end
end
