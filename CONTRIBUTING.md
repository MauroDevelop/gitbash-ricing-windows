# Contribuyendo a Hyler GitBash

¡Gracias por considerar contribuir a Hyler GitBash! Este documento describe el flujo de trabajo de desarrollo y los comandos para ayudarte a contribuir efectivamente.

## 🛠️ Configuración del Entorno de Desarrollo

1. **Haz un fork y clona** el repositorio
2. **Instala Hyler** siguiendo las instrucciones en [README.md](./README.md)
3. **Vincula tu instalación local** al repositorio usando `dev-repo`

## 💻 Comandos de Desarrollo

Hyler incluye un conjunto de comandos de desarrollo accesibles a través del espacio de nombres `dev`. Estos están definidos en `.dotfiles/dev.sh`.

### Resumen

Ejecuta `dev-help` para ver todos los comandos de desarrollo disponibles:

```bash
dev-help
```

### Referencia Detallada de Comandos

#### `dev-repo`
Vincula tu instalación de Hyler a este repositorio para sincronización.

**Uso:**
```bash
dev-repo
```
Sigue las indicaciones para apuntar a tu carpeta del repositorio clonado.

#### `dev-sync`
Sincroniza tu **instalación activa de Hyler** (`~/.dotfiles/`) al **repositorio vinculado**.

**Qué hace:**
- Copia `.bashrc` y `.bash_profile` a la raíz del repo
- Copia todos los archivos `.sh` (excepto configuración personal) a `/.dotfiles/`
- Copia el directorio `logos/` de forma recursiva

**Útil cuando:** Has hecho cambios en tu terminal y quieres traerlos al repositorio para crear un pull request.

```bash
dev-sync
```

#### `dev-publish`
Sincroniza los cambios desde el **repositorio** a tu **instalación activa de Hyler**.

**Qué hace:**
- Copia los archivos de script principales (dashboard.sh, dev.sh, help.sh, prompt.sh, utils.sh, aliases.sh) a `~/.dotfiles/`
- Copia el contenido del directorio `logos/`
- **Preserva** tu configuración personal: `user_config.sh`, `notas_dev.txt`, `.bashrc`, `.bash_profile`

**Útil cuando:** Has obtenido actualizaciones del repositorio y quieres probarlas en tu terminal.

```bash
dev-publish
```

#### `dev-audit`
Ejecuta una comprobación de integridad en todos los comandos principales de Hyler para verificar que estén disponibles y funcionen correctamente.

**Uso:**
```bash
dev-audit
```

#### `dev-help`
Muestra este menú de ayuda.

```bash
dev-help
```

## 📥 Flujo de Trabajo para Contribuir

1. **Haz un fork** del repositorio en GitHub
2. **Clona** tu fork localmente
3. **Instala Hyler** (si no está ya instalado)
4. **Vincula el entorno de desarrollo**:
   ```bash
   dev-repo   # Apunta a tu fork clonado
   ```
5. **Realiza cambios** en los archivos dentro de `.dotfiles/` (o en archivos raíz como `.bashrc` si es necesario)
6. **Prueba los cambios** en tu terminal:
   - O bien reinicia la terminal o ejecuta `source ~/.bashrc`
   - O usa `dev-publish` después de hacer cambios en el repositorio para enviarlos a tu entorno activo
7. **Sincroniza los cambios al repositorio**:
   ```bash
   dev-sync   # Trae tus cambios activos de vuelta al repositorio
   ```
8. **Verifica** con `git status` y `git diff`
9. **Confirma** tus cambios con mensajes descriptivos
10. **Empuja** a tu fork
11. **Abre un Pull Request** contra el repositorio principal

## 🧪 Pruebas

- Usa `dev-audit` para verificar que todos los comandos estén funcionales después de los cambios
- Prueba manualmente comandos nuevos o modificados
- Asegúrate de mantener la compatibilidad hacia atrás cuando sea posible
- Prueba en Git Bash para Windows (objetivo principal)

## 📝 Estilo de Código

- Sigue las convenciones de Bash existentes en el proyecto
- Usa 4 espacios para indentación (sin tabulaciones)
- Comenta la lógica compleja
- Mantén las funciones enfocadas y con una única responsabilidad
- Agrega encabezados descriptivos para nuevas funciones

## 🐛 Reporte de Problemas

Por favor usa el [rastreador de Issues de GitHub](https://github.com/MauroDevelop/hyler-gitbash/issues) para reportar errores o sugerir funcionalidades.

## 🙏 ¡Gracias!

Tus contribuciones hacen que Hyler sea mejor para todos. ¡Feliz hackeo!

---