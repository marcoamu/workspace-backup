# 📋 BACKLOG - TikTok AI Trends Intelligence System

## 🎯 Descripción General

Sistema automatizado que captura diariamente los trending topics de TikTok relacionados con inteligencia artificial, agentes y tecnología. Elimina duplicados, aplica lista negra configurable, y notifica cuando aparecen nuevas tendencias.

---

## 🔴 Prioridad Alta - Proyecto: TikTok AI Trends Intelligence

### 1. Backend - Script de Scraping (Playwright)

**Ubicación:** `/root/.openclaw/workspace/scripts/tiktok-trends-scraper.js`

#### 1.1 Hashtags a Monitorizar (AI Focus)
```javascript
const TARGET_HASHTAGS = [
    'AI', 'ArtificialIntelligence', 'ChatGPT', 'GPT', 
    'Agent', 'Agents', 'MachineLearning', 'DeepLearning',
    'OpenAI', 'AGI', 'NeuralNetwork', 'Robotics',
    'AIAgent', 'LLM', 'GenerativeAI', 'Midjourney',
    'Claude', 'Gemini', 'Copilot', 'Sora', 'StableDiffusion'
];
```

#### 1.2 Flujo de Scraping
```
1. Lanzar navegador Playwright (headless)
2. Navegar a cada hashtag en TikTok:
   https://www.tiktok.com/tag/{hashtag}
3. Esperar que carguen los videos (infinite scroll)
4. Capturar datos de cada video:
   - video_id (único)
   - título y descripción
   - autor (nombre, ID, seguidores)
   - métricas (views, likes, comments, shares)
   - hashtags usados
   - URL del video
   - thumbnail
5. Detectar si es "trending" (alto engagement early)
6. Guardar en base de datos
7. Cerrar navegador
```

#### 1.3 Deduplicación
```javascript
// No guardar si:
// 1. video_id ya existe en DB
// 2. Título similar >80% con video existente
// 3. Mismo autor + mismo día (mismo video)
```

#### 1.4 Velocidad de Trend
```javascript
// Calcular trend_score basado en:
// - Vistas en primeras 24h vs 48h (velocity)
// - Likes/Views ratio
// - Crecimiento de hashtags relacionados
trend_score = (views_24h / views_48h) * 100
```

---

### 2. Base de Datos - PostgreSQL

**Ubicación:** Puerto 5432, DB: `mibimax`

#### 2.1 Tabla: tiktok_trends
```sql
CREATE TABLE tiktok_trends (
    id SERIAL PRIMARY KEY,
    video_id VARCHAR(50) UNIQUE NOT NULL,
    title TEXT,
    description TEXT,
    author_name VARCHAR(100),
    author_id VARCHAR(50),
    author_followers INT,
    author_verified BOOLEAN DEFAULT false,
    views BIGINT DEFAULT 0,
    likes INT DEFAULT 0,
    comments INT DEFAULT 0,
    shares INT DEFAULT 0,
    engagement_rate FLOAT,
    hashtags JSONB,           -- ['#AI', '#GPT', ...]
    thumbnail_url TEXT,
    video_url TEXT,
    duration_seconds INT,
    published_at TIMESTAMP,
    trend_score FLOAT DEFAULT 0,  -- 0-100 basado en velocity
    captured_at TIMESTAMP DEFAULT NOW(),
    is_trending BOOLEAN DEFAULT false,
    trend_velocity VARCHAR(20),    -- 'rising', 'stable', 'falling'
    source_hashtag VARCHAR(50)
);
```

#### 2.2 Tabla: blacklist
```sql
CREATE TABLE blacklist (
    id SERIAL PRIMARY KEY,
    type VARCHAR(20) NOT NULL,      -- 'creator', 'hashtag', 'keyword', 'video'
    value VARCHAR(255) NOT NULL,
    reason TEXT,
    added_at TIMESTAMP DEFAULT NOW(),
    added_by VARCHAR(50) DEFAULT 'system'
);
```

#### 2.3 Tabla: trend_history
```sql
CREATE TABLE trend_history (
    id SERIAL PRIMARY KEY,
    trend_id INTEGER REFERENCES tiktok_trends(id),
    captured_at TIMESTAMP,
    views BIGINT,
    likes INT,
    comments INT,
    trend_score FLOAT,
    UNIQUE(trend_id, captured_at)
);
```

#### 2.4 Tabla: hashtags_monitored
```sql
CREATE TABLE hashtags_monitored (
    id SERIAL PRIMARY KEY,
    hashtag VARCHAR(100) UNIQUE NOT NULL,
    is_active BOOLEAN DEFAULT true,
    last_scraped TIMESTAMP,
    trend_count INT DEFAULT 0,
    added_at TIMESTAMP DEFAULT NOW()
);
```

---

### 3. Backend - API Endpoints (FastAPI)

**Archivo:** `/root/.openclaw/workspace/mibimax-app/backend/main.py`

#### 3.1 Endpoints de Trends
```
GET /api/tiktok/trends
    ?hashtag=AI              → Filtrar por hashtag
    ?days=7                   → Últimos 7 días
    ?min_score=50             → Solo trends con score > 50
    ?limit=20                 → Limitar resultados
    
→ { trends: [...], total: 100 }

GET /api/tiktok/trends/latest
    → Los 10 trends más nuevos

GET /api/tiktok/trends/top
    ?days=7&limit=10
    → Top 10 trends de la semana

GET /api/tiktok/trends/velocity
    → Trends que están subiendo rápido
```

#### 3.2 Endpoints de Blacklist
```
GET /api/blacklist
    ?type=creator
    
→ { items: [...] }

POST /api/blacklist/add
← { type: 'creator', value: '@username', reason: 'spam' }
→ { id: 123, success: true }

DELETE /api/blacklist/{id}
→ { success: true }
```

#### 3.3 Endpoints de Stats
```
GET /api/tiktok/stats
→ { 
    total_captured: 1234,
    active_trends: 56,
    creators_blocked: 12,
    last_scraped: '2026-05-06 14:30'
}

GET /api/tiktok/stats/velocity
→ Trends con mayor velocidad de crecimiento
```

---

### 4. Agente Automático - Cron Job

**Ubicación:** Script diario via OpenClaw cron

#### 4.1 Schedule
```
Diario a las 08:00 AM (España)
8:00 → Primer scraping
20:00 → Segundo scraping (capturar cambios de día)
```

#### 4.2 Proceso del Agente
```
1. Leer hashtags activos de DB
2. Para cada hashtag:
   a. Ejecutar scraping con Playwright
   b. Aplicar deduplicación
   c. Aplicar blacklist (filtrar)
   d. Calcular trend_score
   e. Guardar en DB
3. Comparar con trends anteriores (velocity)
4. Si hay nuevos trends con score alto:
   → Notificar por Telegram
5. Limpiar trends muy antiguos (>30 días)
```

#### 4.3 Notificación Telegram
```
📊 *Nuevo Trend AI Detectado!*

🎬 **{Título del video}**
👤 @{autor} • {seguidores} followers
📈 **{views} views** • ❤️ {likes} likes
🏷️ {hashtags}
🔗 {url}

⏰ Lleva {horas}h trending
📊 Trend Score: {score}/100
```

---

### 5. Frontend - Dashboard

**URL:** `/tiktok-trends.html`

#### 5.1 Vista Principal
- Lista de trends con:
  - Thumbnail del video
  - Título truncado
  - Autor + seguidores
  - Métricas (views, likes)
  - Trend score (visual)
  - Badge de velocidad (↑ trending / ↓ falling)

#### 5.2 Filtros
- **Búsqueda** por título o autor
- **Hashtag** selector múltiple
- **Fecha** rango
- **Trend Score** slider (0-100)
- **Velocidad** (rising/stable/falling)

#### 5.3 Gestión de Blacklist
- Tabla de elementos bloqueados
- Añadir nuevo (tipo + valor + razón)
- Eliminar de blacklist

#### 5.4 Dashboard de Stats
- Total trends capturados
- Trends activos ahora
- Gráfico de trends por día
- Top hashtags capturados
- Creadores más bloqueados

---

### 6. Features Avanzadas (v2)

#### 6.1 Agrupación por Tema
```javascript
// Agrupar trends relacionados
TOPICS = {
    'OpenAI': ['ChatGPT', 'GPT-4', 'Sora', 'OpenAI'],
    'Google': ['Gemini', 'Bard', 'Google AI'],
    'Anthropic': ['Claude', 'Anthropic AI'],
    'Microsoft': ['Copilot', 'Bing AI', 'Microsoft']
};
```

#### 6.2 Análisis de Sentimiento
- Clasificar trend como: positive/neutral/negative
- Basado en palabras clave del título

#### 6.3 Predicción de Trend
- Basado en velocity y engagement rate
- "Este trend subirá en las próximas 48h"

#### 6.4 Exportar a Notion/Google Sheets
- Botón para exportar trends a spreadsheet
- Integración con API de Notion

---

### 7. Edge Cases

| Caso | Manejo |
|------|--------|
| TikTok detecta bot | Rotar User-Agents, usar proxies, reducir frecuencia |
| Video privado/borrado | Marcar como `unavailable` en DB, no mostrar |
| Mismo video en múltiples hashtags | Deduplicar por video_id |
| Creador en blacklist | No mostrar videos de ese autor |
| Rate limit TikTok | Esperar exponential backoff, reintentar |
| Sin internet | Guardar último scrape, marcar como stale |

---

### 8. API Externa - TikAPI (Alternativa)

**Descripción:** En lugar de Playwright, usar TikAPI.net (más fiable)

**Ventajas:**
- API REST simple
- No necesita navegador
- Más estable

**Desventajas:**
- Plan gratuito limitado (100 requests/día)
- Plan premium: ~$30/mes

**Endpoints alternativos:**
```
GET https://tikapi.io/api/v1/hashtag/{id}/videos
GET https://tikapi.io/api/v1/user/{username}/videos
```

---

## 📁 Archivos a Crear

| Archivo | Descripción |
|---------|-------------|
| `/root/.openclaw/workspace/scripts/tiktok-trends-scraper.js` | Script principal de scraping |
| `/root/.openclaw/workspace/scripts/tiktok-agent.js` | Agente que ejecuta diariamente |
| `/var/www/html/tiktok-trends.html` | Dashboard frontend |
| `/root/.openclaw/workspace/mibimax-app/backend/main.py` | Modificar: añadir endpoints |

---

## 📊 Tablas SQL a Crear

```sql
-- Ejecutar en PostgreSQL (DB: mibimax)
CREATE TABLE tiktok_trends (...);
CREATE TABLE blacklist (...);
CREATE TABLE trend_history (...);
CREATE TABLE hashtags_monitored (...);
```

---

## ✅ Checklist de Implementación

### Fase 1: Core (Esta semana)
- [ ] 1. Crear tablas en PostgreSQL
- [ ] 2. Implementar script scraping con Playwright
- [ ] 3. Añadir endpoints API al backend
- [ ] 4. Crear cron diario básico

### Fase 2: Dashboard
- [ ] 5. Frontend dashboard básico
- [ ] 6. Filtros funcionales
- [ ] 7. Sistema de blacklist

### Fase 3: Avanzado
- [ ] 8. Sistema de notificaciones Telegram
- [ ] 9. Agrupación por tema
- [ ] 10. Dashboard de stats
- [ ] 11. Análisis de velocity

---

*Creado: 2026-05-06*
*Proyecto: TikTok AI Trends Intelligence*
*Prioridad: 🔴 Alta*
*Status: En desarrollo*
---

## 💡 Nuevas Ideas (Guardadas 2026-05-07)

| # | Idea | Prioridad | Descripción |
|---|------|-----------|-------------|
| 1 | Link Shortener | 🟡 Media | URLs personalizadas con tu marca |
| 2 | AI Content Generator | 🔴 Alta | TikTok trends → posts LinkedIn/Twitter |
| 3 | Agenda Visual/Recordatorios | 🟡 Media | Calendario con recordatorios IA |
| 4 | Generador de Portadas | 🟡 Media | YouTube, blogs con AI |
| 5 | Quote/Image Generator | 🟢 Baja | Imágenes con citas motivacionales |
| 6 | Landing Page Generator | 🟢 Baja | Templates web bonitos |
| 7 | **Auto-respondedor Gmail IA** | 🔴 Alta | Respuestas automáticas inteligentes |
| 8 | **Backup automático GitHub** | 🔴 Alta | Proyectos → repos GitHub |
| 9 | Monitor Pi/Server | 🟢 Baja | Dashboard ligero |

---

## 🔥 EN PROGRESO: Backup automático GitHub

### Estado: Planning
### Fecha inicio: 2026-05-07

**Objetivo:** Hacer backup automático de todos los proyectos importantes a GitHub

**Proyectos a backup:**
- `/root/.openclaw/workspace/mibimax-app/` → GitHub
- `/root/.openclaw/workspace/scripts/` → GitHub  
- `/var/www/html/` → GitHub (o parte pública)

**Pasos:**
- [ ] Crear repos en GitHub
- [ ] Configurar Git credentials
- [ ] Script de backup automático
- [ ] Cron para ejecución diaria


## 📊 Prioridades Actualizadas (2026-05-07)

| # | Idea | Prioridad | Estado |
|---|------|----------|--------|
| 8 | **Backup automático GitHub** | 🔴 ALTA | ✅ Planificado, docs creadas |
| 2 | AI Content Generator | 🔴 ALTA | Pendiente |
| 7 | Auto-respondedor Gmail IA | 🔴 ALTA | Pendiente |
| 1 | Link Shortener | 🟡 MEDIA | Pendiente |
| 3 | Agenda Visual | 🟡 MEDIA | Pendiente |
| 4 | Generador de Portadas | 🟡 MEDIA | Pendiente |
| 6 | Landing Page Generator | 🟢 BAJA | Pendiente |
| 5 | Quote/Image Generator | 🟢 BAJA | Pendiente |
| 9 | Monitor Pi/Server | 🟢 BAJA | Pendiente |

## 📚 Documentación de Migración Creada

```
/root/.openclaw/workspace/docs/sistema/
├── README.md           # Guía principal
├── SISTEMA.md          # Vista general sistema
├── mibimax-app.md      # Detalles app
├── scripts.md          # Scripts automatización  
├── openclaw.md         # Config OpenClaw
└── db-schema.md        # Schema BD
```

## 🔧 Script de Backup

```bash
/root/.openclaw/workspace/scripts/backup-to-github.sh
```

**Para que funcione con GitHub:**
1. Crear repos en GitHub
2. Añadir token de acceso personal en remote URL
3. El script prepara todo, solo falta hacer `git push`

