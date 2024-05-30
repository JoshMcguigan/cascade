run-container: rootfs
  youki run cascade -b container

rootfs:
  ./mkcascade

clean:
  -sudo umount target/rootfs/proc
  -sudo rm -rf target
