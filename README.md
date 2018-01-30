## ELAN1200 touchpad driver

A linux kernel module for ElanTech 1200 touchpad in Asus UX310UQ laptop. The way the default hid-multitouch driver reports touchpad's data results in random jumps of a cursor and random right-click events caused by the fake two-finger taps during two-finger scrolling. This driver somewhat minimises the glitches by filtering out the unrelated reports from the touchpad.

The repository also contains a userspace driver, based on https://github.com/redmcg/FTE1001 which can be used for debugging the data from a hidraw device.

The driver is tested on Debian 9, kernels 4.11, 4.13.

## Use with DKMS

Information drawn from [Building a kernel module using Dynamic Kernel Module Support (DKMS)](https://wiki.centos.org/HowTos/BuildingKernelModules#head-d313bd351f90d4f25a2143b7bbcff73f927731f0).

1. Copy this directory into /usr/src/hid-elan-1.00/
2. dkms add -m hid-elan -v 1.00
3. dkms build -m hid-elan -v 1.00
4. dkms install -m hid-elan -v 1.00

## Warning

If the driver doesn't work well. There's a patch (drop_releases.diff) for xorg synaptics driver 1.9.0 which implements the same idea: it drops the artificial releases if a next report is a touch, it happens when the touchpad starts to report two close contacts as one wide contact. Probably to handle those reports in user space is more natural from the architectural point of view.

### Problem report

https://bugzilla.kernel.org/show_bug.cgi?id=196619
