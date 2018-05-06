# (Unofficial) Apama Core Community Edition on Raspbian Linux for ARMv7hf 
Dockerfile for an _unofficial_ Apama Core Community Edition on a Raspbian base image for the 
ARMv7hf (and later) architecture, such as the *Raspberry Pi* Model B version 2, 3, or 3+.  

*Note:* Apama will _not_ run on less capable hardware such as the ARMv6 architecture in the Pi Zero/ZeroW or the older v1.

## Images and tags
The image can be found on DockerHub as specific tags on the `kpalf/apamacore` repo.  The images there are for a mix of architectures and Operating Systems, so please carefully choose he correct tag.

Lookup the tags at: https://hub.docker.com/r/kpalf/apamacore/tags/

You will also see tags for Apama Core on CentOS for amd64 (default), and for Windows Server version 1709 Nano Server (amd64) base images, so please be careful.

For example, for the Raspbian (ARMv7hf) base initially there will be the following tagged image that you can pull with the following command:
```
docker pull kpalf/apamacore:10.2.0.1_raspbian_armv7hf
```

## Unofficial
This is an unofficial, community-member contribution only.  
Use at your own risk.

At the time of writing, the only "official" distribution of Apama by Software AG as a pre-built amd64 Docker image was the one on a linux CentOS:7 (amd64) base image and distributed (free) on DockerStore: https://store.docker.com/images/apama-correlator

## Apama Community
To find out more about Apama, access full documentation, and download the distribution and samples, visit http://www.apamacommunity.com


## Base image
The base image is "resin/rpi-raspbian:jessie", but at some point I'll upgrade to "stretch".
The Raspbian base is actually armv6, but that ought to be OK as the OS direct from RaspberryPi.org is the same.
It's possible in future we might switch the base image from Raspbian (armv6hf) to Debian (armv7hf).

See the Docker Hub info on the base image: https://hub.docker.com/r/resin/rpi-raspbian/
The base image is supplied and maintained by the good folks at http://resin.io, see their
documentation for further details: https://docs.resin.io/reference/base-images/resin-base-images/


## Licenses
Please refer to the following URL for terms for the Apama Core Community Edition:
http://www.apamacommunity.com/terms-conditions/
And also, that link will normally be presenting the Software AG general license, and the primary difference from the commercial version is highlighted in "PART F: PRODUCT SPECIFIC TERMS for Apama Core Community Edition".

