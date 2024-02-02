@echo off

:: Intro

echo Welcome to the xInWin Installer
echo.
echo xInWin converts some Bash commands into Batch commands, allowing you to use Bash without virtualization.
echo.

pause

echo.

:: Create xInWin folder to %PROGRAMFILES%

md "%PROGRAMFILES%\xInWin"
echo.
set xiw="%PROGRAMFILES\xInWin%"
set wd=%cd%

:: Download commands and interpreter

cd %PROGRAMFILES%\xInWin

del interpreter.bat
curl -O https://raw.githubusercontent.com/srcatarr/xInWin/main/interpreter.exe

:: Delete older directory

if exist commands (
    del commands
    rd commands
)

echo.

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
curl -O https://raw.githubusercontent.com/srcatarr/xInWin/main/commands/cat.bat
curl -O https://raw.githubusercontent.com/srcatarr/xInWin/main/commands/chmod.bat
curl -O https://raw.githubusercontent.com/srcatarr/xInWin/main/commands/cp.bat
curl -O https://raw.githubusercontent.com/srcatarr/xInWin/main/commands/less.bat
curl -O https://raw.githubusercontent.com/srcatarr/xInWin/main/commands/mv.bat
curl -O https://raw.githubusercontent.com/srcatarr/xInWin/main/commands/pwd.bat
curl -O https://raw.githubusercontent.com/srcatarr/xInWin/main/commands/sed.bat
curl -O https://raw.githubusercontent.com/srcatarr/xInWin/main/commands/xiw.bat

cd %wd%

:: Download readme

del "%PROGRAMFILES%\xInWin\readme.txt"
curl https://raw.githubusercontent.com/srcatarr/xInWin/main/readme.txt>>"%PROGRAMFILES%\xInWin\readme.txt"
"%PROGRAMFILES%\xInWin\readme.txt"

:: Save to path

setx path "%PATH%;%xiw%\commands"

:: Outro

echo.
echo xInWin installed.
echo.

