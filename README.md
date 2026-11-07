# Sistema de Gestión · Versión Centralizada (Red Local / LAN)

Sistema de gestión y punto de venta diseñado con arquitectura **Cliente-Servidor Local**, donde una computadora central actúa como servidor de base de datos compartida y múltiples terminales o celulares conectados al mismo router WiFi pueden operar concurrentemente en tiempo real.

## Características Principales
- **Servidor Central:** Servidor Python multi-hilo (`servidor_red.py`) sobre la red de área local.
- **Concurrencia Multi-Dispositivo:** Mozo / terminales cargan pedidos desde celulares o computadoras secundarias hacia la caja principal.
- **Arranque con Windows:** Scripts automatizados para inicio como servicio (`Iniciar_Con_Windows.bat`).
- **Base de Datos Unificada:** Control centralizado de stock, arqueo de caja y emisión de tickets en la terminal principal.

## Ejecución
Para iniciar el servidor en la PC central:
```bash
Iniciar_Servidor_Red.bat
```
El script mostrará la dirección IP local asignada (ejemplo: `http://192.168.1.50:5000`) para que las terminales y celulares puedan conectarse.

## Documentación
Consultar [MANUAL_VERSION_RED_CENTRALIZADA.md](MANUAL_VERSION_RED_CENTRALIZADA.md) y [LEEME_PRIMERO.txt](LEEME_PRIMERO.txt) para la configuración paso a paso.
