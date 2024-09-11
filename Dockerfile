FROM nvcr.io/nvidia/deepstream:7.0-samples-multiarch

# Otorgar permisos de ejecución a los scripts y ejecutarlos
RUN chmod +x /opt/nvidia/deepstream/deepstream/user_additional_install.sh \
    && chmod +x /opt/nvidia/deepstream/deepstream/update_rtpmanager.sh \
    && /opt/nvidia/deepstream/deepstream/user_additional_install.sh \
    && /opt/nvidia/deepstream/deepstream/update_rtpmanager.sh


# Copiar los scripts de instalación al contenedor
COPY install_gst_python.sh /opt/nvidia/deepstream/deepstream/install_gst_python.sh
COPY install_bindings.sh /opt/nvidia/deepstream/deepstream/install_bindings.sh

# Otorgar permisos de ejecución a los scripts y ejecutarlos
RUN chmod +x /opt/nvidia/deepstream/deepstream/install_gst_python.sh \
    && /opt/nvidia/deepstream/deepstream/install_gst_python.sh \
    && chmod +x /opt/nvidia/deepstream/deepstream/install_bindings.sh \
    && /opt/nvidia/deepstream/deepstream/install_bindings.sh


COPY requirements.txt /opt/nvidia/deepstream/deepstream/requirements.txt

RUN pip install -r requirements.txt

CMD ["/bin/bash"]