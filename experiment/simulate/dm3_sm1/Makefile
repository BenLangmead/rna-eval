FLUX_DIR=../../../tools/simulate/flux
IGENOMES_DIR=../../../data/igenomes
NM=dm3_sm1

$(NM).pro: $(NM).par genes.fixed.gtf flux/flux-simulator/bin/flux-simulator
	flux/flux-simulator/bin/flux-simulator -p $<

# Copy flux stuff to here
flux/flux-simulator/bin/flux-simulator flux/gtf_flux_fix.py flux/igenomes_setup.sh: $(FLUX_DIR)/copy.sh
	mkdir -p flux
	sh $< ./flux

$(IGENOMES_DIR)/Drosophila_melanogaster:
	make -C $(IGENOMES_DIR)

# Setup flux to simulate from Drosophila
genes.fixed.gtf: flux/igenomes_setup.sh $(IGENOMES_DIR)/Drosophila_melanogaster
	export IGENOMES_DIR=$(IGENOMES_DIR) && sh flux/igenomes_setup.sh Drosophila_melanogaster UCSC dm3
