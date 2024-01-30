export CC="gcc"
export CFLAGS="-O2 -Wall -Wextra"
export CXXFLAGS="$CFLAGS"
export MAKEFLAGS="-j`nproc`"

XZ_FLAGS="-e9 -T`nproc`"
ARCH=`uname -m`