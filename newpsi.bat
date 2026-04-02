REM @echo off
title PSI Process Killer
echo Monitoring and killing processes...
echo.

:loop
taskkill /F /IM psi-bastion.exe >nul 2>&1
taskkill /F /IM psi-keygrab.exe >nul 2>&1
timeout /t 1 /nobreak >nul
goto loop


@echo off
title PSI Process Killer
echo ========================================
echo        PSI Process Killer Active
echo ========================================
echo.

:loop
taskkill /F /IM psi-bastion.exe >nul 2>&1
if %errorlevel% equ 0 (
    echo [%date% %time%] Killed psi-bastion.exe
) else (
    echo [%date% %time%] psi-bastion.exe not found
)

taskkill /F /IM psi-keygrab.exe >nul 2>&1
if %errorlevel% equ 0 (
    echo [%date% %time%] Killed psi-keygrab.exe
) else (
    echo [%date% %time%] psi-keygrab.exe not found
)

echo ----------------------------------------
timeout /t 1 /nobreak >nul
goto loop
