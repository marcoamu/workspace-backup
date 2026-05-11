# Twitter/X Trends Scraper Skill

## Description
Search Twitter/X for trending topics, hashtags, and discussions.

## Setup
```bash
pip3 install tweepy httpx
```

## Usage

### Using Twitter API v2
```python
import tweepy
import os

client = tweepy.Client(
    bearer_token=os.environ["TWITTER_BEARER_TOKEN"],
    consumer_key=os.environ["TWITTER_API_KEY"],
    consumer_secret=os.environ["TWITTER_API_SECRET"],
    access_token=os.environ["TWITTER_ACCESS_TOKEN"],
    access_token_secret=os.environ["TWITTER_ACCESS_SECRET"]
)

def search_tweets(query, limit=25):
    """Search tweets"""
    tweets = client.search_recent_tweets(
        query=query,
        tweet_fields=["created_at", "public_metrics", "author_id"],
        expansions=["author_id"],
        max_results=limit
    )
    
    return [{
        "id": t.id,
        "text": t.text,
        "created_at": str(t.created_at),
        "metrics": t.public_metrics,
        "author": t.author_id
    } for t in tweets.data] if tweets.data else []

def get_trending_topics():
    """Get trending topics (WOEID for Spain: 23424950)"""
    # Note: Requires Academic Research access
    return []

def search_by_hashtag(hashtag, limit=25):
    """Search by hashtag"""
    return search_tweets(f"#{hashtag}", limit)

def get_user_tweets(username, limit=10):
    """Get recent tweets from a user"""
    user = client.get_user(username=username)
    if not user.data:
        return []
    
    tweets = client.get_users_tweets(
        id=user.data.id,
        max_results=limit,
        tweet_fields=["created_at", "public_metrics"]
    )
    
    return [{
        "text": t.text,
        "created_at": str(t.created_at),
        "metrics": t.public_metrics
    } for t in tweets.data] if tweets.data else []
```

## Alternative: Web Scraping (No API)
```python
import httpx
from selectolax.parser import HTMLParser

async def scrape_twitter_trending():
    """Scrape Twitter trending without API"""
    async with httpx.AsyncClient() as client:
        response = await client.get(
            "https://syndication.twitter.com/srv/timeline-profile/screen-name/TwitterTrends",
            headers={"User-Agent": "Mozilla/5.0"}
        )
        # Parse response...
```

## Endpoints in MiBimax
- `GET /api/research/twitter?q=topic` - Search Twitter
- `GET /api/research/twitter/user?username=name` - User tweets

## Notes
- Twitter API requires approval for most endpoints
- Web scraping may be blocked
- Consider using Nitter (open source Twitter frontend) as alternative
