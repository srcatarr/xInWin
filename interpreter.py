import os, json, sys, subprocess

file_name = sys.argv[1]
file = open(file_name, "r", encoding="utf-8")

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

