default:
  just --list

chroot: rootfs
  sudo chroot /var/stage3 /bin/bash

rootfs:
  sudo ./mkcascade

clean:
  -sudo umount -lf /var/stage3/dev
  -sudo umount -lf /var/stage3/proc
  -sudo umount -lf /var/stage3/sys
  -sudo umount -lf /var/stage3/cascade
  -sudo rm -rf /var/stage3
  -sudo rm -rf target/rootfs

