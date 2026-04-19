dashboard() {
    clear
    
    # --- LOGICA DEL TÍTULO DINÁMICO ---
    # 1. Prioridad Máxima: Si existe un archivo de logo personalizado y NO está vacío (-s)
    if [ -s "$HOME/.dotfiles/custom_logo.txt" ]; then
        echo -e "\e[36m"
        cat "$HOME/.dotfiles/custom_logo.txt"
        echo -e "\e[0m"
        
    # 2. Prioridad Media: Si hay un título corto de una línea
    elif [ -n "$DASHBOARD_TITLE" ]; then
        echo -e "\e[36m"
        echo " ────────────────────────────────────────────────────────"
        echo -e "   \e[1;36m✨ $DASHBOARD_TITLE ✨\e[0m"
        echo " ────────────────────────────────────────────────────────"
        echo -e "\e[0m"
        
    # 3. Prioridad Baja: Logo por defecto de Hyler
    else
        echo -e "\e[36m"
        cat << "EOF"
██╗  ██╗██╗   ██╗██╗     ███████╗██████╗ 
██║  ██║╚██╗ ██╔╝██║     ██╔════╝██╔══██╗
███████║ ╚████╔╝ ██║     █████╗  ██████╔╝
██╔══██║  ╚██╔╝  ██║     ██╔══╝  ██╔══██╗
██║  ██║   ██║   ███████╗███████╗██║  ██║
╚═╝  ╚═╝   ╚═╝   ╚══════╝╚══════╝╚═╝  ╚═╝
       > G I T B A S H   E D I T I O N <
EOF
        echo -e "\e[0m"
    fi
    # ---------------------------------

    echo -e "\e[33m📅 Fecha:\e[0m $(date '+%A, %d de %B de %Y - %H:%M')"
    echo -e "\e[34m⛅ Clima:\e[0m $(curl -s "wttr.in/${WEATHER_CITY}?format=3" || echo "Servicio no disponible")"
    echo -e "\e[32m🟢 Node:\e[0m $(node.exe -v 2>/dev/null || echo 'No instalado o no agregado al PATH')"
    echo -e "\e[90m📍 Ubicación actual:\e[0m $(pwd)"

    # --- LOGICA DE NOTAS ---
    if [ -f "$NOTES_FILE" ]; then
        # Guardamos la última nota en una variable
        LAST_NOTE=$(tail -n 1 "$NOTES_FILE")
        
        # Evaluamos si la variable tiene contenido
        if [ -n "$LAST_NOTE" ]; then
            echo -e "\e[35m📝 Pendiente:\e[0m $LAST_NOTE"
        else
            echo -e "\e[35m📝 Pendiente:\e[0m No hay tareas actuales"
        fi
    fi
    
    echo "--------------------------------------------------------"
    echo "Escribe 'comandos' para ver la lista de atajos."
    echo "--------------------------------------------------------"
}

# Ejecutamos el dashboard
dashboard
