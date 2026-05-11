# 📚 Skills Documentation

This document contains all installed skills and how to use them.

---

## 🕷️ Web Scraping Skills

### scrapling-official
- **Repo:** D4Vinci/Scrapling (31,736 ⭐)
- **Uso:** Web scraping avanzado con detección zero-bot
- **Install:** `pip install "scrapling[all]"`
- **Docs:** https://github.com/D4Vinci/Scrapling

### scrapling-web-scraper
- **Descripción:** Web scraping con bypass de Cloudflare
- **Uso:**
```python
from scrapling import Fetcher
scraper = Fetcher()
response = scraper.get("https://example.com")
```

---

## 🎬 Video Generation Skills

### remotion
- **Uso:** Generación de videos programáticos
- **Docs:** https://www.remotion.dev

### comfyui-video
- **Uso:** Generación de video con ComfyUI

### acestep-simplemv
- **Uso:** Music videos con Remotion

---

## 🖼️ Image Generation Skills

### openclaw-comfyui-imagegenerate
- **Uso:** Generación de imágenes con ComfyUI

### 3d-model-generation
- **Uso:** Generación de modelos 3D

---

## ✏️ Prompt Engineering Skills

### promptify
- **Descripción:** Optimización de prompts
- **Trigger:** "improve this prompt", "optimize my prompt"

### prompt-enhancer
- **Descripción:** Reescritura automática de prompts
- **Trigger:** Prefix `p:` o `prompt:`

### prompt-architect
- **Descripción:** Arquitectura de prompts

---

## 📚 Research Skills

### academic-deep-research
- **Descripción:** Búsqueda académica profunda
- **API:** OpenAlex (gratis, 250M+ papers)
- **Uso:** Buscar papers, citations, literature reviews

### tavily-search
- **Descripción:** Búsqueda web con Tavily
- **API Key:** tvly-dev-...

---

## 🤖 Claude Code Agents

### Frontend Expert
- **Ubicación:** `/root/.openclaw/workspace/claude-agents/frontend-expert.md`
- **Especialidad:** Vue.js, React, Tailwind CSS, TypeScript
- **Uso:**
```bash
claude -p "Eres experto en Vue.js..." --allowed-tools "Bash,Read,Edit,Write"
```

### Backend Expert  
- **Ubicación:** `/root/.openclaw/workspace/claude-agents/backend-expert.md`
- **Especialidad:** Python, FastAPI, PostgreSQL, Docker
- **Uso:**
```bash
claude -p "Eres experto en Python..." --allowed-tools "Bash,Read,Edit,Write"
```

---

## 🗄️ Database Skills

### sql-toolkit
- **Uso:** Operaciones SQL avanzadas

### postgresql
- **Uso:** Gestión PostgreSQL

### sqlite
- **Uso:** Gestión SQLite

---

## 🔧 Utility Scripts

### btc-price.py
- **Ubicación:** `/root/.openclaw/workspace/scripts/btc-price.py`
- **Uso:** Scraping precio BTC
```bash
python3 /root/.openclaw/workspace/scripts/btc-price.py
```

---

## 📋 How to Use

### Web Scraping
```python
# Basic
from scrapling import Fetcher
scraper = Fetcher()
response = scraper.get("https://example.com")

# Stealth mode
from scrapling import StealthyFetcher
scraper = StealthyFetcher()
response = scraper.get("https://protected-site.com")
```

### Academic Research
```bash
# Search papers
npx clawhub academic-deep-research "machine learning transformers"
```

### Claude Code Agents
```bash
# Frontend task
/root/.openclaw/workspace/scripts/claude-code/frontend.sh "Create a Vue component"

# Backend task  
/root/.openclaw/workspace/scripts/claude-code/backend.sh "Create an API endpoint"
```

---

## 📍 Quick Reference

| Task | Tool/Skill |
|------|------------|
| Scraping básico | `requests` |
| Scraping avanzado | `scrapling` |
| Imágenes | ComfyUI skill |
| Videos | Remotion skill |
| Prompts | promptify/prompt-enhancer |
| Research | academic-deep-research |
| Frontend code | Claude Code Frontend Agent |
| Backend code | Claude Code Backend Agent |
| BTC price | `/root/.openclaw/workspace/scripts/btc-price.py` |

---

## 🤖 Multi-Agent System (LangGraph)

### Ubicación
`/root/.openclaw/workspace/multi-agent/`

### Activar entorno
```bash
source /root/.openclaw/workspace/venv_langgraph/bin/activate
python3
```

### Código básico
```python
import sys
sys.path.insert(0, '/root/.openclaw/workspace/multi-agent')
from team import AgentTeam

team = AgentTeam()
result = team.run_task("tu tarea aquí")
print(team.status())
```

### Agentes disponibles

| # | Agente | Modelo | Cuándo usar |
|---|--------|--------|-------------|
| 1 | 🔍 **Research** | Ollama | Búsquedas simples |
| 2 | 💻 **Code** | Ollama | Código simple |
| 3 | ✍️ **Writer** | Ollama | Documentos |
| 4 | 🔎 **Review** | Ollama | Revisiones simples |
| 5 | ⚡ **Claude Code** | Claude CLI | Código complejo |
| 6 | 🧠 **OpenClaw** | MiniMax-M2.5 | Investigación y análisis |

### Cómo funciona

- **Tareas complejas de código** → Claude Code
- **Investigación profunda** → OpenClaw (MiniMax)
- **Análisis** → OpenClaw
- **Tareas simples** → Ollama agents

### Memoria compartida

Todos los agentes comparten memoria. Puedes buscar:
```python
team.search_memory("query")
team.get_all_memory()
team.status()
```

---

## 📊 Team9 (Pausado)

- Repo: https://github.com/team9ai/team9
- Estado: Instalado pero requiere más configuración (JWT keys, Redis)
- Para más adelante cuando tengamos más tiempo

---

## 💡 Skills para Generar Ideas

### Skills instalados:
- `brainstorm` - Generación de ideas
- `market-research-agent` - Investigación de mercado
- `ai-researcher` - Investigador de IA

### GitHub para inspirarse:
| Repo | Stars | Para qué |
|------|-------|-----------|
| system-prompts-of-ai-tools | 133K | Mejores prompts de IA |
| ToolJet | 37K | Low-code platform |
| E2B | 11K | Coding sandbox for AI |
| 53AIHub | 9K | Colección de tools IA |
| Klavis-AI | 5K | AI interface library |

### Uso:
```bash
# Generar ideas
npx clawhub brainstorm "mejoras para mi sistema de IA"

# Investigar mercado
npx clawhub market-research-agent "AI agents trends"
```
