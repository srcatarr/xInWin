import os, json, sys, subprocess

if len(sys.argv)==2:
    pass
else: os._exit(0)

file_name = sys.argv[1]


try: file = open(file_name, "r", encoding="utf-8")
except FileNotFoundError:
    print("File not found.")
    os._exit(0)

print("")

for line in file:
    if line=="#!/bin/bash":
        os.system("@echo off")
    if "#" in line:
        os.system(line.split("#")[0])

    elif line[0:1]=="if":
        pass # IF-ELSE method not supported
    
    else: os.system(line)


print("")
print("Program exited")
print("")

