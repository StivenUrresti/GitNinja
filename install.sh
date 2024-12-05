#!/bin/bash

# Descargar el paquete .deb de GitNinja
echo "Descargando GitNinja..."
curl -fsSL https://github.com/StivenUrresti/GitNinja/blob/master/apt-repo/GitNinja.deb

# Instalar el paquete .deb
echo "Instalando GitNinja..."
sudo dpkg -i git-ninja.deb

# Corregir dependencias si es necesario
echo "Corrigiendo dependencias..."
sudo apt --fix-broken install -y

# Limpiar el archivo .deb descargado
rm git-ninja.deb

echo "GitNinja instalado correctamente."
