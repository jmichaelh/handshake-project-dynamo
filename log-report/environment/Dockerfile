FROM python:3.11.9-slim@sha256:9c8d5d5e7f7f6e2ad0a6df9f9f0c2bfc5f56fda3d1d2d06e3b2f7b9d2f5f4f0d

RUN apt-get update && apt-get install -y --no-install-recommends \
    bash \
    ca-certificates \
    jq \
 && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir pytest==8.4.1 pytest-json-ctrf==0.3.5

WORKDIR /app

COPY access.log /app/access.log
<<<<<<< HEAD
COPY solution_hint.py /app/solution_hint.py
=======
COPY ../tests /tests
COPY ../instruction.md /instruction.md

CMD ["/bin/bash"]
>>>>>>> 2519cad8ca7a9364917427cd504c8878a2fcaa06
