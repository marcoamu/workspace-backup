# TOOLS.md - Local Notes

Skills define _how_ tools work. This file is for _your_ specifics — the stuff that's unique to your setup.

---

## 🎯 Agentes Especializados

| Agente | Especialidad |
|--------|---------------|
| 📚 Research Agent | Investigaciones, búsqueda |
| 📈 Finance Agent | Bolsa, crypto, commodities |
| 🎨 Frontend Agent | UI/UX, responsive, componentes |
| ⚙️ Backend Agent | APIs, DB, Docker |

---

## 📊 Research System

- **DB:** `/root/.openclaw/workspace/data/research.db`
- **Scripts:** 
  - `research-agent.js` - AI Architecture
  - `finance-agent.js` - Bolsa/Crypto
  - `content-agent.js` - Content Ideas
  - `youtube-research-agent.js` - YouTube real data
  - `fetch-transcripts.js` - Transcripciones
  - `morning-summary.js` - Resumen matutino
- **Crons:**
  - YouTube Research (2:00 AM)
  - AI Research (3:00 AM)
  - Fetch Transcripts (4:00 AM)
  - Content Ideas (8AM, 8PM)

---

## 🌐 Web Services

| Servicio | Puerto | URL |
|----------|--------|-----|
| Dashboard | 4000 | http://212.227.107.120:4000/dashboard.html |
| Research DB | 4000 | http://212.227.107.120:4000/research.html |
| ER Diagram | 4000 | http://212.227.107.120:4000/er-diagram.html |
| Iran Conflict | 4000 | http://212.227.107.120:4000/iran-conflict.html |

---

## 📦 Installed Skills (59)

### 🤖 AI & Agents
| Skill | Descripción |
|-------|-------------|
| ai-agent-helper | AI Agent Helper |
| ai-agent-setup | AI Agent Setup |
| agent-development | Agent Development |
| agent-orchestrator | Agent Orchestrator |
| ai-presentation-maker | AI Presentation Maker |

### 🔧 Desarrollo & Git
| Skill | Descripción |
|-------|-------------|
| openclaw-master-skills | OpenClaw Master Skills |
| jarvis-skills | JARVIS AI Skills |
| openclaw-claude-code | Claude Code Agent |
| context-driven-development | Context Driven Dev |
| task-development-workflow | Task Workflow |
| senior-dev | Senior Dev |
| github, github GitHub |
| git,-cli | git-workflows | Git |

### 🎨 Frontend
| Skill | Descripción |
|-------|-------------|
| react | React.js |
| nextjs-expert | Next.js |
| typescript | TypeScript |
| tailwindcss | Tailwind CSS |
| frontend | Frontend Design |
| ui-ux-design | UI/UX Design |

### ⚙️ Backend
| Skill | Descripción |
|-------|-------------|
| nodejs | Node.js |
| python-executor | Python |
| api-dev | API Development |
| senior-backend | Senior Backend |

### 🗄️ Databases
| Skill | Descripción |
|-------|-------------|
| sql-toolkit | SQL Toolkit |
| database-operations | Database Operations |
| supabase | Supabase |
| mongodb | MongoDB |
| pg | PostgreSQL |
| sqlite | SQLite |

### 🐳 Docker & Kubernetes
| Skill | Descripción |
|-------|-------------|
| docker | Docker |
| docker-essentials | Docker Essentials |
| docker-compose | Docker Compose |
| kubernetes | Kubernetes |
| kubectl | kubectl |
| container-debug | Container Debug |

### 🌐 Web & Automation
| Skill | Descripción |
|-------|-------------|
| ai-web-automation | AI Web Automation |
| browserautomation-skill | Browser Automation |
| playwright-scraper-skill | Playwright Scraper |
| automation-workflows | Automation Workflows |
| jina-web-fetcher | Jina Web Fetcher |

### 🔍 Búsqueda
| Skill | Descripción |
|-------|-------------|
| tavily-search | Tavily Search |
| ddg-web-search | DuckDuckGo Search |
| youtube | YouTube |
| youtube-transcript | YouTube Transcript |

### 📊 Análisis & Productividad
| Skill | Descripción |
|-------|-------------|
| data-analysis | Data Analysis |
| ai-data-analysis | AI Data Analysis |
| productivity | Productivity |
| generate-presentation | Generate Presentation |

### 🔒 Seguridad & Monitoring
| Skill | Descripción |
|-------|-------------|
| security-auditor | Security Auditor |
| openclaw-security-auditor | OpenClaw Security |
| openclaw-security-monitor | Security Monitor |
| monitoring | System Monitoring |
| sysadmin-toolbox | Sysadmin Toolbox |

### 📝 Documentación & Visualización
| Skill | Descripción |
|-------|-------------|
| notebooklm-skill | NotebookLM |
| open-notebook-integration | Notebook Integration |
| visual-explainer | Diagramas HTML, slides, diff reviews |
| presentation-html-generator | HTML Presentations |
| mermaid-diagram | Mermaid Diagrams |

### 🎥 Media
| Skill | Descripción |
|-------|-------------|
| presentation-html-generator | HTML Presentations |
| mermaid-diagram | Mermaid Diagrams |

---

## 🔑 API Keys & Config

- **YouTube API:** Configurada ✅
- **yt-dlp:** Instalado ✅
- **API Tracker:** Activo (límite 8000/día)

---

## 🎧 NotebookLM

- **CLI:** `notebooklm` (npm global)
- **Docs:** `/root/.openclaw/workspace/scripts/notebooklm/README.md`
- **Uso:** `notebooklm login` → autenticarse con Google

### Comandos:
```bash
notebooklm list                    # Ver notebooks
notebooklm create "Título"        # Crear notebook
notebooklm source add <id> <url>  # Añadir fuente
notebooklm generate audio <id>    # Generar podcast
```

---

## 🎧 Podcast Generator (NotebookLM Alternative)

### Instalado:
- **gTTS** - Google TTS for Python
- **Ollama** - Local AI (llama3.2:1b)

### Scripts:
- `/root/.openclaw/workspace/scripts/notebooklm/podcast_generator.py`

### Uso:
```bash
python3 /root/.openclaw/workspace/scripts/notebooklm/podcast_generator.py <url> <titulo>

# Ejemplo:
python3 /root/.openclaw/workspace/scripts/notebooklm/podcast_generator.py "https://example.com" "Mi Podcast"
```

### Output:
- Audio: `/root/.openclaw/workspace/data/podcasts/*.mp3`

---

## 🎨 Visual Explainer

**Skill:** `/root/.openclaw/workspace/skills/visual-explainer`
**GitHub:** https://github.com/nicobailon/visual-explainer

Genera HTML visual profesional en vez de ASCII art. Compatible con Claude Code.

### Comandos disponibles:
| Comando | Función |
|---------|---------|
| `/generate-web-diagram` | Diagrama HTML de cualquier tema |
| `/generate-visual-plan` | Plan visual de implementación |
| `/generate-slides` | Slide deck magazine-quality |
| `/diff-review` | Review visual de diffs |
| `/plan-review` | Comparar plan vs código |
| `/project-recap` | Snapshot mental del proyecto |

### Instalado en:
- ✅ Claude Code: `~/.claude/skills/visual-explainer`
- ✅ OpenClaw workspace: `/root/.openclaw/workspace/skills/visual-explainer`

---

## 🚀 RTK - Token Optimization

**RTK (Reduce Token Consumption)** installed at: `/root/.local/bin/rtk`

### Usage
Wrap common commands with rtk to reduce token usage 60-90%:

| Command | RTK equivalent |
|---------|---------------|
| `ls -la` | `rtk ls` |
| `cat file` | `rtk read file` |
| `git status` | `rtk git status` |
| `git diff` | `rtk git diff` |
| `npm test` | `rtk test npm test` |
| `pytest` | `rtk pytest` |
| `docker ps` | `rtk docker ps` |

### Benefits
- **60-90% less tokens** on command outputs
- **<10ms overhead**
- Filters noise, keeps essential info


---

## 🌐 Ollama Chat UI

**URL:** http://212.227.107.120:4000/chat-ollama.html

Simple web interface to chat with Ollama (llama3.2:1b)


---

## 🎬 New Installed Skills (2026-03-21)

| Skill | Función |
|-------|---------|
| remotion | Video generation con Remotion |
| academic-deep-research | Búsqueda académica profunda |
| 3d-model-generation | Generación de modelos 3D |

### Usage:
- `remotion` - Videos from templates
- `academic-deep-research` - Papers y research
- `3d-model-generation` - 3D models


---

## 🖼️ Image & Video Skills (2026-03-21)

| Skill | Función |
|-------|---------|
| openclaw-comfyui-imagegenerate | ComfyUI image generation |
| comfyui-video | ComfyUI video generation |
| prompt-architect | Architecture de prompts |
| prompt-enhancer | Mejora de prompts |
| promptify | Prompt optimization |


---

## 🤖 Claude Code Agents

### Agentes especializados configurados:

| Agente | Función | Ubicación |
|--------|---------|-----------|
| 🎨 Frontend Expert | Vue, React, Tailwind, UI | `/root/.openclaw/workspace/claude-agents/frontend-expert.md` |
| ⚙️ Backend Expert | Python, FastAPI, DB, Docker | `/root/.openclaw/workspace/claude-agents/backend-expert.md` |

### Scripts de ejecución:
```bash
# Frontend
/root/.openclaw/workspace/scripts/claude-code/frontend.sh "crea un componente Vue"

# Backend  
/root/.openclaw/workspace/scripts/claude-code/backend.sh "crea un endpoint API"
```

### Uso directo:
```bash
# Frontend
claude -p "Eres experto en Frontend Vue.js..." --allowed-tools "Bash,Read,Edit,Write"

# Backend
claude -p "Eres experto en Backend Python..." --allowed-tools "Bash,Read,Edit,Write"
```

### Cuándo usar:
- **Frontend Expert**: Componentes Vue/React, Tailwind, CSS, responsive
- **Backend Expert**: APIs, DB, Docker, autenticación, arquitectura

---

## 📚 Skills Documentation
Ver: `/root/.openclaw/workspace/SKILLS.md`

---

## 🤖 Multi-Agent Team System (LangGraph)

### Ubicación
`/root/.openclaw/workspace/multi-agent/`

### Agentes especializados:

| # | Agente | Función | Uso |
|---|--------|---------|-----|
| 1 | 🔍 **Research** | Investigación web | Tareas de búsqueda |
| 2 | 💻 **Code** | Generación código simple | Scripts básicos |
| 3 | ✍️ **Writer** | Escritura documentos | Contenido, blogs |
| 4 | 🔎 **Review** | Revisión código | Feedback, mejoras |
| 5 | ⚡ **Claude Code** | Código complejo | Frontend/Backend avanzado |

### Para usar:
```bash
cd /root/.openclaw/workspace/multi-agent
source /root/.openclaw/workspace/venv_langgraph/bin/activate
python3
>>> from team import AgentTeam
>>> team = AgentTeam()
>>> team.run_task("tu tarea aquí")
```

### Memoria compartida:
- Todos los agentes comparten contexto
- Historial de acciones
- Búsqueda en memoria

---

## 🤖 Agentes Actualizados

| # | Agente | Modelo | Uso |
|---|--------|---------|-----|
| 1 | 🔍 **Research** | Ollama | Búsquedas simples |
| 2 | 💻 **Code** | Ollama | Código simple |
| 3 | ✍️ **Writer** | Ollama | Documentos |
| 4 | 🔎 **Review** | Ollama | Revisiones simples |
| 5 | ⚡ **Claude Code** | Claude CLI | Código complejo |
| 6 | 🧠 **OpenClaw** | MiniMax-M2.5 | **Investigación y análisis profundo** |

### Flujo de selección:

```
Tarea compleja de código → Claude Code
Investigación/Análisis → Openclaw (MiniMax)
Tareas simples → Ollama agents
```

## 🤖 Claude Code

**Ubicación:** `/usr/local/bin/claude`

### Uso:
```bash
# Modo interactivo
claude

# Modo prompt
claude -p "tu tarea" --allowed-tools "Bash,Read,Edit,Write"
```

### MCPs configurados:
- **GitHub** - Issues, PRs, repos
- **PostgreSQL** - Query directo a BD

### Config:
`~/.claude/mcp.json`

