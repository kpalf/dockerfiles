# EXPERIMENTAL (Unofficial) Apama Core Community Edition on Debian (Slim) Linux 
Dockerfile for an _unofficial_ Apama Core Community Edition on a Debian-slim base image. Currently this is with the Debian (9) Stretch-slim release. Purpose is to try to get smaller even than Ubuntu.


## Images and tags
The image can be found on DockerHub as specific tags on the `kpalf/apamacore` repo.  The images there are for a mix of architectures and Operating Systems, so please carefully choose the correct tag.

Lookup the tags at: https://hub.docker.com/r/kpalf/apamacore/tags/

You will also see tags for Apama Core on CentOS 7 for amd64, Ubuntu for amd64, a couple of Windows Server Nano Server base images  for amd64 (1809, 1803, and historically 1709), and Raspbian for ARMv7hf so please be careful.

For example, for the debian-slim (amd64) base initially there will be the following tagged image that you can pull with the following command:
```
docker pull kpalf/apamacore:10.3.0.1_experimental-debian-slim_amd64
```

## User ID
Note that since version 10.3 these images now specify that the file and process ownership within the images is sagadmin:sagadmin, in order to more closely match the way that the official SAG images would be used.

## Unofficial
This is an unofficial, community-member contribution only.  
Use at your own risk.

At the time of writing, the only "official" distribution of Apama by Software AG as a pre-built Docker image are those on a linux CentOS:7 (amd64) base image and distributed (free) on DockerStore: https://store.docker.com/images/apama-correlator

Those "official" images on DockerStore (apama-correlator and apama-builder) are much larger than these Apama Core Community Edition images as the offial ones contain not only client APIs to allow Apama to interact with other Software AG products (e.g. TerracottaDB, Universal Messaging, Digital Event Services, Cumulocity) but also large third-parties such as a JVM.

## Apama Community
To find out more about Apama, access full documentation, and download the distribution and samples, visit http://www.apamacommunity.com


## Base image
The base image is "debian:stretch-slim" ("stretch" == 9 == "stable").
At the time of writing (Oct 2018) Stretch-slim was 22MB, which is smaller than Buster-slim at 26MB (buster==testing==9.5)



## Licenses
Please refer to the following URL for terms for the Apama Core Community Edition:
http://www.apamacommunity.com/terms-conditions/
And also, that link will normally be presenting the Software AG general license, and the primary difference from the commercial version is highlighted in "PART F: PRODUCT SPECIFIC TERMS for Apama Core Community Edition".

