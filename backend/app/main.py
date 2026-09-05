from fastapi import FastAPI, HTTPException
from .data import PROJECTS

app = FastAPI(
    title="Jaydeo Sawale Portfolio API",
    version="13.0.0",
)


@app.get("/")
def root():
    return {
        "name": "Jaydeo Sawale",
        "service": "portfolio-api",
        "status": "ok",
    }


@app.get("/api/projects")
def projects():
    return PROJECTS


@app.get("/api/projects/{project_id}")
def project(project_id: str):
    for item in PROJECTS:
        if item["id"] == project_id:
            return item
    raise HTTPException(status_code=404, detail="Project not found")
