include version.mk

## GNU cross compiler toolchain

BINUTILS		= binutils-$(BINUTILS_VER)
BINUTILS_GZ		= $(BINUTILS).tar.xz

GCC				= gcc-$(GCC_VER)
GCC_GZ			= $(GCC).tar.xz

GMP				= gmp-$(GMP_VER)
GMP_GZ			= $(GMP).tar.xz

MPFR			= mpfr-$(MPFR_VER)
MPFR_GZ			= $(MPFR).tar.bz2

MPC				= mpc-$(MPC_VER)
MPC_GZ			= $(MPC).tar.gz

## bootloader/microkernel

UBOOT 			= u-boot-$(UBOOT_VER)
UBOOT_GZ		= $(UBOOT).tar.bz2

SYSLINUX 		= syslinux-$(SYSLINUX_VER)
SYSLINUX_GZ		= $(SYSLINUX).tar.bz2
