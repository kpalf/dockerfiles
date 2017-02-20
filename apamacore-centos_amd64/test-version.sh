#!/bin/sh
docker run --rm kpalf/apamacore:centos_amd64 correlator --version
docker tag kpalf/apamacore:centos_amd64 kpalf/apamacore:9.12.0.3_centos_amd64