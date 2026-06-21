# SystemVerilog Learning Paths

Structured learning approaches for different roles and experience levels.

---

## Path 1: SystemVerilog Beginner (10-15 hours)

**Target Audience**: Students, newcomers to hardware design

### Week 1: Language Fundamentals

**Day 1-2: Core Concepts**
- [ ] Read: `docs/theory/systemverilog_basics.md`
- [ ] Study: Data types (logic, bit, int, real)
- [ ] Do: `fundamentals/data_types/` examples
- [ ] Practice: Write simple modules with different data types

**Day 3-4: Procedural Logic**
- [ ] Read: Procedural blocks theory
- [ ] Study: `always_ff` vs `always_comb` vs `initial`
- [ ] Do: `fundamentals/procedural_blocks/` examples
- [ ] Practice: Design a simple counter (synchronous)

**Day 5-6: Introduction to Testbenches**
- [ ] Read: Basic testbench concepts
- [ ] Study: `fundamentals/first_testbench/`
- [ ] Do: Write testbench for counter
- [ ] Practice: Simulate and observe waveforms

**Day 7: Review & Project**
- [ ] Review all concepts from week 1
- [ ] Complete: Simple counter + testbench project
- [ ] Verify: Can run simulation and understand waveforms

### Week 2: Intermediate Concepts

**Day 8-9: Object-Oriented Programming**
- [ ] Read: Classes and OOP theory
- [ ] Study: `fundamentals/classes/`
- [ ] Do: Create transaction classes
- [ ] Practice: Inheritance and method overriding

**Day 10-11: Interfaces**
- [ ] Read: Interface theory and modports
- [ ] Study: `fundamentals/interfaces/`
- [ ] Do: Define protocol interface with modports
- [ ] Practice: Use interface in testbench

**Day 12-13: Randomization**
- [ ] Read: Constrained randomization theory
- [ ] Study: `fundamentals/randomization/`
- [ ] Do: Write constrained transactions
- [ ] Practice: Debug constraint failures

**Day 14-15: First Real Testbench**
- [ ] Project: Design + Testbench for simple circuit
- [ ] Include: Classes, interfaces, randomization
- [ ] Verify: Can run and analyze results

### Capstone Project
```
Build an 8-bit multiplier with:
✓ RTL design (always_ff / always_comb)
✓ Interface definition
✓ Transaction class with constraints
✓ Basic testbench with 100 random tests
✓ Coverage report
```

**Checkpoint**: Comfortable with SV syntax and basic verification

---

## Path 2: RTL Designer (15-20 hours)

**Target Audience**: FPGA/ASIC designers, digital logic professionals

### Phase 1: Syntax & Semantics (5 hours)

- [ ] Study all data types and operators
- [ ] Practice: `fundamentals/operators/`
- [ ] Understand: Logic domains (synthesis vs simulation)
- [ ] Learn: Verilog compatibility and differences

### Phase 2: Design Patterns (8 hours)

**Clock Domain Crossing (2 hours)**
- [ ] Read: CDC theory in `docs/theory/`
- [ ] Study: `design_patterns/cdc/` with examples
- [ ] Practice: Implement dual FF synchronizer
- [ ] Verify: Protocol and assertions correct

**FIFO Design (2 hours)**
- [ ] Read: FIFO theory (pointers, gray code)
- [ ] Study: `design_patterns/fifo/`
- [ ] Design: Synchronous FIFO
- [ ] Practice: Generate, verify with testbench

**State Machines (2 hours)**
- [ ] Read: FSM theory (Mealy, Moore, encoding)
- [ ] Study: `design_patterns/fsm/`
- [ ] Design: Multi-state controller
- [ ] Analyze: Encoding options and tradeoffs

**Arbiters (1 hour)**
- [ ] Study: `design_patterns/arbiter/`
- [ ] Design: Priority arbiter
- [ ] Compare: Round-robin vs priority

**Pipeline Design (1 hour)**
- [ ] Study: Pipelining concepts
- [ ] Practice: Pipeline hazard detection
- [ ] Analyze: Throughput improvements

### Phase 3: Protocol Implementation (5 hours)

- [ ] Study: APB protocol
- [ ] Do: `projects/apb_slave_design/`
- [ ] Study: AXI-Lite protocol
- [ ] Do: `projects/axi_lite_slave/`
- [ ] Implement: One more custom protocol

### Phase 4: Real-World Considerations (2 hours)

- [ ] Read: Timing constraints and synthesis
- [ ] Study: Reset strategies
- [ ] Learn: Simulation speed optimization
- [ ] Practice: Design reviews and best practices

### RTL Designer Capstone Project
```
Implement a Small SoC Component:
✓ Multi-protocol master (AXI-Lite / APB)
✓ Internal state machine with CDC
✓ Full formal verification assertions
✓ Complete simulation testbench
✓ Documentation and timing analysis
```

---

## Path 3: Verification Engineer (18-25 hours)

**Target Audience**: QA engineers transitioning to hardware verification, test automation experts

### Phase 1: Testbench Fundamentals (5 hours)

**Basic Testbench Architecture**
- [ ] Read: Testbench design principles
- [ ] Study: `verification/basic_testbench/`
- [ ] Do: Write generators, drivers, monitors
- [ ] Practice: Create scoreboard

**Constrained Randomization**
- [ ] Deep dive: `fundamentals/randomization/`
- [ ] Master: Constraint writing strategies
- [ ] Practice: Debug constraint violations
- [ ] Learn: Seed management for reproducibility

### Phase 2: Coverage & Assertions (5 hours)

**Functional Coverage**
- [ ] Study: Coverage theory and metrics
- [ ] Do: `verification/coverage/`
- [ ] Write: Covergroups for protocols
- [ ] Analyze: Coverage reports and closure

**SystemVerilog Assertions (SVA)**
- [ ] Study: SVA theory and properties
- [ ] Do: `verification/assertions/`
- [ ] Write: Protocol assertions
- [ ] Practice: Assertion coverage

### Phase 3: Protocol Verification (6 hours)

**APB Protocol**
- [ ] Study: APB specification
- [ ] Do: `projects/apb_design/` testbench
- [ ] Write: Full APB verification environment

**AXI-Lite Protocol**
- [ ] Study: AXI-Lite specification
- [ ] Do: `projects/axi_lite_slave/` testbench
- [ ] Implement: Complete AXI-Lite verification

**UART Protocol**
- [ ] Study: UART theory
- [ ] Do: `projects/uart_design/` verification
- [ ] Add: Edge case and error testing

### Phase 4: UVM Methodology (6 hours)

**UVM Basics**
- [ ] Read: UVM theory and philosophy
- [ ] Study: `uvm_examples/basic_agent/`
- [ ] Do: Convert testbench to UVM
- [ ] Practice: Factory pattern

**Advanced UVM**
- [ ] Study: `uvm_examples/advanced_env/`
- [ ] Learn: Multi-agent environments
- [ ] Practice: UVM configuration database
- [ ] Master: Sequence layering

**UVM Integration**
- [ ] Study: Coverage integration in UVM
- [ ] Learn: Assertion integration
- [ ] Practice: UVM reporting

### Phase 5: Verification Methodology (3 hours)

- [ ] Read: Verification planning
- [ ] Study: Regression strategy
- [ ] Learn: Coverage closure methodology
- [ ] Practice: Test development process

### Verification Engineer Capstone Project
```
Complete Verification of a Complex Module:
✓ Write UVM environment (agent/env/test)
✓ Implement all coverage models
✓ Write comprehensive assertions
✓ Achieve 100% functional coverage
✓ Run regression suite
✓ Document verification plan
```

---

## Path 4: Design Verification Engineer (Expert Level, 30-40 hours)

**Target Audience**: Senior engineers combining design and verification expertise

### Phase 1: Master All Fundamentals (10 hours)

- [ ] Complete Path 1: Beginner
- [ ] Complete Path 2: RTL Designer  
- [ ] Complete Path 3: Verification Engineer
- [ ] Deep review: All theory documents

### Phase 2: Advanced Design Patterns (8 hours)

**Complex CDC Scenarios**
- [ ] Multi-bit CDC with handshake
- [ ] Partial bit CDC
- [ ] Clock mux synchronization

**Advanced FIFO Architectures**
- [ ] Asynchronous FIFO deep dive
- [ ] Parameterized FIFOs
- [ ] Special-purpose FIFOs

**Protocol Architecture**
- [ ] Layered protocol design
- [ ] Multi-protocol interfaces
- [ ] Error handling strategies

### Phase 3: Advanced Verification (8 hours)

**Formal Verification Basics**
- [ ] Study: Formal verification theory
- [ ] Learn: Bounded model checking
- [ ] Practice: Simple formal properties

**Advanced UVM**
- [ ] Master: Advanced sequence techniques
- [ ] Learn: UVM RAL (Register Abstraction Layer)
- [ ] Practice: Temporal assertions in UVM

**Performance Optimization**
- [ ] Learn: Simulation acceleration techniques
- [ ] Practice: Testbench optimization
- [ ] Study: Parallel simulation concepts

### Phase 4: System-Level Verification (6 hours)

- [ ] Multi-unit integration testing
- [ ] System-level coverage models
- [ ] Real-world protocol stacks
- [ ] Performance benchmarking

### Phase 5: Mentorship & Leadership (4 hours)

- [ ] Documentation best practices
- [ ] Code review criteria
- [ ] Team scalability
- [ ] Industry standards and compliance

### Expert Capstone Project
```
Design and Verify a Complete SoC Block:
✓ Multi-protocol interface
✓ Internal complex state machines
✓ CDC boundaries
✓ Formal property verification
✓ Comprehensive UVM environment
✓ 100%+ coverage (functional + code)
✓ Complete documentation
✓ Performance analysis
```

---

## Path 5: Hands-On Practical Track ("Learn by Doing")

**Best for**: People who learn through projects

### Project 1: Simple Counter (6 hours)
```
✓ Design: 8-bit up counter
✓ Testbench: Basic procedural testbench
✓ Coverage: Basic functional coverage
✓ Goal: Learn SV syntax
```

### Project 2: ALU Design (12 hours)
```
✓ Design: 8-bit ALU with 4 operations
✓ Testbench: UVM basic structure
✓ Coverage: Comprehensive functional coverage
✓ Assertions: SVA for ALU operations
✓ Goal: Learn design patterns + verification
```

### Project 3: UART Controller (20 hours)
```
✓ Design: TX/RX UART subsystem
✓ Protocol: UART protocol implementation
✓ Testbench: UVM environment with agents
��� Coverage: Protocol-level coverage
✓ Assertions: UART protocol assertions
✓ Goal: Real protocol verification
```

### Project 4: AXI-Lite Slave (25 hours)
```
✓ Design: Full AXI-Lite slave interface
✓ Protocol: Complete AXI-Lite specification
✓ Testbench: Advanced UVM with scoreboards
✓ Coverage: Cross coverage and protocol coverage
✓ Assertions: Complete AXI protocol verification
✓ Formal: Optional formal property verification
✓ Goal: Industry-level verification skills
```

### Project 5: Interconnect Module (35+ hours)
```
✓ Design: Simple crossbar / interconnect
✓ Protocols: Multiple protocol support
✓ Features: Arbitration, routing
✓ Testbench: Multi-agent UVM environment
✓ Coverage: System-level coverage
✓ Performance: Throughput and latency analysis
✓ Goal: Senior-level system design
```

---

## Quick Decision Tree

```
Are you a...
│
├─→ Student / Beginner?
│   └─→ START: Path 1 (Beginner)
│
├─→ FPGA / ASIC Designer?
│   └─→ START: Path 2 (RTL Designer)
│
├─→ Software QA Engineer?
│   └─→ START: Path 3 (Verification Engineer)
│
├─→ Experienced in both Design & Verification?
│   └─→ START: Path 4 (Design Verification Engineer)
│
└─→ Learn by doing projects?
    └─→ START: Path 5 (Hands-On Practical Track)
```

---

## Time Estimates

| Path | Level | Hours | Timeline |
|------|-------|-------|----------|
| 1 | Beginner | 10-15 | 2-3 weeks |
| 2 | Intermediate | 15-20 | 3-4 weeks |
| 3 | Intermediate | 18-25 | 4-5 weeks |
| 4 | Advanced | 30-40 | 8-10 weeks |
| 5 | Practical | Varies | Project-based |

---

## How to Use This Guide

1. **Identify your role** using the decision tree
2. **Pick your learning path** based on background
3. **Follow the structure** week by week or project by project
4. **Combine theory and practice** - don't skip either
5. **Do the projects** - hands-on experience is critical
6. **Review and iterate** - come back to theory as you practice
7. **Share your knowledge** - teach others to deepen understanding

---

## Recommended Study Schedule

### Full-Time (Professional)
- Path 1: 2-3 weeks
- Path 3: 4-5 weeks
- Total to proficiency: 6-8 weeks

### Part-Time (Evening/Weekend)
- Path 1: 4-6 weeks
- Path 3: 8-10 weeks  
- Total to proficiency: 12-16 weeks

### Dedicated Expert Track
- All paths + capstones: 8-10 weeks (full-time)
- 16-20 weeks (part-time)

---

**Remember**: The best engineers balance theory with practice. Don't just read — build, test, verify!
