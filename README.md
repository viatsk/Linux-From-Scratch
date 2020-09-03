# Linux-From-Scratch
This is my implementation of the LFS textbook, which you can find here: http://www.linuxfromscratch.org/

I have migrated to version 10 of the textbook. To build, run the commands:
```bash
sudo ./mount_partition.sh
sudo ./ready_packages.sh
sudo ./add_tools_and_user.sh
```

The next step is the cross-compilation environment needed for chapter 5.
```bash
cd chapter5 
sudo -u lfs ./binutils.sh

```

You can login as the lfs user anytime by running:
```bash
./login_as_lfs_user.sh
```

