TARGET = $(ARCH)-elf
UBOOT_DEFCONFIG = qemu_$(ARCH)_defconfig
QEMU = -M $(ARCH) $(QEMU_CPU) -nographic -bios
QEMU = -M mips -nographic
