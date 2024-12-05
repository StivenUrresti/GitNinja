#!/bin/bash

# Descargar el paquete .deb de GitNinja
echo "Descargando GitNinja..."
curl -fsSL https://github.com/StivenUrresti/GitNinja/raw/master/apt-repo/git-ninja.deb -o git-ninja.deb

# Instalar el paquete .deb
echo "Instalando GitNinja..."
sudo dpkg -i git-ninja.deb

# Corregir dependencias si es necesario
echo "Corrigiendo dependencias..."
sudo apt --fix-broken install -y

# Preguntar al usuario qué terminal está utilizando
echo "¿Qué shell estás usando? (1) Bash, (2) Zsh"
read -p "Selecciona 1 para Bash o 2 para Zsh: " shell_choice

# Configurar el alias según el shell seleccionado
if [ "$shell_choice" -eq 1 ]; then
  echo "Configurando alias para Bash..."
  echo "alias git-ninja='/usr/local/bin/git-ninja.sh'" >> ~/.bashrc
  source ~/.bashrc
elif [ "$shell_choice" -eq 2 ]; then
  echo "Configurando alias para Zsh..."
  echo "alias git-ninja='/usr/local/bin/git-ninja.sh'" >> ~/.zshrc
  source ~/.zshrc
else
  echo "Selección no válida. No se configurará el alias."
fi

# Limpiar el archivo .deb descargado
rm git-ninja.deb

# Mensaje de confirmación
echo "GitNinja instalado correctamente."
echo "Puedes usar el comando 'git-ninja' para comenzar a usar la herramienta."

