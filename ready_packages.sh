export LFS=/mnt/lfs
mkdir -v $LFS/sources
chmod -v a+wt $LFS/sources 

echo 'wget --input-file=wget-list --continue --directory-prefix=$LFS/sources'

cp -v md5sums $LFS/sources
pushd $LFS/sources
md5sum -c ./md5sums
popd

