pkg_name="readline"
pkg_version="8.2"
pkg_depends="glibc ncurses"

pkg_src="https://ftp.gnu.org/gnu/readline/readline-$pkg_version.tar.gz"
pkg_src_dir="readline-$pkg_version"
pkg_patches=(
    "https://www.linuxfromscratch.org/patches/lfs/development/readline-8.2-upstream_fixes-2.patch"
)

pkg_build() {
    sed -i '/MV.*old/d' Makefile.in
    sed -i '/{OLDSUFF}/c:' support/shlib-install
    ./configure --prefix=/usr    \
                --disable-static \
                --with-curses    \
                --docdir=/usr/share/doc/readline-$pkg_version
    make SHLIB_LIBS="-lncursesw"
    make SHLIB_LIBS="-lncursesw" install DESTDIR=$1
    install -v -m644 doc/*.{ps,pdf,html,dvi} $1/usr/share/doc/readline-$pkg_version
}