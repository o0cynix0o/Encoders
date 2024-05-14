@echo off

REM Check if a folder was dropped onto the batch file
if "%~1" == "" (
    echo Please drag and drop a folder onto this batch file.
    pause
    exit /b
)

REM Run the PowerShell script with the dropped folder as a parameter
powershell.exe -ExecutionPolicy Bypass -File "G:\Scripts\Working\TVShowENC.ps1" "%~1"

REM pause <<Edited out to see the script still pause