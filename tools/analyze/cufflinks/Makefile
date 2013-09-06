URL_DIR=http://cufflinks.cbcb.umd.edu/downloads
VER=2.1.1
NORM_NM=cufflinks
NM=$(NORM_NM)-$(VER)
PKG=$(NM).tar.gz
URL=$(URL_DIR)/$(PKG)

VERSION: $(NORM_NM)/src/sam_juncs
	-$< 2>&1 | tee $@

$(NORM_NM)/src/sam_juncs: $(NORM_NM)/Makefile
	make -C $(NORM_NM)

$(NORM_NM)/Makefile: $(NORM_NM) ../../util/samtools/samtools/libbam.a
	mkdir -p $(NORM_NM)/libbam/lib $(NORM_NM)/libbam/include/bam
	cp ../../util/samtools/samtools/libbam.a $(NORM_NM)/libbam/lib
	cp ../../util/samtools/samtools/*.h $(NORM_NM)/libbam/include/bam
	cd $(NORM_NM) && ./configure --with-bam=`pwd`/libbam

$(NORM_NM): $(PKG)
	tar zxvf $<
	mv $(NM) $@

$(PKG):
	wget $(URL)

.PHONY: clean
clean:
	rm -rf VERSION $(NM) $(PKG) $(NORM_NM)
