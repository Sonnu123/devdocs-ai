import os
from dotenv import load_dotenv

load_dotenv()

GOOGLE_API_KEY = os.getenv("GOOGLE_API_KEY")

if not GOOGLE_API_KEY:
    raise ValueError("GOOGLE_API_KEY not found in environment variables. Did you create a .env file?")

# Scraper config - URLs to scrape for documentation
DOCS_URLS = [
    "https://docs.python.org/3/tutorial/",
    "https://docs.python.org/3/library/functions.html",
    # Add more URLs here as needed
]

# Vector store config
VECTOR_STORE_PATH = "vectorstore/faiss_index"
CHUNK_SIZE = 1000
CHUNK_OVERLAP = 200

# API config
MAX_TOKENS = 500
TEMPERATURE = 0.3
