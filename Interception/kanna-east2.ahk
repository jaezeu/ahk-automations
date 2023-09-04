; <COMPILER: v1.1.33.10>
#include Lib\AutoHotInterception.ahk
#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%\Assets
FileCreateDir,%A_ScriptDir%\Assets

global AHI := new AutoHotInterception()
FileInstall,me.png,%A_ScriptDir%\Assets\me.png,1
FileInstall,rune.png,%A_ScriptDir%\Assets\rune.png,1
FileInstall,violetta.png,%A_ScriptDir%\Assets\violetta.png,1
FileInstall,violettaalarm.mp3,%A_ScriptDir%\Assets\violettaalarm.mp3,1
FileInstall,alarm.mp3,%A_ScriptDir%\Assets\alarm.mp3,1
FileInstall,alarm2.mp3,%A_ScriptDir%\Assets\alarm2.mp3,1
FileInstall,buddy.png,%A_ScriptDir%\Assets\buddy.png,1
FileInstall,guild.png,%A_ScriptDir%\Assets\guild.png,1
FileInstall,people.png,%A_ScriptDir%\Assets\people.png,1
FileInstall,Polo.png,%A_ScriptDir%\Assets\polo.png,1
FileInstall,frito.png,%A_ScriptDir%\Assets\frito.png,1
FileInstall,Especia.png,%A_ScriptDir%\Assets\Especia.png,1
#SingleInstance, force
#InstallKeybdHook
#MaxThreadsPerHotkey 1
CoordMode, Pixel, Client
gui, +Alwaysontop
gui, color, BCE954
gui, show, x25 y600 w210 h240 NoActivate,
gui, font, s8
gui, add, groupbox, x5 y5 h90 w200, Controls
gui, add, groupbox, x5 y100 h75 w200, KeyboardID
gui, font, s15
gui, add, button, w140 h24 x35 y15 gReload1, Reload
gui, add, text, x30 y40, F3 =
gui, add, button, w100 h24 x85 y40 gStart1 vStart1, Start
gui, add, text, x30 y65, F4 =
gui, add, button, w100 h24 x85 y65 gPause1 vPause1 , Pause
gui, add, radio, x10 y115 ghid1 vhid1, 1
gui, add, radio, x49 y115 ghid2 vhid2, 2
gui, add, radio, x88 y115 ghid3 vhid3 , 3
gui, add, radio, x127 y115 ghid4 vhid4, 4
gui, add, radio, x166 y115 ghid5 vhid5, 5
gui, add, radio, x10 y145 ghid6 vhid6, 6
gui, add, radio, x49 y145 ghid7 vhid7, 7
gui, add, radio, x88 y145 ghid8 vhid8 , 8
gui, add, radio, x127 y145 ghid9 vhid9, 9
gui, add, radio, x166 y145 ghid10 vhid10, 10
gui, add, checkbox, x65 y180 galarms checked, Alarm
Gui, add, text, x57 y210 c0000A0, MapleSEA
global hid := 1
gosub, alarms
Iniread, hid, Map.ini, KeyboardID, ID
if(hid = 1) {
    gosub, hid1
} else if(hid = 2) {
    gosub, hid2
} else if(hid = 3) {
    gosub, hid3
} else if(hid = 4) {
    gosub, hid4
} else if(hid = 5) {
    gosub, hid5
} else if(hid = 6) {
    gosub, hid6
} else if(hid = 7) {
    gosub, hid7
} else if(hid = 8) {
    gosub, hid8
} else if(hid = 9) {
    gosub, hid9
} else if(hid = 10) {
    gosub, hid10
}
return
hid1:
    hid := 1
    Iniwrite, %hid% , Map.ini, KeyboardID, ID
    guicontrol,,hid1, 1
return
hid2:
    hid := 2
    Iniwrite, %hid% , Map.ini, KeyboardID, ID
    guicontrol,,hid2, 1
return
hid3:
    hid := 3
    Iniwrite, %hid% , Map.ini, KeyboardID, ID
    guicontrol,,hid3, 1
return
hid4:
    hid := 4
    Iniwrite, %hid% , Map.ini, KeyboardID, ID
    guicontrol,,hid4, 1
return
hid5:
    hid := 5
    Iniwrite, %hid% , Map.ini, KeyboardID, ID
    guicontrol,,hid5, 1
return
hid6:
    hid := 6
    Iniwrite, %hid% , Map.ini, KeyboardID, ID
    guicontrol,,hid6, 1
return
hid7:
    hid := 7
    Iniwrite, %hid% , Map.ini, KeyboardID, ID
    guicontrol,,hid7, 1
return
hid8:
    hid := 8
    Iniwrite, %hid% , Map.ini, KeyboardID, ID
    guicontrol,,hid8, 1
return
hid9:
    hid := 9
    Iniwrite, %hid% , Map.ini, KeyboardID, ID
    guicontrol,,hid9, 1
return
hid10:
    hid := 10
    Iniwrite, %hid% , Map.ini, KeyboardID, ID
    guicontrol,,hid10, 1
return
guiclose:
ExitApp
return
Start1:
    atk()
return
Pause1:
    Loop, 0xFF
    {
        Key := Format("VK{:02X}",A_Index)
        IF GetKeyState(Key)
            Send, {%Key% Up}
    }
    Pause ,,1
    if A_IsPaused
    {
        TrayTip, `t, BOT HAS PAUSED
        guicontrol, text , Pause1 , Resume
    }
    else
    {
        TrayTip, `t, BOT HAS RESUMED
        guicontrol, text , Pause1 , Pause
    }
return
Reload1:
    Reload
return
f4::
    Loop, 0xFF
    {
        Key := Format("VK{:02X}",A_Index)
        IF GetKeyState(Key)
            Send, {%Key% Up}
    }
    Pause ,,1
    if A_IsPaused
    {
        TrayTip, `t, BOT HAS PAUSED
        guicontrol, text , Pause1 , Resume
    }
    else
    {
        TrayTip, `t, BOT HAS RESUMED
        guicontrol, text , Pause1 , Pause
    }
return
f3::
    atk() {
        global
        guicontrol, text , Pause1 , Pause
        guicontrol, text , Start1 , Started
        pause, off
        LeftX := 82
        RightX := 160
        boss := true
        spider()
        yuki()
        domain := true
        haku()
        ninetail()
        sengoku()
        kishin()
        shower := true
        SetTimer, pet,-300000
        loop{
            ImageSearch,vX,vY,1,1,1920,1080, *1 me.png
            while (vX > (RightX-10) && Errorlevel = 0) {
                AHI.Instance.SendKeyEvent(HID, GetKeySC("Left"), 1)
                AHI.Instance.SendKeyEvent(HID, GetKeySC("d"), 1)
                sleep 100
                AHI.Instance.SendKeyEvent(HID, GetKeySC("Space"), 1)
                AHI.Instance.SendKeyEvent(HID, GetKeySC("Space"), 0)
                sleep 100
                loop 3 {
                    random, ran, 20,68
                    AHI.Instance.SendKeyEvent(HID, GetKeySC("x"), 1)
                    AHI.Instance.SendKeyEvent(HID, GetKeySC("x"), 0)
                    sleep %ran%
                }
                sleep 400
                ImageSearch,vX,vY,1,1,1920,1080, *1 me.png
            }
            if (domain) {
                AHI.Instance.SendKeyEvent(HID, GetKeySC("d"), 0)
                AHI.Instance.SendKeyEvent(HID, GetKeySC("Left"), 0)
                sleep 100
                loop 4 {
                    random, ran, 88,115
                    AHI.Instance.SendKeyEvent(HID, GetKeySC("0"), 1)
                    sleep %ran%
                    AHI.Instance.SendKeyEvent(HID, GetKeySC("0"), 0)
                }
                sleep 500
                domain := false
                SetTimer, domain, -188000
            }
            ImageSearch,vX,vY,1,1,1920,1080, *1 me.png
            while (vX > LeftX && Errorlevel = 0) {
                AHI.Instance.SendKeyEvent(HID, GetKeySC("Left"), 1)
                AHI.Instance.SendKeyEvent(HID, GetKeySC("d"), 1)
                sleep 100
                AHI.Instance.SendKeyEvent(HID, GetKeySC("Space"), 1)
                AHI.Instance.SendKeyEvent(HID, GetKeySC("Space"), 0)
                sleep 100
                loop 3 {
                    random, ran, 20,68
                    AHI.Instance.SendKeyEvent(HID, GetKeySC("x"), 1)
                    AHI.Instance.SendKeyEvent(HID, GetKeySC("x"), 0)
                    sleep %ran%
                }
                sleep 400
                ImageSearch,vX,vY,1,1,1920,1080, *1 me.png
            }
            AHI.Instance.SendKeyEvent(HID, GetKeySC("d"), 0)
            AHI.Instance.SendKeyEvent(HID, GetKeySC("Left"), 0)
            sleep 100
            ImageSearch,vX,vY,1,1,1920,1080, *1 me.png
            if(Errorlevel = 1) {
                AHI.Instance.SendKeyEvent(HID, GetKeySC("Right"), 1)
                sleep 800
                AHI.Instance.SendKeyEvent(HID, GetKeySC("Right"), 0)
            }
            ImageSearch,vX,vY,1,1,1920,1080, *1 me.png
            vX2 := vX + 1
            While(vX < vX2 && Errorlevel = 0) {
                AHI.Instance.SendKeyEvent(HID, GetKeySC("Right"), 1)
                sleep 25
                ImageSearch,vX,vY,1,1,1920,1080, *1 me.png
            }
            ImageSearch,vX,vY,1,1,1920,1080, *1 me.png
            while (vX < 75 && Errorlevel = 0) {
                AHI.Instance.SendKeyEvent(HID, GetKeySC("Right"), 1)
                sleep 25
                ImageSearch,vX,vY,1,1,1920,1080, *1 me.png
            }
            AHI.Instance.SendKeyEvent(HID, GetKeySC("Right"), 0)
            AHI.Instance.SendKeyEvent(HID, GetKeySC("Shift"), 1)
            AHI.Instance.SendKeyEvent(HID, GetKeySC("Shift"), 0)
            ; ImageSearch,vX,vY,1,1,1920,1080, *1 me.png
            ; if (vX > 77 && vX < 85) {
            ;     while vX > 77 {
            ;         AHI.Instance.SendKeyEvent(HID, GetKeySC("Right"), 1)
            ;         sleep 25
            ;         ImageSearch,vX,vY,1,1,1920,1080, *1 me.png
            ;     }
            ;     AHI.Instance.SendKeyEvent(HID, GetKeySC("Right"), 0)
            ; }
            loop 3 {
                random, ran, 20,68
                AHI.Instance.SendKeyEvent(HID, GetKeySC("x"), 1)
                AHI.Instance.SendKeyEvent(HID, GetKeySC("x"), 0)
                sleep %ran%
            }
            sleep 300
            ImageSearch,vX,vY,1,1,1920,1080, *1 me.png
            while (vY > 115 && Errorlevel = 0) {
                AHI.Instance.SendKeyEvent(HID, GetKeySC("Up"), 1)
                sleep 50
                AHI.Instance.SendKeyEvent(HID, GetKeySC("d"), 1)
                AHI.Instance.SendKeyEvent(HID, GetKeySC("d"), 0)
                sleep 250
                ImageSearch,vX,vY,1,1,1920,1080, *1 me.png
            }
            AHI.Instance.SendKeyEvent(HID, GetKeySC("Up"), 0)
            sleep 100
            if(shower) {
                sleep 300
                AHI.Instance.SendKeyEvent(HID, GetKeySC("Down"), 1)
                sleep 50
                loop 3 {
                    random, ran, 88,115
                    AHI.Instance.SendKeyEvent(HID, GetKeySC("F8"), 1)
                    sleep %ran%
                    random, ran, 88,115
                    AHI.Instance.SendKeyEvent(HID, GetKeySC("F8"), 0)
                    sleep %ran%
                }
                AHI.Instance.SendKeyEvent(HID, GetKeySC("Down"), 0)
                sleep 600
                shower := false
                SetTimer, shower, -60000
            } else {
                loop 3 {
                    random, ran, 88,115
                    AHI.Instance.SendKeyEvent(HID, GetKeySC("v"), 1)
                    sleep %ran%
                    AHI.Instance.SendKeyEvent(HID, GetKeySC("v"), 0)
                }
                sleep 900
            }
            ImageSearch,vX,vY,1,1,1920,1080, *1 me.png
            while (vY > 90 && Errorlevel = 0) {
                AHI.Instance.SendKeyEvent(HID, GetKeySC("Space"), 1)
                AHI.Instance.SendKeyEvent(HID, GetKeySC("Space"), 0)
                AHI.Instance.SendKeyEvent(HID, GetKeySC("Up"), 1)
                sleep 50
                AHI.Instance.SendKeyEvent(HID, GetKeySC("d"), 1)
                AHI.Instance.SendKeyEvent(HID, GetKeySC("d"), 0)
                sleep 250
                ImageSearch,vX,vY,1,1,1920,1080, *1 me.png
            }
            AHI.Instance.SendKeyEvent(HID, GetKeySC("Up"), 0)
            AHI.Instance.SendKeyEvent(HID, GetKeySC("Shift"), 1)
            AHI.Instance.SendKeyEvent(HID, GetKeySC("Shift"), 0)
            loop 3 {
                random, ran, 20,68
                AHI.Instance.SendKeyEvent(HID, GetKeySC("x"), 1)
                AHI.Instance.SendKeyEvent(HID, GetKeySC("x"), 0)
                sleep %ran%
            }
            sleep 300
            ImageSearch,vX,vY,1,1,1920,1080, *1 me.png
            while (vX < (RightX - 20) && Errorlevel = 0) {
                AHI.Instance.SendKeyEvent(HID, GetKeySC("Right"), 1)
                AHI.Instance.SendKeyEvent(HID, GetKeySC("d"), 1)
                sleep 100
                AHI.Instance.SendKeyEvent(HID, GetKeySC("Space"), 1)
                AHI.Instance.SendKeyEvent(HID, GetKeySC("Space"), 0)
                sleep 100
                loop 3 {
                    random, ran, 20,68
                    AHI.Instance.SendKeyEvent(HID, GetKeySC("x"), 1)
                    AHI.Instance.SendKeyEvent(HID, GetKeySC("x"), 0)
                    sleep %ran%
                }
                sleep 400
                ImageSearch,vX,vY,1,1,1920,1080, *1 me.png
                while (vY < 82 && Errorlevel = 0) {
                    AHI.Instance.SendKeyEvent(HID, GetKeySC("Right"), 0)
                    AHI.Instance.SendKeyEvent(HID, GetKeySC("d"), 0)
                    AHI.Instance.SendKeyEvent(HID, GetKeySC("Down"), 1)
                    sleep 50
                    AHI.Instance.SendKeyEvent(HID, GetKeySC("d"), 1)
                    AHI.Instance.SendKeyEvent(HID, GetKeySC("d"), 0)
                    sleep 250
                    AHI.Instance.SendKeyEvent(HID, GetKeySC("Down"), 0)
                    ImageSearch,vX,vY,1,1,1920,1080, *1 me.png
                }
                ImageSearch,vX,vY,1,1,1920,1080, *1 me.png
            }
            ImageSearch,vX,vY,1,1,1920,1080, *1 me.png
            while (vX < RightX && Errorlevel = 0) {
                AHI.Instance.SendKeyEvent(HID, GetKeySC("Right"), 1)
                AHI.Instance.SendKeyEvent(HID, GetKeySC("d"), 1)
                sleep 100
                loop 3 {
                    random, ran, 20,68
                    AHI.Instance.SendKeyEvent(HID, GetKeySC("x"), 1)
                    AHI.Instance.SendKeyEvent(HID, GetKeySC("x"), 0)
                    sleep %ran%
                }
                sleep 375
                ImageSearch,vX,vY,1,1,1920,1080, *1 me.png
            }
            AHI.Instance.SendKeyEvent(HID, GetKeySC("Right"), 0)
            AHI.Instance.SendKeyEvent(HID, GetKeySC("d"), 0)
            AHI.Instance.SendKeyEvent(HID, GetKeySC("Shift"), 1)
            AHI.Instance.SendKeyEvent(HID, GetKeySC("Shift"), 0)
            loop 3 {
                random, ran, 20,68
                AHI.Instance.SendKeyEvent(HID, GetKeySC("x"), 1)
                AHI.Instance.SendKeyEvent(HID, GetKeySC("x"), 0)
                sleep %ran%
            }
            sleep 300
            ImageSearch,vX,vY,1,1,1920,1080, *1 me.png
            while (vY < 90 && Errorlevel = 0) {
                AHI.Instance.SendKeyEvent(HID, GetKeySC("Down"), 1)
                sleep 50
                AHI.Instance.SendKeyEvent(HID, GetKeySC("Space"), 1)
                AHI.Instance.SendKeyEvent(HID, GetKeySC("Space"), 0)
                sleep 250
                ImageSearch,vX,vY,1,1,1920,1080, *1 me.png
            }
            if(boss) {
                AHI.Instance.SendKeyEvent(HID, GetKeySC("Down"), 0)
                sleep 100
                ImageSearch,vX,vY,1,1,1920,1080, *1 me.png
                vX2 := vX - 1
                while(vX > vX2 && Errorlevel = 0) {
                    AHI.Instance.SendKeyEvent(HID, GetKeySC("Left"), 1)
                    sleep 25
                    ImageSearch,vX,vY,1,1,1920,1080, *1 me.png
                }
                AHI.Instance.SendKeyEvent(HID, GetKeySC("Left"), 0)
                sleep 100
                loop 4 {
                    random, ran, 88,115
                    AHI.Instance.SendKeyEvent(HID, GetKeySC("t"), 1)
                    sleep %ran%
                    AHI.Instance.SendKeyEvent(HID, GetKeySC("t"), 0)
                }
                sleep 500
                boss := false
                SetTimer, boss, -30000
            }
            ImageSearch,vX,vY,1,1,1920,1080, *1 me.png
            while (vY < 110 && Errorlevel = 0) {
                AHI.Instance.SendKeyEvent(HID, GetKeySC("Down"), 1)
                sleep 50
                AHI.Instance.SendKeyEvent(HID, GetKeySC("d"), 1)
                AHI.Instance.SendKeyEvent(HID, GetKeySC("d"), 0)
                sleep 250
                ImageSearch,vX,vY,1,1,1920,1080, *1 me.png
            }
            AHI.Instance.SendKeyEvent(HID, GetKeySC("Down"), 0)
            sleep 100
            AHI.Instance.SendKeyEvent(HID, GetKeySC("Shift"), 1)
            AHI.Instance.SendKeyEvent(HID, GetKeySC("Shift"), 0)
            loop 3 {
                random, ran, 20,68
                AHI.Instance.SendKeyEvent(HID, GetKeySC("x"), 1)
                AHI.Instance.SendKeyEvent(HID, GetKeySC("x"), 0)
                sleep %ran%
            }
            sleep 300
            ; ImageSearch,vX,vY,1,1,1920,1080, *1 me.png
            ; if(Errorlevel = 1) {
            ;     AHI.Instance.SendKeyEvent(HID, GetKeySC("Left"), 1)
            ;     sleep 800
            ;     AHI.Instance.SendKeyEvent(HID, GetKeySC("Left"), 0)
            ; }
            ; sleep 1000
        }
        return
    }
pet:
    pet()
return
pet() {
    Loop, 0xFF
    {
        Key := Format("VK{:02X}",A_Index)
        IF GetKeyState(Key)
            Send, {%Key% Up}
    }
    sleep 500
    loop 3 {
        AHI.Instance.SendKeyEvent(HID, GetKeySC("Ins"), 1)
        AHI.Instance.SendKeyEvent(HID, GetKeySC("Ins"), 0)
        sleep 700
    }
    SetTimer, pet, -600000
}
shower:
    shower := true
return
domain:
    domain := true
return
boss:
    boss := true
return
spider:
    spider()
return
spider() {
    Loop, 0xFF
    {
        Key := Format("VK{:02X}",A_Index)
        IF GetKeyState(Key)
            Send, {%Key% Up}
    }
    sleep 800
    loop 4 {
        random, ran, 66,95
        AHI.Instance.SendKeyEvent(HID, GetKeySC("Alt"), 1)
        sleep %ran%
        AHI.Instance.SendKeyEvent(HID, GetKeySC("Alt"), 0)
        sleep %ran%
    }
    sleep 500
    SetTimer, seren, -50000
}
seren:
    seren()
return
seren() {
    Loop, 0xFF
    {
        Key := Format("VK{:02X}",A_Index)
        IF GetKeyState(Key)
            Send, {%Key% Up}
    }
    sleep 800
    loop 4 {
        random, ran, 66,95
        AHI.Instance.SendKeyEvent(HID, GetKeySC("Ctrl"), 1)
        sleep %ran%
        AHI.Instance.SendKeyEvent(HID, GetKeySC("Ctrl"), 0)
        sleep %ran%
    }
    sleep 500
    SetTimer, spider, -190000
}
yuki:
    yuki()
return
yuki() {
    Loop, 0xFF
    {
        Key := Format("VK{:02X}",A_Index)
        IF GetKeyState(Key)
            Send, {%Key% Up}
    }
    sleep 800
    loop 4 {
        random, ran, 80, 105
        AHI.Instance.SendKeyEvent(HID, GetKeySC("u"), 1)
        sleep %ran%
        AHI.Instance.SendKeyEvent(HID, GetKeySC("u"), 0)
        sleep %ran%
    }
    sleep 500
    SetTimer, yuki, -72000
}
loot:
    loot := true
return
haku:
    haku()
return
haku() {
    Loop, 0xFF
    {
        Key := Format("VK{:02X}",A_Index)
        IF GetKeyState(Key)
            Send, {%Key% Up}
    }
    sleep 800
    loop 4 {
        random, ran, 80, 105
        AHI.Instance.SendKeyEvent(HID, GetKeySC("8"), 1)
        sleep %ran%
        AHI.Instance.SendKeyEvent(HID, GetKeySC("8"), 0)
        sleep %ran%
    }
    sleep 500
    SetTimer, haku, -450000
}
ninetail:
    ninetail()
return
ninetail() {
    Loop, 0xFF
    {
        Key := Format("VK{:02X}",A_Index)
        IF GetKeyState(Key)
            Send, {%Key% Up}
    }
    sleep 800
    loop 4 {
        random, ran, 80, 105
        AHI.Instance.SendKeyEvent(HID, GetKeySC("l"), 1)
        sleep %ran%
        AHI.Instance.SendKeyEvent(HID, GetKeySC("l"), 0)
        sleep %ran%
    }
    sleep 300
    AHI.Instance.SendKeyEvent(HID, GetKeySC("Shift"), 1)
    AHI.Instance.SendKeyEvent(HID, GetKeySC("Shift"), 0)
    SetTimer, ninetail, -171000
}
sengoku:
    sengoku()
return
sengoku() {
    Loop, 0xFF
    {
        Key := Format("VK{:02X}",A_Index)
        IF GetKeyState(Key)
            Send, {%Key% Up}
    }
    sleep 800
    loop 4 {
        random, ran, 80, 105
        AHI.Instance.SendKeyEvent(HID, GetKeySC("["), 1)
        sleep %ran%
        AHI.Instance.SendKeyEvent(HID, GetKeySC("["), 0)
        sleep %ran%
    }
    sleep 500
    SetTimer, sengoku, -114000
}
kishin:
    kishin()
return
kishin() {
    Loop, 0xFF
    {
        Key := Format("VK{:02X}",A_Index)
        IF GetKeyState(Key)
            Send, {%Key% Up}
    }
    sleep 800
    loop 4 {
        random, ran, 80, 105
        AHI.Instance.SendKeyEvent(HID, GetKeySC("f"), 1)
        sleep %ran%
        AHI.Instance.SendKeyEvent(HID, GetKeySC("f"), 0)
        sleep %ran%
    }
    sleep 500
    SetTimer, kishin, -57000
}
alarms:
    if(alarms) {
        SetTimer, rune, off
        SetTimer, violetta, off
        alarms := false
    } else {
        violetta()
        rune()
        alarms := true
    }
return
rune:
    rune()
return
rune() {
    ImageSearch,RuneX,RuneY,1,1,1920,1080, *1 rune.png
    if(Errorlevel = 0) {
        TrayTip, `t, Rune Spawned
        SoundPlay, alarm.mp3
    }
    SetTimer, rune, -15000
}
violetta:
    violetta()
return
violetta() {
    ImageSearch,RuneX,RuneY,1,1,1920,1080, *1 guild.png
    if(Errorlevel = 0) {
        TrayTip, `t, Guildie Entered Map
        SoundPlay, alarm2.mp3
    }
    ImageSearch,RuneX,RuneY,1,1,1920,1080, *1 people.png
    if(Errorlevel = 0) {
        TrayTip, `t, Stranger Entered Map
        SoundPlay, alarm2.mp3
    }
    ImageSearch,RuneX,RuneY,1,1,1920,1080, *1 buddy.png
    if(Errorlevel = 0) {
        TrayTip, `t, Buddy Entered Map
        SoundPlay, alarm2.mp3
    }
    ImageSearch,RuneX,RuneY,1,1,1920,1080, *25 Especia.png
    if(Errorlevel = 0) {
        AHI.Instance.SendKeyEvent(HID, GetKeySC("Esc"), 1)
        sleep %ran%
        AHI.Instance.SendKeyEvent(HID, GetKeySC("Esc"), 0)
    }
    ImageSearch,RuneX,RuneY,1,1,1920,1080, *25 polo.png
    if(Errorlevel = 0) {
        AHI.Instance.SendKeyEvent(HID, GetKeySC("Esc"), 1)
        sleep %ran%
        AHI.Instance.SendKeyEvent(HID, GetKeySC("Esc"), 0)
    }
    ImageSearch,RuneX,RuneY,1,1,1920,1080, *25 frito.png
    if(Errorlevel = 0) {
        AHI.Instance.SendKeyEvent(HID, GetKeySC("Esc"), 1)
        sleep %ran%
        AHI.Instance.SendKeyEvent(HID, GetKeySC("Esc"), 0)
    }
    ImageSearch,RuneX,RuneY,1,1,1920,1080, *1 violetta.png
    if(Errorlevel = 0) {
        TrayTip, `t, Violetta alert
        SoundPlay, violettaalarm.mp3
        SetTimer, violetta, -15000
    } else {
        SetTimer, violetta, -5000
    }
}