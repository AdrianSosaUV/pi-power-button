#! /bin/sh

set -e

cd "$(dirname "$0")/.."

echo "==>> Deteniendo botón de encendido <<==\n"
sudo systemctl stop shutdown_button
sudo systemctl disable shutdown_button

echo "==>> Removiendo  botón de encendido <<==\n"
sudo rm /etc/init.d/shutdown_button.sh
sudo systemctl daemon-reload

echo "==>> Botón de encendido desinstalado<<==\n"
