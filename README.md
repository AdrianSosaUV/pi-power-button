# Botón de encendido Raspberry Pi

En este tutorial te enseñare a instalar un botón de encendido y apagado en tu Raspberry Pi.

Este pequeño manual estara divido en dos partes, la primera sera el hardware que se va a utilizar el segundo sera el software.

## Hardware

En esta sección veremos lo que necesitaremos para este sensillo tutorial.

Primero estan los materiales:

1. Una Raspberry Pi (obvio).
1. Un push button, de la forma y color que gustes, que sea NO (Normaly Open).
1. Cables Dupont (hembra - hembra / hembra - macho).

opcional:

1. Thermofill (el color a tu gusto) / cinta de aislar
1. Protoboard

### Procedimiento:

* Primero creamos un simple circuito con los cables Dupont y el push button sobre el protoboard:

![Conexión Protoboard](https://raw.githubusercontent.com/AdrianSosaUV/pi-power-button/master/imagenes/protoboard.jpg)

* Despues lo conectamos a dos terminales del GPIO ( no cualquiera, en la sección de Software estaran los pines disponibles), en mi caso utilize los pines 5 y 6 (GPIO 3 y GND respectivamente).

![Conexión GPIO](https://raw.githubusercontent.com/AdrianSosaUV/pi-power-button/master/imagenes/rpi-connect.jpg)

#### Opcional:

Si deseas puedes hacer un botón las estetico soldandolo y poniendole Thermofill, y ya lo acomodas a tu gusto!! ;)

![Botón Estetico](https://raw.githubusercontent.com/AdrianSosaUV/pi-power-button/master/imagenes/btn-finished.jpg)


## Software:

Esta es la parte interesante, aqui el archivo de instalacion creara un script de python que se encargara de dar la isntrucción de apagar la RPI cuando sea oprimido el botón y la reactivara cuando se oprima de nuevo, en si nunca se apaga, solo entra en un modo de ultra bajo consumo ( tipo hibernación).

_nota:_
Apartir de aqui todo es en la consola

### Conexión

Para conectar los pines correctamente debemos consultar la [documentación oficial](https://www.raspberrypi.org/documentation/usage/gpio/README.md "GPIO").
Una manera de verificar nuestras conexiones es usando el comando `pinout` que nos dejara ver (en la consola) una imagen de nuestra RPI, modelo y características de la misma, y por ultimo lo que mas nos importa, una lista de los pines.

![pinout](https://raw.githubusercontent.com/AdrianSosaUV/pi-power-button/master/imagenes/pinout.png)

Para ejecutar este comando sirve utilizar la siguiente instrucción en la terminal:

	pinout

si no podemos ejecutarlo o no lo reconoce como comando simplemente demos instalarlo de la siguiente manera:

	sudo apt-get update
	sudo apt-get install -y python3-gpiozero
	pinout

De esta manera estaremos instalando la herramienta necesaria para desplegar la información.

Es recomendable consultar la información oficial de cada raspberry, debido a que cada GPIO pin tiene una función especifica, y podriamos hacer algo que no nos agrade totalmente.

### instalación

El siguiente paso es descargar el archivo de instalación, para ello vamos a copiar este repositorio en la RPI, los siguientes pasos van a instalar git y descargar el repo en la carpeta */home/pi/*

	sudo apt-get install -y git 
	git clone https://github.com/AdrianSosaUV/pi-power-button.git

Ahora que ya tenemos el repositorio en nuestra RPI entramos en el.
	
	cd pi-power-button

Para instalar el programa basta con tipear el siguiente comando:
	
	bash instal.sh

Ahora viene lo mas dificil de todo el procedimiento, es decidir que botana nos acompañara durante el largo y tedioso tiempo de instalación (aprox 40 seg.) Solito hara todo lo necesario para instalar el programa y que quede a punto.

_nota:_

No te preocupes si tienes poco espacio o no quieres esta guia y las imagenes en tu RPI, el mismo archivo de instalación se encarga de borrarlo, si quieres tener la guia descargada solo vuelve a clonar el repo despues de instalar( de verdad no creo que quieras la guia, pero cada quién xD)

si por alguna razon necesitas modificar el pin donde lo conectas por que ocupas ese pin o tienes una pantalla *lcd* conectada y ocupa esos pines no te preocupes aquí puedes ver como editar el código:
Basta con escribir el siguiente comando 

	sudo nano /usr/local/bin/shutdown_button.py

y modificar la 6ta linea del código (esta marcada con un comentario), ahi pones el pin (consultar documentación) que desees utilizar, el otro pin es una tierra, hay varias en todo el *GPIO* puedes usar la que este libre (el pin 39 casi siempre esta libre, es GND), ahi depende de ti.

### Uso del servicio

el programa lo unico que hace es prender y apagar la *RPI*, no hay que hacerle mucho (solo es un botón), pero es un buen momento para ver como manejar los _servicios_ o _Demonios_ de los sistemas linux.

Aqui dejo algunos comandos para que comiences a probar:

| Comando        | Descripción    | 
| :------------- | :----------: |
|  		start 	 | Start Service  |
| 		stop     | Stop Service |
|  		status   | Service Status  |
| 	is-enabled   | Whether the service is activated at boot |
|  		enable   | Active start the service  |
| 		disable  | Disables the startup service |


_nota:_

Algunos servicios son muy importantes, si jugamos con alguno elemental podriamos hacer que la *RPI* deje de funcionar ( nada del otro mundo solo basta con volver a cargar *Raspbian* a la sd y listo), mi remomendación es solo jugar con el que creamos en este tutorial (*shutdown_button*), si lo hechamos a perder basta con correr los archivos de desinstalación y volverlo a instalar.

### Desintalación

Si quieres desintalarlo es muy simple, basta con ejecutar el siguiente comando de la carpeta pi-power-button:

	bash uninstal.sh

y listo, se desinstala solito, solo queda la carpeta pi-power-button con tres archivos install, unsintall y LICENCE.
Si aun asi te quieres deshacerte de todo esto bastara con borrar la carpeta con el siguiente comando:

	sudo rm -r -f pi-power-button

__________________________________

tome como referencia esta [guia](https://howchoo.com/g/mwnlytk3zmm/how-to-add-a-power-button-to-your-raspberry-pi), y me modifique un monton de cosas.

Hice esta guía a petición de un usuario de instagram: [Álvaro Otero](https://www.instagram.com/alvarotero_007/)
Espero te sirva a ti y a mucha gente! 

