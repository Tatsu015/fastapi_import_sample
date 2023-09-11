# fastapi_import_sample

this code is use fastapi in python playwright base image.

## Usage

```bash
docker build -t fastapi_import_sample --target runtime .
docker run -it fastapi_import_sample:latest /bin/bash
```

and run fastapi application

```bash
uvicorn fastapi_import_sample.main:app
```
