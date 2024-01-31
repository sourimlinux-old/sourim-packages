pkg_name="libelf"
pkg_version="0.190"
pkg_depends="glibc bzip2 xz zlib zstd"

pkg_src="https://sourceware.org/ftp/elfutils/$pkg_version/elfutils-$pkg_version.tar.bz2"
pkg_src_dir="elfutils-$pkg_version"

pkg_build() {
    ./configure --prefix=/usr                \
                --disable-debuginfod         \
                --enable-libdebuginfod=dummy

    make
    make -C libelf install DESTDIR=$1
    install -vm644 config/libelf.pc $1/usr/lib/pkgconfig
    rm $1/usr/lib/libelf.a
}
