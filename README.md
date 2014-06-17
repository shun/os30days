# 30日でできる OS自作入門
## Make enviromnent

* install qemu by brew
* if you need original source code, download [here](http://book.mynavi.jp/support/pc/1984/HariboteOS.iso)

***

## 1st day

* make OS image for floppy disk
* you can make OS image with ruby script at 00-script/osimg.rb
  - ruby osimg.rb <your OS image file path>
* run qemu
  - qemu-system-x86_64 -fda myos.img (done by OS X 10.9)
