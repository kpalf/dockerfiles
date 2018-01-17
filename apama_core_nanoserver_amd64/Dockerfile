# This dockerfile utilizes components licensed by their respective owners/authors.
# Prior to utilizing this file or resulting images please review the respective licenses 
# at: 
#   http://www.apamacommunity.com/terms-conditions/
#   http://documentation.softwareag.com/legal/general_license.txt
#   https://hub.docker.com/r/microsoft/nanoserver/

############################################################
# This Docker file assumes that the zip file:
#    https://downloads.apamacommunity.com/apama-core/10.1.0.1/apama_core_10.1.0.1_amd64_win.zip
# has been downloaded and extracted to folder named "apama_core_10.1.0.1_amd64_win" 
# alongside this Dockerfile
############################################################

FROM microsoft/nanoserver:1709

LABEL \
    name="Apama Core Community Edition" \
    arch="x86-64" \
    base="microsoft/nanoserver:1709" \
    maintainer="Kev Palfreyman (@kpalf)" \
    build-date="20180114"

# Set environment variables inside the image
ENV \
    APAMA_HOME=C:\\apamacce 

# Get/download the compressed archive of Apama Core Community Edition, and unzip it
### Can't do that yet so use local filesystem

# simple local filesystem copy for now (makes use of the WORKDIR)
WORKDIR /apamacce
COPY ./apama_core_10.1.0.1_amd64_win ./
RUN setx PATH %PATH%;%APAMA_HOME%\bin 


# Standard server port for the correlator CEP/Streaming-Analytics engine
EXPOSE 15903

# Primary binary for the CEP/Streaming-Analytics engine, but the image also 
# contains the standard tools such as engine_inject, engine_send, etc
CMD ["correlator"]
