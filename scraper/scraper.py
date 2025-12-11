import requests
from bs4 import BeautifulSoup
import os
from typing import List
from utils.config import DOCS_URLS

class DocumentationScraper:
    def __init__(self, urls: List[str]):
        self.urls = urls
        self.output_dir = "scraper/processed_docs"
        os.makedirs(self.output_dir, exist_ok=True)
    
    def scrape_url(self, url: str) -> str:
        """Scrape content from a single URL"""
        try:
            print(f"  Fetching {url}...")
            response = requests.get(url, timeout=10)
            response.raise_for_status()
            
            soup = BeautifulSoup(response.content, 'html.parser')
            
            # Remove script and style elements
            for script in soup(["script", "style"]):
                script.decompose()
            
            # Get text
            text = soup.get_text()
            
            # Clean up whitespace
            lines = (line.strip() for line in text.splitlines())
            chunks = (phrase.strip() for line in lines for phrase in line.split("  "))
            text = '\n'.join(chunk for chunk in chunks if chunk)
            
            print(f"  ✓ Successfully scraped {len(text)} characters")
            return text
        except Exception as e:
            print(f"  ✗ Error scraping {url}: {e}")
            return ""
    
    def scrape_all(self):
        """Scrape all configured URLs"""
        print(f"\n🔍 Starting documentation scraper...")
        print(f"📝 Will scrape {len(self.urls)} URLs\n")
        
        for i, url in enumerate(self.urls):
            print(f"[{i+1}/{len(self.urls)}] Scraping {url}...")
            content = self.scrape_url(url)
            
            if content:
                # Save to file
                filename = f"doc_{i}.txt"
                filepath = os.path.join(self.output_dir, filename)
                
                with open(filepath, 'w', encoding='utf-8') as f:
                    f.write(f"Source: {url}\n\n")
                    f.write(content)
                
                print(f"  💾 Saved to {filepath}\n")
        
        print(f"✅ Scraped {len(self.urls)} documents successfully!")
        print(f"📁 Documents saved in: {self.output_dir}/\n")

if __name__ == "__main__":
    scraper = DocumentationScraper(DOCS_URLS)
    scraper.scrape_all()
