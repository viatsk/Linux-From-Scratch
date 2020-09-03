# Linux-From-Scratch
This is my implementation of the LFS textbook, which you can find here: http://www.linuxfromscratch.org/

Before proceding, I partitioned `/dev/sdb` into a 12G partition `/dev/sdb1`, which is where these scripts assume the builds occur.

I have migrated to version 10 of the textbook. To build, run the commands:
```bash
sudo ./mount_partition.sh
sudo ./ready_packages.sh
sudo ./add_tools_and_user.sh
```

The next step is the cross-compilation environment needed for chapter 5.
```bash
cd chapter5 
sudo -u lfs -i /home/stacy/LFS/chapter5/binutils.sh
sudo -u lfs -i /home/stacy/LFS/chapter5/gcc.sh
sudo -u lfs -i /home/stacy/LFS/chapter5/linux-api.sh
sudo -u lfs -i /home/stacy/LFS/chapter5/glibc.sh
```

You can login as the lfs user anytime by running:
```bash
./login_as_lfs_user.sh
```

