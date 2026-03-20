@echo off
title PSI Process Killer
echo ==========================================
echo   PSI Process Killer - Running
echo ==========================================
echo.
echo Started at: %date% %time%
echo Monitoring every 10 seconds...
echo Press Ctrl+C to stop.
echo.

:loop
set "found=0"

tasklist /FI "IMAGENAME eq psi-bastion.exe" 2>nul | find /I "psi-bastion.exe" >nul
if %errorlevel%==0 (
    taskkill /F /IM psi-bastion.exe >nul 2>&1
    echo [%time%] [KILLED] psi-bastion.exe
    set "found=1"
)

tasklist /FI "IMAGENAME eq psi-keygrab.exe" 2>nul | find /I "psi-keygrab.exe" >nul
if %errorlevel%==0 (
    taskkill /F /IM psi-keygrab.exe >nul 2>&1
    echo [%time%] [KILLED] psi-keygrab.exe
    set "found=1"
)

if "%found%"=="0" (
    echo [%time%] [OK] No target processes found - System clean
)

timeout /t 10 /nobreak >nul
goto loop
