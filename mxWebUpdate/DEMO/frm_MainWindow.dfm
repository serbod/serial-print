object form_MainWindow: Tform_MainWindow
  Left = 905
  Top = 272
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'mxWebUpdate Demo'
  ClientHeight = 225
  ClientWidth = 352
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object grp_ComponentUpdate: TGroupBox
    Left = 9
    Top = 8
    Width = 336
    Height = 177
    Caption = 'Component Update:'
    TabOrder = 0
    object Label1: TLabel
      Left = 10
      Top = 24
      Width = 69
      Height = 13
      Caption = 'Product name:'
    end
    object Label2: TLabel
      Left = 10
      Top = 88
      Width = 62
      Height = 13
      Caption = 'Your version:'
    end
    object Label3: TLabel
      Left = 10
      Top = 104
      Width = 91
      Height = 13
      Caption = 'Version at the web:'
    end
    object Label4: TLabel
      Left = 10
      Top = 40
      Width = 34
      Height = 13
      Caption = 'Author:'
    end
    object Label5: TLabel
      Left = 10
      Top = 56
      Width = 30
      Height = 13
      Caption = 'e-mail:'
    end
    object lbl_ProductName: TLabel
      Left = 114
      Top = 24
      Width = 3
      Height = 13
      Caption = ' '
    end
    object lbl_Author: TLabel
      Left = 114
      Top = 40
      Width = 3
      Height = 13
      Caption = ' '
    end
    object lbl_Email: TLabel
      Left = 114
      Top = 56
      Width = 3
      Height = 13
      Caption = ' '
    end
    object lbl_YourVersion: TLabel
      Left = 114
      Top = 88
      Width = 3
      Height = 13
      Caption = ' '
    end
    object lbl_WebVersion: TLabel
      Left = 114
      Top = 104
      Width = 3
      Height = 13
      Caption = ' '
    end
    object Bevel: TBevel
      Left = 8
      Top = 128
      Width = 321
      Height = 9
      Shape = bsTopLine
    end
    object lbl_File: TLabel
      Left = 8
      Top = 136
      Width = 3
      Height = 13
    end
    object ProgressBar: TProgressBar
      Left = 8
      Top = 152
      Width = 321
      Height = 16
      TabOrder = 0
    end
  end
  object btn_Exit: TButton
    Left = 176
    Top = 192
    Width = 75
    Height = 25
    Caption = '&Exit'
    TabOrder = 2
    OnClick = btn_ExitClick
  end
  object chk1: TCheckBox
    Left = 32
    Top = 192
    Width = 97
    Height = 17
    Caption = 'chk1'
    TabOrder = 3
  end
  object btn_Update: TButton
    Left = 88
    Top = 192
    Width = 75
    Height = 25
    Caption = '&Download'
    TabOrder = 1
    OnClick = btn_UpdateClick
  end
  object mxWebUpdate: TmxWebUpdate
    TagInfo.Author = 'mxAuthor'
    TagInfo.Email = 'mxEmail'
    TagInfo.ClientFileName = 'mxClientSideName'
    TagInfo.Download = 'mxDownload'
    TagInfo.ProductName = 'mxProduct'
    TagInfo.Redirection = 'mxRedirection'
    TagInfo.RunParameters = 'mxRunParameters'
    TagInfo.Version = 'mxVersion'
    ProductInfo.URL = 'http://www.tusich.ru/webupdate.php?auto_updata'
    ProductInfo.Version = '0.9'
    InfoCaption.OkButton = '&OK'
    InfoCaption.CancelButton = '&Cancel'
    InfoCaption.CheckForUpdate = 'C&heck for updates in the future'
    Options = []
    Version = '1.21'
    TargetFolder = './'
    HTTPPort = 80
    OnBeforeDownload = mxWebUpdateBeforeDownload
    OnAfterDownload = mxWebUpdateAfterDownload
    OnGetInfo = mxWebUpdateGetInfo
    OnUpdateAvailable = mxWebUpdateUpdateAvailable
    OnGetClientFileName = mxWebUpdateGetClientFileName
    OnClientFileExists = mxWebUpdateClientFileExists
    OnBeforeShowInfo = mxWebUpdateBeforeShowInfo
    OnAfterShowInfo = mxWebUpdateAfterShowInfo
    OnBeforeGetInfo = mxWebUpdateBeforeGetInfo
    OnAfterGetInfo = mxWebUpdateAfterGetInfo
    OnNoUpdateFound = mxWebUpdateNoUpdateFound
    OnDownload = mxWebUpdateDownload
    OnDownloadError = mxWebUpdateDownloadError
    Left = 304
    Top = 24
  end
end
