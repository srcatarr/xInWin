@echo off
@title xInWin Installer

:: Intro

echo Welcome to the xInWin Installer
echo.
echo xInWin converts some Bash commands into Batch commands, allowing you to use Bash without virtualization.
echo.

pause

:: Make directory

md commands
cd commands

:: Create Batch files

echo @echo off>>clear.bat
echo cls>>clear.bat

echo @echo off>>export.bat
echo if "%3"=="" (>>export.bat
echo        set %1=%2>>export.bat
echo ) else (>>export.bat
echo        set %1 %2=%3>>export.bat
echo )>>export.bat

echo @echo off>>grep.bat
echo findstr %3 %2 %1>>grep.bat

echo @echo off>>ls.bat
echo dir %cd%>>ls.bat

echo @echo off>>mkdir.bat
echo md %1>>mkdir.bat

echo @echo off>>rm.bat
echo del %1>>rm.bat

echo @echo off>>touch.bat
echo echo.>>%1

:: Save to path

setx path "%PATH%;%cd%\commands"
