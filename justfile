default:
  just --list

chroot: rootfs
  sudo chroot /var/stage3 /bin/bash

rootfs:
  sudo ./mkcascade

vm: rootfs
  qemu-system-x86_64 -kernel /var/stage3/boot/vmlinuz-* -m 1G -hda target/kernel-hd -append "root=/dev/sda console=ttyS0" -nographic -enable-kvm

mount: rootfs
  sudo mount target/kernel-hd /mnt/cascade

unmount: rootfs
  sudo umount /mnt/cascade

clean:
  -sudo umount -lf /var/stage3/dev
  -sudo umount -lf /var/stage3/proc
  -sudo umount -lf /var/stage3/sys
  -sudo rm -rf /var/stage3
  -sudo rm -rf target/rootfs
  -sudo rm -rf target/kernel-hd

