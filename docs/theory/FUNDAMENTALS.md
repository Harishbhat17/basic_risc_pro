# SystemVerilog Fundamentals Theory

## 1. Language Overview

### What is SystemVerilog?

SystemVerilog is an extension to Verilog that adds:
- **Hardware Description Language (HDL)** features for RTL design
- **Testbench Language (TBL)** features for verification
- **Object-Oriented Programming (OOP)** support
- **Constrained Randomization** for stimulus generation
- **Assertions** for formal and dynamic verification

### Why SystemVerilog?

**Over Verilog:**
- More expressive syntax for complex designs
- Better testbench capabilities
- Type safety improvements
- Cleaner object-oriented code

**Over VHDL:**
- Simpler, more concise syntax
- Better industry adoption in verification
- Stronger OOP support
- Extensive tool vendor support

**For Modern Verification:**
- Industry standard for advanced verification
- Enables UVM (Universal Verification Methodology)
- Supports coverage-driven verification
- Enables constrained random testing

### Design vs Testbench Separation

**Design Side (RTL)**
- Synthesizable code
- Describes hardware behavior
- Runs at high speeds
- Uses `logic`, `bit`, `always_ff`, `always_comb`

**Testbench Side**
- Non-synthesizable code
- Stimulates and checks design
- Runs at lower speeds (more functionality)
- Uses `class`, `task`, `function`, `initial`

---

## 2. SystemVerilog vs Verilog

### Key Differences

| Feature | Verilog | SystemVerilog |
|---------|---------|---------------|
| Data Types | Limited (wire, reg, etc.) | Rich (logic, bit, int, real, etc.) |
| OOP | None | Full support (classes, inheritance) |
| Randomization | None | Constrained random (rand, constraint) |
| Testbench | Limited | Comprehensive (UVM, agents, etc.) |
| Interfaces | None | Built-in interface construct |
| Assertions | None | SVA (SystemVerilog Assertions) |
| Type Safety | Weak | Strong with type checking |

### Backward Compatibility

- Most Verilog is valid SystemVerilog
- Can mix Verilog and SystemVerilog in same project
- Tools provide migration assistance
- Old Verilog testbenches need updates for SystemVerilog tools

---

## 3. Design Layers

### Three Layers of SystemVerilog

```
┌─────────────────────────────────┐
│    RTL/Synthesis Layer          │
│  (always_ff, always_comb)       │
│  - Synthesizable subset         │
│  - Hardware description         │
└─────────────────────────────────┘
         ↑           ↓
┌─────────────────────────────────┐
│   Testbench Layer               │
│  (classes, tasks, functions)    │
│  - Non-synthesizable            │
│  - Test generation & checking   │
└─────────────────────────────────┘
         ↑           ↓
┌─────────────────────────────────┐
│   Assertion Layer (SVA)         │
│  (properties, sequences)        │
│  - Protocol checking            │
│  - Intent documentation         │
└─────────────────────────────────┘
```

### Layer Characteristics

**RTL Layer**
- Describes hardware behavior
- Synthesizable by tools
- Runs in simulation
- Limited flexibility (for good reason)

**Testbench Layer**
- Stimulates RTL
- Collects and checks responses
- Uses full SV features
- Can be modified easily

**Assertion Layer**
- Expresses design intent
- Checked continuously
- Can be used in simulation and formal verification
- Part of design documentation

---

## 4. File Organization

### Typical Project Structure

```
project/
├── rtl/
│   ├── pkg/
│   │   └── design_pkg.sv     // Shared package
│   ├── interfaces/
│   │   └── dut_if.sv         // Protocol interface
│   └── src/
│       ├── fifo.sv           // FIFO design
│       ├── uart.sv           // UART design
│       └── top.sv            // Top module
├── tb/
│   ├── tests/
│   │   └── base_test.sv      // Test class
│   ├── env/
│   │   └── environment.sv    // Test environment
│   └── top_tb.sv             // Test harness
├── sim/
│   ├── Makefile
│   └── run.sh
└── docs/
    └── README.md
```

### File Naming Conventions

**RTL Files**
- `*.sv` - SystemVerilog source file
- `module_name.sv` - One module per file (preferred)
- `*_pkg.sv` - Package definition
- `*_if.sv` - Interface definition

**Testbench Files**
- `*_test.sv` - Test classes
- `*_tb.sv` - Testbench harness
- `*_env.sv` - Environment setup
- `*_seq.sv` - Sequences

### Compilation Order

1. **Packages** first (define types used elsewhere)
2. **Interfaces** (used by modules)
3. **RTL Modules** (design)
4. **Testbench** (uses RTL)
5. **Tests** (instantiate testbench)

---

## 5. Compilation vs Simulation

### Compilation Phase

```
SV Source Files (.sv)
        ↓ (Compiler)
Intermediate Representation (IR)
        ↓ (Elaboration)
Simulation Database
```

**What Happens:**
- Syntax checking
- Type checking
- Module instantiation
- Hierarchy elaboration
- Generate statement expansion

**Output:**
- Compiled database
- Ready for simulation

### Simulation Phase

```
Simulation Database
        ↓ (Simulator)
Event Queue Processing
        ↓
Signal Updates
        ↓
Waveform File (.vcd, .wdb)
        ↓
Coverage Data
```

**What Happens:**
- Execute testbench
- Update signals
- Process events
- Collect coverage
- Write waveforms

**Output:**
- Test results
- Coverage reports
- Waveform files

### Typical Flow

```bash
# 1. Compile
vcs -sverilog tb/top_tb.sv -o simv

# 2. Run simulation
./simv

# 3. View waveforms (optional)
verbview simv.wdb &
```

---

## 6. Key Concepts

### Logic Values (4-State)

**Two-value logic** (Bit)
- 0: Low/False
- 1: High/True
- Performance: Faster

**Four-value logic** (Logic)
- 0: Low/False
- 1: High/True  
- X: Unknown (uninitialized or conflict)
- Z: High-impedance (floating)

```systemverilog
logic signal;    // Can be 0, 1, x, or z
bit flag;        // Can only be 0 or 1 (faster)
```

### Nets vs Variables

**Nets** (Verilog concept, less common in SV)
- Connect hardware
- Updated by continuous assignment
- Example: `wire`

**Variables** (Preferred in SV)
- Store values
- Updated by procedural assignment
- Example: `logic`, `bit`, `int`

### Continuous vs Procedural

**Continuous Assignment**
```systemverilog
logic result;
assign result = a & b;  // Always active
```

**Procedural Assignment**
```systemverilog
always_comb begin
  result = a & b;  // When inputs change
end
```

---

## 7. Simulation Semantics

### Time Steps

```
Time 0ns
├─ All initial blocks execute
├─ All combinational logic settles
└─ Time advances

Time 5ns (first positive clock edge)
├─ All @(posedge clk) blocks trigger
├─ Sequential logic updates
└─ Time advances

Time 10ns, 15ns, ... (repeat)
```

### Delta Cycle (Same Time, Different Phases)

```
Time T.0 (before any activity)
Time T.1 (all procedural blocks)
Time T.2 (continuous assignments)
Time T.3 (monitor/assertion activity)
Time T.4 (simulation end events)
```

### Race Conditions in Simulation

```systemverilog
// Example: Which runs first?
always begin
  a = 1;
end

initial begin
  a = 0;
end
```

**Problem**: Execution order is undefined → simulation artifact
**Solution**: Use proper reset and initialization

---

## 8. Industry Standards

### IEEE 1800-2017 (Current Standard)

- Latest SystemVerilog specification
- Published by IEEE
- Implemented by: VCS, Vivado, ModelSim, Xsim, etc.
- Reference: IEEE standard document

### Tool Support

**Commercial Tools**
- VCS (Synopsys) - Most widely used
- ModelSim (Mentor) - Common in FPGA
- Vivado (Xilinx) - FPGA design
- Xcelium (Cadence) - Enterprise tool

**Open Source**
- Verilator - High-performance simulation
- iverilog - Educational tool
- open-source EDA tools

---

## 9. Best Practices

### Always Use:
- ✓ `logic` for design signals (not `wire`)
- ✓ `always_ff` for sequential (not `always @(posedge clk)`)
- ✓ `always_comb` for combinational (not `always @(*)`)
- ✓ Non-blocking for sequential (`<=`)
- ✓ Blocking for combinational (`=`)
- ✓ Interfaces for protocol definition
- ✓ Assertions for protocol checking
- ✓ Coverage for verification metrics

### Never Use:
- ✗ `reg` for new code (use `logic`)
- ✗ `wire` for assignment (use `logic`)
- ✗ Mixing blocking and non-blocking in same block
- ✗ `always` without sensitivity (use `always_ff` or `always_comb`)
- ✗ Global variables (use proper module ports)

---

## 10. Common Mistakes

### Mistake 1: Mixing Always Blocks
```systemverilog
// WRONG: Mixing blocking and non-blocking
always @(posedge clk) begin
  x <= y;        // Non-blocking (good)
  result = x & z; // Blocking (wrong here!)
end
```

### Mistake 2: Uninitialized Signals
```systemverilog
// WRONG: 'x' propagates through design
logic [7:0] data;  // Uninitialized = 'x'
always_comb begin
  output = data + 1;  // Result is 'x'
end
```

### Mistake 3: Missing Reset
```systemverilog
// WRONG: No reset = 'x' at start
always_ff @(posedge clk) begin
  counter <= counter + 1;  // Starts as 'x'
end
```

---

## 11. Summary

**SystemVerilog is the industry standard for:**
1. RTL design (synthesizable hardware)
2. Advanced testbenches (verification)
3. Protocol-level verification (assertions)
4. Coverage-driven verification
5. Constrained random stimulus generation

**Key Advantages:**
- Object-oriented testbenches
- Type-safe language features
- Comprehensive verification capabilities
- Industry tool support
- Continuous learning resources

**Next Steps:**
- Learn data types in depth
- Master procedural blocks
- Study OOP concepts
- Build your first testbench

---

*For practical examples, see `fundamentals/` directory*
