#!/usr/bin/env bash
set -euo pipefail
TOP=${1:-top_tb}
shift || true
vlib work
vlog -sv "$@"
vsim -c "$TOP" -do "run -all; quit -f"
