from fastapi.testclient import TestClient

from backend.app.main import app

client = TestClient(app)


def test_root():
    response = client.get("/")
    assert response.status_code == 200
    assert response.json()["status"] == "ok"


def test_projects():
    response = client.get("/api/projects")
    assert response.status_code == 200
    assert len(response.json()) == 4
