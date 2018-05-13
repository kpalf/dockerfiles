# This dockerfile utilizes components licensed by their respective owners/authors.
# Prior to utilizing this file or resulting images please review the respective licenses 
# at: 
#   http://www.apamacommunity.com/terms-conditions/
#   http://documentation.softwareag.com/legal/general_license.txt
#   https://hub.docker.com/r/microsoft/nanoserver/

ARG SAG_HOME=C:\\SoftwareAG
ARG ACCE_VERSION=10.2.0.1
ARG ACCE_LIBRARY_VERSION=10.2

#####################################################################
# Docker Multi-stage build

#####################################################################
# First our builder image that does the download of Apama Core
FROM microsoft/nanoserver:1803 as acce_build
ARG SAG_HOME
ARG ACCE_VERSION

# Get/download the compressed archive of Apama Core Community Edition, and unzip it
RUN \
    mkdir %SAG_HOME% && \ 
    curl -s https://downloads.apamacommunity.com/apama-core/%ACCE_VERSION%/apama_core_%ACCE_VERSION%_amd64_win.zip \
       | tar -xvf - -C %SAG_HOME% 


#####################################################################
# Now make the real image that will be pushed to the registry
FROM microsoft/nanoserver:1803
ARG SAG_HOME
ARG ACCE_VERSION
ARG ACCE_LIBRARY_VERSION

LABEL \
    name="Apama Core Community Edition" \
    arch="x86-64" \
    base="microsoft/nanoserver:1803" \
    maintainer="Kev Palfreyman (@kpalf)" \
    build-date="20180513" \
    version=${ACCE_VERSION}

# Set environment variables inside the image
ENV \
    APAMA_HOME=${SAG_HOME}\\Apama \
    APAMA_WORK=C:\\ApamaWork \
    APAMA_LIBRARY_VERSION=${ACCE_LIBRARY_VERSION} \
    APAMA_PLATFORM=amd64-win


# Copy the unzipped Apama Core Community Edition, from the first-stage interim builder image
COPY --from=acce_build ${SAG_HOME} ${SAG_HOME}

WORKDIR ${APAMA_WORK}
RUN setx PATH %PATH%;%APAMA_HOME%\bin;%APAMA_HOME%\..\common\security\openssl\bin 


# Standard server port for the correlator CEP/Streaming-Analytics engine
EXPOSE 15903

# Primary binary for the CEP/Streaming-Analytics engine, but the image also 
# contains the standard tools such as engine_inject, engine_send, etc
CMD ["correlator"]
