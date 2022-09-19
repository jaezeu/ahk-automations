import pyautogui
import time
# from pynput.keyboard import Key, Controller
import keyboard

# keyboard = Controller()


def active_window():
    '''
    Make maplestory the active window
    '''
    print("Finding MapleLegends Window...")

    try:
        maple_window = pyautogui.getWindowsWithTitle("MapleStory")[0]
        print("MapleStory Window Found...")
    except:
        print("Cannot Find MapleStory Window... Program Terminating")
        exit(1)

    if maple_window.isActive == False:
        pyautogui.click("taskbaricon.PNG")

    pyautogui.click(maple_window.box)
    print("MapleStory Windows open successful")
    

def get_window_coordinates():
    maple_window = pyautogui.getWindowsWithTitle("MapleStory")[0]
    return maple_window.box


def toggle_buffs():
        #pyautogui.press("delete") # Magic guard
        #time.sleep(2)
        buff1 = "7"
        buff2 = "8"
        keyboard.send(buff1)
        time.sleep(1)
        keyboard.send(buff2)

def player_teleport():
    keyboard.press("left+d")
    time.sleep(0.1)
    keyboard.release("left")

def mobbing():
    while True:
        #reached middle 
        keyboard.press("c")
        time.sleep(0.2)
        keyboard.release("c")
        time.sleep(0.5)
        keyboard.press("h")
        time.sleep(0.2)
        keyboard.release("h")
        time.sleep(0.2)

        #reach bottom right
        keyboard.press("x")
        time.sleep(0.2)
        keyboard.release("x")
        time.sleep(0.2)
        keyboard.press("x")
        time.sleep(0.1)
        keyboard.release("x")
        time.sleep(0.2)
    
        keyboard.press("t")
        time.sleep(0.1)
        keyboard.release("t")
        time.sleep(0.2)
        keyboard.press("y")
        time.sleep(0.1)
        keyboard.release("y")
        time.sleep(0.2)
        keyboard.press("x")
        time.sleep(0.1)
        keyboard.release("x")
        time.sleep(0.2)

        keyboard.press("j")
        time.sleep(0.1)
        keyboard.release("j")
        time.sleep(0.1)

        keyboard.press("f")
        time.sleep(0.1)
        keyboard.release("f")
        time.sleep(0.1)

        keyboard.press("k")
        time.sleep(0.1)
        keyboard.release("k")
        time.sleep(0.1)


        keyboard.press("l")
        time.sleep(0.1)
        keyboard.release("l")
        time.sleep(0.1)


        keyboard.press("home")
        time.sleep(0.1)
        keyboard.release("home")
        time.sleep(0.1)

        keyboard.press("end")
        time.sleep(0.1)
        keyboard.release("end")
        time.sleep(0.1)


    


if __name__ == '__main__':
    active_window() # Activates maplestory window
    maple_window_box = get_window_coordinates()
    hours = 3600
    loops = 0
    toggle_buffs()
    time.sleep(2)
    mobbing()