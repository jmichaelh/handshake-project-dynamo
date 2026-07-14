FROM python:3.11-slim

WORKDIR /app
COPY data/ /app/data/
COPY tests/ /app/tests/

RUN pip install --no-cache-dir pytest

CMD ["/bin/bash"]
