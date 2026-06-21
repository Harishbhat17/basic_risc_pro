# Debugging Guide

## Common Issues

1. **X-propagation after reset**
   - Verify reset deassertion synchronization.
   - Ensure all sequential elements have reset behavior.

2. **Scoreboard mismatches**
   - Compare transaction packing/unpacking in monitor vs driver.
   - Check latency assumptions in expected model.

3. **Stuck handshakes**
   - Add SVA on ready/valid response timing.
   - Confirm clock-domain crossing structure.

4. **Coverage not improving**
   - Add targeted tests for uncovered bins.
   - Revisit constraints to avoid over-constraining.
