# DeepStream Docker Setup 🚀

Este repositorio proporciona un `Dockerfile` y scripts para crear un entorno basado en DeepStream 7.0 con soporte de Python. Esta configuración permite utilizar las capacidades de procesamiento de video acelerado por GPU de NVIDIA, incluyendo la instalación de plugins de GStreamer y bindings de Python necesarios para aplicaciones avanzadas de análisis de video.

## 🛠️ Requisitos

- [Docker](https://docs.docker.com/get-docker/) y [NVIDIA Container Toolkit](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html)
- CUDA 12.4 o superior
- Una GPU NVIDIA compatible con los drivers necesarios instalados.
- **Servidor X** habilitado para visualización gráfica.
- **WSL2** con soporte para GPU NVIDIA, si estás usando un entorno de Windows.

## 🚀 Instrucciones de Uso

1. **Clonar el Repositorio y Cambiar a la Rama `deepstream-7-python-dev`**:

    ```bash
    git clone https://github.com/cesarcherre848/deepstream-images.git
    cd deepstream-docker
    git checkout deepstream-7-python-dev
    ```

2. **Dar Permisos de Ejecución al Script `build_image`**:

    ```bash
    chmod +x build_image
    ```

    Esto asegura que el script tenga permisos de ejecución antes de ejecutarlo.

3. **Construir la Imagen Docker**:

    Ejecuta el script `build_image` para crear la imagen:

    ```bash
    ./build_image
    ```

    Este script configura el entorno `DISPLAY`, construye la imagen `deepstream-7-dev` y verifica el éxito de la construcción.

4. **Ejecutar el Contenedor**:

    Utiliza el siguiente comando para iniciar el contenedor:

    ```bash
    docker run -it --rm --net=host --gpus all -e DISPLAY=$DISPLAY \
        -v /tmp/.X11-unix/:/tmp/.X11-unix \
        -v "$(pwd)":/home \
        deepstream-7-dev
    ```

    > **Nota**: `$(pwd)` es un ejemplo que monta el directorio actual; puedes reemplazarlo con cualquier ruta que desees.

## 📂 Archivos Importantes

- **Dockerfile**: Configuración base para la imagen Docker con DeepStream 7.0.
- **Scripts de instalación**: `install_gst_python.sh` y `install_bindings.sh` instalan GStreamer y los bindings de Python.
- **`requirements.txt`**: Lista de dependencias de Python necesarias.

## 📧 Contacto

Para preguntas o sugerencias, abre un issue o contacta a través de [GitHub](https://github.com/cesarcherre848).

---

¡Gracias por utilizar este proyecto! 🎉
