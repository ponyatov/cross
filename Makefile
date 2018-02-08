HW = x86

include hw/$(HW).mk
include cpu/$(CPU).mk
include arch/$(ARCH).mk

include mk/package.mk

# default make target

.PHONY: all dirs cross binutils gcc0 boot
all: dirs cross
cross: binutils gcc0

# directories structure

CWD = $(CURDIR)
GZ  = $(CURDIR)/gz
TMP = $(CWD)/tmp
SRC = $(CWD)/src
## cross-compiler tools
TC	= $(CWD)/$(TARGET).cross
BIN = $(TC)/bin
## target root filesystem
ROOT= $(CWD)/$(TARGET)
BOOT= $(ROOT)/boot

.PHONY: dirs
dirs: $(GZ) $(TMP) $(SRC) $(TC) $(BIN) $(ROOT) $(BOOT)
$(GZ) $(TMP) $(SRC) $(TC) $(BIN) $(ROOT) $(BOOT):
	mkdir -p $@

# commands used for build

WGET = wget -c -P $(GZ)

XPATH = PATH=$(BIN):$(PATH)
CPU_NUM = $(shell grep processor /proc/cpuinfo|wc -l)
MAKE = $(XPATH) make -j$(CPU_NUM)

CFG = configure --disable-nls --prefix=$(TC)  

include mk/unpack.mk
include mk/binutils.mk
include mk/gcclibs.mk
