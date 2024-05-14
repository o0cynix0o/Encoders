@echo off

REM Check if a folder was dropped onto the batch file
if "%~1" == "" (
    echo Please drag and drop a folder onto this batch file.
    pause
    exit /b
)

REM Run the MovieENC PowerShell script with the dropped folder as a parameter
powershell.exe -ExecutionPolicy Bypass -File "G:\Scripts\Working\MovieENC.ps1" "%~1"

Rem pause << Editied out to see if the script still pauses