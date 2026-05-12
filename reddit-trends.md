# Reddit Trends Scraper Skill

## Description
Scrape Reddit to find trending topics, popular posts, and discussions.

## Setup
```bash
pip3 install praw beautifulsoup4 requests
```

## Usage

### Basic Search
```python
import praw
import json

reddit = praw.Reddit(
    client_id="your_client_id",
    client_secret="your_client_secret",
    user_agent="trends_scraper"
)

def get_trending_subreddits(limit=10):
    """Get trending subreddits"""
    return [s.display_name for s in reddit.subreddits.popular(limit=limit)]

def search_reddit(query, subreddit=None, limit=25):
    """Search Reddit for a topic"""
    results = []
    
    if subreddit:
        sub = reddit.subreddit(subreddit)
        posts = sub.search(query, limit=limit)
    else:
        posts = reddit.subreddit("all").search(query, limit=limit)
    
    for post in posts:
        results.append({
            "title": post.title,
            "url": post.url,
            "score": post.score,
            "num_comments": post.num_comments,
            "subreddit": post.subreddit.display_name,
            "created_utc": post.created_utc,
            "selftext": post.selftext[:500] if post.selftext else ""
        })
    
    return results

def get_trending_posts(subreddit="all", timeframe="day", limit=25):
    """Get trending posts from a subreddit"""
    sub = reddit.subreddit(subreddit)
    
    if timeframe == "hour":
        posts = sub.top("hour", limit=limit)
    elif timeframe == "week":
        posts = sub.top("week", limit=limit)
    else:
        posts = sub.top("day", limit=limit)
    
    return [{
        "title": p.title,
        "score": p.score,
        "comments": p.num_comments,
        "url": p.url,
        "subreddit": p.subreddit.display_name
    } for p in posts]
```

## Endpoints in MiBimax
- `GET /api/research/reddit?q=topic` - Search Reddit
- `GET /api/research/reddit/trending?sub=all` - Trending posts

## Notes
- Requires Reddit API credentials
- Rate limits apply (60 requests/minute)
