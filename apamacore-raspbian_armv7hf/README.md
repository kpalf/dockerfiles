# (Unofficial) Apama Core Community Edition on Raspbian Linux for ARMv7hf 
Dockerfile for an _unofficial_ Apama Core Community Edition on a Raspbian base image for the 
ARMv7hf (and later) architecture, such as the *Raspberry Pi* Model B version 2, 3, or 3+.  

*Note:* Apama will _not_ run on less capable hardware such as the ARMv6 architecture in the Pi Zero/ZeroW or the older v1.

## Images and tags
The image can be found on DockerHub as specific tags on the `kpalf/apamacore` repo.  The images there are for a mix of architectures and Operating Systems, so please carefully choose he correct tag.

Lookup the tags at: https://hub.docker.com/r/kpalf/apamacore/tags/

You will also see tags for Apama Core on CentOS for amd64 (default), Ubuntu 18.10 for amd64, a couple of Windows Server Nano Server base images for amd64 (1809, 1803, and historically 1709), so please be careful.

For example, for the Raspbian (ARMv7hf) base there will be the following tagged image that you can pull with the following command:
```
docker pull kpalf/apamacore:10.3.1.1_raspbian_armv7hf
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
The base image is "balenalib/rpi-raspbian:jessie", (resin repo renamed to balenalib) but at some point I'll upgrade to "stretch".
The Raspbian base is actually armv6, but that ought to be OK as the OS direct from RaspberryPi.org is the same.
It's possible in future we might switch the base image from Raspbian (armv6hf) to Debian (armv7hf).

See the Docker Hub info on the base image: https://hub.docker.com/r/balenalib/rpi-raspbian
The base image is supplied and maintained by the good folks at https://www.balena.io/ (previosuly http://resin.io), see their
documentation for further details: https://www.balena.io/docs/reference/base-images/base-images/


## Licenses
Please refer to the following URL for terms for the Apama Core Community Edition:
http://www.apamacommunity.com/terms-conditions/
And also, that link will normally be presenting the Software AG general license, and the primary difference from the commercial version is highlighted in "PART F: PRODUCT SPECIFIC TERMS for Apama Core Community Edition".

