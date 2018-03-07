#!/bin/bash
echo "Downloading latest Nexus 3 build for Unix"
wget --quiet https://download.sonatype.com/nexus/3/latest-unix.tar.gz
echo "Uncompressing"
tar xf latest-unix.tar.gz
VERSION=$(ls -d nexus-* |cut -d '-' -f 2-)
NAME=${VERSION/-/.}
echo "Creating RPM for ${VERSION}"
/usr/local/bin/fpm -s dir -t rpm -n nexus -v $NAME nexus-$VERSION/=/var/lib/nexus/nexus-$VERSION sonatype-work/=/var/lib/nexus/sonatype-work-$VERSION
echo "Copy RPM out of container with command 'docker cp rpmbuilder:/build/nexus-${NAME}-1.x86_64.rpm ./'"


