My JoyToKey Configuration and Explanation
============================

This document explains to the best of my ability the syntax and values for a JoyToKey config profile, as well as explaining button aliases, templates, and more! I haven't seen any documentation on how this works on the JoyToKey website, or anywhere else on the internet. So I took it upon myself to figure out as much as I can about the configs and templates, and made a config to use for VS Code. This experience helped me to learn the JoyToKey program as well as VS Code keybinds.

See `VS_Code.cfg` to learn more about my actual config for using VS code with EVERY keyboard shortcut I need, using only one gamepad (and also speech to text software because it's rather difficult to type using a controller.) There is a bit more explanation in the file.

 See https://lilyspeech.com to learn how you can download a simple software that can turn your voice into text! I find it highly useful all over the place.

See `dualsense_final.png` for a visual guide to all the shortcuts I have mapped out.

See `key_mappings.md` for a table of hex values the program uses to map buttons to keys on the keyboard.

For example you'd see something like this: `11:46:0:0` which means `Ctrl+F`

See `button_alias.txt` for information about how you can combine buttons to map to more keybinds, and `button_mapping.png` for how you can find that menu in the program. If you use button aliases, a new block of code will appear at the bottom of your config, with simple numbers representing the index values shown in `button_alias.txt`.

The `kill_joy.ps1` is just a simple powershell script to kill the program if it is active, and to turn it on if it is inactive. I moved the JoyToKey folder to my Documents folder, so adjust the path in the script to your needs. I used it for testing purposes because the default close command just moves it to system tray. You can also terminate the program by going to system tray/taskbar (depending on your preference), right click on the icon, and either press X on keyboard or click Terminate. On that note, if you are at the desktop, you can press Tab 3 times and then Enter to see the extra system tray icons, navigate to the icon, press Shift+F10 (same thing as right click) and then press X to terminate it.

Button Configuration
-------------------
The button configuration line is usually divided into these parts:

*   `ButtonXX` = `ID`, `keybinds`, `msec`, `analog thresholds`, `auto repeat rate`, `toggle key press`, `analog acceleration`, `delay before auto repeat`, `mouse buttons`, `mouse wheel rotation X axis`

    *   `ID` = identifier to know this is multi-keyboard (7), identifier for the switch mode (8)
    *   `keybinds` = keybinds (up to 4)
    *   `msec` = used for double tap or long press functions
    *   `analog thresholds` = analog thresholds for sticks
    *   `auto repeat rate` = number of inputs per second (auto repeat only)
    *   `toggle key press` = unknown
    *   `analog acceleration` = unknown
    *   `delay before auto repeat` = unknown
    *   `mouse buttons` = mouse buttons (4 and 5)
    *   `mouse wheel rotation X axis` = mouse wheel rotation X axis

Example of a Button Configuration
--------------------------------
`Button22=7, 8, 300, 11:4B:0:0, 11:4F:0:0, 0:0:0:0, 0:0:0:0, 95, 100, 0.000, 0, 0, 500, 0`


    7,          # an identifier to know this is multi-keyboard
    8,          # identifier for the switch mode
    300,        # msec, used for double tap or long press functions
    11:4B:0:0,  # keybinds (refer to key_mappings)
    11:4F:0:0,  # keybinds (up to 4 keys per button)
    0:0:0:0,    # keybinds (up to 4 inputs per multi-key function)
    0:0:0:0,    # keybinds (all 0 means None)
    95,         # analog thresholds for sticks
    100,        # analog thresholds for sticks
    0.000,      # number of inputs per second (auto repeat only)
    0,          # toggle button on/off (0 or 1)
    0,          # unknown
    500,        # msec, used for multi key hold input 
    0           # unknown

I had to find out some of these things with trial and error. Also not all the values have been figured out as you can see above with button mappings. They likely are used for special cases that I just don't use.

Axes (sticks)
-------------
Axis = Analog stick.
- 1n, 1p = Left stick, n=left, p=right
- 2n, 2p = Left stick, n=up, p=down
- 3n, 3p = Right stick, n=left, p=right
- 4n, 4p = Right stick, n=up, p=down


And remember this coordinate system for mouse movement: -X=left, +X=right, -Y=up, +Y=down

The axes configuration line is usually divided into these parts:

*   `AxesX` = `ID`, `keybinds`, `msec`, `analog thresholds`, `auto repeat rate`, `toggle key press`, `analog acceleration`, `delay before auto repeat`, `mouse buttons`, `mouse wheel rotation X axis`

    *   `ID` = identifier to know this is stick functions (1, 2, 3, 4,)
    *   `keybinds` = keybinds (up to 4)
    *   `msec` = used for double tap or long press functions
    *   `analog thresholds` = analog thresholds for sticks
    *   `auto repeat rate` = number of inputs per second (auto repeat only)
    *   `toggle key press` = unknown
    *   `analog acceleration` = unknown
    *   `delay before auto repeat` = unknown
    *   `mouse buttons` = mouse buttons (4 and 5)
    *   `mouse wheel rotation X axis` = mouse wheel rotation X axis (left: -10, right: 10)

Example of an Axis Configuration
--------------------------------

`Axis1n=2, 0, 0, 0, 1, 0, 0, 0.000, 0, 95, 1.0, 100, 0, 0, 0, 0`

    Axis1n = stick 1 left
    2        # mouse functions
    0, 0     # mouse movement (X,Y), usually -50 or 50, to indicate speed
    0        # mouse wheel rotation Y axis (simulating mouse wheel scroll)
    1, 0, 0  # mouse click (left, middle, right) so this means left click
    0.000    # auto repeat: 20 clicks per sec, -20 = one click per 20 sec
    0        # Toggle key press (0 or 1)
    95       # lower analog threshold (in %)
    1.0      # Acceleration towards 100% input
    100      # upper analog threshold
    0        # msec to delay auto-repeat
    0, 0     # mouse buttons 4 and 5
    0        # mouse wheel rotation X axis (simulate horizontal scroll)


Special Modes
--------------
You can activate an external program or even a url link with a button! You can also paste text, or activate the SHIFT function, which switches to a second profile when the button is held down, allowing for many more button mappings.

`Button32=9, "C:\Program Files\VideoLAN\VLC\vlc.exe", |||`

    9 = special mode
    "path/to/executable/file"
    no parameters

`Button33=10, ##Hello World!\nThis is me.`

    10 = text mode
    ##text with no parentheses, escape characters in use (\n means new line)

`Axis4n=5, 1, 200`

    Axis4n = stick 2 up
    5 = special mode (SHIFT mode) in this case shift to Joystick 2 config
    1 = activate with delay (1 or 0)
    200 = msec delay

The SHIFT function can be configured to switch to any Joystick configurations you have made. In fact you can even have more than one SHIFT button that switches to different configurations if you want to. The possibilities are truly endless.

I hope you find at least some of this information useful. This has been a tough but satisfying journey for me. I learned a lot about JoyToKey, keyboard mapping, gamepad mapping, and keyboard shortcuts. And I can even use this same profile to browse the web or browse File explorer, with no need for any mouse or keyboard. You can become more productive in coding or in browsing by knowing and using keyboard shortcuts. You will find out that the mouse actually sucks. Stop using it so much! :p