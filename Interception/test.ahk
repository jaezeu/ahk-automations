#SingleInstance force
#Persistent
#include Lib\AutoHotInterception.ahk

;OPTIMIZATIONS START
#NoEnv
#MaxHotkeysPerInterval 99000000
#HotkeyInterval 99000000
#KeyHistory 0
ListLines Off
Process, Priority, , A
SetBatchLines, -1
SetKeyDelay, -1, -1
SetWinDelay, -1
SetControlDelay, -1
;OPTIMIZATIONS END

CoordMode ,Pixel, Window
Gui +AlwaysOnTop
Gui Show,w200 h130
Gui Font, s8 Bold  cBlack
Gui, Color, 0xb53c3c
Gui Add, Text, x25 y18 , F1=
Gui, Add, Button, x50 y10 w120 h30 gReload, Reload
Gui Add, Text, x25 y58 , F2=
Gui, Add, Button, x50 y50 w120 h30 gStart, Start
Gui Add, Text, x25 y98 , F3=
Gui, Add, Button, x50 y90 w120 h30 gStop, Stop

kishinInitialCooldown := 0
yukiInitialCooldown := 0
yakshaInitialCooldown := 0
bbInitialCooldown := 0
vowInitialCooldown := 0
ninetailInitialCooldown := 0

global AHI := new AutoHotInterception()
global keyboardId := AHI.GetKeyboardId(0x445A, 0x1424)

pressedKey(pressed,timedelay){
    AHI.SendKeyEvent(keyboardId, pressed, 1)
	Sleep, timedelay
    AHI.SendKeyEvent(keyboardId, pressed, 0)
}

F1::
Reload:
Reload

GuiClose:
ExitApp

F2::
Start:
; SetTimer, checkIntruder , 5000
SetTimer,checkBuffs,4000
run:=1
While run {
    ImageSearch, MeX, MeY, 6, 32, 385, 176, Resources\me.png
    if (ErrorLevel = 0){
        TrayTip, Your location %MeX%x%MeY%, 2
        if (MeX > 50 && MeX <= 120){
            AHI.SendKeyEvent(keyboardId, 331, 0)
            AHI.SendKeyEvent(keyboardId, 32, 0)
            pressedKey(57,100)
            AHI.SendKeyEvent(keyboardId, 333, 1)
            AHI.SendKeyEvent(keyboardId, 32, 1)
            pressedKey(45,100)
            pressedKey(45,100)
            pressedKey(45,100)
            pressedKey(57,100)
            pressedKey(45,100)
            pressedKey(45,100)
            pressedKey(45,100)
        }
        if (MeX >= 120){
            AHI.SendKeyEvent(keyboardId, 333, 0)
            AHI.SendKeyEvent(keyboardId, 32, 0)
            AHI.SendKeyEvent(keyboardId, 331, 1)
            AHI.SendKeyEvent(keyboardId, 32, 1)
        }
    }
    sleep 1000
}

F3::
Stop:
run:=0
Return

checkIntruder:
stranger := {"Stranger":"people.png", "Buddy":"buddy.png", "Guildmate":"guild.png"}
for key, value in stranger {
        ImageSearch, StrangerX, StrangerY, 6, 32, 385, 176, Resources\%value%
    if (ErrorLevel = 0)
        TrayTip, %key% has entered your map at location, 2
        ; SoundPlay, Resources\alarm2.mp3
}
Return


; Below this is for checking summons/buffs

checkBuffs:
if (a_tickcount > kishinInitialCooldown) {
    send {f down}
    sleep 50
    send {f up}
    kishinInitialCooldown := a_tickcount + 60000 ;set cooldown
    sleep 500
}
if (a_tickcount > yukiInitialCooldown) {
     send {u down}
     sleep 50
     send {u up}
     yukiInitialCooldown := a_tickcount + 75000 ;set cooldown
     sleep 500
 }
 if (a_tickcount > yakshaInitialCooldown) {
     send {t down}
     sleep 50
     send {t up}
     yakshaInitialCooldown := a_tickcount + 35000 ;set cooldown
     sleep 500
 }
 if (a_tickcount > bbInitialCooldown) {
     send {y down}
     sleep 50
     send {y up}
     bbInitialCooldown := a_tickcount + 180000 ;set cooldown
     sleep 500
 }
 if (a_tickcount > ninetailInitialCooldown) {
     send {l down}
     sleep 50
     send {l up}
     ninetailInitialCooldown := a_tickcount + 180000 ;set cooldown
     sleep 500
 }
