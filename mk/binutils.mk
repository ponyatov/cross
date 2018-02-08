CFG_BINUTILS += --target=$(TARGET)
CFG_BINUTILS += --with-sysroot=$(ROOT) --with-native-system-header-dir=/include
CFG_BINUTILS += --enable-lto --disable-multilib # target optimizations
.PHONY: binutils
binutils: $(BIN)/$(TARGET)-ld
$(GZ)/$(BINUTILS_GZ):
	$(WGET) http://ftp.gnu.org/gnu/binutils/$(BINUTILS_GZ)
$(SRC)/$(BINUTILS)/README: $(GZ)/$(BINUTILS_GZ)
$(BIN)/$(TARGET)-ld: $(SRC)/$(BINUTILS)/README
	rm -rf $(TMP)/$(BINUTILS) ; mkdir $(TMP)/$(BINUTILS) ; cd $(TMP)/$(BINUTILS) ;\
	$(XPATH) $(SRC)/$(BINUTILS)/$(CFG) $(CFG_BINUTILS) &&\
	$(MAKE) && make install-strip