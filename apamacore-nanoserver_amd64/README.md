# (Unofficial) Apama Core Community Edition on Microsoft Windows Server Nano Server 
**Experimental** Dockerfile for an _unofficial_ Apama Core Community Edition on a Microsoft Windows Server Nano Server (simply referred to as "nanoserver") base image for Windows Containers.

## Images and tags
The image can be found on DockerHub as specific tags on the `kpalf/apamacore` repo.  The images there are for a mix of architectures and Operating Systems, so please carefully choose he correct tag.

Lookup the tags at: https://hub.docker.com/r/kpalf/apamacore/tags/

You will also see tags for Apama Core on other base images such as CentOS (amd64), Ubuntu (amd64), Raspbian (ARM32v7hf), so please be careful.

The first nanoserver image for this repository was using version 1709, but as new releases become available it's moved forward, for example with version 1803.
The nanoserver 1803 based image for Apama Core can be pulled with the following command:
```
docker pull kpalf/apamacore:10.3.0.1_nanoserver_amd64_1803
```

## User ID
Note that since version 10.3 the linux images now specify that the file and process ownership within the images is sagadmin:sagadmin, in order to more closely match the way that the official SAG images would be used.  However, with Windows containers that doesn't appear to be a common pattern, so the practice is not yet adopted here and processes will run as the standard windows "ContainerUser".

## Unofficial
This is an unofficial, experimental, community-member contribution only.  At the time of writing Apama Core Community Edition was only being tested by the its original creators (Software AG) on full Windows Server, but not on nanoserver, and not with Windows Containers.  That may change later.
Use at your own risk.

At the time of writing, the only "official" distribution of Apama by Software AG as a pre-built Docker image are those on a linux CentOS:7 (amd64) base image and distributed (free) on DockerStore: https://store.docker.com/images/apama-correlator

Those "official" images on DockerStore (apama-correlator and apama-builder) are much larger than these Apama Core Community Edition images as the offial ones contain not only client APIs to allow Apama to interact with other Software AG products (e.g. TerracottaDB, Universal Messaging, Digital Event Services, Cumulocity) but also large third-parties such as a JVM.

## Apama Community
To find out more about Apama, access full documentation, and download the distribution and samples, visit http://www.apamacommunity.com


## Base image
Windows Server Nano Server has undergone significant changes since first release.  The first LTS or GA release is known as `"10.0.14393.<build-number>"` and is around 400MB.
However, the ones we want are the smaller ones that started with the "Fall Creators Update" or "1709", with tags `"1709_KB<knowledge-base-id>"`, and later the "1803" release.  The 1709 release started nice and small at 93MB when it was first released, but have grown with each monthly update - the May 2018 is 132MB.  The first 1803 release in May 2018 was 115MB, and by October 2018 is 145MB.

To use the nanoserver 1709 image, and layered images such as this one, your host OS needs to be either Windows 10 (Fall Creators Update / 1709), or Windows Server version 1709.
To use the nanoserver 1803 image, and layered images such as this one, your host OS needs to be either Windows 10 (1803), or Windows Server version 1803.  The 1803 image might work on a 1709 host but is NOT recommended (I don't test this).

In future we will create a nanoserver 1809 image.

For more info on Windows Container version compatibility wee the following:
https://docs.microsoft.com/en-us/virtualization/windowscontainers/deploy-containers/version-compatibility


## Building
The nanoserver:1709 version is nice and small due to removal of things like Windows Powershell, but that makes downloading and extracting remote archives tricky when building the image from the Dockerfile. So building the earlier 1709 versions of this image needed the Apama Core archive to be downloaded and extracted on the host filesytem alongside the Dockerfile.  To see how this was done, look in the GitHub history of this repo.

Since nanoserver:1803 added curl and bsdtar, that meant that the Dockerfile could be improved to automatically download and extract the Apama Core archive as part of the build.

## Licenses
Please refer to the following URL for terms for the Microsoft nanoserver base image:
https://hub.docker.com/r/microsoft/nanoserver/

Please refer to the following URL for terms for the Apama Core Community Edition:
http://www.apamacommunity.com/terms-conditions/
And also, that link will normally be presenting the Software AG general license, and the primary difference from the commercial version is highlighted in "PART F: PRODUCT SPECIFIC TERMS for Apama Core Community Edition".

