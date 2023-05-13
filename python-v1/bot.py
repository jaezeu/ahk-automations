import pyautogui
import time
# from pynput.keyboard import Key, Controller
import keyboard

# keyboard = Controller()


def active_window():
    '''
    Make maplestory the active window
    '''
    print("Finding MapleStory Window...")

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

if __name__ == '__main__':
    active_window() # Activates maplestory window
    maple_window_box = get_window_coordinates()
    hours = 3600
    loops = 0
    toggle_buffs()
    time.sleep(2)
    mobbing()