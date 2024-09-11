#!/bin/bash

# Establecer la variable DISPLAY y permitir acceso al servidor X
export DISPLAY=:0
xhost +

# Nombre de la imagen
IMAGE_NAME="deepstream-7-dev"

# Construir la imagen Docker
echo "Building Docker image: $IMAGE_NAME"
#docker build --no-cache -t $IMAGE_NAME .
docker build -t $IMAGE_NAME .

# Verificar si la imagen se construyó correctamente
if [ $? -eq 0 ]; then
    echo "Docker image $IMAGE_NAME built successfully."
else
    echo "Failed to build Docker image $IMAGE_NAME."
    exit 1
fi