@echo off
chcp 65001 > nul
title Activar Inicio Automatico con Windows
color 0a

echo ======================================================================
echo    CONFIGURAR INICIO AUTOMATICO CON WINDOWS
echo ======================================================================
echo.
echo Esta opcion permite que el Servidor POS se levante solo cada vez
echo que encendes la computadora, sin tener que hacer doble clic a mano.
echo.

powershell -NoProfile -ExecutionPolicy Bypass -Command "$ws = New-Object -ComObject WScript.Shell; $sc = $ws.CreateShortcut([IO.Path]::Combine([Environment]::GetFolderPath('Startup'), 'ControlStock_Servidor.lnk')); $sc.TargetPath = '%~dp0Iniciar_Servidor_Red.bat'; $sc.WorkingDirectory = '%~dp0'; $sc.Save()"

if %ERRORLEVEL% equ 0 (
    echo ======================================================================
    echo  [EXITO] ¡Configurado correctamente!
    echo  Cada manana al encender la PC, el servidor arrancara solo
    echo  y abrira el navegador listo para cobrar.
    echo ======================================================================
) else (
    echo [ERROR] No se pudo configurar el inicio automatico.
)
echo.
pause
