OUT_DIR = "../out/"

AS=wi23-elf-as
CC=wi23-elf-gcc
LD=wi23-elf-ld
OBJCOPY=wi23-elf-objcopy
OBJDUMP=wi23-elf-objdump

# default target
calc:
	@make -C calc/ 

unit:
    ifeq ($(suffix $(FW_UNIT_TEST)), .s)
		BASE_NAME=$(basename $(FW_UNIT_TEST) .s)
        @$(AS) $(FW_UNIT_TEST) -o $(OUT_DIR)/$(BASE_NAME).o
    else ifeq ($(suffix $(FW_UNIT_TEST)), .c)
		BASE_NAME=$(basename $(FW_UNIT_TEST) .c)
		@$(CC) -O2 $(FW_UNIT_TEST) -o $(OUT_DIR)/$(BASE_NAME).o
    else
        @echo "Error: Invalid file extension for FW_UNIT_TEST: $(suffix $(FW_UNIT_TEST))"
    endif
