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

# set up user's working environment 
# Create a new bash_profile, which will be the new user's computing environment
cat > /home/lfs/.bash_profile << "EOF"
exec env -i HOME=$HOME TERM=$TERM PS1='\u:\w\$ ' /bin/bash
EOF

# Set up a bashrc so shell starts in the same state 
cat > /home/lfs/.bashrc << "EOF"
set +h
umask 022
LFS=/mnt/lfs
LC_ALL=POSIX
LFS_TGT=$(uname -m)-lfs-linux-gnu
PATH=/tools/bin:/bin:/usr/bin
export LFS LC_ALL LFS_TGT PATH
EOF


