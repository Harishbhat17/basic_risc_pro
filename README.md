# SystemVerilog Design & Verification Guide

This repository now includes a complete, progressive SystemVerilog learning path from fundamentals to practical projects.

## Structure

- `fundamentals/` - interfaces, classes, randomization, procedural blocks
- `design_patterns/` - CDC, FIFOs, FSMs, arbiters, counters/timers
- `verification/` - basic TB, SVA, coverage, scoreboarding
- `uvm_examples/` - agent, tests, advanced env, coverage, factory override
- `projects/` - ALU, UART, AXI-Lite slave, multi-port FIFO, traffic light controller
- `docs/` - best practices, checklist, debugging, performance tips
- `tools/` - simulator automation Makefiles, compile scripts, Python utilities

Each topic/project includes:
- RTL/design (`*.sv`)
- interface (`*_if.sv`)
- testbench (`*_tb.sv`)
- assertions (`*_assertions.sv`)
- coverage (`*_coverage.sv`)
- tests/sequences (`*_tests.sv`)
- local README + Makefile

## Quick Start

```bash
cd projects/alu8
make sim SIM=vcs
```

Supported `SIM` values in Makefiles:
- `vcs`
- `vivado`
- `modelsim`

## Learning Path

1. Start with `fundamentals/interfaces` and `fundamentals/procedural_blocks`
2. Move to `design_patterns/fifo` and `design_patterns/cdc`
3. Practice `verification/scoreboard` and `verification/assertions_sva`
4. Use `uvm_examples/basic_agent` and `uvm_examples/simple_test`
5. Complete end-to-end with `projects/*`

## Coverage & Quality Goals

Examples target:
- Assertion pass/fail visibility for protocol and state behavior
- Functional coverage for directed + random + corner cases
- Reusable test architecture (driver/monitor/scoreboard)
- IEEE 1800-2017 compliant coding style
