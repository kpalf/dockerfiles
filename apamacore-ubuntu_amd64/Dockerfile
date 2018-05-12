ARG SAG_HOME=/opt/softwareag
ARG ACCE_VERSION=10.2.0.1

# Docker Mulit-stage build

# First our builder image that has curl added to it and does the download of Apama Core
FROM ubuntu:18.04 as acce_build
ARG SAG_HOME
ARG ACCE_VERSION

# Get/download the compressed archive of Apama Core Community Edition, and unzip it
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*
RUN \
    ACCE_BASE_URL=https://downloads.apamacommunity.com/apama-core/${ACCE_VERSION} && \
    ACCE_TGZ_FILE=apama_core_${ACCE_VERSION}_amd64_linux.tar.gz && \
    ACCE_INSTALL_FOLDER=${SAG_HOME} && \
    mkdir $ACCE_INSTALL_FOLDER && \
    curl -s $ACCE_BASE_URL/$ACCE_TGZ_FILE | tar -xvz -C $ACCE_INSTALL_FOLDER 


# Now make the real image that does not include 14MB of curl and dependencies
FROM ubuntu:18.04
ARG SAG_HOME
ARG ACCE_VERSION

LABEL \
    name="Apama Core Community Edition" \
    arch="x86-64" \
    base="ubuntu:18.04" \
    maintainer="Kev Palfreyman (@kpalf)" \
    build-date="20180512" \
    version=${ACCE_VERSION}

# Get/download the compressed archive of Apama Core Community Edition, and unzip it
COPY --from=acce_build ${SAG_HOME} ${SAG_HOME}

# Set environment variables inside the image
ENV \
    APAMA_HOME=${SAG_HOME}/Apama \
    PATH=${SAG_HOME}/Apama/bin:$PATH \
    LD_LIBRARY_PATH=${SAG_HOME}/Apama/lib:${SAG_HOME}/Apama/../common/security/openssl/lib:$LD_LIBRARY_PATH 

# Standard server port for the correlator CEP/Streaming-Analytics engine
EXPOSE 15903

# Primary binary for the CEP/Streaming-Analytics engine, but the image also 
# contains the standard tools such as engine_inject, engine_send, etc
CMD ["correlator"]
