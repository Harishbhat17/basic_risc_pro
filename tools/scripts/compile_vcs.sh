#!/usr/bin/env bash
set -euo pipefail
TOP=${1:-top_tb}
shift || true
vcs -sverilog -timescale=1ns/1ps "$@" -top "$TOP"
