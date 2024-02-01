pkg_name="glibc"
pkg_version="2.38"
pkg_depends=""

pkg_src="https://ftp.gnu.org/gnu/glibc/glibc-$pkg_version.tar.xz"
pkg_src_dir="glibc-$pkg_version"

pkg_build() {
    mkdir build
    cd build
    echo "rootsbindir=/usr/sbin" > configparms
    ../configure --prefix=/usr                            \
                --disable-werror                         \
                --enable-kernel=4.14                     \
                --enable-stack-protector=strong          \
                --with-headers=/usr/include              \
                --disable-nscd                           \
                libc_cv_slibdir=/usr/lib
    
    make

    sed '/test-installation/s@$(PERL)@echo not running@' -i ../Makefile

    make install DESTDIR=$1

    mkdir -p $1/etc
    touch $1/etc/ld.so.conf
    mkdir -pv $1/{usr/lib/locale,etc/ld.so.conf.d}
    sed '/RTLDLIST=/s@/usr@@g' -i $1/usr/bin/ldd

    echo "Write config..."
    # /etc/nsswitch.conf
    cat > $1/etc/nsswitch.conf << "EOF"
# Begin /etc/nsswitch.conf

passwd: files
group: files
shadow: files

hosts: files dns
networks: files

protocols: files
services: files
ethers: files
rpc: files

# End /etc/nsswitch.conf
EOF

    # /etc/ld.so.conf
    cat > $1/etc/ld.so.conf << "EOF"
# Begin /etc/ld.so.conf
/usr/local/lib
/opt/lib

EOF

    # /etc/ld.so.conf
    cat >> $1/etc/ld.so.conf << "EOF"
# Add an include directory
include /etc/ld.so.conf.d/*.conf

EOF

    echo "Install locales"
    make localedata/install-locales DESTDIR=$1
}
