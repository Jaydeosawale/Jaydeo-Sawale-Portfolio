# Portfolio V14

Premium Flutter Web portfolio for Jaydeo Sawale.

## Positioning
- Professional experience: Android and Flutter frontend/mobile development at eNyota Learning Pvt. Ltd.
- Independent engineering: Python backend services, Machine Learning, Generative AI, RAG, MLOps, testing, Docker, CI/CD, and deployment workflows.

## Flagship projects
1. MessageShield AI — MLOps / Machine Learning / AI Safety
2. Trav Planner — Flutter / Mobile Application Engineering
3. LegalLens AI — Generative AI / RAG / Document Intelligence
4. AI Nexus — LLMs / Agents / AI Systems

## Local validation
```bash
python3 -m venv .venv
source .venv/bin/activate
pip install -r backend/requirements.txt
pytest

cd frontend
flutter pub get
flutter analyze
flutter run -d chrome
```

Project links (Web, Android APK, iOS, GitHub) are modeled as optional URLs. Add the real URLs in `frontend/lib/data/portfolio_data.dart`; enabled buttons open externally.

The profile image asset is a crop of the supplied photograph with only pixel-level brightness, contrast, and color adjustments.
