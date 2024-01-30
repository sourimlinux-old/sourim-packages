pkg_name="attr"
pkg_version="2.5.2"
pkg_depends="glibc"
pkg_description="Extended attribute support library for ACL support"

pkg_src="https://mirror.downloadvn.com/nongnu/attr/attr-$pkg_version.tar.xz"
pkg_src_dir="attr-$pkg_version"

pkg_build() {
    mkdir -p $1/usr/lib
    ./configure --prefix=/usr     \
                --disable-static  \
                --sysconfdir=/etc \
                --docdir=/usr/share/doc/attr-$pkg_version
    make
    make install DESTDIR=$1
}
