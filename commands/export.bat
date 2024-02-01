@echo off
if %1=="" (
       set %1=%2
) else (
       set %1 %2=%3
)
