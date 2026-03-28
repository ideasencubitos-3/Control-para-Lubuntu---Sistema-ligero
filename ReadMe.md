
INSTALACIÓN DEL SISTEMA

	sudo apt install python3-pip python3-venv python3-evdev python3-tk -y

CREAR ENTORNO VIRTUAL

	python3 -m venv venv
	source venv/bin/activate

INSTALAR DEPENDENCIAS:

	pip install -r requirements.txt

CONFIGURAR MÓDULO UINPUT

	sudo modprobe uinput

VERIFICAR

	ls -l /dev/uinput
	
SI NO EXISTE:

	sudo modprobe uinput
	
CONFIGURAR PERMISOS PERMANENTES

	sudo nano /etc/udev/rules.d/99-uinput.rules
	
CONTENIDO:

	KERNEL=="uinput", GROUP="input", MODE="0660"
	
APLICAR CAMBIOS:

	sudo udevadm control --reload-rules
	sudo udevadm trigger
	
AGREGAR USUARIO AL GRUPO INPUT
	
	sudo usermod -aG input javis
	sudo reboot
	
DESPUÉS DEL REINICIO:

	groups
	
DEBE APARECER UINPUT.

PROBAR UINPUT SIN ROOT

	python3 - << "EOF"
	import uinput
	device = uinput.Device([uinput.KEY_A])
	print("OK: uinput funciona sin root")
	EOF

SALIDA ESPERADA:

	OK: uinput funciona sin root
	
EJECUTAR LA APLICACIÓN

	python3 app.py
