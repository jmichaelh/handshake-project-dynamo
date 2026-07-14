#!/bin/bash
set -euo pipefail

mkdir -p /logs/verifier
pytest -q /app/tests/test_outputs.py
status=$?
echo "$([ $status -eq 0 ] && echo 1 || echo 0)" > /logs/verifier/reward.txt
exit $status
