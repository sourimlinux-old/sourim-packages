pkg_name="zlib"
pkg_version="1.3"
pkg_depends="glibc"

pkg_src="https://zlib.net/fossils/zlib-$pkg_version.tar.gz"
pkg_src_dir="zlib-$pkg_version"

pkg_build() {
    ./configure --prefix=/usr

    make
    
    echo "Installing with root."
    sudo make install DESTDIR=$1
    sudo rm -fv $1/usr/lib/libz.a
}