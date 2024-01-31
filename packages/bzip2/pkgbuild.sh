pkg_name="bzip2"
pkg_version="1.0.8"
pkg_depends="glibc"

pkg_src="https://www.sourceware.org/pub/bzip2/bzip2-$pkg_version.tar.gz"
pkg_src_dir="bzip2-$pkg_version"

pkg_build() {
    mkdir -pv $1/usr/{lib,bin}

    sed -i 's@\(ln -s -f \)$(PREFIX)/bin/@\1@' Makefile
    sed -i "s@(PREFIX)/man@(PREFIX)/share/man@g" Makefile

    make -f Makefile-libbz2_so
    make clean
    make
    make PREFIX=/usr DESTDIR=$1 install

    cp -av libbz2.so.* $1/usr/lib
    ln -sv libbz2.so.1.0.8 $1/usr/lib/libbz2.so

    cp -v bzip2-shared $1/usr/bin/bzip2
    for i in $1/usr/bin/{bzcat,bunzip2}; do
        ln -sfv bzip2 $i
    done
    rm -fv $1/usr/lib/libbz2.a
}