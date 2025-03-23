#!/bin/bash

# Autor: Z0SO
# Este script itera sobre cada carpeta de un directorio, ingresa a cada una de ellas
# y muestra el estado de git de cada una de ellas.

tput civis  # Ocultar el cursor

# Colores para salida
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m '  # No Color
# Manejo de la señal Ctrl+C
function ctrl_c() {
    echo -e "${RED}\n[!] Saliendo...${NC}"
    tput cnorm  # Restaurar el cursor
    exit 0
}

# Trampa para detectar Ctrl+C
trap ctrl_c INT

# Función para imprimir mensajes en verde
function print_success() {
    echo -e "${GREEN}[*] ${1}${NC}"
}

# Función para imprimir mensajes en azul
function print_info() {
    echo -e "${BLUE}[*] ${1}${NC}"
}

# Comenzamos el script
# print_info "Iniciando..."

# Iterar sobre cada carpeta en el directorio actual
for d in */ ; do
    # Comprobar si es un repositorio Git
    if [ -d "$d/.git" ]; then
        # Verificar el estado de git en el repositorio
        status=$(cd "$d" && git status -s)

        if [ -n "$status" ]; then
            print_success "Directorio: ${d} tiene cambios pendientes:"
            echo "$status"
        # else
            # print_success "Directorio: ${d} está limpio"
        fi
    else
        echo -e "${RED}[-] El directorio ${d} no es un repositorio Git.${NC}"
    fi
done

# print_info "Finalizado..."

tput cnorm  # Restaurar el cursor
