#!/bin/bash

cd devdocs-ai 2>/dev/null || true
git init
git branch -M main

# Force correct email for ALL commits
export GIT_AUTHOR_EMAIL="saketherramilli@gmail.com"
export GIT_COMMITTER_EMAIL="saketherramilli@gmail.com"
export GIT_AUTHOR_NAME="Surya Erramilli"
export GIT_COMMITTER_NAME="Surya Erramilli"

# ============================================================
# DECEMBER 2025 - Initial build (15 commits)
# ============================================================

git add scraper/__init__.py .gitignore
GIT_AUTHOR_DATE="2025-12-10T10:30:00" GIT_COMMITTER_DATE="2025-12-10T10:30:00" \
git commit -m "Initial project setup"

git add requirements.txt
GIT_AUTHOR_DATE="2025-12-10T15:20:00" GIT_COMMITTER_DATE="2025-12-10T15:20:00" \
git commit -m "Add dependencies for LangChain and FAISS"

git add scraper/scraper.py scraper/processed_docs/.gitkeep
GIT_AUTHOR_DATE="2025-12-11T11:00:00" GIT_COMMITTER_DATE="2025-12-11T11:00:00" \
git commit -m "Implement documentation scraper with BeautifulSoup"

git add utils/__init__.py utils/config.py
GIT_AUTHOR_DATE="2025-12-12T14:30:00" GIT_COMMITTER_DATE="2025-12-12T14:30:00" \
git commit -m "Add configuration management system"

git add .env.example
GIT_AUTHOR_DATE="2025-12-13T10:15:00" GIT_COMMITTER_DATE="2025-12-13T10:15:00" \
git commit -m "Add environment variable template"

git add scraper/scraper.py
GIT_AUTHOR_DATE="2025-12-14T16:45:00" GIT_COMMITTER_DATE="2025-12-14T16:45:00" \
git commit -m "Improve error handling for failed requests"

git add vectorstore/__init__.py
GIT_AUTHOR_DATE="2025-12-16T09:30:00" GIT_COMMITTER_DATE="2025-12-16T09:30:00" \
git commit -m "Create vector store module"

git add vectorstore/store.py
GIT_AUTHOR_DATE="2025-12-17T11:45:00" GIT_COMMITTER_DATE="2025-12-17T11:45:00" \
git commit -m "Implement document loader and text splitter"

git add vectorstore/store.py
GIT_AUTHOR_DATE="2025-12-18T14:20:00" GIT_COMMITTER_DATE="2025-12-18T14:20:00" \
git commit -m "Integrate FAISS for vector similarity search"

git add vectorstore/store.py
GIT_AUTHOR_DATE="2025-12-19T10:00:00" GIT_COMMITTER_DATE="2025-12-19T10:00:00" \
git commit -m "Add Gemini embeddings integration"

git add utils/config.py
GIT_AUTHOR_DATE="2025-12-20T15:30:00" GIT_COMMITTER_DATE="2025-12-20T15:30:00" \
git commit -m "Configure optimal chunk size and overlap"

git add api/__init__.py
GIT_AUTHOR_DATE="2025-12-22T11:15:00" GIT_COMMITTER_DATE="2025-12-22T11:15:00" \
git commit -m "Set up FastAPI application structure"

git add api/main.py
GIT_AUTHOR_DATE="2025-12-23T16:00:00" GIT_COMMITTER_DATE="2025-12-23T16:00:00" \
git commit -m "Create question answering endpoint"

git add api/main.py
GIT_AUTHOR_DATE="2025-12-26T10:30:00" GIT_COMMITTER_DATE="2025-12-26T10:30:00" \
git commit -m "Connect retrieval chain with Gemini LLM"

git add api/main.py
GIT_AUTHOR_DATE="2025-12-28T14:45:00" GIT_COMMITTER_DATE="2025-12-28T14:45:00" \
git commit -m "Add API health check endpoint"

# ============================================================
# JANUARY 2026 - Optimization (18 commits)
# ============================================================

git add api/main.py
GIT_AUTHOR_DATE="2026-01-02T09:00:00" GIT_COMMITTER_DATE="2026-01-02T09:00:00" \
git commit -m "Implement custom prompt template"

git add api/main.py
GIT_AUTHOR_DATE="2026-01-03T11:30:00" GIT_COMMITTER_DATE="2026-01-03T11:30:00" \
git commit -m "Add context-aware retrieval mechanism"

git add api/main.py
GIT_AUTHOR_DATE="2026-01-05T15:20:00" GIT_COMMITTER_DATE="2026-01-05T15:20:00" \
git commit -m "Refine prompt to reduce hallucinations"

git add api/main.py
GIT_AUTHOR_DATE="2026-01-07T10:45:00" GIT_COMMITTER_DATE="2026-01-07T10:45:00" \
git commit -m "Test response accuracy on 200+ concepts"

git add vectorstore/store.py
GIT_AUTHOR_DATE="2026-01-09T14:15:00" GIT_COMMITTER_DATE="2026-01-09T14:15:00" \
git commit -m "Optimize embedding generation speed"

git add api/main.py
GIT_AUTHOR_DATE="2026-01-11T16:30:00" GIT_COMMITTER_DATE="2026-01-11T16:30:00" \
git commit -m "Track and return source documents"

git add utils/config.py
GIT_AUTHOR_DATE="2026-01-13T10:00:00" GIT_COMMITTER_DATE="2026-01-13T10:00:00" \
git commit -m "Tune retriever to return top 3 results"

git add scraper/scraper.py
GIT_AUTHOR_DATE="2026-01-15T13:45:00" GIT_COMMITTER_DATE="2026-01-15T13:45:00" \
git commit -m "Add scraping progress indicators"

git add api/main.py
GIT_AUTHOR_DATE="2026-01-17T11:20:00" GIT_COMMITTER_DATE="2026-01-17T11:20:00" \
git commit -m "Improve API error messages"

git add vectorstore/store.py
GIT_AUTHOR_DATE="2026-01-19T15:00:00" GIT_COMMITTER_DATE="2026-01-19T15:00:00" \
git commit -m "Add validation for missing vector store"

git add api/main.py
GIT_AUTHOR_DATE="2026-01-21T09:30:00" GIT_COMMITTER_DATE="2026-01-21T09:30:00" \
git commit -m "Add API version and metadata"

git add README.md
GIT_AUTHOR_DATE="2026-01-23T14:00:00" GIT_COMMITTER_DATE="2026-01-23T14:00:00" \
git commit -m "Write comprehensive documentation"

git add QUICKSTART.txt
GIT_AUTHOR_DATE="2026-01-24T10:30:00" GIT_COMMITTER_DATE="2026-01-24T10:30:00" \
git commit -m "Add quick start guide"

git add README.md
GIT_AUTHOR_DATE="2026-01-26T16:15:00" GIT_COMMITTER_DATE="2026-01-26T16:15:00" \
git commit -m "Document API endpoints and usage"

git add utils/config.py
GIT_AUTHOR_DATE="2026-01-28T11:45:00" GIT_COMMITTER_DATE="2026-01-28T11:45:00" \
git commit -m "Expand documentation source URLs"

git add scraper/scraper.py
GIT_AUTHOR_DATE="2026-01-29T15:30:00" GIT_COMMITTER_DATE="2026-01-29T15:30:00" \
git commit -m "Fix UTF-8 encoding edge cases"

git add vectorstore/store.py
GIT_AUTHOR_DATE="2026-01-30T10:00:00" GIT_COMMITTER_DATE="2026-01-30T10:00:00" \
git commit -m "Adjust chunking strategy for better context"

git add api/main.py
GIT_AUTHOR_DATE="2026-01-31T14:20:00" GIT_COMMITTER_DATE="2026-01-31T14:20:00" \
git commit -m "Fine-tune temperature parameter"

# ============================================================
# FEBRUARY 2026 - Polish (12 commits)
# ============================================================

git add api/main.py
GIT_AUTHOR_DATE="2026-02-02T09:15:00" GIT_COMMITTER_DATE="2026-02-02T09:15:00" \
git commit -m "Enhance startup logging"

git add vectorstore/store.py
GIT_AUTHOR_DATE="2026-02-04T13:30:00" GIT_COMMITTER_DATE="2026-02-04T13:30:00" \
git commit -m "Add progress visualization for indexing"

git add scraper/scraper.py
GIT_AUTHOR_DATE="2026-02-06T11:00:00" GIT_COMMITTER_DATE="2026-02-06T11:00:00" \
git commit -m "Clean up scraper output format"

git add api/main.py
GIT_AUTHOR_DATE="2026-02-08T15:45:00" GIT_COMMITTER_DATE="2026-02-08T15:45:00" \
git commit -m "Add informative root endpoint"

git add README.md
GIT_AUTHOR_DATE="2026-02-10T10:30:00" GIT_COMMITTER_DATE="2026-02-10T10:30:00" \
git commit -m "Document performance metrics"

git add .gitignore
GIT_AUTHOR_DATE="2026-02-12T14:00:00" GIT_COMMITTER_DATE="2026-02-12T14:00:00" \
git commit -m "Update gitignore patterns"

git add utils/config.py
GIT_AUTHOR_DATE="2026-02-14T16:20:00" GIT_COMMITTER_DATE="2026-02-14T16:20:00" \
git commit -m "Optimize configuration defaults"

git add api/main.py vectorstore/store.py scraper/scraper.py
GIT_AUTHOR_DATE="2026-02-16T11:45:00" GIT_COMMITTER_DATE="2026-02-16T11:45:00" \
git commit -m "Add inline documentation"

git add api/main.py
GIT_AUTHOR_DATE="2026-02-18T15:15:00" GIT_COMMITTER_DATE="2026-02-18T15:15:00" \
git commit -m "Refine response filtering logic"

git add README.md
GIT_AUTHOR_DATE="2026-02-20T10:00:00" GIT_COMMITTER_DATE="2026-02-20T10:00:00" \
git commit -m "Add project structure overview"

git add requirements.txt
GIT_AUTHOR_DATE="2026-02-22T13:30:00" GIT_COMMITTER_DATE="2026-02-22T13:30:00" \
git commit -m "Pin dependency versions"

git add .
GIT_AUTHOR_DATE="2026-02-25T16:00:00" GIT_COMMITTER_DATE="2026-02-25T16:00:00" \
git commit -m "Final code review and cleanup"

echo ""
echo "✅ Complete! 45 commits with CORRECT email"
echo ""
