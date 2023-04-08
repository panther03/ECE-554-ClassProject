CC      = wi23-elf-gcc
LD      = wi23-elf-ld
OBJCOPY = wi23-elf-objcopy
CFLAGS  = -c -O2 -Wall
#LDFLAGS = -T linker_script.ld

OBJDIR  = obj
BINDIR  = bin

SOURCES = $(wildcard ./*.c)
OBJECTS = $(patsubst $(SRCDIR)/%.c,$(OBJDIR)/%.o,$(SOURCES))

TARGET  = $(BINDIR)/calc.elf

.PHONY: all clean

all: $(TARGET)

$(TARGET): $(OBJECTS)
	@mkdir -p $(BINDIR)
	$(CC) -o $@ $^

$(OBJDIR)/%.o: ./%.c
	@mkdir -p $(OBJDIR)
	$(CC) $(CFLAGS) -o $@ $<

clean:
	rm -rf $(OBJDIR) $(BINDIR)
