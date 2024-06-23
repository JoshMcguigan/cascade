# Cascade

Cascade defines a minimal and automated path to replace GNU coreutils with uutils coreutils in a [stage 3 Gentoo tarball](https://wiki.gentoo.org/wiki/Stage_file#Stage_3).

You can run it in either a chroot:

```sh
just clean chroot
```

Or a virtual machine:

```sh
just clean vm
```

You can exit QEMU with `ctrl-a x`. `ctrl-a c` will show the QEMU monitor.

## Development dependencies

### just

[Installation instructions](https://github.com/casey/just?tab=readme-ov-file#installation)

