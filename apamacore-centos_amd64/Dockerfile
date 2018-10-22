ARG SAG_HOME=/opt/softwareag
ARG ACCE_VERSION=10.3.0.1
ARG ACCE_LIBRARY_VERSION=10.3

# Docker Mulit-stage build

# First our builder image that has curl added to it and does the download of Apama Core
FROM centos:7 as acce_build
ARG SAG_HOME
ARG ACCE_VERSION

# Get/download the compressed archive of Apama Core Community Edition, and unzip it

RUN \
    ACCE_BASE_URL=https://downloads.apamacommunity.com/apama-core/${ACCE_VERSION} && \
    ACCE_TGZ_FILE=apama_core_${ACCE_VERSION}_amd64_linux.tar.gz && \
    ACCE_INSTALL_FOLDER=${SAG_HOME} && \
    mkdir $ACCE_INSTALL_FOLDER && \
    curl -s $ACCE_BASE_URL/$ACCE_TGZ_FILE | tar -xvz -C $ACCE_INSTALL_FOLDER 


# Now make the real image that does not include 14MB of curl and dependencies
FROM centos:7
ARG SAG_HOME
ARG APAMA_HOME=${SAG_HOME}/Apama
ARG APAMA_WORK=/apama_work
ARG ACCE_VERSION
ARG ACCE_LIBRARY_VERSION

LABEL \
    name="Apama Core Community Edition" \
    arch="x86-64" \
    base="centos:7" \
    maintainer="Kev Palfreyman (@kpalf)" \
    build-date="20181022" \
    version=${ACCE_VERSION}

# Set the shell and create user identical to the official SAG images
SHELL ["/bin/bash", "-c"]
RUN groupadd -g 1724 sagadmin && useradd -d /opt/softwareag --no-create-home -g 1724 -u 1724 sagadmin

# Copy the unzipped Apama Core Community Edition from the "acce_build" interim image, with correct user:group
COPY --from=acce_build --chown=sagadmin:sagadmin ${SAG_HOME} ${SAG_HOME}

# Set environment variables inside the image
ENV \
    SAG_HOME=${SAG_HOME} \
    APAMA_HOME=${APAMA_HOME} \
    APAMA_WORK=${APAMA_WORK} \
    APAMA_LIBRARY_VERSION=${ACCE_LIBRARY_VERSION} \
    APAMA_PLATFORM=amd64_linux \
    PATH=${APAMA_HOME}/bin:$PATH \
    LD_LIBRARY_PATH=${APAMA_HOME}/lib:${APAMA_WORK}/lib:$LD_LIBRARY_PATH \
    PYTHONPATH=${APAMA_HOME}/third_party/python/lib/python3.6/site-packages

RUN ldconfig

WORKDIR ${APAMA_WORK}
RUN chown sagadmin:sagadmin ${APAMA_WORK}

# Standard server port for the correlator CEP/Streaming-Analytics engine
EXPOSE 15903

# Primary binary for the CEP/Streaming-Analytics engine, but the image also 
# contains the standard tools such as engine_inject, engine_send, etc
USER sagadmin:sagadmin
CMD ["correlator"]
