#!/usr/bin/env bash
set -euo pipefail
TOP=${1:-top_tb}
shift || true
xvlog --sv "$@"
xelab "$TOP"
