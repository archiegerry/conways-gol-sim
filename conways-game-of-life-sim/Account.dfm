object frmAccount: TfrmAccount
  Left = 0
  Top = 0
  Caption = 'ACCOUNT'
  ClientHeight = 416
  ClientWidth = 753
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblLoad: TLabel
    Left = 68
    Top = 124
    Width = 221
    Height = 20
    Caption = 'CHOOSE A SAVE TO LOAD:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Reference Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object user: TStaticText
    Left = 28
    Top = 24
    Width = 80
    Height = 39
    Caption = 'stock'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -29
    Font.Name = 'MS Reference Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object btnLogout: TButton
    Left = 592
    Top = 336
    Width = 137
    Height = 57
    Caption = 'LOG OUT'
    TabOrder = 1
    OnClick = btnLogoutClick
  end
  object btnBack: TButton
    Left = 440
    Top = 336
    Width = 137
    Height = 57
    Caption = 'BACK'
    TabOrder = 2
    OnClick = btnBackClick
  end
  object boxLoad: TComboBox
    Left = 308
    Top = 123
    Width = 365
    Height = 21
    TabOrder = 3
    OnChange = boxLoadChange
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\44749\Desktop\Stuff\Old laptop stuff\Work\Comp' +
        'uting\drive-download-20190909T100908Z-001\Saves Database.db'
      'DriverID=SQLite')
    Left = 664
    Top = 16
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    Left = 720
    Top = 16
  end
end
