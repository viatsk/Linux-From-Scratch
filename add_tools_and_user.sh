export LFS=/mnt/lfs

# Make new tools directory, create a symlink to host system
mkdir -v $LFS/tools
ln -sv $LFS/tools /

# add an LFS user
groupadd lfs
useradd -s /bin/bash -g lfs -m -k /dev/null lfs
passwd lfs

# give user full access to tools, and sources
chown -v lfs $LFS/tools
chown -v lfs $LFS/sources 


