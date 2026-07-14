FROM python:3.11.9-slim@sha256:9c8d5d5e7f7f6e2ad0a6df9f9f0c2bfc5f56fda3d1d2d06e3b2f7b9d2f5f4f0d

RUN apt-get update && apt-get install -y --no-install-recommends \
    bash \
    ca-certificates \
    jq \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY access.log /app/access.log
COPY ../tests /tests
COPY ../instruction.md /instruction.md

CMD ["/bin/bash"]
