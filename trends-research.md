# Trends Research Skill

## Description
Combined skill for researching trends across Reddit, Twitter/X, and GitHub.

## Usage

### Quick Search All Platforms
```python
async def research_trends(query):
    """Research a topic across all platforms"""
    results = {
        "reddit": await search_reddit(query),
        "twitter": await search_twitter(query),
        "github": search_github_repos(query)
    }
    return results

def generate_trends_report(query):
    """Generate a comprehensive trends report"""
    import datetime
    
    report = {
        "query": query,
        "date": datetime.now().isoformat(),
        "sources": {}
    }
    
    # Reddit
    report["sources"]["reddit"] = {
        "posts": search_reddit(query, limit=10),
        "subreddits": get_related_subreddits(query)
    }
    
    # GitHub  
    report["sources"]["github"] = {
        "repositories": search_github_repos(query, limit=10)
    }
    
    # Twitter
    report["sources"]["twitter"] = {
        "tweets": search_tweets(query, limit=10)
    }
    
    return report
```

## API Endpoints
| Endpoint | Description |
|----------|-------------|
| `/api/research/trends?q=topic` | All platforms |
| `/api/research/reddit` | Reddit only |
| `/api/research/twitter` | Twitter only |
| `/api/research/github` | GitHub only |

## Installation
```bash
pip3 install praw httpx beautifulsoup4 selectolax
```

## Notes
- Configure API keys for full access
- Respect rate limits
- Use async for better performance
