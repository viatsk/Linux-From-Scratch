pushd $LFS/sources

tar -xf bash-5.0.tar.gz
cd bash-5.0

time {
./configure --prefix=/usr                   \
            --build=$(support/config.guess) \
            --host=$LFS_TGT                 \
            --without-bash-malloc	    \
	    && make			    \
	    && make DESTDIR=$LFS install
}

mv $LFS/usr/bin/bash $LFS/bin/bash
ln -sv bash $LFS/bin/sh

cd ../
rm -rf bash-5.0 
echo Finished Building bash v 5.0
popd





