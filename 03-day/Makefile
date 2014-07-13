default :
	make img

ipl.bin : ipl.nas Makefile
	nasm ipl.nas -o ipl.bin -l 	ipl.lst

img : ipl.nas ipl.bin Makefile
	mformat -f 1440 -C -B ipl.bin -i myos.img ::

runqemu :
	qemu-system-x86_64 -fda myos.img

run :
	make ipl.bin
	make img
	make runqemu

clean :
	rm ipl.bin
	rm ipl.lst
	rm myos.img

