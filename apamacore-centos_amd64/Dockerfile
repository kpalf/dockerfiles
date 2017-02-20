from centos:7

LABEL \
    name="Apama Core Community Edition" \
    arch="x86-64" \
    base="centos:7" \
    maintainer="Kev Palfreyman (@kpalf)" \
    build-date="20170219"

# Get/download the compressed archive of Apama Core Community Edition, and unzip it
RUN \
    ACCE_BASE_URL="https://downloads.apamacommunity.com/apama-core/9.12.0.3" && \
    ACCE_TGZ_FILE="apama_core_9.12.0.3_amd64_linux.tar.gz" && \
    ACCE_INSTALL_FOLDER="/opt/apamacce" && \
    mkdir $ACCE_INSTALL_FOLDER && \
    curl -s $ACCE_BASE_URL/$ACCE_TGZ_FILE | tar -xvz -C $ACCE_INSTALL_FOLDER 

# Set environment variables inside the image
ENV \
    APAMA_HOME=/opt/apamacce \
    PATH=/opt/apamacce/bin:$PATH \
    LD_LIBRARY_PATH=/opt/apamacce/lib:$LD_LIBRARY_PATH 

# Standard server port for the correlator CEP/Streaming-Analytics engine
EXPOSE 15903

# Primary binary for the CEP/Streaming-Analytics engine, but the image also contains the standard tools such as engine_inject, engine_send, etc
CMD ["correlator"]
