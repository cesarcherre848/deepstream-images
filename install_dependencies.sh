#!/bin/bash


# Instalar todas las dependencias necesarias
echo "Installing required dependencies..."
sudo apt-get install -y \
    python3-gi python3-dev python3-gst-1.0 python-gi-dev git meson \
    python3 python3-pip python3.10-dev cmake g++ build-essential libglib2.0-dev \
    libglib2.0-dev-bin libgstreamer1.0-dev libtool m4 autoconf automake \
    libgirepository1.0-dev libcairo2-dev

# Confirmación de instalación
if [ $? -eq 0 ]; then
    echo "All dependencies installed successfully."
else
    echo "Failed to install some dependencies."
    exit 1
fi
