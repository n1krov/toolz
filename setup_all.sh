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
    exit 0
}

function main() 
{
    echo -e "${GREEN}[~]${NC} Setup de Toolz\n"
    sleep 1

    echo -e "${GREEN}[~]${NC} Instalando dstatus y dockreset en /usr/local/bin/\n"

    sudo cp dstatus/dstatus.sh /usr/local/bin/dstatus
    sudo cp dockreset/dockreset.sh /usr/local/bin/dockreset

    echo -e "${GREEN}[~] Terminado!${NC}\n"
    echo -e "${GREEN}[~]${NC} Para ejecutar dstatus y dockreset en cualquier lugar, solo escribe el nombre del comando\n"
}

main

tput cnorm
