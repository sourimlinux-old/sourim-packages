pkg_name="libunistring"
pkg_version="1.1"
pkg_depends="glibc"

pkg_src="https://ftp.gnu.org/gnu/libunistring/libunistring-$pkg_version.tar.xz"
pkg_src_dir="libunistring-$pkg_version"

pkg_build() {
    ./configure --prefix=/usr    \
                --disable-static \
                --docdir=/usr/share/doc/libunistring-$pkg_depends
    make
    make DESTDIR=$1 install
}