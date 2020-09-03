export LFS=/mnt/lfs
pushd $LFS/sources

mkdir binutils/
tar -xf binutils-2.35.tar.xz -C binutils/
cd binutils/binutils-2.35
mkdir -v build
cd build 
time {
	../configure --prefix=$LFS/tools       \
             	--with-sysroot=$LFS        \
             	--target=$LFS_TGT          \
             	--disable-nls              \
             	--disable-werror	\
	&& make \
	&& make install
}
rm -rf binutils 
echo Finished Building Binutils v 2.35
popd





