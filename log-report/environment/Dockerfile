FROM python:latest

WORKDIR /app

COPY data/ /app/data/
COPY tests/ /app/tests/
COPY access.log /app/access.log
COPY solution_hint.py /app/solution_hint.py

RUN pip install --no-cache-dir pytest
RUN pip install --no-cache-dir pytest==8.4.1 pytest-json-ctrf==0.3.5

CMD ["/bin/bash"]
