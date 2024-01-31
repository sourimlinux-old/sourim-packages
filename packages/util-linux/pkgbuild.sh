pkg_name="util-linux"
pkg_subver="2.39"
pkg_version="2.39.3"
pkg_depends="glibc readline ncurses"

pkg_src="https://www.kernel.org/pub/linux/utils/util-linux/v$pkg_subver/util-linux-$pkg_version.tar.xz"
pkg_src_dir="util-linux-$pkg_version"

pkg_build() {
    ./configure --bindir=/usr/bin    \
                --libdir=/usr/lib    \
                --runstatedir=/run   \
                --sbindir=/usr/sbin  \
                --disable-chfn-chsh  \
                --disable-login      \
                --disable-nologin    \
                --disable-su         \
                --disable-setpriv    \
                --disable-runuser    \
                --disable-pylibmount \
                --disable-static     \
                --without-python     \
                --without-systemd    \
                --without-systemdsystemunitdir        \
                ADJTIME_PATH=/var/lib/hwclock/adjtime \
                --docdir=/usr/share/doc/util-linux-$pkg_version
    
    make
    echo "Installing wirh root."
    sudo make install DESTDIR=$1
}