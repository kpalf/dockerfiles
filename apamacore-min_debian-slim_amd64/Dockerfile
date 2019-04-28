ARG SAG_HOME=/opt/softwareag
ARG ACCE_VERSION=10.3.1.1
ARG ACCE_LIBRARY_VERSION=10.3

# Docker Mulit-stage build

# First our builder image that has curl added to it and does the download of Apama Core
FROM kpalf/apamacore:${ACCE_VERSION}_experimental-debian-slim_amd64 as acce_build
ARG SAG_HOME
ARG APAMA_HOME=${SAG_HOME}/Apama
ARG ACCE_VERSION

# Start REMOVING unnecessary files from the interim builder image
RUN rm -r ${SAG_HOME}/Release_Notes.pdf && \
    rm -r ${SAG_HOME}/3rdPartyLicenses.pdf && \
    rm -r ${SAG_HOME}/common/lib && \
    rm -r ${APAMA_HOME}/monitors/R && \
    rm -r ${APAMA_HOME}/lib/rpath && \
    rm -r ${APAMA_HOME}/lib/libRPlugin.* && \
    rm -r ${APAMA_HOME}/monitors/*JMS*.mon && \
    rm -r ${APAMA_HOME}/monitors/EDAUtils.mon && \
    rm -r ${APAMA_HOME}/monitors/matlab && \
    rm -r ${APAMA_HOME}/monitors/query_support && \
    rm -r ${APAMA_HOME}/utilities && \
    rm -r ${APAMA_HOME}/include && \
    rm -r ${APAMA_HOME}/lib/*.jar && \
    rm -r ${APAMA_HOME}/third_party && \
    rm -r ${APAMA_HOME}/bin/pysys ${APAMA_HOME}/bin/pysys.py && \
    rm -r ${APAMA_HOME}/bin/engine_debug && \
    rm -r ${APAMA_HOME}/bin/epl_coverage && \
    rm -r ${APAMA_HOME}/connectivity/bundles

# Strip the binaries
USER root
RUN apt-get update && apt-get install -y binutils
RUN strip ${APAMA_HOME}/bin/* || true && strip ${APAMA_HOME}/lib/*.so* && strip ${SAG_HOME}/common/security/openssl/lib/*.so*




# Now make the real image that does not include 14MB of curl and dependencies
# next (9.5) == Buster (testing)
# 9 == Stretch (current stable)
# 8 == Jessie (obsolete stable) ** used here **
# 7 == Wheezy (obsolete stable)
# 6 == Squeeze (obsolete stable)
FROM debian:stretch-slim
ARG SAG_HOME
ARG APAMA_HOME=${SAG_HOME}/Apama
ARG APAMA_WORK=/apama_work
ARG ACCE_VERSION
ARG ACCE_LIBRARY_VERSION

LABEL \
    name="Experimental MINIMAL Apama Core Community Edition" \
    arch="x86-64" \
    base="debian:stretch-slim" \
    maintainer="Kev Palfreyman (@kpalf)" \
    build-date="20190428" \
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
