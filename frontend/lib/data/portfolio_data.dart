import '../models/project.dart';

const projects = <Project>[
  Project(
    id: 'messageshield-ai',
    number: '01',
    name: 'MessageShield AI',
    category: 'MLOps • Machine Learning • AI Safety',
    stage: 'Flagship Project',
    tagline:
        'A complete end-to-end AI safety system combining Machine Learning, FastAPI, Flutter, web application development, automated testing, Docker, CI/CD, and deployment workflows.',
    overview:
        'MessageShield AI is a complete end-to-end AI and MLOps project that takes a machine learning model beyond experimentation and integrates it into real applications. The system combines ML-based message classification with a FastAPI backend, Flutter application, web experience, automated testing, Docker, CI/CD, and deployment-oriented workflows.',
    role:
        'Independent AI/ML engineer — designed and built the ML workflow, backend services, Flutter application, web application experience, testing strategy, containerization, and CI/CD workflows.',
    outcomes: [
      'Built a message classification workflow using TF-IDF feature extraction and Logistic Regression.',
      'Integrated trained model inference into a FastAPI backend service.',
      'Developed application experiences using Flutter.',
      'Built a web application interface for interacting with the system.',
      'Created structured API workflows connecting applications with machine learning inference.',
      'Added automated tests with Pytest to verify backend behavior.',
      'Containerized the backend application with Docker.',
      'Implemented GitHub Actions CI workflows for automated validation.',
      'Prepared the system for reproducible development and deployment workflows.',
    ],
    technologies: [
      'Python',
      'Scikit-learn',
      'TF-IDF',
      'Logistic Regression',
      'FastAPI',
      'Flutter',
      'Dart',
      'REST APIs',
      'Pytest',
      'Docker',
      'Git',
      'GitHub Actions',
      'CI/CD',
      'Render',
      'Vercel',
    ],
    architecture: [
      'Flutter / Web application',
      'API communication',
      'FastAPI backend',
      'Request validation',
      'Text preprocessing',
      'TF-IDF features',
      'Logistic Regression inference',
      'Safety classification',
      'Structured response',
    ],
    approach: [
      'Started with a lightweight and interpretable classical machine learning baseline for efficient experimentation and inference.',
      'Separated application UI, backend APIs, and model inference into clear engineering boundaries.',
      'Connected machine learning capabilities to real Flutter and web application experiences.',
      'Used automated tests as a safety net for backend behavior.',
      'Used Docker and CI/CD workflows to support reproducible development and delivery.',
    ],
    challenges: [
      'Moving from machine learning experimentation into a complete multi-layer application.',
      'Keeping preprocessing and inference behavior consistent between development and serving.',
      'Connecting mobile, web, backend, and ML components through clear interfaces.',
      'Recognizing the current multilingual limitations of TF-IDF and Logistic Regression.',
    ],
    roadmap: [
      'Evaluate multilingual embeddings and Transformer-based alternatives.',
      'Expand safety and risk taxonomy with stronger evaluation coverage.',
      'Introduce richer model monitoring and release gates.',
      'Improve edge-case and language-specific evaluation.',
    ],
    webUrl: 'https://messageshield-ai.vercel.app',
    androidUrl:
        'https://github.com/Jaydeosawale/messageshield-ai/releases/latest/download/MessageShield.apk',
    iosUrl: null,
    githubUrl: 'https://github.com/Jaydeosawale/messageshield-ai',
  ),

  Project(
    id: 'trav-planner',
    number: '02',
    name: 'Trav Planner',
    category: 'Flutter • Mobile Application Engineering',
    stage: 'Flagship Project',
    tagline:
        'A mobile-first travel planning application connecting Flutter development with practical state management, caching, persistence, and application architecture.',
    overview:
        'Trav Planner represents the Flutter and mobile application engineering side of the portfolio. It focuses on building maintainable application experiences using reusable UI components, structured state management, caching, persistence, and practical product flows.',
    role:
        'Independent application engineer — designed and developed the mobile experience and supporting application architecture.',
    outcomes: [
      'Built a Flutter-based application for planning and organizing travel information.',
      'Structured the application around reusable UI components and state-driven flows.',
      'Worked with REST-oriented data flows and client-side application architecture.',
      'Applied Riverpod for structured application state management.',
      'Explored caching and secure local storage concepts within the application workflow.',
    ],
    technologies: [
      'Flutter',
      'Dart',
      'Riverpod',
      'REST APIs',
      'Redis',
      'Secure Storage',
    ],
    architecture: [
      'Mobile UI',
      'Reusable widgets',
      'State management',
      'Service / data layer',
      'REST communication',
      'Caching',
      'Local persistence',
    ],
    approach: [
      'Prioritized responsive and reusable Flutter UI architecture.',
      'Separated presentation concerns from application state and data handling.',
      'Applied caching and persistence where they improve user experience.',
      'Focused on maintainable application flows as the project grows.',
    ],
    challenges: [
      'Keeping growing mobile UI flows maintainable.',
      'Managing state boundaries without tightly coupling screens to data handling.',
      'Balancing a simple user experience with an architecture that can evolve.',
    ],
    roadmap: [
      'Refine travel information architecture and UX.',
      'Strengthen offline and caching behavior where appropriate.',
      'Expand automated testing around critical user flows.',
    ],
  ),

  Project(
    id: 'legallens-ai',
    number: '03',
    name: 'LegalLens AI',
    category: 'Generative AI • RAG • Document Intelligence',
    stage: 'Flagship Project',
    tagline:
        'A retrieval-first AI system exploring document processing, embeddings, semantic search, and grounded LLM responses.',
    overview:
        'LegalLens AI explores how document processing, retrieval, and large language models can work together to produce more context-aware AI experiences. The project emphasizes retrieval quality and grounding rather than treating an LLM as a standalone answer engine.',
    role:
        'Independent GenAI engineer — designed the retrieval-first architecture and explored document-to-context workflows.',
    outcomes: [
      'Designed a document-to-retrieval-to-generation workflow.',
      'Worked through text chunking and embedding concepts for semantic search.',
      'Explored context construction before passing information to an LLM.',
      'Identified retrieval evaluation and reranking as key areas for improvement.',
    ],
    technologies: [
      'Python',
      'LLMs',
      'RAG',
      'Embeddings',
      'Vector Search',
      'Semantic Retrieval',
      'Prompt Engineering',
    ],
    architecture: [
      'Document ingestion',
      'Text extraction',
      'Chunking',
      'Embeddings',
      'Vector retrieval',
      'Context construction',
      'LLM generation',
    ],
    approach: [
      'Retrieve relevant context before generation to reduce unsupported responses.',
      'Treat chunking, retrieval, and context quality as first-class engineering concerns.',
      'Keep retrieval conceptually separate from generation to make the system easier to evaluate and improve.',
    ],
    challenges: [
      'Choosing useful chunk boundaries and retrieval granularity.',
      'Understanding how retrieval quality controls downstream answer quality.',
      'Controlling context size while preserving the information needed by the model.',
    ],
    roadmap: [
      'Add retrieval evaluation and benchmark datasets.',
      'Experiment with reranking for stronger context selection.',
      'Improve citation and grounding behavior.',
    ],
  ),

  Project(
    id: 'ai-nexus',
    number: '04',
    name: 'AI Nexus',
    category: 'Native Android • Kotlin • Generative AI',
    stage: 'Flagship Project',
    tagline:
        'A Native Android application built with Kotlin for exploring how Generative AI, LLM-powered features, and modern mobile application architecture can work together.',
    overview:
        'AI Nexus represents the Native Android and Kotlin side of the portfolio combined with modern AI engineering. The project explores integrating AI-powered capabilities into a native mobile application while applying structured Android architecture, reusable components, and maintainable application design.',
    role:
        'Independent Android and AI engineer — designed and developed the Native Android application using Kotlin while exploring AI-powered application workflows.',
    outcomes: [
      'Built a Native Android application using Kotlin.',
      'Applied structured mobile application architecture and reusable UI patterns.',
      'Explored integration of Generative AI and LLM-powered capabilities.',
      'Worked with API-driven application workflows.',
      'Designed the project to connect Native Android development with modern AI features.',
    ],
    technologies: [
      'Kotlin',
      'Native Android',
      'Android SDK',
      'Generative AI',
      'LLMs',
      'REST APIs',
      'Mobile Architecture',
    ],
    architecture: [
      'Native Android UI',
      'Application architecture',
      'State and UI logic',
      'API communication',
      'AI / LLM services',
      'Application response',
    ],
    approach: [
      'Use Native Android and Kotlin as the foundation for the application.',
      'Keep mobile UI, application logic, and AI services separated.',
      'Treat AI capabilities as application features integrated through clear boundaries.',
      'Focus on maintainable Android architecture rather than placing AI logic directly inside the UI layer.',
    ],
    challenges: [
      'Designing clear boundaries between Native Android application logic and AI services.',
      'Managing asynchronous API and AI workflows in a responsive mobile experience.',
      'Keeping AI-powered features predictable and maintainable.',
    ],
    roadmap: [
      'Expand AI-powered application capabilities.',
      'Improve evaluation and reliability of AI responses.',
      'Add stronger testing around Android and AI workflows.',
      'Explore additional LLM and agent-powered features.',
    ],
  ),
];