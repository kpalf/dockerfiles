# (Unofficial) Apama Core Community Edition on Ubuntu Linux 
Dockerfile for an _unofficial_ Apama Core Community Edition on a Ubuntu base image. Initially this is with the Ubuntu 18.04 LTS release.  The Ubuntu base image used to be quite large but as of 18.04 are significantly smaller than the CentOS 7 (7.4) base images.

## Images and tags
The image can be found on DockerHub as specific tags on the `kpalf/apamacore` repo.  The images there are for a mix of architectures and Operating Systems, so please carefully choose the correct tag.

Lookup the tags at: https://hub.docker.com/r/kpalf/apamacore/tags/

You will also see tags for Apama Core on CentOS 7 for amd64, a couple of Windows Server Nano Server base images  for amd64 (1803, and historically 1709), and Raspbian for ARMv7hf so please be careful.

For example, for the Ubuntu (amd64) base initially there will be the following tagged image that you can pull with the following command:
```
docker pull kpalf/apamacore:10.2.0.2_ubuntu_amd64
```

## Unofficial
This is an unofficial, community-member contribution only.  
Use at your own risk.

At the time of writing, the only "official" distribution of Apama by Software AG as a pre-built Docker image was the one on a linux CentOS:7 (amd64) base image and distributed (free) on DockerStore: https://store.docker.com/images/apama-correlator

## Apama Community
To find out more about Apama, access full documentation, and download the distribution and samples, visit http://www.apamacommunity.com


## Base image
The base image is "ubuntu:18.04", which at the time of writing is Ubuntu version 18.04 ("bionic")


## Licenses
Please refer to the following URL for terms for the Apama Core Community Edition:
http://www.apamacommunity.com/terms-conditions/
And also, that link will normally be presenting the Software AG general license, and the primary difference from the commercial version is highlighted in "PART F: PRODUCT SPECIFIC TERMS for Apama Core Community Edition".

