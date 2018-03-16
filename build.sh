#!/bin/bash
VER=$1
VER=${VER:='3.9.0-01'}
docker run -it -e DOWNLOAD_VERSION=$VER --name rpmbuilder alastairhm/nexusrpm:latest

