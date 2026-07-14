Your task is to create `/app/report.json` from the access log.

Success criteria:
1. `/app/report.json` must exist after your solution runs.
2. `/app/report.json` must be valid JSON and contain an object.
3. The object must contain exactly these required integer fields:
   - `total_requests`
   - `unique_ips`
4. `total_requests` must equal the number of non-empty lines in `/app/access.log`.
5. `unique_ips` must equal the number of distinct client IP addresses in `/app/access.log`.
6. The verifier checks the actual JSON values, not just file existence.

Notes:
- Do not hardcode values.
- Do not write the report anywhere except `/app/report.json`.
- The environment already includes the access log at `/app/access.log`.
