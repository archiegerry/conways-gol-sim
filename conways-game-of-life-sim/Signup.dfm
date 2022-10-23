object frmSignup: TfrmSignup
  Left = 0
  Top = 0
  Caption = 'frmSignup'
  ClientHeight = 480
  ClientWidth = 650
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  PixelsPerInch = 96
  TextHeight = 13
  object signup: TLabel
    Left = 264
    Top = 40
    Width = 97
    Height = 29
    Caption = 'SIGN UP'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object staticUser: TLabel
    Left = 36
    Top = 124
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
  object staticEmail: TLabel
    Left = 37
    Top = 172
    Width = 53
    Height = 20
    Caption = 'EMAIL:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object staticEmailRep: TLabel
    Left = 37
    Top = 220
    Width = 121
    Height = 20
    Caption = 'REPEAT EMAIL:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object staticPass: TLabel
    Left = 37
    Top = 268
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
  object staticPassRep: TLabel
    Left = 36
    Top = 319
    Width = 166
    Height = 20
    Caption = 'REPEAT PASSWORD:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object username: TEdit
    Left = 208
    Top = 126
    Width = 313
    Height = 21
    TabOrder = 0
  end
  object email: TEdit
    Left = 208
    Top = 174
    Width = 313
    Height = 21
    TabOrder = 1
  end
  object repeatemail: TEdit
    Left = 208
    Top = 222
    Width = 313
    Height = 21
    TabOrder = 2
  end
  object password: TEdit
    Left = 208
    Top = 270
    Width = 313
    Height = 21
    PasswordChar = '*'
    TabOrder = 3
  end
  object repeatpassword: TEdit
    Left = 208
    Top = 318
    Width = 313
    Height = 21
    PasswordChar = '*'
    TabOrder = 4
  end
  object btnFinish: TButton
    Left = 208
    Top = 384
    Width = 116
    Height = 41
    Caption = 'DONE'
    TabOrder = 5
    OnClick = btnFinishClick
  end
  object showpass: TCheckBox
    Left = 527
    Top = 272
    Width = 106
    Height = 17
    Caption = 'SHOW PASSWORD'
    TabOrder = 6
    OnClick = showpassClick
  end
  object btnBack: TButton
    Left = 365
    Top = 384
    Width = 116
    Height = 41
    Caption = 'BACK'
    TabOrder = 7
    OnClick = btnBackClick
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\44749\Desktop\Stuff\Old laptop stuff\Work\Comp' +
        'uting\drive-download-20190909T100908Z-001\Account Database.db'
      'DriverID=SQLite')
    Left = 568
    Top = 48
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    Left = 520
    Top = 48
  end
end
