pkg_name="iproute2"
pkg_version="6.7.0"
pkg_depends="glibc libelf libcap libtirpc"

pkg_src="https://www.kernel.org/pub/linux/utils/net/iproute2/iproute2-$pkg_version.tar.xz"
pkg_src_dir="iproute2-$pkg_version"

pkg_build() {
    make NETNS_RUN_DIR=/run/netns
    make SBINDIR=/usr/sbin DESTDIR=$1 install
}