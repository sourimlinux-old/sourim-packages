pkg_name="acl"
pkg_version="2.3.2"
pkg_depends="glibc attr"
pkg_description="Access control list utilities, libraries and headers"

pkg_src="https://mirror.downloadvn.com/nongnu/acl/acl-$pkg_version.tar.xz"
pkg_src_dir="acl-$pkg_version"

pkg_build() {
    mkdir -p $1/usr/lib
    ./configure --prefix=/usr         \
                --disable-static      \
                --docdir=/usr/share/doc/acl-$pkg_version
    make
    make install DESTDIR=$1
}
