pushd $LFS/sources

tar -xf m4-1.4.18.tar.xz
cd m4-1.4.18

# make some changes to be copatible with glibc
sed -i 's/IO_ftrylockfile/IO_EOF_SEEN/' lib/*.c
echo "#define _IO_IN_BACKUP 0x100" >> lib/stdio-impl.h

time {
    ./configure --prefix=/usr   \
            --host=$LFS_TGT \
            --build=$(build-aux/config.guess) \
	    && make \
    	    && make DESTDIR=$LFS install
}

cd ../
rm -rf m4-1.4.18 
echo Finished Building m4 v 1.4.18
popd





