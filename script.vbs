
Function style_Init()

  ' // provide information about our style

  With style.info
    .format = "display"
    .name = "Cobalt Scripted"
    .description = "A clean, sleek-looking style (powered by VBScript)"
    .version = 0
    .revision = 2
    .icon = style.path & "icon.png"
    .schemes = "Light;Dark"

  End With

End Function

Sub style_Draw()
Dim pbIcon
Dim xEdge
Dim sz
Dim prTitle
Dim prText
Dim lc

Const TITLE_TEXT_GAP = 2
Const MARGIN_SIZE = 20
Const POPUP_WIDTH = 350

  Set prTitle = new_BRect(0,0,0,0)
  Set prText = new_BRect(0,0,0,0)

  With view 
    .SizeTo 350, 78
    Set pbIcon = load_image_obj(style.notification.ValueOf("icon"))
    xEdge = MARGIN_SIZE
    If is_valid_image((pbIcon)) Then _
      xEdge = xEdge + 32 + 10

    If style.notification.ValueOf("title") <> "" Then
      .SetFont "Arial", 9, True   
      .MeasureString style.notification.ValueOf("title"), new_BRect(xEdge, 0, .Width - MARGIN_SIZE, 16384), (prTitle)

    End If

    If style.notification.ValueOf("text") <> "" Then
      .SetFont "Arial", 9
      .MeasureString style.notification.ValueOf("text"), new_BRect(xEdge, 0, .Width - MARGIN_SIZE, 16384), (prText)

    End If

    ' /* final size */

    .SizeTo POPUP_WIDTH, _
            MAX(MARGIN_SIZE + MARGIN_SIZE + TITLE_TEXT_GAP + 32, _
		MARGIN_SIZE + prTitle.Height + TITLE_TEXT_GAP + prText.Height + MARGIN_SIZE)

    ' /* background */

    .EnableSmoothing True
    .TextMode = 4			'// MFX_TEXT_ANTIALIAS

    Select Case style.notification.ValueOf("scheme")
    Case "light"
      .SetHighColour rgba(250, 250, 250)
      .FillRoundRect .Bounds, 4, 4
      .SetHighColour rgba(0, 0, 0, 0)
      .SetLowColour rgba(0, 0, 0, 32)
      .FillRoundRect .Bounds, 4, 4, 3

''                .SetHighColour rgba(255, 255, 255, 190)
''                .StrokeLine new_BRect(8, 1, .Width - 8 - 1, 1)
''                .StrokeLine new_BRect(1, 8, 1, .Height - 8 - 1)

    Case Else
      .SetHighColour rgba(22, 22, 22)
      .FillRoundRect .Bounds, 4, 4
      .SetHighColour rgba(0, 0, 0, 0)
      .SetLowColour rgba(0, 0, 0, 255)
      .FillRoundRect .Bounds, 4, 4, 3

    End Select


    ' /* title */

    .SetFont "Arial", 9, True            
    Select Case style.notification.ValueOf("scheme")
    Case "light"
      .SetHighColour rgba(0, 0, 0)

    Case Else
      .SetHighColour rgba(255, 255, 255)

    End Select

    prTitle.OffsetBy 0, MARGIN_SIZE
    .DrawString style.notification.ValueOf("title"), (prTitle), 0


    ' /* text */

    .SetFont "Arial", 9
    Select Case style.notification.ValueOf("scheme")
    Case "light"
      .SetHighColour rgba(0, 0, 0, 198)

    Case Else
      .SetHighColour rgba(255, 255, 255, 198)

    End Select

    prText.OffsetBy 0, MARGIN_SIZE + prTitle.Height + TITLE_TEXT_GAP
    .DrawString style.notification.ValueOf("text"), (prText), 0


    ' /* R2.6: background tint */

    If style.notification.exists("colour-tint") then
      lc = string_as_long(style.notification.valueof("colour-tint"))
      .SetHighColour rgba(get_red(lc), get_green(lc), get_blue(lc), 32)
      .FillRect .Bounds

    End If


    ' /* icon */
    .DrawScaledImage (pbIcon), new_BPoint(MARGIN_SIZE, MARGIN_SIZE), new_BPoint(32, 32)


    ' /* priority */

    If string_as_long(style.notification.ValueOf("priority")) > 0 Then
      .SetHighColour rgba(236, 59, 0, 220)
      .SetPenSize 2
      .StrokeRect .Bounds

    End If


  End With

End Sub