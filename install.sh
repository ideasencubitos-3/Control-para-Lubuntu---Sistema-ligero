#!/bin/bash

echo "Instalando dependencias del sistema..."
sudo apt update
sudo apt install python3-pip python3-venv python3-evdev python3-tk -y

echo "Creando entorno virtual..."
python3 -m venv venv
source venv/bin/activate

echo "Instalando dependencias de Python..."
pip install -r requirements.txt

echo "Configurando uinput..."
sudo modprobe uinput

echo "Listo."