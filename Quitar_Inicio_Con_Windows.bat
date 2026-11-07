@echo off
chcp 65001 > nul
title Desactivar Inicio Automatico con Windows
color 0e

echo ======================================================================
echo    DESACTIVAR INICIO AUTOMATICO CON WINDOWS
echo ======================================================================
echo.

powershell -NoProfile -ExecutionPolicy Bypass -Command "$path = [IO.Path]::Combine([Environment]::GetFolderPath('Startup'), 'ControlStock_Servidor.lnk'); if (Test-Path $path) { Remove-Item $path -Force; Write-Host 'El inicio automatico ha sido desactivado con exito.' } else { Write-Host 'El inicio automatico ya estaba desactivado.' }"

echo.
pause
