object Form7: TForm7
  Left = 620
  Top = 227
  Width = 313
  Height = 491
  AutoSize = True
  Caption = 'IFK ausw�hlen'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object TPanel
    Left = 0
    Top = 0
    Width = 305
    Height = 417
    BevelInner = bvLowered
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 77
      Top = 19
      Width = 77
      Height = 17
      Caption = 'IFKs Count '
    end
    object Label2: TLabel
      Left = 9
      Top = 52
      Width = 75
      Height = 17
      Caption = 'IFKs Found'
    end
    object Button_UPDATE: TButton
      Left = 6
      Top = 369
      Width = 113
      Height = 25
      Caption = 'U P D A T E'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = Button_UPDATEClick
    end
    object Panel2: TPanel
      Left = 161
      Top = 16
      Width = 56
      Height = 25
      BevelInner = bvLowered
      Caption = '1'
      TabOrder = 1
    end
    object ListBox1: TListBox
      Left = 8
      Top = 72
      Width = 289
      Height = 270
      ItemHeight = 17
      MultiSelect = True
      TabOrder = 2
    end
    object Button_selall: TButton
      Left = 237
      Top = 352
      Width = 61
      Height = 22
      Caption = 'sel all'
      TabOrder = 3
      OnClick = Button_selallClick
    end
    object Button_diselall: TButton
      Left = 237
      Top = 384
      Width = 61
      Height = 22
      Caption = 'disel all'
      TabOrder = 4
      OnClick = Button_diselallClick
    end
  end
  object Button_OK: TButton
    Left = 223
    Top = 424
    Width = 81
    Height = 33
    Caption = 'OK'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = Button_OKClick
  end
end
