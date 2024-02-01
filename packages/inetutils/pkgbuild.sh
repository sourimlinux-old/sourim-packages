pkg_name="inetutils"
pkg_version="2.5"
pkg_depends="glibc libcap readline ncurses"

pkg_src="https://ftp.gnu.org/gnu/inetutils/inetutils-$pkg_version.tar.xz"
pkg_src_dir="inetutils-$pkg_version"

pkg_build() {
    ./configure --prefix=/usr        \
                --bindir=/usr/bin    \
                --localstatedir=/var \
                --disable-logger     \
                --disable-whois      \
                --disable-rcp        \
                --disable-rexec      \
                --disable-rlogin     \
                --disable-rsh        \
                --disable-servers
    
    make
    make DESTDIR=$1 install
}