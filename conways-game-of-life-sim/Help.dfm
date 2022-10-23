object frmHelp: TfrmHelp
  Left = 0
  Top = 0
  Caption = 'HELP'
  ClientHeight = 441
  ClientWidth = 711
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  PixelsPerInch = 96
  TextHeight = 13
  object title: TStaticText
    Left = 24
    Top = 24
    Width = 136
    Height = 33
    Caption = 'HELP PAGE'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'MS Reference Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object btnBack: TButton
    Left = 584
    Top = 376
    Width = 107
    Height = 49
    Caption = 'BACK'
    TabOrder = 1
    OnClick = btnBackClick
  end
  object btnGroup: TGroupBox
    Left = 56
    Top = 78
    Width = 593
    Height = 275
    Caption = 'INDEX'
    TabOrder = 2
    object BitBtn1: TBitBtn
      Left = 16
      Top = 48
      Width = 105
      Height = 49
      Caption = 'CLICK ME'
      TabOrder = 0
    end
    object BitBtn2: TBitBtn
      Left = 16
      Top = 122
      Width = 105
      Height = 45
      Caption = 'CLICK ME'
      TabOrder = 1
    end
    object BitBtn3: TBitBtn
      Left = 16
      Top = 192
      Width = 105
      Height = 49
      Caption = 'CLICK ME'
      TabOrder = 2
    end
    object BitBtn4: TBitBtn
      Left = 280
      Top = 48
      Width = 105
      Height = 49
      Caption = 'CLICK ME'
      TabOrder = 3
    end
    object BitBtn5: TBitBtn
      Left = 280
      Top = 120
      Width = 105
      Height = 49
      Caption = 'CLICK ME'
      TabOrder = 4
    end
    object BitBtn6: TBitBtn
      Left = 280
      Top = 192
      Width = 105
      Height = 49
      Caption = 'CLICK ME'
      TabOrder = 5
    end
    object txt1: TStaticText
      Left = 136
      Top = 64
      Width = 124
      Height = 17
      Caption = 'What does the game do?'
      TabOrder = 6
    end
    object txt2: TStaticText
      Left = 136
      Top = 136
      Width = 137
      Height = 17
      Caption = 'How do I access the game?'
      TabOrder = 7
    end
    object txt3: TStaticText
      Left = 136
      Top = 200
      Width = 124
      Height = 25
      Caption = 'What features does this software have?'
      TabOrder = 8
    end
    object txt4: TStaticText
      Left = 408
      Top = 64
      Width = 136
      Height = 17
      Caption = 'Why is this game important?'
      TabOrder = 9
    end
    object txt5: TStaticText
      Left = 408
      Top = 136
      Width = 122
      Height = 17
      Caption = 'How do I play the game?'
      TabOrder = 10
    end
    object txt6: TStaticText
      Left = 408
      Top = 208
      Width = 114
      Height = 17
      Caption = 'How is my data stored?'
      TabOrder = 11
    end
  end
end
