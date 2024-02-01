pkg_name="neofetch"
pkg_version="7.1.0"
pkg_depends="bash coreutils"

pkg_src="https://github.com/dylanaraps/neofetch/archive/refs/tags/$pkg_version.tar.gz"
pkg_src_dir="neofetch-$pkg_version"

pkg_build() {
    make DESTDIR=$1 install
}