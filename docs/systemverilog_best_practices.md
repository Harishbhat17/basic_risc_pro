# SystemVerilog Best Practices

- Use `always_ff`, `always_comb`, `always_latch` consistently.
- Keep interfaces protocol-centric with modports for role separation.
- Prefer enumerated state types for FSM readability and safety.
- Keep combinational logic fully assigned to avoid latch inference.
- Use assertions for protocol legality, not only in testbench.
- Use constrained-random plus directed corner-case tests.
- Collect functional coverage tied to verification plan goals.
- Maintain clear reset semantics in design and assertions.
