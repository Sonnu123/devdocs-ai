from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
from langchain_google_genai import ChatGoogleGenerativeAI
from langchain.chains import RetrievalQA
from langchain.prompts import PromptTemplate
from vectorstore.store import VectorStoreManager
from utils.config import GOOGLE_API_KEY, MAX_TOKENS, TEMPERATURE

app = FastAPI(
    title="DevDocs AI",
    description="RAG-based Q&A system for technical documentation",
    version="1.0.0"
)

# Initialize vector store and QA chain
print("\n" + "="*60)
print("🚀 INITIALIZING DEVDOCS AI API")
print("="*60 + "\n")

try:
    manager = VectorStoreManager()
    vectorstore = manager.load_vector_store()
    
    # Create LLM with Gemini
    print("🤖 Initializing Gemini AI...")
    llm = ChatGoogleGenerativeAI(
        model="gemini-pro",
        temperature=TEMPERATURE,
        max_tokens=MAX_TOKENS,
        google_api_key=GOOGLE_API_KEY
    )
    print("✓ Gemini AI initialized\n")
    
    # Custom prompt template for better responses and reduced hallucinations
    prompt_template = """You are a helpful programming assistant. Use the following pieces of context to answer the question at the end. 

If you don't know the answer based on the context, just say "I don't have enough information in the documentation to answer that question." Don't try to make up an answer.

Always provide code examples when relevant and keep explanations clear and concise.

Context: {context}

Question: {question}

Answer:"""
    
    PROMPT = PromptTemplate(
        template=prompt_template,
        input_variables=["context", "question"]
    )
    
    # Create QA chain with retrieval
    print("🔗 Building QA chain...")
    qa_chain = RetrievalQA.from_chain_type(
        llm=llm,
        chain_type="stuff",
        retriever=vectorstore.as_retriever(search_kwargs={"k": 3}),
        chain_type_kwargs={"prompt": PROMPT},
        return_source_documents=True
    )
    print("✓ QA chain ready\n")
    
    print("="*60)
    print("✅ API INITIALIZATION COMPLETE!")
    print("="*60)
    print("\n🌐 API running at: http://localhost:8000")
    print("📖 Docs available at: http://localhost:8000/docs\n")
    
except Exception as e:
    print(f"\n❌ Error initializing API: {e}\n")
    print("Make sure you've completed these steps:")
    print("1. Created .env file with GOOGLE_API_KEY")
    print("2. Run 'python -m scraper.scraper' to scrape docs")
    print("3. Run 'python -m vectorstore.store' to build vector DB\n")
    qa_chain = None

class Question(BaseModel):
    question: str

class Answer(BaseModel):
    question: str
    answer: str
    sources: list[str]

@app.get("/")
def read_root():
    """Root endpoint - returns API information"""
    return {
        "message": "DevDocs AI - RAG-based Q&A System",
        "version": "1.0.0",
        "status": "online" if qa_chain else "error",
        "endpoints": {
            "/": "GET - API information",
            "/ask": "POST - Ask a technical question",
            "/health": "GET - Health check",
            "/docs": "GET - Interactive API documentation"
        },
        "example_usage": {
            "curl": 'curl -X POST "http://localhost:8000/ask" -H "Content-Type: application/json" -d \'{"question": "What is a Python decorator?"}\''
        }
    }

@app.get("/health")
def health_check():
    """Health check endpoint"""
    if qa_chain is None:
        raise HTTPException(
            status_code=503,
            detail="QA chain not initialized. Check server logs."
        )
    return {
        "status": "healthy",
        "model": "gemini-pro",
        "embeddings": "models/embedding-001"
    }

@app.post("/ask", response_model=Answer)
def ask_question(question: Question):
    """
    Ask a technical question and get an AI-generated answer.
    
    The system will:
    1. Search the vector database for relevant documentation
    2. Use Gemini AI to generate an answer from the context
    3. Return the answer with source documents
    """
    if qa_chain is None:
        raise HTTPException(
            status_code=503,
            detail="QA chain not initialized. Make sure vector store is built."
        )
    
    try:
        # Get answer from QA chain
        result = qa_chain({"query": question.question})
        
        # Extract source documents
        sources = [
            doc.metadata.get("source", "unknown") 
            for doc in result.get("source_documents", [])
        ]
        
        return Answer(
            question=question.question,
            answer=result["result"],
            sources=list(set(sources))  # Remove duplicates
        )
    
    except Exception as e:
        raise HTTPException(
            status_code=500,
            detail=f"Error processing question: {str(e)}"
        )

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)
