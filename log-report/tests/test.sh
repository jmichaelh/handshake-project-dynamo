#!/usr/bin/env bash
set -euo pipefail

mkdir -p /logs/verifier

REPORT="/app/report.json"
LOG="/app/access.log"

fail() {
  echo "0" > /logs/verifier/reward.txt
  jq -n --arg reason "$1" '{success:false,reason:$reason}' > /logs/verifier/ctrf.json
  echo "$1" >&2
  exit 1
}

[[ -f "$REPORT" ]] || fail "missing /app/report.json"

python3 - <<'PY'
import json
import sys
from pathlib import Path

report_path = Path("/app/report.json")
log_path = Path("/app/access.log")

try:
    report = json.loads(report_path.read_text())
except Exception as e:
    print(f"invalid JSON: {e}")
    sys.exit(2)

if not isinstance(report, dict):
    print("report is not an object")
    sys.exit(3)

for key in ("total_requests", "unique_ips"):
    if key not in report:
        print(f"missing key: {key}")
        sys.exit(4)
    if not isinstance(report[key], int):
        print(f"{key} is not an integer")
        sys.exit(5)

lines = [ln for ln in log_path.read_text().splitlines() if ln.strip()]
expected_total = len(lines)
expected_unique = len({ln.split()[0] for ln in lines})

if report["total_requests"] != expected_total:
    print(f"bad total_requests: {report['total_requests']} != {expected_total}")
    sys.exit(6)

if report["unique_ips"] != expected_unique:
    print(f"bad unique_ips: {report['unique_ips']} != {expected_unique}")
    sys.exit(7)

print(json.dumps({
    "success": True,
    "total_requests": report["total_requests"],
    "unique_ips": report["unique_ips"],
    "expected_total": expected_total,
    "expected_unique": expected_unique
}))
PY

status=$?
if [[ $status -eq 0 ]]; then
  echo "1" > /logs/verifier/reward.txt
  jq -n --slurpfile result <(python3 - <<'PY'
import json
from pathlib import Path
report = json.loads(Path("/app/report.json").read_text())
print(json.dumps(report))
PY
) '{success:true}' > /logs/verifier/ctrf.json
  exit 0
fi

fail "report contents are incorrect"
