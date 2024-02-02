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

venv = {}

for line in file:
    if line=="#!/bin/bash":
        os.system("@echo off")
    if "#" in line:
        os.system(line.split("#")[0])

    if "export" in line:
        exports = line.split("export")[1].split("=")
        venv[exports[0]] = exports[1]
        os.system(
            f"set {exports[0]}={exports[1]}"
        )

    elif "$" in line:
        imports = line.split("$")[1].split("\n")
        if len(imports) == 1:
            execCode = line.split('$')[0] + venv[str(imports[0])]
            print(execCode)
            os.system(
                execCode
            )
        else:
            execCode = line.split('$')[0] + venv[str(imports[0])]
            os.system(
                execCode
            )
        os.system("echo %txt%")

    elif line[0:1]=="if":
        pass # IF-ELSE method not supported
    
    else: os.system(line)


print("")
print("Program exited")
print("")

