export LFS=/mnt/lfs
pushd $LFS/sources

tar -xf binutils-2.35.tar.xz
cd binutils-2.35
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
cd ../../
rm -rf binutils-2.35/ 
echo Finished Building Binutils v 2.35
popd





