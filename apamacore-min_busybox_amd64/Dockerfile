ARG SAG_HOME=/opt/softwareag
ARG ACCE_VERSION=10.3.1.1
ARG ACCE_LIBRARY_VERSION=10.3

# Docker Mulit-stage build

# This time, we're using our existing experimental MIN image based on Debian-slim as the starting point

# First our builder image that has curl added to it and does the download of Apama Core
FROM kpalf/apamacore-min:${ACCE_VERSION}_experimental-debian-slim_amd64 as acce_build
ARG SAG_HOME
ARG APAMA_HOME=${SAG_HOME}/Apama
ARG ACCE_VERSION

# REMOVING even more unnecessary files from the interim builder image 
# The below set only saves about 2MB out of a full busybox image of around 106MB (down to 104)
# This first set would save some of that, but not worth removing for the value they bring
#RUN rm -r ${APAMA_HOME}/bin/component_management* && \
#    rm -r ${APAMA_HOME}/bin/engine_* && \
#    rm -r ${APAMA_HOME}/bin/httpserver_passman && \
#    rm -r ${APAMA_HOME}/lib/libUMConnectivity* 

# These get 1MB (of the 2MB mentioned above), but really it's more cleaning up unnecessary files than space saving
RUN rm -r ${APAMA_HOME}/connectivity && \
    rm -r ${APAMA_HOME}/etc/* && \
    rm -r ${APAMA_HOME}/lib/libJMS* && \
    rm -r ${APAMA_HOME}/lib/libapiaf*   




# Most of the size is in just a few files:
# 40 MB bin/correlator
# 27 MB lib/libicudata.so* 
#  8 MB lib/libapclient.so*
# then we're into files between 2-3MB: 
#   common/security/openssl/lib/libcrypto.so.*
#   lib/libicui18n.so*
#   lib/libPocoFoundation.so.*
# then 4 files between 1-2MB
# everything else in less than 1MB



# Now make the real image that is just our minimal bits on top of busybux
FROM busybox:1.30-glibc
ARG SAG_HOME
ARG APAMA_HOME=${SAG_HOME}/Apama
ARG APAMA_WORK=/apama_work
ARG ACCE_VERSION
ARG ACCE_LIBRARY_VERSION

LABEL \
    name="Experimental MINIMAL BusyBox (debian glibc) Apama Core Community Edition" \
    arch="x86-64" \
    base="busybox:1.30-glibc" \
    maintainer="Kev Palfreyman (@kpalf)" \
    build-date="20190518" \
    version=${ACCE_VERSION}

# Set the shell and create user identical to the official SAG images
#SHELL ["/bin/bash", "-c"]
#RUN groupadd -g 1724 sagadmin && useradd -d /opt/softwareag --no-create-home -g 1724 -u 1724 sagadmin
RUN addgroup -g 1724 sagadmin 
RUN adduser -h /opt/softwareag -H -G sagadmin -u 1724 -D sagadmin

# Copy the unzipped Apama Core Community Edition from the "acce_build" interim image, with correct user:group
COPY --from=acce_build --chown=sagadmin:sagadmin ${SAG_HOME} ${SAG_HOME}

# Since BusyBox (debian glibc) is *so* minimal, we need some extra libs from debian
# These we determined by executing ldd against a correlator in the debian-slim image that we are copying from
COPY --from=acce_build /lib/x86_64-linux-gnu/libz.so.1 /lib/x86_64-linux-gnu/libz.so.1
COPY --from=acce_build /lib/x86_64-linux-gnu/librt.so.1 /lib/x86_64-linux-gnu/librt.so.1
COPY --from=acce_build /lib/x86_64-linux-gnu/libdl.so.2 /lib/x86_64-linux-gnu/libdl.so.2 
COPY --from=acce_build /usr/lib/x86_64-linux-gnu/libstdc++.so.6 /usr/lib/x86_64-linux-gnu/libstdc++.so.6 
COPY --from=acce_build /lib/x86_64-linux-gnu/libgcc_s.so.1  /lib/x86_64-linux-gnu/libgcc_s.so.1
COPY --from=acce_build /lib/x86_64-linux-gnu/libutil.so.1 /lib/x86_64-linux-gnu/libutil.so.1
#COPY --from=acce_build 


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

#RUN ldconfig

WORKDIR ${APAMA_WORK}
RUN chown sagadmin:sagadmin ${APAMA_WORK}

# Standard server port for the correlator CEP/Streaming-Analytics engine
EXPOSE 15903

# Primary binary for the CEP/Streaming-Analytics engine, but the image also 
# contains the standard tools such as engine_inject, engine_send, etc
USER sagadmin:sagadmin
CMD ["correlator"]

