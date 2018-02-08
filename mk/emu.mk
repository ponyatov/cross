.PHONY: emu
emu: $(BOOT)/u-boot.bin
	dd of=$(TMP)/flash bs=1k count=4k if=/dev/zero
	dd of=$(TMP)/flash bs=1k conv=notrunc if=$(BOOT)/u-boot.bin
	xterm -e qemu-system-$(ARCH) $(QEMU) -pflash $(TMP)/flash &
