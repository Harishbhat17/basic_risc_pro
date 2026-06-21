#!/usr/bin/env python3
"""Simple coverage summary parser for simulator text reports."""
from pathlib import Path
import re
import sys

if len(sys.argv) != 2:
    print("Usage: coverage_report.py <report.log>")
    raise SystemExit(1)

text = Path(sys.argv[1]).read_text(encoding="utf-8", errors="ignore")
percentages = [float(x) for x in re.findall(r"(\d+(?:\.\d+)?)%", text)]
if not percentages:
    print("No coverage percentages found")
    raise SystemExit(2)
print(f"Found {len(percentages)} coverage metrics")
print(f"Min: {min(percentages):.2f}%")
print(f"Max: {max(percentages):.2f}%")
print(f"Avg: {sum(percentages)/len(percentages):.2f}%")
