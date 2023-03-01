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

kishin := 0
yuki := 0
yaksha := 0
bb := 0
vow := 0
ninetail := 0

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
run:=1
While run { ;right 333,left 331, up 328, down 336
    ImageSearch, MeX, MeY, 6, 32, 385, 176, Resources\me.png
    if (ErrorLevel = 0){
        ; TrayTip, Your location %MeX%x%MeY%, 2
        if (a_tickcount > kishin) {
            pressedKey(33,50)
            kishin := a_tickcount + 60000 ;set cooldown
            sleep 500
        }
         if (a_tickcount > yuki) {
            pressedKey(22,50)
            yuki := a_tickcount + 75000 ;set cooldown
            sleep 500
        }
        if (a_tickcount > yaksha) {
            pressedKey(20,50)
            yaksha := a_tickcount + 35000 ;set cooldown
            sleep 500
        }
        if (a_tickcount > bb) {
            pressedKey(21,50)
            bb := a_tickcount + 180000 ;set cooldown
            sleep 500
        }
        if (a_tickcount > ninetail) {
            pressedKey(38,50)
            ninetail := a_tickcount + 180000 ;set cooldown
            sleep 500
        }
        if (MeX >= 45 && MeX <= 65) && (MeY >= 142 && MeY <= 153){
            pressedKey(333,10)
            pressedKey(45,150)
            pressedKey(45,150)
            pressedKey(45,150)
            pressedKey(45,150)
            AHI.SendKeyEvent(keyboardId, 333, 1)
            AHI.SendKeyEvent(keyboardId, 32, 1)
        }
        if (MeX >= 64 && MeX < 85) && (MeY >= 142 && MeY <= 155){
            AHI.SendKeyEvent(keyboardId, 333, 0)
            AHI.SendKeyEvent(keyboardId, 32, 0)
            pressedKey(45,150)
            pressedKey(45,150)
            pressedKey(45,150)
            pressedKey(45,150)
            pressedKey(331,100)
            pressedKey(45,150)
            pressedKey(45,150)
            pressedKey(45,150)
            pressedKey(45,150)
            AHI.SendKeyEvent(keyboardId, 333, 1)
            AHI.SendKeyEvent(keyboardId, 32, 1)
            
        }
        if (MeX >= 84 && MeX < 117) && (MeY >= 142 && MeY <= 155){
            AHI.SendKeyEvent(keyboardId, 333, 0) 
            AHI.SendKeyEvent(keyboardId, 32, 0)
            pressedKey(45,150)
            pressedKey(45,150)
            pressedKey(45,150)
            pressedKey(45,150)
            pressedKey(331,100)
            pressedKey(45,150)
            pressedKey(45,150)
            pressedKey(45,150)
            pressedKey(45,150)
            AHI.SendKeyEvent(keyboardId, 333, 1)
            AHI.SendKeyEvent(keyboardId, 32, 1)
        }
        if (MeX >= 116 && < 135) && (MeY >= 142 && MeY <= 153){
            AHI.SendKeyEvent(keyboardId, 333, 0)
            AHI.SendKeyEvent(keyboardId, 32, 0)t
            AHI.SendKeyEvent(keyboardId, 331, 0)
            AHI.SendKeyEvent(keyboardId, 32, 0)
            AHI.SendKeyEvent(keyboardId, 328, 1)
            AHI.SendKeyEvent(keyboardId, 32, 1)
        } 
        if (MeX >= 135) && (MeY >= 142 && MeY <= 153){
            pressedKey(45,150)
            pressedKey(45,150)
            pressedKey(45,150)
            pressedKey(45,150)
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