ARG SAG_HOME=/opt/softwareag
ARG ACCE_VERSION=10.2.0.2
ARG ACCE_LIBRARY_VERSION=10.2

# Docker Mulit-stage build

# First our builder image that does the download of Apama Core (some base images have to have curl added here)
FROM resin/rpi-raspbian:jessie as acce_build
ARG SAG_HOME
ARG ACCE_VERSION

# Get/download the compressed archive of Apama Core Community Edition, and unzip it

RUN \
    ACCE_BASE_URL=https://downloads.apamacommunity.com/apama-core/${ACCE_VERSION} && \
    ACCE_TGZ_FILE=apama_core_${ACCE_VERSION}_armv7_linux.tar.gz && \
    ACCE_INSTALL_FOLDER=${SAG_HOME} && \
    mkdir $ACCE_INSTALL_FOLDER && \
    curl -s $ACCE_BASE_URL/$ACCE_TGZ_FILE | tar -xvz -C $ACCE_INSTALL_FOLDER 


# Now make the real image (for some images that does not include the extra 14MB of curl and dependencies)
FROM resin/rpi-raspbian:jessie
ARG SAG_HOME
ARG ACCE_VERSION
ARG ACCE_LIBRARY_VERSION

LABEL \
    name="Apama Core Community Edition" \
    arch="armv7hf" \
    base="resin/rpi-raspbian:jessie" \
    maintainer="Kev Palfreyman (@kpalf)" \
    build-date="20180526" \
    version=${ACCE_VERSION}

# Get/download the compressed archive of Apama Core Community Edition, and unzip it
COPY --from=acce_build ${SAG_HOME} ${SAG_HOME}

# Set environment variables inside the image
ENV \
    SAG_HOME=${SAG_HOME} \
    APAMA_HOME=${SAG_HOME}/Apama \
    APAMA_WORK=/apama_work \
    APAMA_LIBRARY_VERSION=${ACCE_LIBRARY_VERSION} \
    APAMA_PLATFORM=armv7_linux \
    PATH=${SAG_HOME}/Apama/bin:$PATH \
    LD_LIBRARY_PATH=${SAG_HOME}/Apama/lib:${SAG_HOME}/Apama/../common/security/openssl/lib:$LD_LIBRARY_PATH 


WORKDIR ${APAMA_WORK}

# Standard server port for the correlator CEP/Streaming-Analytics engine
EXPOSE 15903

# Primary binary for the CEP/Streaming-Analytics engine, but the image also 
# contains the standard tools such as engine_inject, engine_send, etc
CMD ["correlator"]
