all: prog
	@cp output_files/$(REVISION).sof ../../out/out.sof

DB_IMEM_MIF = $(wildcard ./db/*imem*.mif)
SRC_MEM_MIF = ../../out.mif

.PHONY: $(DB_IMEM_MIF) $(SRC_MEM_MIF)

prog: compile
ifdef HPS_SOC
	@$(QPFX)quartus_pgm -mjtag -o "p;output_files/$(REVISION).sof@2"
else
	@$(QPFX)quartus_pgm -mjtag -o "p;output_files/$(REVISION).sof"
endif

compile:
	@$(QPFX)quartus_sh --flow compile $(PROJ) -c $(REVISION)

$(SRC_MEM_MIF):
	@wi23-elf-objcopy ../../out/out.elf -O binary ../../out/out.bin
	@python ../../sw/convert_mif.py --depth 8192 --width 32 ../../out/out.bin > $(SRC_MEM_MIF) 

$(DB_IMEM_MIF): $(SRC_MEM_MIF)
	cp $< $@

replace_mif: $(DB_IMEM_MIF)

update_mem: replace_mif	
	@$(QPFX)quartus_cdb --update_mif $(PROJ) --rev=$(REVISION)
	@$(QPFX)quartus_asm $(PROJ) --rev=$(REVISION)
