#!/bin/bash
tput civis
trap ctrl_c INT

# colores
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

function ctrl_c() 
{
    echo -e "\n${RED}[*]${NC} Saliendo..."
    tput cnorm
    exit 1
}

function main() 
{
    echo -e "${GREEN}[~]${NC} Setup de Toolz | DSTATUS\n"
    sleep 1

    echo -e "${GREEN}[~]${NC} Instalando DSTATUS en /usr/local/bin/\n"

    sudo cp dstatus.sh /usr/local/bin/dstatus

    echo -e "${GREEN}[~] Terminado!${NC}\n"
}

main

tput cnorm
