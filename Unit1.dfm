object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Check NTP'
  ClientHeight = 202
  ClientWidth = 430
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object btnCheckNTP: TButton
    Left = 8
    Top = 88
    Width = 113
    Height = 25
    Caption = 'Check NTP'
    TabOrder = 0
    OnClick = btnCheckNTPClick
  end
  object edtHost: TEdit
    Left = 8
    Top = 8
    Width = 121
    Height = 21
    TabOrder = 1
    Text = 'localhost'
  end
  object edtPort: TEdit
    Left = 8
    Top = 48
    Width = 121
    Height = 21
    TabOrder = 2
    Text = '123'
  end
  object Memo1: TMemo
    Left = 135
    Top = 8
    Width = 274
    Height = 186
    ScrollBars = ssVertical
    TabOrder = 3
  end
  object IdSNTP1: TIdSNTP
    OnStatus = IdSNTP1Status
    Port = 123
    OnConnected = IdSNTP1Connected
    OnDisconnected = IdSNTP1Disconnected
    Left = 216
    Top = 48
  end
end
