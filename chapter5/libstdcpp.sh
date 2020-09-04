pushd $LFS/sources

cd gcc-10.2.0

mkdir -v build_cpp
cd build_cpp
time {
../libstdc++-v3/configure           \
    --host=$LFS_TGT                 \
    --build=$(../config.guess)      \
    --prefix=/usr                   \
    --disable-multilib              \
    --disable-nls                   \
    --disable-libstdcxx-pch         \
    --with-gxx-include-dir=/tools/$LFS_TGT/include/c++/10.2.0 \
	&& make \
	&& make DESTDIR=$LFS install
}
# exit build dir
cd ../..
rm -rf gcc-10.2.0/
echo Finished Building libstdc++ v 10.2.0
popd





