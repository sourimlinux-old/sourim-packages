pkg_name="libtirpc"
pkg_version="1.3.4"
pkg_depends="glibc"

pkg_src="https://downloads.sourceforge.net/libtirpc/libtirpc-$pkg_version.tar.bz2"
pkg_src_dir="libtirpc-$pkg_version"

pkg_build() {
    ./configure --prefix=/usr                                   \
                --sysconfdir=/etc                               \
                --disable-static                                \
                --disable-gssapi                                
    make
    make DESTDIR=$1 install
}