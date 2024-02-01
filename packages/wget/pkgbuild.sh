pkg_name="wget"
pkg_version="1.21.4"
pkg_depends="glibc openssl libidn2 libpsl pcre2 zlib util-linux libunistring"

pkg_src="https://ftp.gnu.org/gnu/wget/wget-$pkg_version.tar.gz"
pkg_src_dir="wget-$pkg_version"

pkg_build() {
    ./configure --prefix=/usr      \
                --sysconfdir=/etc  \
                --with-ssl=openssl
    make
    
    make install DESTDIR=$1
}