# Hyler GitBash

¡Bienvenido a **Hyler**! Si sos desarrollador, usás Windows 11 y querés exprimir al máximo los recursos de tu hardware sin que la RAM se evapore usando WSL o máquinas virtuales, este proyecto es para vos.

Hyler es una arquitectura modular de dotfiles diseñada para transformar la simple terminal de Git Bash en un entorno de desarrollo profesional, bonito, ligero y con funcionalidades de Linux.

## Características Principales

- **Instalación "Zero-Code"**: Incluye un Asistente Interactivo (`configurar-entorno`) que te permite personalizar tu nombre, título del dashboard, ciudad para el clima y rutas de trabajo sin tocar una sola línea de código.
- **Dashboard Inteligente**: Te recibe con el logo de Hyler (o tu propio título personalizado), fecha, clima local, estado de Node.js y la última nota de tu backlog.
- **Arquitectura Limpia**: Todo el código está modularizado en una carpeta `.dotfiles` oculta. Tu `.bashrc` se mantiene limpio y funciona solo como un cargador (loader).
- **Git Branch Dinámico**: El prompt (línea de comandos) detecta automáticamente si estás en un repositorio y te muestra en qué rama estás parado.
- **Herramientas de Backend**: Comandos cortos nativos para matar puertos trabados (`killport`), levantar servidores (`dev`), y navegar por tus proyectos.

## Instalación (Paso a Paso)

Sigue estos comandos para aplicar Hyler en tu propia máquina:

1. **Cloná este repositorio** en tu computadora:

```bash
git clone https://github.com/MauroDevelop/hyler-gitbash.git
```

2. Copiá la arquitectura a tu directorio raíz.  
Abre Git Bash y usa los siguientes comandos para mover el loader, el profile y la carpeta de módulos a tu usuario:

```bash
cp .bashrc ~/.bashrc
cp .bash_profile ~/.bash_profile
cp -r .dotfiles ~/.dotfiles
```

3. Recargá la terminal e inicia el Asistente.  
Ejecuta el siguiente comando para cargar la nueva configuración y luego lanza el menú interactivo para personalizarla con tus propios datos:

```bash
source ~/.bashrc
configurar-entorno
```

## Configuración y Personalización

Hyler permite una personalización completa del entorno sin necesidad de editar scripts de Bash manualmente, evitando errores de sintaxis y rutas.

### Asistente Interactivo (`configurar-entorno`)
Este comando inicia un asistente que genera automáticamente tu Panel de Control (`user_config.sh`):

* **Identidad**: Define tu nombre para el prompt y un título corto para el encabezado del dashboard.
* **Clima**: Configura tu ubicación para el reporte meteorológico (usa `+` para ciudades con espacios, ej: `Buenos+Aires`).
* **Rutas Inteligentes**: 
    * En las preguntas de rutas (Proyectos o Notas), puedes ingresar un punto (`.`) y el asistente detectará automáticamente tu ubicación actual.
    * **Gestión Automática**: Si defines una ruta para tus notas, el sistema se encargará de crear el archivo `notas_dev.txt` por ti si no existe en el disco.

### Arte ASCII Personalizado (`mi-logo`)
Para utilizar logos de gran tamaño (multi-línea) de forma segura, utiliza este comando dedicado:

1.  Ejecuta `mi-logo` y presiona una tecla para entrar al editor de texto.
2.  Pega tu diseño ASCII directamente en la pantalla.
3.  Presiona `Ctrl + O` y luego `Enter` para guardar los cambios.
4.  Presiona `Ctrl + X` para salir. 
*Hyler detectará automáticamente la presencia de tu logo personalizado y le dará prioridad visual sobre el título de texto corto en el dashboard.*

### Auditoría de Entorno (`mi-config`)
Utiliza este comando para visualizar rápidamente un resumen de tus rutas de trabajo, ciudad y variables activas en una pantalla modal. Al finalizar la lectura, presiona cualquier tecla para retornar automáticamente al dashboard principal.

## Requisitos

Para que Hyler GitBash funcione con todo su potencial, es recomendable tener instalado:

- **Node.js**: Para detectar la versión en el dashboard, matar puertos y ejecutar los alias de desarrollo.
- **Curl**: Viene por defecto en Git Bash, es el motor detrás del widget del clima.

## Atajos Incluidos

Una vez instalado, podés escribir `comandos` en la terminal para ver la vista rápida, o usar **`comandos -a`** para leer el manual detallado.

| Comando | Descripción |
| :--- | :--- |
| `c` | Limpia la pantalla y recarga el dashboard visual. |
| `comandos -a` | Despliega el menú de ayuda con la referencia detallada de cada atajo. |
| `configurar-entorno` | **Abre el asistente interactivo para personalizar tu terminal.** |
| `mi-config` | Muestra un resumen en pantalla de tus variables actuales (nombre, ciudad, rutas). |
| `dev` | Ejecuta `npm run dev` al instante. |
| `killport 3000` | Libera el puerto 3000 si quedó bloqueado por un proceso de Node/Express. |
| `nota [texto]` | Guarda una nota rápida con la fecha actual en tu backlog. |
| `misnotas` | Imprime todas tus notas pendientes en pantalla de forma estructurada. |
| `api` | Salta al instante a tu carpeta principal de proyectos. |
| `bashconfig -r` | Abre el editor para modificar tu `.bashrc`, o usa `-r` para recargar al instante sin abrir el editor. |

## 🤝 Contribuciones

Si tenés ideas para agregar más alias útiles, mejorar el asistente o sumar integraciones para Backend, ¡los pull requests son 100% bienvenidos!

---

**Codeado con ☕ por [Mauro Algañaraz](https://github.com/MauroDevelop) - Estudiante de Desarrollo de Software.**