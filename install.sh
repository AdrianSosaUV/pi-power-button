#! /bin/sh

set -e 

echo "==>> Instalando Botón de encendido <<==\n"
echo "#!/usr/bin/python

import RPi.GPIO as GPIO
import subprocess

# modificar esta variable en caso de necesitarlo
PIN = 3

GPIO.setmode(GPIO.BCM)
GPIO.setup(PIN, GPIO.IN, pull_up_down=GPIO.PUD_UP)
GPIO.wait_for_edge(PIN, GPIO.FALLING)

subprocess.call(['shutdown', '-h', 'now'], shell=False)
" >> ~/shutdown_button.py 

sudo mv ~/shutdown_button.py /usr/local/bin/
sudo chmod +x /usr/local/bin/shutdown_button.py


echo '#! /bin/sh
 
### BEGIN INIT INFO
# Provides:          shutdown_button.py
# Required-Start:    $remote_fs $syslog
# Required-Stop:     $remote_fs $syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
### END INIT INFO

NAME=shutdown_button
DESC="Servicio de boton de Inicio/apagado"
PIDFILE="/var/run/${NAME}.pid"
LOGFILE="/var/log/${NAME}.log"

DAEMON="/usr/bin/python"
DAEMON_OPTS="/usr/local/bin/shutdown_button.py"
 
START_OPTS="--start --background --make-pidfile --pidfile ${PIDFILE} --exec ${DAEMON} ${DAEMON_OPTS}"
STOP_OPTS="--stop --pidfile ${PIDFILE}"
 
test -x $DAEMON || exit 0
 
set -e
 
case "$1" in
    start)
        echo -n "Iniciando ${DESC}: "
        start-stop-daemon $START_OPTS >> $LOGFILE
        echo "$NAME."
        ;;
    stop)
        echo -n "Deteniendo $DESC: "
        start-stop-daemon $STOP_OPTS
        echo "$NAME."
        rm -f $PIDFILE
        ;;
    restart)
        echo -n "Restarting $DESC: "
        start-stop-daemon $STOP_OPTS
        sleep 1
        start-stop-daemon $START_OPTS >> $LOGFILE
        echo "$NAME."
        ;;
    *)
        N=/etc/init.d/$NAME
        echo "Comandos: $N {start|stop|restart}" >&2
        exit 1
        ;;
esac
 
exit 0
' >> ~/shutdown_button.sh 

sudo mv ~/shutdown_button.sh /etc/init.d/
sudo chmod +x /etc/init.d/shutdown_button.sh

echo "==>> Activando botón de encendido <<==\n"

sudo systemctl daemon-reload
sudo systemctl enable shutdown_button
sudo systemctl start shutdown_button

echo "==>> Limpiando instalación <<==\n"

PATH =$(pwd)
Full_PATH = "$PATH/pi-power-button"
cd $Full_PATH
sudo rm -r imagenes/
suro rm -f .gitignore README.md 


