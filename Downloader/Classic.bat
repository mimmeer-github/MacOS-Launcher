cchcp 65001
echo off & setlocal EnableDelayedExpansion
cls
echo.
echo MAC OS EMULATOR LAUNCHER
echo ========================
echo.
set maincd=%1\
set condition0=%2
set ver=%2.x
IF %1 == 128K (set emu=Mini vMac) ELSE (set emu=other)
IF %1 == 512Ke (set emu=Mini vMac & set "notice=NOTICE: The emulator may not launch properly without you compiling Mini vMac YOURSELF (or finding it online).") ELSE (set emu=other)
echo Press any key to start...
echo.
echo DEBUG INFO
echo ==========
echo MacOS version: %ver%
echo Emulator Version: 36.40
echo Emulating Macintosh: %1 using %emu%
echo %notice%
pause>nul
cls
echo.
echo MAC OS EMULATOR LAUNCHER
echo ========================
echo.
echo The emulator is now trying to start...
echo.
echo HELP
echo ====
echo.
echo Press [CTRL] (Control) to open the **Control Menu**. The following shortcuts need you to be holding [CTRL]:
echo.
echo A - About: Displays version and Mini vMac Copyright information.
echo O - Open: Open a different disk image.
echo Q - Quit: Quit the program (after pressing [CTRL] + [Y])
echo S - Speed control: Change the speed of the emulated processor.
echo M - Magnify toggle: Toggle the virtual display size between 2x and 1x.
echo F - Full screen toggle: Toggles fullscreen mode.
echo K - emulated 'control' Key toggle: Toggles the virtual Mac's CTRL key.
echo R - Reset: Resets the virtual Mac.
echo I - Interrupt: Uses the virual Mac's interrupt button.
echo P - copy variation oPtions: Copies to your clipboard, options describing the variation of Mini vMac.
"%~dp0%maincd%emu.exe" %condition0%
set erlvl=%ERRORLEVEL%
echo.
echo MacOS quit, ending the session...
choice /c yn /m "Did you encounter any errors playing?"
if %ERRORLEVEL% == 2 (GOTO EOL) else (GOTO ERROR)

:ERROR
echo.
echo TROUBLESHOOTING
echo ===============
echo.
echo Base knowledge:
echo The first parameter is the Macintosh you want to emulate, the second one is your MacOS version.
echo I will show these as "1st parameter", "{1st parameter}", "2nd parameter" and "{2nd parameter}" respectively.
echo.
echo Q. My emulator isn't being found.
echo A. If Windows showed "The system cannot find the path specified." or Mini vMac said "Open failed I could not open the disk
echo image.", that probably means you haven't set up the directory structure right^^! You can use this directory
echo structure (compatible with the script):
echo .
echo ├───Emulator
echo │   └───// Your Emulator Folders Here (uses the 1st parameter)...
echo ├───openMac.bat
echo └───MacOS{2nd parameter}.img
echo A2. The emulator folder has to be set out like this:
echo {1st parameter}
echo ├───emu.exe
echo └───// vMac ROM file
echo.
echo Q. My emulator asks for a ROM file^^!
echo A. Mini vMac requires a ROM file to operate. You can search online for information on obtaining a ROM
echo file for your specific vMac emualtor. Be sure to respect copyright laws and only use ROM files you have
echo the right to use.
echo.

:EOL
