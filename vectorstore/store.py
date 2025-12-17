from langchain.text_splitter import RecursiveCharacterTextSplitter
from langchain_google_genai import GoogleGenerativeAIEmbeddings
from langchain_community.vectorstores import FAISS
from langchain.docstore.document import Document
import os
from typing import List
from utils.config import GOOGLE_API_KEY, VECTOR_STORE_PATH, CHUNK_SIZE, CHUNK_OVERLAP

class VectorStoreManager:
    def __init__(self):
        print("🔧 Initializing vector store manager...")
        self.embeddings = GoogleGenerativeAIEmbeddings(
            model="models/embedding-001",
            google_api_key=GOOGLE_API_KEY
        )
        self.text_splitter = RecursiveCharacterTextSplitter(
            chunk_size=CHUNK_SIZE,
            chunk_overlap=CHUNK_OVERLAP,
            length_function=len,
        )
        print("✓ Embeddings initialized with Gemini\n")
    
    def load_documents(self, docs_dir: str = "scraper/processed_docs") -> List[Document]:
        """Load all documents from the processed docs directory"""
        print(f"📂 Loading documents from {docs_dir}...")
        documents = []
        
        if not os.path.exists(docs_dir):
            raise FileNotFoundError(
                f"Documents directory {docs_dir} not found.\n"
                f"Run 'python -m scraper.scraper' first to scrape documentation."
            )
        
        for filename in os.listdir(docs_dir):
            if filename.endswith('.txt'):
                filepath = os.path.join(docs_dir, filename)
                
                with open(filepath, 'r', encoding='utf-8') as f:
                    content = f.read()
                    
                    doc = Document(
                        page_content=content,
                        metadata={"source": filename}
                    )
                    documents.append(doc)
        
        print(f"✓ Loaded {len(documents)} documents\n")
        return documents
    
    def create_vector_store(self, documents: List[Document]):
        """Create FAISS vector store from documents"""
        # Split documents into chunks
        print(f"✂️  Splitting documents into chunks...")
        texts = self.text_splitter.split_documents(documents)
        print(f"✓ Split into {len(texts)} chunks\n")
        
        # Create vector store
        print("🧮 Creating embeddings and building FAISS index...")
        print("⏳ This may take 1-2 minutes...\n")
        vectorstore = FAISS.from_documents(texts, self.embeddings)
        
        # Save to disk
        os.makedirs(os.path.dirname(VECTOR_STORE_PATH), exist_ok=True)
        vectorstore.save_local(VECTOR_STORE_PATH)
        print(f"✅ Vector store saved to {VECTOR_STORE_PATH}")
        print(f"🎯 Ready for semantic search!\n")
        
        return vectorstore
    
    def load_vector_store(self):
        """Load existing vector store from disk"""
        if not os.path.exists(VECTOR_STORE_PATH):
            raise FileNotFoundError(
                f"Vector store not found at {VECTOR_STORE_PATH}.\n"
                f"Run 'python -m vectorstore.store' first to build the vector database."
            )
        
        print(f"📥 Loading vector store from {VECTOR_STORE_PATH}...")
        vectorstore = FAISS.load_local(
            VECTOR_STORE_PATH,
            self.embeddings,
            allow_dangerous_deserialization=True
        )
        print("✓ Vector store loaded successfully\n")
        return vectorstore

if __name__ == "__main__":
    print("\n" + "="*60)
    print("🗄️  BUILDING VECTOR DATABASE")
    print("="*60 + "\n")
    
    manager = VectorStoreManager()
    
    # Load documents
    docs = manager.load_documents()
    
    # Create and save vector store
    manager.create_vector_store(docs)
    
    print("="*60)
    print("✅ VECTOR DATABASE BUILD COMPLETE!")
    print("="*60)
    print("\nNext step: Run the API with 'python -m api.main'\n")
