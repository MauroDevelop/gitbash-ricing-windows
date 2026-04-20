dashboard() {
    clear
    
    # --- LÓGICA DE LOGO MODULAR ---
    local LOGO_FILE="$DOTFILES_DIR/logos/${HYLER_LOGO:-default}.txt"

    # 1. Traductor de colores humanos a código ANSI
    case "${HYLER_COLOR:-cyan}" in
        "red")     COLOR_CODE="\e[31m" ;;
        "green")   COLOR_CODE="\e[32m" ;;
        "yellow")  COLOR_CODE="\e[33m" ;;
        "blue")    COLOR_CODE="\e[34m" ;;
        "magenta") COLOR_CODE="\e[35m" ;;
        "cyan")    COLOR_CODE="\e[36m" ;;
        "white")   COLOR_CODE="\e[37m" ;;
        *)         COLOR_CODE="\e[36m" ;; # Cyan por defecto si hay error
    esac

    # 2. Imprimir el logo aplicando el color elegido
    echo -e "${COLOR_CODE}"
    if [ -s "$LOGO_FILE" ]; then
        cat "$LOGO_FILE"
    elif [ -n "$DASHBOARD_TITLE" ]; then
        echo " ────────────────────────────────────────────────────────"
        echo -e "   \e[1;${COLOR_CODE:3}✨ $DASHBOARD_TITLE ✨\e[0m"
        echo " ────────────────────────────────────────────────────────"
    else
        echo " > HYLER GITBASH < "
    fi
    echo -e "\e[0m" # Reseteamos el color para que no pinte el resto de la terminal

    # --- RESTO DEL DASHBOARD (Fecha, Clima, Node, etc.) ---
    echo -e "\e[33m📅 Fecha:\e[0m $(date '+%A, %d de %B de %Y - %H:%M')"
    echo -e "\e[34m⛅ Clima:\e[0m $(curl -s "wttr.in/${WEATHER_CITY}?format=3" || echo "Servicio no disponible")"
    echo -e "\e[32m🟢 Node:\e[0m $(node.exe -v 2>/dev/null || echo 'No instalado')"
    echo -e "\e[90m📍 Ubicación:\e[0m $(pwd)"

    if [ -f "$NOTES_FILE" ]; then
        LAST_NOTE=$(tail -n 1 "$NOTES_FILE")
        echo -e "\e[35m📝 Pendiente:\e[0m ${LAST_NOTE:-No hay tareas actuales}"
    fi

    # --- PIE DE PÁGINA ESTILIZADO ---
    echo -e "\e[90m ────────────────────────────────────────────────────────\e[0m"
    echo -e "\e[0m Escribe \e[32mcomandos\e[0m (vista rápida) o \e[32mcomandos -a\e[0m (detalles)"
    echo -e "\e[90m ────────────────────────────────────────────────────────\e[0m"
}

# Ejecutamos el dashboard
dashboard
