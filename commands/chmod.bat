@echo off

set filename=%1
set permissions=%2

attrib "!filename!" +%permissions%
