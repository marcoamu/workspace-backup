# GitHub Trends Scraper Skill

## Description
Scrape GitHub for trending repositories, popular projects, and developer trends.

## Setup
```bash
pip3 install httpx beautifulsoup4
```

## Usage

### Get Trending Repos
```python
import httpx
from selectolax.parser import HTMLParser

def get_github_trending(language="", timeframe="daily"):
    """Get trending GitHub repositories"""
    url = f"https://github.com/trending"
    if language:
        url = f"https://github.com/trending/{language}"
    
    response = httpx.get(url, headers={
        "User-Agent": "Mozilla/5.0"
    })
    
    parser = HTMLParser(response.text)
    repos = []
    
    for article in parser.css("article"):
        try:
            repo = article.css_first("h2 a")
            stars = article.css_first("span[data-view-component='true']")
            
            if repo:
                repo_path = repo.attributes.get("href", "")
                repos.append({
                    "name": repo_path.replace("/", ""),
                    "full_name": repo_path.strip("/"),
                    "url": f"https://github.com{repo_path}",
                    "stars": stars.text() if stars else "0"
                })
        except:
            continue
    
    return repos

def search_github_repos(query, sort="stars", limit=10):
    """Search GitHub repositories via API"""
    import os
    token = os.environ.get("GITHUB_TOKEN", "")
    
    headers = {"Authorization": f"Bearer {token}"} if token else {}
    
    response = httpx.get(
        f"https://api.github.com/search/repositories",
        params={"q": query, "sort": sort, "per_page": limit},
        headers=headers
    )
    
    if response.status_code == 200:
        return [{
            "name": r["name"],
            "full_name": r["full_name"],
            "description": r["description"],
            "stars": r["stargazers_count"],
            "forks": r["forks_count"],
            "language": r["language"],
            "url": r["html_url"]
        } for r in response.json().get("items", [])]
    
    return []

def get_repo_readme(owner, repo):
    """Get repository README"""
    import base64
    import os
    
    token = os.environ.get("GITHUB_TOKEN", "")
    headers = {"Authorization": f"Bearer {token}"} if token else {}
    
    response = httpx.get(
        f"https://api.github.com/repos/{owner}/{repo}/readme",
        headers=headers
    )
    
    if response.status_code == 200:
        content = response.json().get("content", "")
        return base64.b64decode(content).decode("utf-8")
    
    return ""
```

## Endpoints in MiBimax
- `GET /api/research/github/trending?language=python` - Trending repos
- `GET /api/research/github/search?q=topic` - Search repos
- `GET /api/research/github/repo?owner=name&repo=name` - Repo details

## Notes
- GitHub API has rate limits (60/hour without token)
- Web scraping GitHub is against ToS
- Use official API for reliable results
