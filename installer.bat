@echo off
@title xInWin Installer

:: Intro

echo Welcome to the xInWin Installer
echo.
echo xInWin converts some Bash commands into Batch commands, allowing you to use Bash without virtualization.
echo.

pause

:: Create xInWin folder to %PROGRAMFILES%

md "%PROGRAMFILES%\xInWin"
set xiw="%PROGRAMFILES\xInWin%"
set wd=%cd%

:: Download commands

cd %xiw%

:: Delete older directory

if exist commands (
    del commands
    rd commands
)

:: Make directory

md commands
cd commands

curl -O https://raw.githubusercontent.com/srcatarr/xInWin/main/commands/clear.bat
curl -O https://raw.githubusercontent.com/srcatarr/xInWin/main/commands/export.bat
curl -O https://raw.githubusercontent.com/srcatarr/xInWin/main/commands/grep.bat
curl -O https://raw.githubusercontent.com/srcatarr/xInWin/main/commands/ls.bat
curl -O https://raw.githubusercontent.com/srcatarr/xInWin/main/commands/mkdir.bat
curl -O https://raw.githubusercontent.com/srcatarr/xInWin/main/commands/rm.bat
curl -O https://raw.githubusercontent.com/srcatarr/xInWin/main/commands/touch.bat

cd %wd%

:: Download readme

curl -O https://raw.githubusercontent.com/srcatarr/xInWin/main/readme.txt

:: Save to path

setx path "%PATH%;%xiw%\commands"

:: Outro

echo xInWin installed.

