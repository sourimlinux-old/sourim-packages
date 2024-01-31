pkg_name="libpsl"
pkg_version="0.21.5"
pkg_depends="glibc libidn2 libunistring"

pkg_src="https://github.com/rockdaboot/libpsl/releases/download/$pkg_version/libpsl-$pkg_version.tar.gz"
pkg_src_dir="libpsl-$pkg_version"

pkg_build() {
    mkdir build
    cd    build

    meson setup --prefix=/usr --buildtype=release
    ninja
    ninja install DESTDIR=$1

    cd ..
}