#!/bin/bash

# Actualizar los repositorios de paquetes y asegurarse de tener las herramientas necesarias
echo "Updating package repositories and installing initial dependencies..."
apt-get update
apt-get install -y python3-gi python3-dev python3-gst-1.0 python-gi-dev git meson \
    python3 python3-pip python3.10-dev cmake g++ build-essential libglib2.0-dev \
    libglib2.0-dev-bin libgstreamer1.0-dev libtool m4 autoconf automake \
    libgirepository1.0-dev libcairo2-dev apt-transport-https ca-certificates

# Actualizar los certificados CA
echo "Updating CA certificates..."
update-ca-certificates

# Clonar el repositorio deepstream_python_apps
echo "Cloning deepstream_python_apps repository..."
git clone https://github.com/NVIDIA-AI-IOT/deepstream_python_apps /opt/nvidia/deepstream/deepstream/sources/deepstream_python_apps

# Cambiar al directorio clonado
cd /opt/nvidia/deepstream/deepstream/sources/deepstream_python_apps/

# Actualizar los submódulos de git
echo "Updating git submodules..."
git submodule update --init

# Instalar dependencias adicionales necesarias para GStreamer
echo "Installing additional GStreamer dependencies..."
apt-get install -y libgstreamer-plugins-base1.0-dev

# Cambiar al directorio de gst-python y configurar meson
echo "Configuring Meson build for gst-python..."
cd 3rdparty/gstreamer/subprojects/gst-python/
meson setup build

# Compilar e instalar gst-python
echo "Building and installing gst-python..."
cd build
ninja
ninja install

echo "Installation completed successfully."
