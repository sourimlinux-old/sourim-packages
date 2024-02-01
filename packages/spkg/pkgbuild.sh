pkg_name="spkg"
pkg_version="0.1.1"
pkg_depends="bash coreutils gawk wget tar xz"

pkg_src="https://codeload.github.com/sourimlinux/spkg/tar.gz/refs/tags/v$pkg_version"
pkg_src_dir="spkg-$pkg_version"

pkg_build() {
    make DESTDIR=$1 install
}
