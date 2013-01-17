object Form2: TForm2
  Left = 334
  Top = 314
  Width = 657
  Height = 452
  AutoSize = True
  Caption = 'Kicker/Interface Flasher'
  Color = clBtnFace
  DefaultMonitor = dmPrimary
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -10
  Font.Name = 'Arial'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Button4: TButton
    Left = 544
    Top = 352
    Width = 105
    Height = 46
    Caption = 'EXIT'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = Button4Click
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 649
    Height = 345
    BevelInner = bvLowered
    TabOrder = 1
    object Label1: TLabel
      Left = 256
      Top = 8
      Width = 60
      Height = 18
      Caption = 'Actions :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object ListBox1: TListBox
      Left = 256
      Top = 32
      Width = 377
      Height = 265
      ItemHeight = 13
      TabOrder = 0
    end
    object Button2: TButton
      Left = 560
      Top = 304
      Width = 73
      Height = 25
      Caption = 'CLEAR'
      TabOrder = 1
      OnClick = Button2Click
    end
    object Panel2: TPanel
      Left = 8
      Top = 261
      Width = 233
      Height = 65
      BevelInner = bvLowered
      TabOrder = 2
      object UserSave: TRadioButton
        Left = 8
        Top = 8
        Width = 113
        Height = 22
        Caption = 'UserSave'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object Failsave: TRadioButton
        Left = 8
        Top = 32
        Width = 88
        Height = 30
        Caption = 'FailSave'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object SendUserFailSave: TButton
        Left = 112
        Top = 20
        Width = 105
        Height = 25
        Caption = 'SEND'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnClick = SendUserFailSaveClick
      end
    end
    object Panel3: TPanel
      Left = 8
      Top = 94
      Width = 233
      Height = 163
      BevelInner = bvLowered
      ParentShowHint = False
      ShowHint = False
      TabOrder = 3
      object SpeedButton2: TSpeedButton
        Left = 16
        Top = 62
        Width = 201
        Height = 41
        AllowAllUp = True
        GroupIndex = 2
        Caption = 'VERIFY'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        OnClick = SpeedButton2Click
      end
      object SpeedButton1: TSpeedButton
        Left = 16
        Top = 9
        Width = 201
        Height = 41
        AllowAllUp = True
        GroupIndex = 1
        Caption = 'BURN'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        OnClick = SpeedButton1Click
      end
      object Button1: TButton
        Left = 16
        Top = 112
        Width = 201
        Height = 41
        Caption = 'BURN / VERIFY'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = Button1Click
      end
    end
    object Panel4: TPanel
      Left = 8
      Top = 32
      Width = 233
      Height = 57
      BevelInner = bvLowered
      TabOrder = 4
      object RadioButton1: TRadioButton
        Left = 24
        Top = 8
        Width = 145
        Height = 17
        Caption = 'Kicker Karte'
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = RadioButton1Click
      end
      object RadioButton2: TRadioButton
        Left = 24
        Top = 29
        Width = 153
        Height = 21
        Caption = 'InterFace Karte'
        Checked = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        TabStop = True
        OnClick = RadioButton2Click
      end
    end
  end
  object MainMenu1: TMainMenu
    Left = 8
    Top = 65528
    object D1: TMenuItem
      Caption = 'Datei'
      object Laden1: TMenuItem
        Caption = 'Laden'
        OnClick = Laden1Click
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object Exit1: TMenuItem
        Caption = 'Exit'
      end
    end
    object Option1: TMenuItem
      Caption = 'Option'
      object IFKAuswhlen1: TMenuItem
        Caption = 'Choose IFK / MBK'
        OnClick = IFKAuswhlen1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object ReadCommandoStatReg1: TMenuItem
        Caption = 'Read Commando StatReg'
        OnClick = ReadCommandoStatReg1Click
      end
    end
    object Extra1: TMenuItem
      Caption = 'Extra'
      object ReadFlashSave1: TMenuItem
        Caption = 'Read Flash'
        OnClick = ReadFlashSave1Click
      end
    end
    object Abour1: TMenuItem
      Caption = 'About'
      object Info1: TMenuItem
        Caption = 'Info'
        OnClick = Info1Click
      end
    end
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = 'rbf'
    Filter = 'KickerConfigFileBin [*.rbf]|*.rbf'
    Left = 192
  end
  object SaveDialog1: TSaveDialog
    Filter = 'KickerConfigFileBin [*.rbf]|*.rbf'
    Left = 128
  end
end
