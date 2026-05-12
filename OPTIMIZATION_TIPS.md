# OpenClaw Optimization Tips

## 🎯 Core Skills (10-15 recommended)

| Skill | Purpose |
|-------|---------|
| Browser Control | Automation, scraping |
| File Manager | Local file operations |
| Calendar Sync | Google Calendar |
| GitHub | PRs, issues, code reviews |
| Database Query | PostgreSQL, MySQL |
| System Monitor | Health checks |
| Web Search | Research |
| Task Automation | Multi-step workflows |

## ⚡ Performance Tips

### 1. Tiered Model Routing
- Use cheap models (Haiku, Gemini Flash) for simple tasks
- Reserve premium models for complex reasoning
- Saves token costs significantly

### 2. Context Management
- Break context into modular components
- Use MEMORY.md for long-term memory
- Keep HEARTBEAT.md minimal

### 3. Memory Strategy
- MEMORY.md: Key decisions, preferences
- memory/YYYY-MM-DD.md: Daily logs
- Clean files >30 days old

## 🔒 Security Tips

### Skill Vetting
- Check install count (1000+ = safe)
- Review source code on ClawHub
- Inspect permissions before install
- Use `openclaw skill inspect <name>`

### Recommended Security Skills
- **agentguard**: Monitor risky behavior
- **prompt-guard**: Defend prompt injection
- **clawscan**: Scan skills for red flags

### Best Practices
- Run skills in Docker when unsure
- Avoid root access to entire OS
- Use Git as safety net
- Keep OpenClaw updated

## 🔧 MCP Configuration

### Environment Variables
```
OPENCLAW_URL
OPENCLAW_GATEWAY_TOKEN
OPENCLAW_MODEL
RATE_LIMIT_PER_MIN
```

### Database Connection
- Configure mcp_config.json
- Use Docker for isolation
- Monitor resource usage

## 📦 Useful Skills to Install

```bash
# Search and install from ClawHub
openclaw skill install <skill-name>

# Core skills
openclaw skill install browser-automation
openclaw skill install database-operations  
openclaw skill install system-monitoring
openclaw skill install web-search
```

## 🚀 Quick Wins

1. **Health Check skill** - Already installed ✅
2. **Backup skill** - Already configured ✅
3. **Ollama local** - Already running ✅
4. **Add Composio** - 860+ tools integration
5. **Add Self-Improving Agent** - Learns from errors

---
Sources: datacamp.com, aimakers.co, composio.dev, medium.com

## ✅ Recently Installed
- **self-improving-agent** - Learns from errors
- **agentguard** - Monitors risky behavior
- **github** - Already installed (PRs, issues)

## Skills in Workspace
Total: 66 skills available

