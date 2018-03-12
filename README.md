# nexusrpm
Create a RPM package for installing Sonatype Nexus 3 Repository Manager

Run with

**Latest released version**
`docker run -it --name rpmbuilder alastairhm/nexusrpm:latest`

**Specify a version**
`docker run -it -e DOWNLOAD_VERSION=3.8.0-02 --name rpmbuilder alastairhm/nexusrpm:latest`
