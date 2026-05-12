# 🤖 OpenClaw - AI Assistant Platform

Your personal AI assistant with automation, multi-channel support, and autonomous agents.

![Version](https://img.shields.io/badge/version-1.0.0-blue)
![Node.js](https://img.shields.io/badge/Node.js-22.x-green)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-16+-blue)

## 🌟 Features

### 🤖 Autonomous Agents
- **Research Agent** - Automated web research with multiple sources
- **Finance Agent** - Financial analysis and market data
- **Frontend Agent** - UI/UX development and presentations
- **Backend Agent** - API and script development
- **Writer Agent** - Content creation
- **Designer Agent** - Presentation generation

### 📊 Components
- **Kanban Board** - Task management with 5 columns
- **Dashboard** - Real-time metrics and analytics
- **Content Tracker** - TikTok & YouTube creator tracking
- **Research Database** - PostgreSQL with pgvector
- **Presentations** - Auto-generated HTML presentations

### 🌐 Channels
- Telegram
- Discord
- Signal
- WhatsApp

## 🚀 Quick Start

```bash
# Install dependencies
cd ai-media-app
npm install

# Start API server
node api/server.js

# Start agent runner
node scripts/agent-runner-v2.js
```

## 📁 Project Structure

```
├── ai-media-app/
│   ├── api/           # Express API server
│   └── public/        # Frontend HTML pages
├── scripts/           # Automation scripts
├── agents/            # Agent configurations
├── presentations/    # Generated presentations
└── memory/           # Daily notes
```

## 🔧 Configuration

### Environment Variables
Create `.env` file:
```
PORT=3001
TELEGRAM_BOT_TOKEN=your_token
POSTGRES_PASSWORD=your_password
```

### API Keys
- YouTube Data API
- Tavily Search
- CoinGecko (crypto)

## 📄 License

MIT License - Feel free to use and modify!

## 👤 Author

Monclair - AI enthusiast and developer

---

*Built with ❤️ using OpenClaw*
