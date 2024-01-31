pkg_name="libidn2"
pkg_version="2.3.7"
pkg_depends="glibc libunistring"

pkg_src="https://ftp.gnu.org/gnu/libidn/libidn2-$pkg_version.tar.gz"
pkg_src_dir="libidn2-$pkg_version"

pkg_build() {
    ./configure --prefix=/usr --disable-static
    make
    make install DESTDIR=$1
}