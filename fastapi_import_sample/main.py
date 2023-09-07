from fastapi import FastAPI
from fastapi_import_sample.module.mod1 import mod1_f

app = FastAPI()


@app.get("/")
async def root():
    return {"message": "Hello World"}

@app.get("/mod1")
async def mod1_result():
    return mod1_f()
