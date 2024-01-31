pkg_name="openssl"
pkg_version="3.2.0"
pkg_depends="glibc"
pkg_description="The Open Source toolkit for Secure Sockets Layer and Transport Layer Security"

pkg_src="https://www.openssl.org/source/openssl-$pkg_version.tar.gz"
pkg_src_dir="openssl-$pkg_version"

pkg_build() {
    ./config --prefix=/usr         \
            --openssldir=/etc/ssl \
            --libdir=lib          \
            shared                \
            zlib-dynamic
    make
    sed -i '/INSTALL_LIBS/s/libcrypto.a libssl.a//' Makefile
    make install DESTDIR=$1
}