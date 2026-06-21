# Simulation Performance Tips

- Run smoke tests first, then random regression.
- Limit waveform dumping to debug windows or key signals.
- Avoid `$display` in hot loops unless guarded.
- Use transaction-level monitors for lower overhead.
- Parallelize regressions across seeds and tests.
