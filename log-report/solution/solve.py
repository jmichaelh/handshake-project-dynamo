import json
from pathlib import Path

log_path = Path("/app/access.log")
report_path = Path("/app/report.json")

lines = [line for line in log_path.read_text().splitlines() if line.strip()]
total_requests = len(lines)
unique_ips = len({line.split()[0] for line in lines})

report = {
    "total_requests": total_requests,
    "unique_ips": unique_ips,
}

report_path.write_text(json.dumps(report))
