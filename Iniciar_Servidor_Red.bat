@echo off
chcp 65001 > nul
title Servidor Red Centralizada - Control de Stock POS
color 0b

echo ======================================================================
echo    INICIANDO SERVIDOR CENTRALIZADO (PC + CELULARES EN VIVO)
echo ======================================================================
echo.

cd /d "%~dp0"

where python >nul 2>nul
if %ERRORLEVEL% neq 0 (
    color 0c
    echo [ERROR] No se encontro Python instalado en esta computadora.
    echo Por favor instala Python 3.10 o superior marcando 'Add Python to PATH'.
    echo Descarga gratuita: https://www.python.org/downloads/
    echo.
    pause
    exit /b 1
)

python -c "import fastapi, uvicorn, qrcode" >nul 2>nul
if %ERRORLEVEL% neq 0 (
    echo [INFO] Verificando e instalando librerias necesarias...
    echo Esto solo se hace la primera vez y demora unos segundos.
    echo.
    python -m pip install -r requirements.txt
    echo.
)

python servidor_red.py

if %ERRORLEVEL% neq 0 (
    echo.
    echo El servidor se detuvo o encontro un error al iniciar.
    pause
)
