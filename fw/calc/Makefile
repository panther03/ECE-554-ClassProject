CC      = wi23-elf-gcc
LD      = wi23-elf-ld
OBJCOPY = wi23-elf-objcopy
OBJDUMP = wi23-elf-objdump
CFLAGS  = -c -O2 -Wall
#LDFLAGS = -T linker_script.ld

OBJDIR  = obj
BINDIR  = bin

SOURCES = $(wildcard ./*.c)
OBJECTS = $(patsubst $(SRCDIR)/%.c,$(OBJDIR)/%.o,$(SOURCES))
TARGET  = $(BINDIR)/calc.elf

OUT_DIR = ../../out/

.PHONY: all clean

all: $(TARGET)

$(TARGET): $(OBJECTS)
	@mkdir -p $(BINDIR)
	$(CC) -o $@ $^

	cp $@ $(OUT_DIR)/out.elf
	$(OBJDUMP) -dr -S $(OUT_DIR)/out.elf > $(OUT_DIR)/exec-out.log
	$(OBJCOPY) --verilog-data-width 4 $(OUT_DIR)/out.elf  -O verilog $(OUT_DIR)/out.hex

$(OBJDIR)/%.o: ./%.c
	@mkdir -p $(OBJDIR)
	$(CC) $(CFLAGS) -o $@ $<

clean:
	rm -rf $(OBJDIR) $(BINDIR)
