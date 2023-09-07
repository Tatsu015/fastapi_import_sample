FROM python:3.10.7-bullseye

ENV PYTHONUNBUFFERED 1

WORKDIR /src/app

COPY requirements.txt /tmp/pip-tmp/
RUN pip --disable-pip-version-check --no-cache-dir install -r /tmp/pip-tmp/requirements.txt \
    && rm -rf /tmp/pip-tmp

COPY fastapi_import_sample ./fastapi_import_sample/
