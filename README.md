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

1. Primero creamos un simple circuito con los cables Dupont y el push button sobre el protoboard:

![Conexión Protoboard](https://raw.githubusercontent.com/AdrianSosaUV/pi-power-button/master/imagenes/protoboard.jpg)

1. Despues lo conectamos a dos terminales del GPIO ( no cualquiera, en la sección de Software estaran los pines disponibles), en mi caso utilize los pines 18 y 20 (GPIO 24 y GND respectivamente).

![Conexión GPIO](https://raw.githubusercontent.com/AdrianSosaUV/pi-power-button/master/imagenes/rpi-connect.jpg)

#### Opcional:

Si deseas puedes hacer un botón las estetico soldandolo y poniendole Thermofill, y ya lo acomodas a tu gusto!! ;)

![Botón Estetico](https://raw.githubusercontent.com/AdrianSosaUV/pi-power-button/master/imagenes/btn-finished.jpg)


## Software:

Esta es la parte interesante, aqui el archivo de instalacion creara un script de python que se encargara de dar la isntrucción de apagar la RPI cuando sea oprimido el botón y la reactivara cuando se oprima de nuevo, en si nunca se apaga, solo entra en un modo de ultra bajo consumo ( tipo hibernación).

	codigo bonito
		mas codigo bonito

