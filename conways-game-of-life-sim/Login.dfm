object frmLogin: TfrmLogin
  Left = 0
  Top = 0
  Caption = 'LOGIN'
  ClientHeight = 433
  ClientWidth = 609
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
  object LOGIN: TLabel
    Left = 248
    Top = 48
    Width = 100
    Height = 37
    Caption = 'LOGIN'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object staticUser: TLabel
    Left = 91
    Top = 139
    Width = 96
    Height = 20
    Caption = 'USERNAME:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object staticPass: TLabel
    Left = 91
    Top = 206
    Width = 98
    Height = 20
    Caption = 'PASSWORD:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object prompt: TLabel
    Left = 142
    Top = 352
    Width = 116
    Height = 13
    Caption = 'Don'#39't have an account? '
  end
  object userEntry: TEdit
    Left = 212
    Top = 136
    Width = 281
    Height = 28
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object passEntry: TEdit
    Left = 212
    Top = 203
    Width = 281
    Height = 28
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object btnLogin: TButton
    Left = 129
    Top = 272
    Width = 129
    Height = 33
    Caption = 'LOGIN'
    TabOrder = 2
    OnClick = btnLoginClick
  end
  object btnSignup: TButton
    Left = 280
    Top = 343
    Width = 129
    Height = 33
    Caption = 'SIGN UP'
    TabOrder = 3
    OnClick = btnSignupClick
  end
  object btnCancel: TButton
    Left = 320
    Top = 272
    Width = 129
    Height = 33
    Caption = 'BACK'
    TabOrder = 4
    OnClick = btnCancelClick
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\44749\Desktop\Stuff\Old laptop stuff\Work\Comp' +
        'uting\drive-download-20190909T100908Z-001\Account Database.db'
      'DriverID=SQLite')
    Left = 544
    Top = 352
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    Left = 488
    Top = 352
  end
end
