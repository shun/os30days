# 30日でできる OS自作入門
## Make enviromnent

* install qemu by brew
* if you need original source code, download [here](http://book.mynavi.jp/support/pc/1984/HariboteOS.iso)

***

## 1st day

* create OS image for floppy disk
* install nasm by brew becase original nasm by apple is quite old
  - re-link nasm if you want
* create nas file which based on "heeloos.nas" provided by original source code
  - modify line 41 "RESB	0x1fe-$" -> "RESB	0x1fe-($-$$)"
  - $ evaluates to the assembly position at the beginning of the line containing the expression
  - $$ evaluates to the beginning of the current section
* make image file
  - nasm myos.nas -o myos.img
* run qemu
  - qemu-system-x86_64 -fda myos.img (done by OS X 10.9)

## 2nd day

* install mtools to use "mformat" command.
  - e.g. brew install mtools
* create ipl file(initial program loader)
* create "Makefile"
* make ipl binary which size is 512 byte
  - nasm ipl.nas -o ipl.bin
* make disk image
  - mformat -f 1440 -C -B ipl.bin -i myos.img ::
* run qemu
  - qemu-system-x86_64 -fda myos.img
