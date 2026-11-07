@echo off
chcp 65001 > nul
title Instalador de Python para Sistema POS
color 0b

echo ======================================================================
echo    INSTALADOR DE PYTHON PARA EL SISTEMA POS CENTRALIZADO
echo ======================================================================
echo.
echo Este paso solo se realiza una sola vez en la vida de la computadora.
echo.
echo ======================================================================
echo  ATENCION: PASO CRUCIAL DURANTE LA INSTALACION
echo ======================================================================
echo  Apenas se abra la primera ventana del instalador:
echo.
echo  1. En la parte inferior, MARCA LA CASILLA:
echo     [X] "Add python.exe to PATH"   (o "Add Python to PATH")
echo.
echo  2. Hace clic en el boton superior grande:
echo     "Install Now"
echo.
echo  3. Al finalizar, hace clic en "Close".
echo ======================================================================
echo.
pause

if exist "%~dp0Instalar_Python_Primero.exe" (
    start "" "%~dp0Instalar_Python_Primero.exe"
) else (
    echo [ERROR] No se encontro el archivo Instalar_Python_Primero.exe en esta carpeta.
    pause
)
