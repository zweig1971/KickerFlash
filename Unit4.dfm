object Form4: TForm4
  Left = 413
  Top = 299
  Width = 553
  Height = 490
  AutoSize = True
  Caption = 'Read Command Stat.-Register'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 545
    Height = 392
    BevelInner = bvLowered
    TabOrder = 0
    object Label1: TLabel
      Left = 25
      Top = 228
      Width = 20
      Height = 16
      Caption = 'Bin'
    end
    object Label2: TLabel
      Left = 161
      Top = 125
      Width = 23
      Height = 16
      Caption = 'Hex'
    end
    object Label3: TLabel
      Left = 162
      Top = 20
      Width = 25
      Height = 16
      Caption = 'Dec'
    end
    object Label4: TLabel
      Left = 265
      Top = 292
      Width = 18
      Height = 16
      Caption = 'D0'
    end
    object D0_Shape: TShape
      Left = 311
      Top = 28
      Width = 14
      Height = 13
      Shape = stCircle
    end
    object Label5: TLabel
      Left = 327
      Top = 26
      Width = 126
      Height = 16
      Caption = 'D0 :Failsave loaded'
    end
    object Label6: TLabel
      Left = 327
      Top = 42
      Width = 102
      Height = 16
      Caption = 'D1 :User loaded'
    end
    object D1_Shape: TShape
      Left = 311
      Top = 44
      Width = 14
      Height = 13
      Shape = stCircle
    end
    object D2_Shape: TShape
      Left = 311
      Top = 59
      Width = 14
      Height = 13
      Shape = stCircle
    end
    object Label7: TLabel
      Left = 327
      Top = 57
      Width = 165
      Height = 16
      Caption = 'D2 :LW-Adress not written'
    end
    object D3_Shape: TShape
      Left = 311
      Top = 75
      Width = 14
      Height = 13
      Shape = stCircle
    end
    object Label8: TLabel
      Left = 327
      Top = 73
      Width = 166
      Height = 16
      Caption = 'D3 :HW-Adress not written'
    end
    object D4_Shape: TShape
      Left = 312
      Top = 97
      Width = 14
      Height = 13
      Shape = stCircle
    end
    object Label9: TLabel
      Left = 328
      Top = 95
      Width = 90
      Height = 16
      Caption = 'D4 :Undefined'
    end
    object D5_Shape: TShape
      Left = 312
      Top = 113
      Width = 14
      Height = 13
      Shape = stCircle
    end
    object Label10: TLabel
      Left = 328
      Top = 111
      Width = 90
      Height = 16
      Caption = 'D5 :Undefined'
    end
    object D6_Shape: TShape
      Left = 312
      Top = 128
      Width = 14
      Height = 13
      Shape = stCircle
    end
    object Label11: TLabel
      Left = 328
      Top = 126
      Width = 97
      Height = 16
      Caption = 'D6 :FiFo empty'
    end
    object D7_Shape: TShape
      Left = 312
      Top = 144
      Width = 14
      Height = 13
      Shape = stCircle
    end
    object Label12: TLabel
      Left = 328
      Top = 142
      Width = 101
      Height = 16
      Caption = 'D7 :FiFo not full'
    end
    object D8_Shape: TShape
      Left = 312
      Top = 167
      Width = 14
      Height = 13
      Shape = stCircle
    end
    object Label13: TLabel
      Left = 328
      Top = 165
      Width = 145
      Height = 16
      Caption = 'D8 :Prog. not complete'
    end
    object D9_Shape: TShape
      Left = 312
      Top = 183
      Width = 14
      Height = 13
      Shape = stCircle
    end
    object Label14: TLabel
      Left = 328
      Top = 181
      Width = 90
      Height = 16
      Caption = 'D9 :Undefined'
    end
    object D10_Shape: TShape
      Left = 312
      Top = 198
      Width = 14
      Height = 13
      Shape = stCircle
    end
    object Label15: TLabel
      Left = 328
      Top = 196
      Width = 94
      Height = 16
      Caption = 'D10:Undefined'
    end
    object D11_Shape: TShape
      Left = 312
      Top = 214
      Width = 14
      Height = 13
      Shape = stCircle
    end
    object Label16: TLabel
      Left = 328
      Top = 212
      Width = 139
      Height = 16
      Caption = 'D11:Read FiFo empty'
    end
    object D12_Shape: TShape
      Left = 313
      Top = 235
      Width = 14
      Height = 13
      Shape = stCircle
    end
    object Label17: TLabel
      Left = 329
      Top = 233
      Width = 143
      Height = 16
      Caption = 'D12:Read FiFo not full'
    end
    object D13_Shape: TShape
      Left = 313
      Top = 251
      Width = 14
      Height = 13
      Shape = stCircle
    end
    object Label18: TLabel
      Left = 329
      Top = 249
      Width = 192
      Height = 17
      Caption = 'D13:U-Flash rd. data not valid'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object D14_Shape: TShape
      Left = 313
      Top = 266
      Width = 14
      Height = 13
      Shape = stCircle
    end
    object Label19: TLabel
      Left = 329
      Top = 264
      Width = 204
      Height = 16
      Caption = 'D14:Erase User-Flash not ready'
    end
    object D15_Shape: TShape
      Left = 313
      Top = 282
      Width = 14
      Height = 13
      Shape = stCircle
    end
    object Label20: TLabel
      Left = 329
      Top = 280
      Width = 108
      Height = 16
      Caption = 'D15:Reload User'
    end
    object RdStatRegButton: TButton
      Left = 176
      Top = 344
      Width = 161
      Height = 41
      Caption = 'Read Status-Reg'
      TabOrder = 0
      OnClick = RdStatRegButtonClick
    end
    object StatusRegOutBinPanel: TPanel
      Left = 25
      Top = 244
      Width = 257
      Height = 49
      BevelInner = bvLowered
      BevelOuter = bvSpace
      Caption = '-'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object StatusRegOutHexPanel: TPanel
      Left = 160
      Top = 141
      Width = 113
      Height = 49
      BevelInner = bvLowered
      Caption = '-'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object StatusRegOutDecPanel: TPanel
      Left = 160
      Top = 37
      Width = 113
      Height = 49
      BevelInner = bvLowered
      Caption = '-'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
  end
  object ExitButton: TButton
    Left = 424
    Top = 399
    Width = 121
    Height = 57
    Caption = 'EXIT'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = ExitButtonClick
  end
end
