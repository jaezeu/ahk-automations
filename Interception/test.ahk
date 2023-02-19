#SingleInstance force
#Persistent
#include Lib\AutoHotInterception.ahk

Gui +AlwaysOnTop
Gui Show,w250 h70
Gui Add, Button, x10 y10 w110 h50 gEnable, Enable
Gui Add, Button, x130 y10 w110 h50 gDisable, Disable
Return

Enable:
Trigger:=0
; Loop{
; 	MouseMove, -5,5,0,R
; 	Sleep, 750
; 	MouseMove 5,-5,0,R
; 	Sleep 750
; } Until Trigger ;check if triggger is true
CoordMode ,Pixel, Window  ;this line is needed
Sleep, 1000
ImageSearch, FoundX, FoundY, 6, 32, 174, 152, Resources\me.png
if (ErrorLevel = 2)
    MsgBox Could not conduct the search.
else if (ErrorLevel = 1)
    MsgBox Icon could not be found on the screen.
else
    MsgBox The icon was found at %FoundX%x%FoundY%.
Return

Disable:
Trigger:=1
Return

GuiClose:
	ExitApp

; global AHI := new AutoHotInterception()

; keyboardId := AHI.GetKeyboardId(0x445A, 0x1424)

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
; #if

; ^Esc::
; 	ExitApp