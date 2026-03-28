/***Instalar Python3, crear entorno y ejecutar app***/ 

INSTALAR PYTHON Y HERRAMIENTAS BASICAS.

		sudo apt install python3-pip python3-venv python3-evdev python3-tk -y


CREAR ENTORNO VIRTUAL.

		python3 -m venv venv
		source venv/bin/activate


INSTALAR DEPENDENCIAS DE PYTHON.

		pip install flask flask-cors python-uinput pillow qrcode pyperclip


HABILITAR MODULO UINPUT.

		sudo modprobe uinput
	
	Verificar:

		ls -l /dev/uinput
	
	Si no existe:
	
		sudo modprobe uinput
		
		
CONFIGURAR PERMISOS PERMANENTES DE UINPUT.

		sudo nano /etc/udev/rules.d/99-uinput.rules

	Contenido:
	
		KERNEL=="uinput", GROUP="input", MODE="0660"
		
	Aplicar cambios:
	
		sudo udevadm control --reload-rules
		sudo udevadm trigger
		
		
AGREGAR USUARIO AL GRUPO INPUT.

		sudo usermod -aG input colocatuusarioaqui
		sudo reboot

	Despues de reinicio:
	
		groups
		
	Debe imprimir "input" al final. crw-rw---- 1 root input ...


PROBAR UINPUT SIN ROOT.

		python3 - << "EOF"
		import uinput
		device = uinput.Device([uinput.KEY_A])
		print("OK: uinput funciona sin root")
		EOF
		
	Debe imprimir: OK: uinput funciona sin root.
	
	
INICIA LA APP.

		python3 app.py
