# (Unofficial) Apama Core Community Edition on Microsoft Windows Server Nano Server 
**Experimental** Dockerfile for an _unofficial_ Apama Core Community Edition on a Microsoft Windows Server Nano Server (simply referred to as "nanoserver") base image for Windows Containers.

## Images and tags
The image can be found on DockerHub as specific tags on the `kpalf/apamacore` repo.  The images there are for a mix of architectures and Operating Systems, so please carefully choose he correct tag.

Lookup the tags at: https://hub.docker.com/r/kpalf/apamacore/tags/

You will also see tags for Apama Core on a CentOS base image, so please be careful.

For example, for the nanoserver base initially there will be the following tagged image that you can pull with the following command:
```
docker pull kpalf/apamacore:10.1.0.3_nanoserver_amd64_1709
```

## Unofficial
This is an unofficial, experimental, community-member contribution only.  At the time of writing Apama Core Community Edition was only being tested by the its original creators (Software AG) on full Windows Server, but not on nanoserver, and not with Windows Containers.  That may change later.
Use at your own risk.

At the time of writing, the only "official" distribution of Apama by Software AG as a pre-built Docker image was the one on a linux CentOS:7 (amd64) base image and distributed (free) on DockerStore: https://store.docker.com/images/apama-correlator

## Apama Community
To find out more about Apama, access full documentation, and download the distribution and samples, visit http://www.apamacommunity.com


## Base image
Windows Server Nano Server has undergone significant changes since first release.  The first LTS or GA release is known as `"10.0.14393.<build-number>"` and is around 400MB.
However, the ones we want are the smaller ones that started with the "Fall Creators Update" or "1709", with tags `"1709_KB<knowledge-base-id>"`.  These started nice and small at 93MB, but have grown with each monthly update - the Jan 2018 is 124MB.

To use the nanoserver 1709 image, and layered images such as this one, your host OS needs to be either Windows 10 (Fall Creators Update), or Windows Server version 1709.
For more info on Windows Container version compatibility wee the following:
https://docs.microsoft.com/en-us/virtualization/windowscontainers/deploy-containers/version-compatibility


## Building
The nanoserver:1709 version is nice and small due to removal of things like Windows Powershell, but that makes downloading and extracting remote archives tricky when building the image from the Dockerfile.

This Dockerfile will be improved in future (e.g. multi-stage), but for now it assumes the Apama Core archive has been downloaded and extracted on the host filesytem alongside the Dockerfile.


## Licenses
Please refer to the following URL for terms for the Microsoft nanoserver base image:
https://hub.docker.com/r/microsoft/nanoserver/

Please refer to the following URL for terms for the Apama Core Community Edition:
http://www.apamacommunity.com/terms-conditions/
And also, that link will normally be presenting the Software AG general license, and the primary difference from the commercial version is highlighted in "PART F: PRODUCT SPECIFIC TERMS for Apama Core Community Edition".

