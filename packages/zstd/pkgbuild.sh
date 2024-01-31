pkg_name="zstd"
pkg_version="1.5.5"
pkg_depends="glibc zlib xz"

pkg_src="https://github.com/facebook/zstd/releases/download/v$pkg_version/zstd-$pkg_version.tar.gz"
pkg_src_dir="zstd-$pkg_version"

pkg_build() {
    make prefix=/usr
    make prefix=/usr DESTDIR=$1 install
    rm -v $1/usr/lib/libzstd.a
}