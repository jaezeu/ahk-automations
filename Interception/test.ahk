#SingleInstance force
#Persistent
#include Lib\AutoHotInterception.ahk

stranger := {"Stranger":"people.png", "Buddy":"buddy.png", "Guildmate":"guild.png"}

global AHI := new AutoHotInterception()
keyboardId := AHI.GetKeyboardId(0x445A, 0x1424)

Gui +AlwaysOnTop
Gui Show,w250 h70
Gui Add, Button, x10 y10 w110 h50 gEnable, Enable
Gui Add, Button, x130 y10 w110 h50 gDisable, Disable
Return

F1::Reload    ; to reload script

Enable:
Trigger:=0
CoordMode ,Pixel, Window
Loop {
    for key, value in stranger {
        ImageSearch, StrangerX, StrangerY, 6, 32, 385, 176, Resources\%value%
    if (ErrorLevel = 0)
        TrayTip, %key% has entered your map at location %StrangerX%x%StrangerY% , 1
    else
        TrayTip, Either Icon could not be found or could not conduct search. Error level is %ErrorLevel% 
    Sleep, 1000
    }
} Until Trigger ;check if triggger is true

Disable:
Trigger:=1
Return

GuiClose:
	ExitApp

; AHI.SubscribeKey(keyboardId, GetKeySC("2"), true, Func("KeyEvent"))
; ctrlCode := GetKeySC("Ctrl")
; AHI.SendKeyEvent(keyboardId, ctrlCode, 1)

; cm1 := AHI.CreateContextManager(keyboardId)
; return

; KeyEvent(state){
; 	static ctrlCode := GetKeySC("Ctrl")
; 	global keyboardId
; 	AHI.SendKeyEvent(keyboardId, ctrlCode, state)
; 	ToolTip % "State: " state
; }

; #if cm1.IsActive
; ::aaa::JACKPOT
; 1:: 
; 	ToolTip % "KEY DOWN EVENT @ " A_TickCount
; 	return
	
; 1 up::
; 	ToolTip % "KEY UP EVENT @ " A_TickCount
; 	return