OUT_DIR = "../out/"

AS=wi23-elf-as
CC=wi23-elf-gcc
LD=wi23-elf-ld
OBJCOPY=wi23-elf-objcopy
OBJDUMP=wi23-elf-objdump

.PHONY: unit calc

# default target
calc:
	@make -C calc/ 

unit:
ifeq ($(suffix $(UNIT)), .s) 
	@bash ../sw/unit_build.sh $(UNIT) $(OUT_DIR)
else ifeq ($(suffix $(UNIT)), .asm) 
	@bash ../sw/unit_build.sh $(UNIT) $(OUT_DIR)
else ifeq ($(suffix $(UNIT)), .c)
	@bash ../sw/unit_build.sh $(UNIT) $(OUT_DIR)
else
	@echo "Error: Invalid file extension for unit test: $(suffix $(UNIT))"
endif
