@echo off

if "%1"=="" (
    cmd/k echo xInWin CLI, write --help for more information.
    exit -b 0
)

if %1==--help (
    echo Usage:
    echo.
    echo --update           Update xInWin
    echo --uninstall        Uninstall xInWin
    echo --readme           Open readme file
    echo --run              Run one Bash file
    echo.
) else (
    if %1==--update (
        curl https://raw.githubusercontent.com/srcatarr/xInWin/main/installer.bat>>"%PROGRAMFILES%\xInWin\installer.bat"
        "%PROGRAMFILES%\xInWin\installer.bat"
    ) else (
        if %1==--uninstall (
            del "%PROGRAMFILES%\xInWin\commands"
            rd "%PROGRAMFILES%\xInWin\commands"
            del "%PROGRAMFILES%\xInWin"
            rd "%PROGRAMFILES%\xInWin"
            echo xInWin successfully uninstalled.
        ) else (
            if %1==--readme (
                start https://github.com/srcatarr/xInWin#readme
            ) else (
                if %1==--run (
                    powershell %2
                ) else (
                    echo Could not find a command registered that meets `%1`
                    echo.
                )
            )
        )
    )
)
