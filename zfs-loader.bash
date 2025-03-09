pacman -Sy

pacman -S neovim wget --noconfirm

mkdir zfs-files

wget -P ./zfs-files/ https://github.com/n0xena/archzfs/releases/download/2.3.0_6.13.5-dkms/zfs-linux-2.3.0_6.13.5.arch1.1-1-x86_64.pkg.tar.zst
wget -P ./zfs-files/ https://github.com/n0xena/archzfs/releases/download/2.3.0_6.13.5-dkms/zfs-linux-headers-2.3.0_6.13.5.arch1.1-1-x86_64.pkg.tar.zst
wget -P ./zfs-files/ https://github.com/n0xena/archzfs/releases/download/2.3.0_6.13.5-dkms/zfs-utils-2.3.0-1-x86_64.pkg.tar.zst

pacman -U ~/zfs-files/*

modprobe zfs

lsmod | grep zfs

cryptsetup open /dev/nvme0n1p2 cryptroot

zpool import -N -R /mnt think
zfs mount think/root
zfs mount think/home

mount /dev/nvme0n1p1 /mnt/boot/
