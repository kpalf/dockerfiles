# (Unofficial) Apama Core Community Edition on Microsoft Windows Server Nano Server 
**Experimental** Dockerfile for an _unofficial_ Apama Core Community Edition on a Microsoft Windows Server Nano Server (simply referred to as "nanoserver") base image for Windows Containers

## Images and tags
The image can be found on DockerHub as specific tags on the kpalf/apamacore repo.  The images there are for a mix of architectures and Operating Systems, so please carefully choose he correct tag.

Lookup the tags at: https://hub.docker.com/r/kpalf/apamacore/tags/


## Base image
Windows Server Nano Server has undergone significant changes since first release.  The first LTS or GA release is known as "10.0.14393.<build-number>" and is around 400MB.
However, the ones we want are the smaller ones that started with the "Fall Creators Update" or "1709", with tags "1709_KB<knowledge-base-id>".  These started nice and small at 93MB, but have grown with each monthly update - the Jan 2018 is 124MB.


## Building
The nanoserver:1709 version is nice and small due to removal of things like Windows Powershell, but that makes downloading and extracting remote archives tricky when building the image from the Dockerfile.

This Dockerfile will be improved in future (e.g. multi-stage), but for now it assumes the Apama Core archive has been downloaded and extracted on the host filesytem alongside the Dockerfile.

## Licenses
Please refer to the following URL for terms for the Microsoft nanoserver base image:
https://hub.docker.com/r/microsoft/nanoserver/

Please refer to the following URL for terms for the Apama Core Community Edition:
http://www.apamacommunity.com/terms-conditions/
And also, that link will normally be presenting the Software AG general license, and the primary difference from the commercial version is highlighted in "PART F: PRODUCT SPECIFIC TERMS for Apama Core Community Edition".

