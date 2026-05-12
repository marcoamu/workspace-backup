# MEMORY.md - Long-term Memory

> ⚠️ **ESTA VERSION ES LEGACY** - Ver [memory/INDEX.md](./memory/INDEX.md) para la estructura nueva.

## Estructura Actual (Legacy)

- **monclair.md** → Usuario y preferencias
- **projects.md** → Proyectos y URLs
- **system.md** → Infraestructura
- **YYYY-MM-DD.md** → Sesiones diarias

## Usuario Principal
- **Nombre:** Monclair
- **Idioma:** Español
- **Profesión:** Programador

## Sistema
- **IP:** 212.227.107.120
- **Ports:** 3000 (frontend), 8000 (backend), 5432 (postgres)

## Quick Ref
- `/root/.openclaw/workspace/memory/` - Memoria estructurada
- `/root/.openclaw/workspace/mibimax-app/` - Proyecto finanzas
- `/root/.openclaw/workspace/BACKLOG.md` - Backlog de ideas

---

_Last major update: 2026-04-02 - Migrated to structured memory system_

## Fix Crítico: MiniMax API Configuration

### Configuración correcta de MiniMax:
- **Endpoint:** `https://api.minimax.io/anthropic/v1/messages`
- **Modelo:** `MiniMax-M2.7`
- **Headers:** `anthropic-version: 2023-06-01`
- **Auth:** `Authorization: Bearer {MINIMAX_API_KEY}`
- **Response:** array `content` con objetos `{"type": "text", "text": "..."}`

### IMPORTANTE:
- No usar `api.minimax.chat` ni `v1/chat/completions`
- La key está en `/mibimax-app/backend/.env`
- Siempre hacer `load_dotenv()` al inicio de scripts que usen la key

