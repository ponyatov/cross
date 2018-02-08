CFG_GCCLIBS = --prefix=$(TMP) --disable-shared

.PHONY: gcclibs
gcclibs: gmp mpfr mpc

CFG_GMP = $(CFG_GCCLIBS)
.PHONY: gmp
gmp: $(TMP)/lib/libgmp.a
$(GZ)/$(GMP_GZ):
	$(WGET) https://gmplib.org/download/gmp/$(GMP_GZ)
$(SRC)/$(GMP)/README: $(GZ)/$(GMP_GZ)
$(TMP)/lib/libgmp.a: $(SRC)/$(GMP)/README 
	rm -rf $(TMP)/$(GMP) ; mkdir $(TMP)/$(GMP) ; cd $(TMP)/$(GMP) ;\
	$(XPATH) $(SRC)/$(GMP)/$(CFG) $(CFG_GMP) && $(MAKE) && make install-strip

CFG_MPFR = $(CFG_GMP) --with-gmp=$(TMP)
.PHONY: mpfr
mpfr: $(TMP)/lib/libmpfr.a
$(GZ)/$(MPFR_GZ):
	$(WGET) http://www.mpfr.org/$(MPFR)/$(MPFR_GZ)
$(SRC)/$(MPFR)/README: $(GZ)/$(MPFR_GZ)
$(TMP)/lib/libmpfr.a: $(SRC)/$(MPFR)/README $(TMP)/lib/libgmp.a 
	rm -rf $(TMP)/$(MPFR) ; mkdir $(TMP)/$(MPFR) ; cd $(TMP)/$(MPFR) ;\
	$(XPATH) $(SRC)/$(MPFR)/$(CFG) $(CFG_MPFR) && $(MAKE) && make install-strip

CFG_MPC = $(CFG_MPFR) --with-mpfr=$(TMP)
.PHONY: mpc
mpc: $(TMP)/lib/libmpc.a
$(GZ)/$(MPC_GZ):
	$(WGET) https://ftp.gnu.org/gnu/mpc/$(MPC_GZ)
$(SRC)/$(MPC)/README: $(GZ)/$(MPC_GZ)
$(TMP)/lib/libmpc.a: $(SRC)/$(MPC)/README $(TMP)/lib/libmpfr.a 
	rm -rf $(TMP)/$(MPC) ; mkdir $(TMP)/$(MPC) ; cd $(TMP)/$(MPC) ;\
	$(XPATH) $(SRC)/$(MPC)/$(CFG) $(CFG_MPC) && $(MAKE) && make install-strip
