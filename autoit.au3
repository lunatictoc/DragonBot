Global $Paused
Global $Start
Global $Jeux = String("Flight Rising")
HotKeySet("{PAUSE}", "TogglePause")
HotKeySet("{ESC}", "Terminate")
HotKeySet("{F6}", "Start")
Global $courtMinTime = 25 ;;25ms
Global $courtMaxTime = 75 ;;75ms
Global $longMinTime = 1000;;
Global $longMaxTime = 2000;;
Global $lootColor = 0xA5A094
Global $noneColor = 0xFFFFFF
Global $dragonCheckColor = 0x00AEFF ;;3000,811
Global $flee = 0xA5A5A5

;;;; Body of program would go here;;;;
While 1
    Sleep(100)
WEnd
;;;;;;;;

Func Start()
	$Start = NOT $Start
	;;ToolTip('Script dans la fonction Start',0,0)
	While $Start

   ;;ToolTip("check " & $check ,0,0)

$couleur = PixelGetColor(3016,829)
	ToolTip("couleur " & Hex($couleur,6) ,0,0)
   if Hex($couleur,6) == Hex($noneColor,6) Then ;;Fight on apparait on continue !
	  SendAttack()
   ElseIf Hex($couleur,6) == Hex($lootColor,6) Then ;;Fight on apparait on continue !
	  MouseClick("Left",3194,843,1,0)
   ElseIf Hex($couleur,6) == hex($dragonCheckColor) Then
		$test = PixelGetColor(3000,811)
	  if hex($dragonCheckColor) == Hex($test,6)  Then
		$Start = Not $Start
	  EndIf
   ElseIf hex($couleur,6) == Hex($flee,6) Then
	  MouseClick("Left",2898,765,1,0)
   EndIf

	WEnd
	ToolTip("")
 EndFunc


Func SendAttack();; Random wait avec attack A F E E W Q
	RandomWait(1)
	ControlSend($Jeux,"","","A")
	RandomWait(1)
  RandomWait(1)
	ControlSend($Jeux,"","","F")
	RandomWait(1)
	ControlSend($Jeux,"","","E")
	RandomWait(1)
	ControlSend($Jeux,"","","E")
	RandomWait(1)
	ControlSend($Jeux,"","","W")
	RandomWait(1)
	ControlSend($Jeux,"","","Q")
	RandomWait(1)
EndFunc
Func RandomWait($court = 0);;Random timer pour entre les touche
	if($court == 1) Then
		$waitingtime = Random($courtMinTime, $courtMaxTime,1)
	Else
		$waitingtime = Random($longMinTime, $longMaxTime,1)
	EndIf

	Sleep($waitingtime)

EndFunc


Func TogglePause()
    $Paused = NOT $Paused
    While $Paused
        sleep(100)
        ToolTip('Script is "Paused"',0,0)
    WEnd
    ToolTip("")
EndFunc

Func Terminate()
    Exit 0
EndFunc
