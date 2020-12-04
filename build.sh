#!/bin/bash -eu

VERSION=$1
ARCHIVE=$PWD/sources/binutils-$VERSION.tar.bz2
INST=$PWD/inst/$VERSION

if [ ! -f "$ARCHIVE" ]
then
	cd sources
	(
		wget sourceware.org/pub/binutils/old-releases/binutils-$VERSION.tar.bz2 ||
		wget sourceware.org/pub/binutils/releases/binutils-$VERSION.tar.bz2
	)
	cd -
fi
ARCHIVE=$PWD/sources/binutils-$VERSION.tar.bz2

mkdir -p $INST
mkdir -p build

cd build
[ -e binutils-$VERSION ] || unar $ARCHIVE
cd binutils-$VERSION
export CFLAGS="-U_FORTIFY_SOURCE -w"
#./configure CFLAGS="$CFLAGS" || 
./configure
make || echo "BUILD ERRORS"
cp binutils/addr2line binutils/ar binutils/cxxfilt binutils/nm-new binutils/objcopy binutils/objdump binutils/ranlib binutils/readelf binutils/size binutils/strings binutils/strip-new $INST
