pkg_name="tar"
pkg_version="1.35"
pkg_depends="glibc acl"
pkg_description="Utility for tar archives"

pkg_src="https://ftp.gnu.org/gnu/tar/tar-$pkg_version.tar.xz"
pkg_src_dir="tar-$pkg_version"

pkg_build() {
    FORCE_UNSAFE_CONFIGURE=1 ./configure --prefix=/usr
    make
    make install DESTDIR=$1/
}