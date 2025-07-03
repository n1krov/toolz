#!/bin/bash
# zuget.sh - Script para traer directorios mediante una url propocionada por el usuario
tput civis
trap ctrl_c INT

# COLORES
readonly BOLD=$(tput bold)
readonly RED=$(tput setaf 1)
readonly GREEN=$(tput setaf 2)
readonly YELLOW=$(tput setaf 3)
readonly BLUE=$(tput setaf 4)
readonly MAGENTA=$(tput setaf 5)
readonly CYAN=$(tput setaf 6)
readonly RESET=$(tput sgr0)

main_url="$1"

# FUNCIONES

ctrl_c() 
{
    echo -e "\n${RED}[~] Saliendo...${RESET}"
    tput cnorm
    exit 1
}

usage() 
{
    echo -e "\n${BOLD}${YELLOW}Uso: $0 ${MAGENTA}<URL>${RESET}${RESET}"
    echo -e "${BOLD}${CYAN}Ejemplo: $0 https://example.com/directory/${RESET}\n"
    tput cnorm
    exit 1
}


main()
{
    echo -e "\n${BOLD}${GREEN}Iniciando descarga desde: ${RESET}${main_url}\n"

    # wget que descarga los dirs de la url ignorando la creacion de la carpeta raiz
    
    wget -r -np -nH --cut-dirs=1 -R "index.html*" "$main_url"
    
    # preguntamos por el codigo de de estado de salida de wget
    if [ $? -eq 0 ]; then
        echo -e "\n${BOLD}${GREEN}Descarga completada exitosamente.${RESET}"
    else
        echo -e "${BOLD}${RED}Error al descargar el contenido.${RESET}"
        tput cnorm
        exit 1
    fi

    echo -e "\n${BOLD}${BLUE}Contenido descargado en el directorio actual.${RESET}"
}

# PROCESS

# Verificar si se proporcionó una url
if [ -z "$1" ]; then  # -z verifica si la variable está vacía
    usage
else
    main
fi

tput cnorm
