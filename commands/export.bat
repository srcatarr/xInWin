@echo off

if exist $%1.bat (
       del $%1.bat
)

echo @echo off>>$%1.bat
echo %2>>$%1.bat

set %1=%2

