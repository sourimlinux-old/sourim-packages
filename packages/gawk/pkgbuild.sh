pkg_name="gawk"
pkg_version="5.3.0"
pkg_depends="glibc readline ncurses"
pkg_description="GNU version of awk"

pkg_src="https://ftp.gnu.org/gnu/gawk/gawk-$pkg_version.tar.xz"
pkg_src_dir="gawk-$pkg_version"

pkg_build() {
    sed -i 's/extras//' Makefile.in
    ./configure --prefix=/usr
    make
    make install DESTDIR=$1
}