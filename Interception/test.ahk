#SingleInstance force
#Persistent
#include Lib\AutoHotInterception.ahk

CoordMode ,Pixel, Window
Gui +AlwaysOnTop
Gui Show,w250 h70
Gui Add, Button, x10 y10 w110 h50 gEnable, Enable
Gui Add, Button, x130 y10 w110 h50 gDisable, Disable
kishinInitialCooldown := 0
yukiInitialCooldown := 0
yakshaInitialCooldown := 0
bbInitialCooldown := 0
vowInitialCooldown := 0
ninetailInitialCooldown := 0
Return

global AHI := new AutoHotInterception()
keyboardId := AHI.GetKeyboardId(0x445A, 0x1424)

F1::Reload    ; to reload script

F2::
Enable:
Trigger:=0
SetTimer, checkIntruder , 4000 ;Check map for people every 4 seconds
settimer,checkKishin,2000 ;check every 2 seconds
settimer,checkYuki,2000 ;check every 2 seconds
settimer,checkYaksha,2000 ;check every 2 seconds
settimer,checkBigBoss,2000 ;check every 2 seconds
settimer,checkPrincessVow,2000 ;check every 2 seconds
settimer,checkNineTail,2000 ;check every 2 seconds
Loop {
    ImageSearch, MeX, MeY, 6, 32, 385, 176, Resources\me.png
    if (ErrorLevel = 0){
        TrayTip, Your location %MeX%x%MeY%, 2
    }
} Until Trigger ;check if triggger is true

checkIntruder:
stranger := {"Stranger":"people.png", "Buddy":"buddy.png", "Guildmate":"guild.png"}
for key, value in stranger {
        ImageSearch, StrangerX, StrangerY, 6, 32, 385, 176, Resources\%value%
    if (ErrorLevel = 0)
        TrayTip, %key% has entered your map at location, 2
    Sleep 3000
}
Return


; Below this is for checking summons/buffs

checkKishin:
if (a_tickcount > kishinInitialCooldown) {
    send {f down}
    sleep 50
    send {f up}
    kishinInitialCooldown := a_tickcount + 60000 ;set cooldown
}
return

checkYuki:
if (a_tickcount > yukiInitialCooldown) {
    send {u down}
    sleep 50
    send {u up}
    yukiInitialCooldown := a_tickcount + 75000 ;set cooldown
}
return

checkYaksha:
if (a_tickcount > yakshaInitialCooldown) {
    send {t down}
    sleep 50
    send {t up}
    yakshaInitialCooldown := a_tickcount + 35000 ;set cooldown
}
return

checkBigBoss:
if (a_tickcount > bbInitialCooldown) {
    send {y down}
    sleep 50
    send {y up}
    bbInitialCooldown := a_tickcount + 180000 ;set cooldown
}
return

checkPrincessVow:
if (a_tickcount > vowInitialCooldown) {
    send {o down}
    sleep 50
    send {o up}
    vowInitialCooldown := a_tickcount + 120000 ;set cooldown
}
return

checkNineTail:
if (a_tickcount > ninetailInitialCooldown) {
    send {l down}
    sleep 50
    send {l up}
    ninetailInitialCooldown := a_tickcount + 180000 ;set cooldown
}
return


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