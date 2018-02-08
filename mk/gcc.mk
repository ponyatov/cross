# bare metal gcc
CFG_GCC0 += --without-headers --with-newlib
CFG_GCC0 += $(CFG_BINUTILS) --enable-languages="c"
CFG_GCC0 += --with-gmp=$(TMP) --with-mpfr=$(TMP) --with-mpc=$(TMP)
.PHONY: gcc0
gcc: gcc0
gcc0: gcclibs $(BIN)/$(TARGET)-gcc
$(GZ)/$(GCC_GZ):
	$(WGET) http://gcc.skazkaforyou.com/releases/$(GCC)/$(GCC_GZ)
$(SRC)/$(GCC)/README: $(GZ)/$(GCC_GZ)
$(BIN)/$(TARGET)-gcc: $(SRC)/$(GCC)/README
	rm -rf $(TMP)/$(GCC) ; mkdir $(TMP)/$(GCC) ; cd $(TMP)/$(GCC) ;\
	$(XPATH) $(SRC)/$(GCC)/$(CFG) $(CFG_GCC0)
	cd $(TMP)/$(GCC) ; $(MAKE) all-gcc
	cd $(TMP)/$(GCC) ; $(MAKE) install-gcc
	cd $(TMP)/$(GCC) ; $(MAKE) all-target-libgcc
	cd $(TMP)/$(GCC) ; $(MAKE) install-target-libgcc
