pacman -Sy

pacman -S neovim --noconfirm

curl -LO https://github.com/n0xena/archzfs/releases/download/2.3.0_6.13.5-dkms/zfs-linux-2.3.0_6.13.5.arch1.1-1-x86_64.pkg.tar.zst
curl -LO https://github.com/n0xena/archzfs/releases/download/2.3.0_6.13.5-dkms/zfs-linux-headers-2.3.0_6.13.5.arch1.1-1-x86_64.pkg.tar.zst
curl -LO https://github.com/n0xena/archzfs/releases/download/2.3.0_6.13.5-dkms/zfs-utils-2.3.0-1-x86_64.pkg.tar.zst

pacman -U zfs-linux-headers-*.pkg.tar.zst zfs-linux-*.pkg.tar.zst zfs-utils-*.pkg.tar.zst --noconfirm

modprobe zfs

lsmod | grep zfs

zpool import -N -R /mnt think
zfs mount think/root
zfs mount think/home

mount /dev/nvme0n1p1 /mnt/boot/
