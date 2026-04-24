@echo off
setlocal

set "APP_DIR=%~dp0"
set "POWERSHELL_EXE=C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe"
set "PORT=8080"

cd /d "%APP_DIR%"

start "Champions League Foari Server" "%POWERSHELL_EXE%" -NoExit -ExecutionPolicy Bypass -File "%APP_DIR%server.ps1" -Port %PORT%
timeout /t 2 /nobreak >nul
start "" "http://localhost:%PORT%/"

endlocal
