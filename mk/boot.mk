.PHONY: boot
boot: boot-$(ARCH)

.PHONY: boot-i386 syslinux
boot-i386: uboot

syslinux:

CFG_UBOOT =
.PHONY: uboot
uboot: $(BOOT)/u-boot.bin
$(SRC)/$(UBOOT)/README: $(GZ)/$(UBOOT_GZ)
$(GZ)/$(UBOOT_GZ):
	$(WGET) -O $@ ftp://ftp.denx.de/pub/u-boot/$(UBOOT_GZ)
$(BOOT)/u-boot.bin: $(SRC)/$(UBOOT)/README
	cd $(SRC)/$(UBOOT) ; make distclean allnoconfig ;\
	echo CONFIG_LOCALVERSION=\"cross_$(HW)\" >> .config ;\
	make menuconfig && $(MAKE)
#	$(MAKE) ARCH=$(ARCH) CROSS_COMPILE=$(TARGET)- distclean $(UBOOT_DEFCONFIG) ;\
#	$(MAKE) ARCH=$(ARCH) CROSS_COMPILE=$(TARGET)- &&\
#	cp u-boot $(BOOT)/ ; cp u-boot.bin $(BOOT)/
##	cat $(CWD)/arch/$(ARCH).uboot >> .config ;\
##	cat $(CWD)/cpu/$(CPU).uboot >> .config ;\
##	make menuconfig &&\
