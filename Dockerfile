FROM python:3.12-slim

WORKDIR /app

COPY pyproject.toml poetry.lock ./

RUN pip install --no-cache-dir poetry

RUN poetry config virtualenvs.create false \
    && poetry install --no-interaction --no-ansi


COPY src ./src

CMD ["python", "src/main.py"]
