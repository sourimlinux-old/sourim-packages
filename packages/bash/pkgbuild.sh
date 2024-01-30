pkg_name="bash"
pkg_version="5.2.21"
pkg_depends="glibc readline"
pkg_description="Bourne-Again Shell."

pkg_src="https://ftp.gnu.org/gnu/bash/bash-$pkg_version.tar.gz"
pkg_src_dir="bash-$pkg_version"

pkg_build() {
    ./configure --prefix=/usr             \
                --without-bash-malloc     \
                --with-installed-readline \
                --docdir=/usr/share/doc/bash-$pkg_version
    
    make
    make install DESTDIR=$1/
}