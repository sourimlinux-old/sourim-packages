pkg_name="ncurses"
pkg_version="6.4-20230520"
pkg_depends="glibc"

pkg_src="https://anduin.linuxfromscratch.org/LFS/ncurses-$pkg_version.tar.xz"
pkg_src_dir="ncurses-$pkg_version"

pkg_build() {
    ./configure --prefix=/usr           \
                --mandir=/usr/share/man \
                --with-shared           \
                --without-debug         \
                --without-normal        \
                --with-cxx-shared       \
                --enable-pc-files       \
                --enable-widec          \
                --with-pkg-config-libdir=/usr/lib/pkgconfig
    make

    make DESTDIR=$PWD/dest install
    install -vm755 dest/usr/lib/libncursesw.so.6.4 $1/usr/lib
    rm -v dest/usr/lib/libncursesw.so.6.4
    sed -e 's/^#if.*XOPEN.*$/#if 1/' \
        -i dest/usr/include/curses.h
    cp -av dest/* $1/

    for lib in ncurses form panel menu ; do
        ln -sfv lib${lib}w.so $1/usr/lib/lib${lib}.so
        ln -sfv ${lib}w.pc    $1/usr/lib/pkgconfig/${lib}.pc
    done

    ln -sfv libncursesw.so $1/usr/lib/libcurses.so
    mkdir -pv $1/usr/share/doc/
    cp -v -R doc -T $1/usr/share/doc/ncurses-$pkg_version
}