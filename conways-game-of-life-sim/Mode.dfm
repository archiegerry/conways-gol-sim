object frmMode: TfrmMode
  Left = 0
  Top = 0
  Caption = 'MODE'
  ClientHeight = 248
  ClientWidth = 855
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btnNormal: TButton
    Left = 8
    Top = 8
    Width = 145
    Height = 65
    Caption = 'NORMAL'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = btnNormalClick
  end
  object btnHigh: TButton
    Left = 8
    Top = 88
    Width = 145
    Height = 65
    Caption = 'HIGHLIFE'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = btnHighClick
  end
  object btnCustom: TButton
    Left = 8
    Top = 168
    Width = 145
    Height = 65
    Caption = 'CUSTOM'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = btnCustomClick
  end
  object info1: TStaticText
    Left = 200
    Top = 32
    Width = 372
    Height = 24
    Caption = 'Vanilla version of the classic: Conway'#39's Game of Life'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object info2: TStaticText
    Left = 200
    Top = 104
    Width = 625
    Height = 24
    Caption = 
      'For advanced players with a different ruleset: a cell is born wh' +
      'en it has 3 or 6 neighbours.'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
  object info3: TStaticText
    Left = 200
    Top = 192
    Width = 387
    Height = 24
    Caption = 'Custom mode where players can make their own rules!'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
  end
end
