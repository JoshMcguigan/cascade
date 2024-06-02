default:
  just --list

chroot: rootfs
  sudo chroot /var/cascade /bin/bash

vm: rootfs
  qemu-system-x86_64 -kernel /var/cascade/boot/vmlinuz-* -initrd /var/cascade/boot/initramfs-* -m 1G -hda target/kernel-hd -append "root=/dev/sda console=ttyS0" -nographic -enable-kvm

mount: rootfs
  sudo mount target/kernel-hd /mnt/cascade

unmount: rootfs
  sudo umount /mnt/cascade

rootfs:
  ./mkcascade

clean:
  -sudo umount -lf /var/cascade/dev
  -sudo umount -lf /var/cascade/proc
  -sudo umount -lf /var/cascade/sys
  -sudo rm -rf target/rootfs
  -sudo rm -rf /var/cascade

