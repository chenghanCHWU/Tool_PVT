object Frm_PVT: TFrm_PVT
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Frm_PVT'
  ClientHeight = 1080
  ClientWidth = 1920
  Color = clBackground
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 960
    Top = 540
    Width = 30
    Height = 50
    Caption = '+'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHighlightText
    Font.Height = -40
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object TA_shape: TShape
    Left = 664
    Top = 488
    Width = 180
    Height = 160
    Brush.Color = clSilver
    Shape = stCircle
    Visible = False
  end
  object TA_showTimer: TTimer
    Enabled = False
    OnTimer = TA_showTimerTimer
    Left = 320
  end
end
