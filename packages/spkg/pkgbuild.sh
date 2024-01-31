pkg_name="spkg"
pkg_version="0.1"
pkg_depends="bash coreutils gawk wget tar xz"

pkg_src="https://github.com/sourimlinux/spkg/releases/download/v$pkg_version/spkg-$pkg_version.tar.xz"

pkg_build() {
    make DESTDIR=$1 install
}