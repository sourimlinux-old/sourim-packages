pkg_name="pcre2"
pkg_version="10.42"
pkg_depends="glibc bzip2 readline zlib"

pkg_src="https://github.com/PCRE2Project/pcre2/releases/download/pcre2-$pkg_version/pcre2-$pkg_version.tar.bz2"
pkg_src_dir="pcre2-$pkg_version"

pkg_build() {
    ./configure --prefix=/usr                       \
                --docdir=/usr/share/doc/pcre2-$pkg_version \
                --enable-unicode                    \
                --enable-jit                        \
                --enable-pcre2-16                   \
                --enable-pcre2-32                   \
                --enable-pcre2grep-libz             \
                --enable-pcre2grep-libbz2           \
                --enable-pcre2test-libreadline      \
                --disable-static                    &&
    
    make
    make install DESTDIR=$1
}