pkg_name="coreutils"
pkg_version="9.4"
pkg_depends="glibc"
pkg_description="The basic file, shell and text manipulation utilities of the GNU operating system"

pkg_src="https://ftp.gnu.org/gnu/coreutils/coreutils-$pkg_version.tar.xz"
pkg_src_dir="coreutils-$pkg_version"

pkg_build() {
    sed -e '/n_out += n_hold/,+4 s|.*bufsize.*|//&|' \
        -i src/split.c
    autoreconf -fiv
    FORCE_UNSAFE_CONFIGURE=1 ./configure \
                --prefix=/usr            \
                --enable-no-install-program=kill,uptime
    make
    make install DESTDIR=$1
}