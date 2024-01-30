pkg_name="xz"
pkg_version="5.4.5"
pkg_depends="glibc"
pkg_description="Library and command line tools for XZ and LZMA compressed files."

pkg_src="https://tukaani.org/xz/xz-$pkg_version.tar.xz"
pkg_src_dir="xz-$pkg_version"

pkg_build() {
    ./configure --prefix=/usr
    make
    make DESTDIR=$1 install
}