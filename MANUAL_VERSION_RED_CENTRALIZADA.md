# Manual de Instalacion y Uso — Version Red Centralizada (PC + Celulares Sincronizados)

Esta version esta disenada para comercios que cuentan con una computadora principal (en caja o mostrador) y uno o varios celulares o tablets (usados por empleados o el dueno en el salon, pasillos o deposito), todos conectados y sincronizados en tiempo real a la misma base de datos.

---

## 1. Que es y en que se diferencia de la Version Celular

Ahora contas con dos productos claramente diferenciados para ofrecer a tus clientes:

| Caracteristica | Opcion A: Version Celular (PWA Offline) | Opcion B: Version Red Centralizada |
| :--- | :--- | :--- |
| **Carpeta en el repo** | `VERSION_CELULAR_OFFLINE` | `VERSION_RED_CENTRALIZADA` |
| **Destinada a** | Comercios unipersonales, feriantes o negocios sin computadora. | Comercios con local a la calle, caja principal y atencion en simultaneo. |
| **Dispositivos** | Funciona en un unico celular o tablet independiente. | Funciona en PC de mostrador + multiples celulares conectados a la vez. |
| **Sincronizacion** | Los datos viven en la memoria de ese telefono. | En tiempo real: lo que vende un celular descuenta el stock en la PC al segundo. |
| **Conexion** | 100% offline (funciona hasta en Modo Avion). | Red local Wi-Fi del negocio (no consume internet) o en la nube. |
| **Instalacion** | Desde un enlace web de Netlify con un toque. | Se ejecuta en la computadora principal con un doble clic. |

---

## 2. Contenido de la carpeta VERSION_RED_CENTRALIZADA

Dentro de `sistema_gestion\VERSION_RED_CENTRALIZADA\` encontras:

1. **`Iniciar_Servidor_Red.bat`**:
   - Lanzador de un solo clic para Windows. Inicia el servidor central sin necesidad de abrir consolas ni escribir comandos.
2. **`servidor_red.py`**:
   - Motor de red inteligente. Detecta de forma automatica la direccion IP de la computadora en la red Wi-Fi y genera un codigo QR en pantalla para conectar los telefonos al instante.
3. **`main.py`**:
   - Servidor FastAPI con toda la logica de negocio, control de roles, ventas, auditoria y cuenta corriente.
4. **`local_db.py`**:
   - Motor de base de datos local SQLite de alto rendimiento (modo WAL y transacciones concurrentes seguras). No requiere instalar PostgreSQL ni configurar servidores externos.
5. **`datos/`**:
   - Carpeta donde reside el archivo de base de datos `pos_local.db` y las fotos de los productos subidas (`uploads/`).
6. **`templates/` y `static/`**:
   - Pantallas y estilos optimizados para navegadores de escritorio (PC) y telefonos moviles.
7. **`requirements.txt`**:
   - Lista de librerias Python necesarias.

---

## 3. Puesta en marcha en 3 pasos (Modo Wi-Fi Local - Costo $0)

Para usar el sistema en el local comercial no hace falta pagar servidores ni tener conexion a internet activa: solo que la PC y los celulares esten conectados al mismo router o red Wi-Fi.

### Paso 1: Iniciar el servidor en la computadora principal
1. En la computadora de caja o mostrador, abri la carpeta `VERSION_RED_CENTRALIZADA`.
2. Hace doble clic en el archivo **`Iniciar_Servidor_Red.bat`**.
3. Se abrira una ventana que detecta tu red y muestra un mensaje como este:
   ```text
   ========================================================================
     SISTEMA DE GESTION Y CONTROL DE STOCK · VERSION CENTRALIZADA
     PC de Mostrador + Celulares y Tablets Sincronizados en Tiempo Real
   ========================================================================

     [1] En esta computadora (Mostrador / Caja):
         -> http://localhost:8000

     [2] Desde celulares o tablets (conectados al mismo Wi-Fi):
         -> http://192.168.1.45:8000
   ```
4. Ademas, dibuja un codigo QR directamente en la ventana.

> **Aviso de Firewall de Windows (solo la primera vez):**
> Si Windows muestra una ventana de alerta de seguridad preguntando si deseas permitir que Python se comunique en las redes, marca la casilla **"Redes privadas (como la red domestica o del trabajo)"** y hace clic en **"Permitir acceso"**.

---

### Paso 2: Abrir el sistema en la computadora
En la misma PC, abri Google Chrome, Microsoft Edge o tu navegador preferido e ingresa a:
**`http://localhost:8000`**

---

### Paso 3: Conectar los celulares y tablets
En cualquier celular o tablet del local (que este conectado a la misma red Wi-Fi):
1. Abri la camara del telefono y apunta al codigo QR que se muestra en la pantalla de la PC (lo encontras directamente en la pantalla de inicio abajo del login, o en el boton 'Conectar Celular' de la barra superior).
2. Toca el enlace detectado (o escribi manualmente en Chrome del celular la direccion que indico el servidor, por ejemplo `http://192.168.1.45:8000`).
3. El sistema se abrira al instante en el celular.

#### Crear el acceso directo en el celular (como una app nativa)
Para que los empleados no tengan que escribir la direccion cada dia:
- **En Android (Chrome):** Toca el menu de los tres puntos arriba a la derecha y selecciona **"Agregar a la pantalla principal"** o **"Instalar aplicacion"**.
- **En iPhone / iPad (Safari):** Toca el boton Compartir (el cuadrado con la flecha hacia arriba) y selecciona **"Agregar al inicio"**.
- En la pantalla del telefono aparecera el icono del sistema, abriendo a pantalla completa.

---

## 4. Usuarios, Roles y Permisos (Dueno vs Empleado)

El sistema incluye seguridad por roles y auditoria integrada para que el dueno tenga control total mientras los empleados operan sin riesgos:

### Usuario Dueno (Rol Administrador)
- **PIN de fabrica inicial:** `1234` (el sistema exigira cambiarlo por uno nuevo de 4 digitos al primer ingreso).
- **Alcance y permisos:**
  - Control completo de ventas y stock.
  - Carga masiva de productos mediante planillas Excel.
  - Edicion de precios, costos, nombres y eliminacion de productos.
  - Control de clientes, limites de credito y cobro de fiados.
  - Administracion de cajas y arqueos.
  - Acceso exclusivo al panel de **Configuracion** (datos del negocio, moneda, backups).
  - Acceso a la pantalla de **Auditoria**: historial detallado de quien agrego stock, quien registro movimientos o quien modifico categorias.

### Usuario Cajero / Empleado (Rol Cajero)
- **PIN de fabrica inicial:** `0000` (el sistema exigira cambiarlo por uno nuevo de 4 digitos al primer ingreso).
- **Alcance y permisos:**
  - Venta rapida en el Punto de Venta.
  - Carga de nuevos productos individuales (cada alta queda registrada en la Auditoria con el nombre del empleado).
  - Bloqueo de edicion y borrado de productos existentes para evitar manipulacion indebida.
  - Bloqueo de importacion masiva de Excel.
  - Creacion de categorias de productos.
  - Gestion de clientes y consulta de cuentas corrientes.
  - Registro de movimientos de caja (ingresos y egresos de efectivo).
  - Cierre abierto de caja (puede realizar el cierre diario dejando registrado el saldo).
  - **Bloqueado:** No puede ingresar a Configuracion general ni a la pantalla de Auditoria.

---

## 5. Respaldo de Informacion (Copias de Seguridad)

Toda la informacion del comercio (catalogo de productos, precios, fotos, clientes, deudas y ventas historicas) se almacena dentro de la carpeta:
`VERSION_RED_CENTRALIZADA\datos\`

### Como hacer una copia de seguridad:
Existen dos formas muy sencillas:

1. **Desde la aplicacion (Recomendada):**
   - Ingresa como Dueno a la seccion **Configuracion**.
   - En el bloque de Respaldo, hace clic en **"Descargar Copia de Seguridad"**.
   - Se descargara un archivo con la fecha del dia conteniendo todos los registros.
2. **Copia directa de carpeta:**
   - Con el servidor cerrado, simplemente copia la carpeta `datos` a un pendrive o subila a Google Drive.

### Como restaurar en caso de cambiar de computadora:
1. Instala la carpeta `VERSION_RED_CENTRALIZADA` en la nueva computadora.
2. Entra a **Configuracion -> Restaurar Respaldo**, selecciona el archivo guardado y confirma con tu PIN de Dueno.
3. Todos los datos, clientes y saldos se restauran al instante.

---

## 6. Opcion Avanzada: Conexion en la Nube (Multi-sucursal o Acceso Remoto)

Si el comercio crece y necesita conectar sucursales ubicadas en distintas direcciones geograficas o el dueno desea ver los numeros desde su casa sin estar en el local:

1. El sistema esta preparado para conectarse a **Supabase (PostgreSQL en la nube)**.
2. Crea un archivo `.env` dentro de `VERSION_RED_CENTRALIZADA` con las siguientes claves:
   ```env
   SUPABASE_URL=https://tu-proyecto.supabase.co
   SUPABASE_KEY=tu_service_role_key
   COMERCIO_ID=1
   ```
3. Al detectar estas variables, el servidor conmuta automaticamente de SQLite a la base en la nube, permitiendo que computadoras y celulares en distintas ciudades compartan el inventario al instante.

---

## 7. Preguntas Frecuentes y Solucion de Problemas

### 1. "Un celular no puede abrir la direccion que muestra la pantalla"
- **Causa comun:** El celular esta usando los datos moviles (4G/5G) en lugar de la red Wi-Fi del negocio, o esta conectado a una red "Invitados" aislada.
- **Solucion:** Asegurate de que el celular este conectado a la misma red Wi-Fi que la computadora principal.

### 2. "La direccion IP de la computadora cambio al reiniciar el router"
- **Causa comun:** Algunos routers hogarenos reasignan la direccion IP local cada vez que se reinician.
- **Solucion:** Al abrir `Iniciar_Servidor_Red.bat`, la ventana siempre te indica la IP exacta y actualiza el codigo QR de inmediato. Si deseas que nunca cambie, podes asignarle una IP fija a la computadora desde la configuracion de red de Windows o en el panel de administracion del router.

### 3. "Deseo cerrar el servidor"
- Hace clic en la ventana negra del servidor y presiona `Ctrl + C` (o simplemente cerra la ventana con la cruz).
