#!/bin/bash
DVER=${DOWNLOAD_VERSION:=latest}
TARGET=${TARGET_PACKAGE:=rpm}
LOCATION=${INSTALL_DIR:=/var/lib/nexus}
echo "Downloading ${DVER} Nexus 3 build for Unix, target package type ${TARGET}"
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
/usr/local/bin/fpm -s dir -t $TARGET -n nexus -v $NAME nexus-$VERSION/=$LOCATION/nexus-$VERSION sonatype-work/=$LOCATION/sonatype-work
FILE=$(ls nexus*$TARGET)
echo "Copy RPM out of container with command 'docker cp rpmbuilder:/build/${FILE} ./'"

