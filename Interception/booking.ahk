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

global AHI := new AutoHotInterception()
global keyboardId := AHI.GetKeyboardId(0x445A, 0x1424)

F1::
Reload:
Reload

GuiClose:
ExitApp

F2::
Start:
run:=1
While run {
    ImageSearch, loginbtnX, loginbtnY, 0, 0, 3440, 1440, Resources\booking\loginBtn.jpg
    if (ErrorLevel = 0){
        ; TrayTip, Your location %loginbtnX%x%loginbtnY%, 2
        MsgBox Test.
    }
    sleep 1000
}

F3::
Stop:
run:=0
Return