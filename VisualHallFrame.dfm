object frmVisualHall: TfrmVisualHall
  Left = 0
  Top = 0
  Width = 320
  Height = 240
  TabOrder = 0
  object pbDisplay: TPaintBox
    Left = 0
    Top = 0
    Width = 320
    Height = 240
    Align = alClient
    OnMouseDown = pbDisplayMouseDown
    OnMouseMove = pbDisplayMouseMove
    OnMouseUp = pbDisplayMouseUp
    OnPaint = pbDisplayPaint
  end
end
