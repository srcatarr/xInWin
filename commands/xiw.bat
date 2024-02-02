@echo off

if "%1"=="" (
    cmd /k echo xInWin CLI, type `--help` or `-h` for more information.
    exit -b 0
)

if %1==--help (
    echo.
    echo   xiw: xInWin CLI - Version 0.0.7.3
    echo.
    echo   =========== COMMANDS AND USAGES ============
    echo.
    echo    --update or -up          Update xInWin
    echo    --uninstall or -un       Uninstall xInWin
    echo    --readme or -rm          Open readme file
    echo    --run -r                 Run one Bash file
    echo.
    echo   ============================================
    echo.
    echo   xInWin, licensed under GPL-3.0 license
    echo   You can follow updates in GH repo;
    echo   https://github.com/srcatarr/xInWin
    echo.
) else (
    if %1==--update (
        del "%PROGRAMFILES%\xInWin\installer.bat"
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
                    if "%2"=="" (
                        echo Please enter file name
                        echo.
                    )
                    sh %2
                ) else (
                    if %1==-h (
                        echo.
                        echo   xiw: xInWin CLI - Version 0.0.7.3
                        echo.
                        echo   =========== COMMANDS AND USAGES ============
                        echo.
                        echo    --update or -up          Update xInWin
                        echo    --uninstall or -un       Uninstall xInWin
                        echo    --readme or -rm          Open readme file
                        echo    --run -r                 Run one Bash file
                        echo.
                        echo   ============================================
                        echo.
                        echo   xInWin, licensed under GPL-3.0 license
                        echo   You can follow updates in GH repo;
                        echo   https://github.com/srcatarr/xInWin
                        echo.
                    ) else (
                        if %1==-up (
                            del "%PROGRAMFILES%\xInWin\installer.bat"
                            curl https://raw.githubusercontent.com/srcatarr/xInWin/main/installer.bat>>"%PROGRAMFILES%\xInWin\installer.bat"
                            "%PROGRAMFILES%\xInWin\installer.bat"
                        ) else (
                            if %1==-un (
                                del "%PROGRAMFILES%\xInWin\commands"
                                rd "%PROGRAMFILES%\xInWin\commands"
                                del "%PROGRAMFILES%\xInWin"
                                rd "%PROGRAMFILES%\xInWin"
                                echo xInWin successfully uninstalled.
                            ) else (
                                if %1==-rm (
                                    start https://github.com/srcatarr/xInWin#readme
                                ) else (
                                    if %1==-r (
                                        if "%2"=="" (
                                            echo Please enter file name
                                            echo.
                                        )
                                        sh %2
                                    ) else (
                                        echo Could not find a command registered that meets `%1`
                                        echo For give information about commands, type `--help` or `-h`
                                        echo.
                                    )
                                )
                            )
                        )
                    )
                )
            )
        )
    )
)

