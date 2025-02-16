cchcp 65001
echo off
setlocal EnableDelayedExpansion

cd %~dp0/../Classic/Images
set "root=%CD%"
GOTO MAKE_LIST_AND_MENU

:MAKE_LIST_AND_MENU

pushd "%folder%"
set /a id=0

for /f "delims=" %%a in ('dir /b') do (
  set /a id=!id! + 1
  if exist "%%a\" (
    set "item!id!=FOLDER"
	set "item!id!cont=%%a"
    set "list=!list!^"%%a^^"/ "
  ) else (
    set "item!id!=FILE"
	set "item!id!cont=%%~na"
	set "item!id!exte=%%~xa"
    set "list=!list!^"%%~na^^" "
  )
)

popd
if (!list! == NUL) (GOTO EOL0) else (GOTO MENU)

:MENU
set "pathto=%CD%"
cls
echo.
echo (CLASSIC) MAC OS SYSTEM SELECTOR
echo ================================
echo.
cd %~dp0
menuhandler 0FF0 !list!
set "erco=%errorlevel%"
if (%erco% == 0) (GOTO EOL1)
set "selitem=!item%erco%!"
set "selitemcont=!item%erco%cont!"
set "selitemexta=!item%erco%exte!"
if %selitem% == FOLDER (GOTO FOLDER)
if %selitem% == FILE (GOTO FILE)
GOTO EOL

:FOLDER
cd %root%
cd %selitemcont%
set "list="
GOTO MAKE_LIST_AND_MENU

:FILE
if %selitemexta% == .img (GOTO RUN)
GOTO EOL

:EOL0
echo. 
echo ERROR: Please add a disk image/s to Classic/Images.
echo.
goto EOL

:EOL1
echo. 
echo ERROR: Something went wrong showing the menu. Please check the message 2 lines
echo above and search for it on Google.
echo.
goto EOL

:RUN
cd %~dp0/../Classic/Emulator/
cls
echo.
echo (CLASSIC) MAC OS SYSTEM SELECTOR
echo ================================
echo.
set "list="
pushd "%folder%"
set /a id=0

for /f "delims=" %%a in ('dir /b') do (
  set /a id=!id! + 1
  if exist "%%a\" (
    set "item!id!=FOLDER"
	set "item!id!cont=%%a"
    set "list=!list!^"%%a^^"/ "
  ) else (
    echo>nul
  )
)

popd
if (!list! == NUL) (GOTO EOL0) else (GOTO MENU2)

:MENU2
cls
echo.
echo (CLASSIC) MAC OS SYSTEM SELECTOR
echo ================================
echo.
cd %~dp0
menuhandler 0FF0 !list!
set "runcont=%selitemcont%"
set "selitemcont=!item%erco%cont!"
cd %~dp0/../Classic/Emulator/
MacOS_Launcher.bat %selitemcont% "%pathto%\%runcont%%selitemexta%"

:EOL
endlocal