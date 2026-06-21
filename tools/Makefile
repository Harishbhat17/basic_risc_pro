SIM ?= vcs
TOP ?= top_tb
SRC ?= $(wildcard *.sv)

.PHONY: compile sim clean

compile:
ifeq ($(SIM),vcs)
	vcs -sverilog -timescale=1ns/1ps $(SRC) -top $(TOP) -l vcs_compile.log
else ifeq ($(SIM),vivado)
	xvlog --sv $(SRC)
	xelab $(TOP)
else ifeq ($(SIM),modelsim)
	vlib work
	vlog -sv $(SRC)
	vsim -c $(TOP) -do "run -all; quit -f"
else
	$(error Unsupported SIM=$(SIM))
endif

sim: compile
ifeq ($(SIM),vcs)
	./simv -l sim.log
endif

clean:
	rm -rf csrc simv* ucli.key *.log *.jou *.pb transcript work xsim.dir
