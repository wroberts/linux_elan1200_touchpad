obj-m = hid-elan.o
KVERSION = $(shell uname -r)
all:
	make -C /lib/modules/$(KVERSION)/build M=$(PWD) modules
clean:
	rm -f *.ko *.o userspace modules.order hid-elan.mod.c Module.symvers .*.cmd
#make -C /lib/modules/$(KVERSION)/b
userspace:
	gcc -o userspace userspace.c
