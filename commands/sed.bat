@echo off

set filename=%1
set searchTerm=%2
set replaceTerm=%3

for /f "delims=" %%a in ('type "%filename%" ^& break ^> "%filename%.tmp"') do (
    set "line=%%a"
    set "line=!line:%searchTerm%=%replaceTerm%!"
    echo !line!>>"%filename%.tmp"
)

del "%filename%"
rename "%filename%.tmp" "%filename%"

