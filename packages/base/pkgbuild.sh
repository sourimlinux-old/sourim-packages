pkg_name="base"
pkg_version="0.1"
pkg_depends="glibc coreutils bash util-linux iproute2 inetutils gawk tar xz bzip2 spkg"

pkg_build() {
    mkdir -p $1/etc $1/usr/{lib,bin}

    echo "NAME=\"sourim\"" > $1/etc/os-release
    echo "PRETTY_NAME=\"Sourim Linux\"" >> $1/etc/os-release

    pushd $1

    ln -vs usr/bin bin
    ln -vs usr/sbin sbin
    ln -vs usr/lib lib
    ln -vs usr/lib lib64
    
    cd usr
        ln -vs lib lib64
        ln -vs bin sbin
    cd ..

    popd
}