#!/bin/bash

# Navegar al directorio de bindings de deepstream_python_apps
cd /opt/nvidia/deepstream/deepstream/sources/deepstream_python_apps/bindings

# Crear el directorio de compilación
mkdir -p build
cd build

# Ejecutar cmake y make para compilar los bindings
echo "Running cmake and make to build bindings..."
cmake ..
make -j$(nproc)

# Instalar los bindings compilados
echo "Installing DeepStream Python bindings..."
pip3 install ./pyds-1.1.11-py3-none*.whl

# Actualizar pip a la última versión
echo "Upgrading pip to the latest version..."
python3 -m pip install --upgrade pip

echo "DeepStream Python bindings installation completed."
