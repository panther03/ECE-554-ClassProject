FPGA_DEV ?= "de1_soc"
TB ?=  # no default
UNIT ?=  # no default

# trying to save you from silly capitalization mistakes
ifneq ($(tb),)
	TB = $(tb)
endif

FW_DIR = "fw/"
SW_DIR = "sw/"
FPGA_DIR = "fpga/"
TB_DIR = "tb/"
OUT_DIR = "out/"

all: fpga

$(OUT_DIR):
	@mkdir -p $(OUT_DIR)

fw: $(OUT_DIR)
ifeq ($(UNIT),)
	@make -C $(FW_DIR)
else
	@make -C $(FW_DIR) unit
endif

fpga_mif: $(OUT_DIR)
	@make -C $(FPGA_DIR)/$(FPGA_DEV) replace_mif
 
fpga_fw: $(OUT_DIR) fw
	@make -C $(FPGA_DIR)/$(FPGA_DEV) update_mem

fpga: $(OUT_DIR) fw
	@make -C $(FPGA_DIR)/$(FPGA_DEV)

sim:
ifeq ($(TB),)
	@python3 $(SW_DIR)/sim.py test
else
	@python3 $(SW_DIR)/sim.py test $(TB)
endif

gui:
ifeq ($(TB),)
	@python3 $(SW_DIR)/sim.py gui
else
	@python3 $(SW_DIR)/sim.py gui $(TB)
endif

proj:
ifeq ($(TB),)
	@python3 $(SW_DIR)/sim.py proj
else
	@python3 $(SW_DIR)/sim.py proj $(TB)
endif

clean:
ifeq ($(TB),)
	@python3 $(SW_DIR)/sim.py clean
else
	@python3 $(SW_DIR)/sim.py clean $(TB)
endif
