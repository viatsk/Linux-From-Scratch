export LFS=/mnt/lfs
pushd $LFS/sources

tar -xf linux-5.8.3.tar.xz
cd linux-5.8.3
make mrproper
make headers
find usr/include -name '.*' -delete
rm usr/include/Makefile
cp -rv usr/include $LFS/usr

cd ../
rm -rf linux-5.8.3/ 
echo Finished Building linux API v 5.8.3
popd





