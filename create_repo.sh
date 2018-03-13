#!/bin/bash
DVER=${DOWNLOAD_VERSION:=latest}
echo "Downloading ${DVER} Nexus 3 build for Unix"
if [[ $DVER == 'latest' ]]
then
	wget --quiet https://download.sonatype.com/nexus/3/latest-unix.tar.gz
else
	wget --quiet https://download.sonatype.com/nexus/3/nexus-$DVER-unix.tar.gz
fi
echo "Uncompressing"
tar xf *-unix.tar.gz && rm -f *-unix.tar.gz
VERSION=$(ls -d nexus-* |cut -d '-' -f 2-)
NAME=${VERSION/-/.}
echo "Creating RPM for ${VERSION}"
/usr/local/bin/fpm -s dir -t rpm -n nexus -v $NAME nexus-$VERSION/=/var/lib/nexus/nexus-$VERSION sonatype-work/=/var/lib/nexus/sonatype-work
echo "Copy RPM out of container with command 'docker cp rpmbuilder:/build/nexus-${NAME}-1.x86_64.rpm ./'"


