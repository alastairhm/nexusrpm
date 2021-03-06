# nexusrpm
Create a RPM package for installing Sonatype Nexus 3 Repository Manager

Run with

**Latest released version**

`docker run -it --name rpmbuilder alastairhm/nexusrpm:latest`

**Specify a version**

`docker run -it -e DOWNLOAD_VERSION=3.8.0-02 --name rpmbuilder alastairhm/nexusrpm:latest`

**Build a deb package**

`docker run -it -e TARGET_PACKAGE=deb --name rpmbuilder alastairhm/nexusrpm:latest`

**Specify a loction**

`docker run -it -e INSTALL_DIR=/opt/nexus --name rpmbuilder alastairhm/nexusrpm:latest`

**Automatically copy output**

`docker run -it --rm -v $PWD:/output --name rpmbuilder alastairhm/nexusrpm:latest`

**Parameters**

DOWNLOAD_VERSION : optional, specify the version of Nexus to download, defaults to "latest" release.

TARGET_PACKAGE : optional, specify package type "rpm" or "deb", defaults to "rpm".

INSTALL_DIR : optional, specify the location you want to install Nexus, defaults to "/var/lib/nexus"
