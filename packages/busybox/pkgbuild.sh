pkg_name="busybox"
pkg_version="1.36.1"
pkg_depends="glibc"

pkg_src="https://www.busybox.net/downloads/busybox-$pkg_version.tar.bz2"
pkg_src_dir="busybox-$pkg_version"

pkg_build() {
    make defconfig
    make
    mkdir -p $1/usr/bin
    install -m755 busybox $1/usr/bin/busybox
}
