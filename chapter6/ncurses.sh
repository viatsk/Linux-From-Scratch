pushd $LFS/sources

tar -xf ncurses-6.2.tar.gz
cd ncurses-6.2

# make sure gawk exists 
# sed -i s/mawk// configure

mkdir build
pushd build
time {
  ../configure \
  && make -C include \
  && make -C progs tic
}
popd 

time {
./configure --prefix=/usr                \
            --host=$LFS_TGT              \
            --build=$(./config.guess)    \
            --mandir=/usr/share/man      \
            --with-manpage-format=normal \
            --with-shared                \
            --without-debug              \
            --without-ada                \
            --without-normal             \
            --enable-widec		\
	    && make 			\
	    && make DESTDIR=$LFS TIC_PATH=$(pwd)/build/progs/tic install
}
echo "INPUT(-lncursesw)" > $LFS/usr/lib/libncurses.so
mv -v $LFS/usr/lib/libncursesw.so.6* $LFS/lib
ln -sfv ../../lib/$(readlink $LFS/usr/lib/libncursesw.so) $LFS/usr/lib/libncursesw.so

cd ../
rm -rf ncurses-6.2
echo Finished Building ncurses v 6.2
popd





