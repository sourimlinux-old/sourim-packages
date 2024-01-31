pkg_name="libcap"
pkg_version="2.69"
pkg_depends="glibc"

pkg_src="https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2/libcap-$pkg_version.tar.xz"
pkg_src_dir="libcap-$pkg_version"

pkg_build() {
    sed -i '/install -m.*STA/d' libcap/Makefile
    make prefix=/usr lib=lib
    make prefix=/usr lib=lib DESTDIR=$1 install
}