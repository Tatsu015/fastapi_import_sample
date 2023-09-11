FROM python:3.11.4-slim-bullseye as builder
WORKDIR /code
RUN apt -y update && apt -y install curl
ENV POETRY_HOME=/code/poetry
RUN curl -sSL https://install.python-poetry.org | python3 - && \
    cd /usr/local/bin && \
    ln -s /code/poetry/bin/poetry
RUN poetry config virtualenvs.create false 
COPY poetry.lock /code/
COPY pyproject.toml /code/
COPY ./fastapi_import_sample /code/fastapi_import_sample
COPY ./README.md /code/
RUN poetry install --no-dev
RUN poetry export -f requirements.txt >> requirements.txt


FROM mcr.microsoft.com/playwright/python:v1.35.0-jammy as runtime
EXPOSE 8080
ENV PYTHONUNBUFFERED 1
WORKDIR /src/app
COPY --from=builder /code/requirements.txt /tmp/pip-tmp/
RUN pip --disable-pip-version-check --no-cache-dir install -r /tmp/pip-tmp/requirements.txt \
    && rm -rf /tmp/pip-tmp
COPY fastapi_import_sample ./fastapi_import_sample/
