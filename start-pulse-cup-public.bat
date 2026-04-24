@echo off
setlocal

set "APP_DIR=%~dp0"
set "POWERSHELL_EXE=C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe"
set "SSH_EXE=C:\Windows\System32\OpenSSH\ssh.exe"
set "PORT=8080"

cd /d "%APP_DIR%"

start "Champions League Foari Server" "%POWERSHELL_EXE%" -NoExit -ExecutionPolicy Bypass -File "%APP_DIR%server.ps1" -Port %PORT%
timeout /t 2 /nobreak >nul

echo.
echo Starting public tunnel with localhost.run...
echo Keep the tunnel window open to keep the public link alive.
echo Google sign-in needs a stable authorized origin, so this changing tunnel URL may not work reliably for Google auth.
echo.

start "Champions League Foari Public Tunnel" "%POWERSHELL_EXE%" -NoExit -Command ^
  "& '%SSH_EXE%' -o ServerAliveInterval=60 -o StrictHostKeyChecking=accept-new -R 80:localhost:%PORT% nokey@localhost.run"

timeout /t 3 /nobreak >nul
start "" "http://localhost:%PORT%/"

endlocal
