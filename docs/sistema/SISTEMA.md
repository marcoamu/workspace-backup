# Sistema MiMax - Documentación de Migración

Última actualización: 2026-05-07
Versión: 2.0

---

## 🖥️ Infraestructura

### Servidor Principal
- **IP:** 212.227.107.120
- **OS:** Ubuntu 24.04
- **RAM:** 3.8 GB
- **Puerto frontend:** 3000
- **Puerto backend:** 8000
- **Puerto PostgreSQL:** 5432
- **Puerto Nginx:** 80

### Servicios Activos
```
Frontend (Node/Vite): Puerto 3000
Backend (FastAPI/uvicorn): Puerto 8000
PostgreSQL 16: Puerto 5432
Nginx: Puerto 80
OpenClaw Gateway: Puerto 18789
```

---

## 📁 Estructura de Directorios

```
/root/.openclaw/workspace/
├── mibimax-app/           # App principal (FastAPI + Vue)
│   ├── backend/            # FastAPI
│   │   ├── main.py        # Endpoints API
│   │   └── .env           # Variables entorno
│   └── frontend/           # Vue.js
│       ├── src/           # Código fuente
│       ├── dist/           # Build producción
│       └── node_modules/   # Dependencias
├── data/                  # Datos
│   ├── music/              # Canciones
│   ├── lyrics/             # Letras
│   └── cegid/              # Sesión Cegid
├── scripts/               # Scripts automatización
├── docs/                   # Documentación
└── venv_langgraph/         # Entorno Python
```

---

## 🔧 Servicios y Puertos

| Servicio | Puerto | Proceso | PID actual |
|----------|--------|---------|------------|
| Frontend | 3000 | node proxy.cjs | Verificar |
| Backend | 8000 | uvicorn main:app | Verificar |
| PostgreSQL | 5432 | postgres | 397696 |

---

## 🚀 Comandos de Recuperación

```bash
# Reiniciar Backend
cd /root/.openclaw/workspace/mibimax-app/backend
python3 -m uvicorn main:app --host 0.0.0.0 --port 8000

# Reiniciar Frontend
cd /root/.openclaw/workspace/mibimax-app/frontend
node proxy.cjs

# Reiniciar PostgreSQL
pg_ctlcluster 16 main start

# Ver estado servicios
ss -tlnp | grep -E "8000|3000|5432"
```

---

## 🔑 Variables Entorno Críticas

```bash
# Backend .env
DATABASE_URL=postgresql://postgres:postgres@localhost:5432/knowledge_base
MINIMAX_API_KEY=sk-cp-GqHpEplSm4tcY6gLqJvCVyLQgu-Sv7BRQyIs3gD1wHlJm8gFQACI1Pl-XLM8jVb2PeyKe6vIY40RWrRdo1dVA5W1t0B6P8mOfsFdXhalkhFXoinBmZLGYtU
```

---

## 📋 Notas de Migración

1. El sistema usa pm2 para gestionar procesos node
2. PostgreSQL debe estar corriendo antes que el backend
3. Los endpoints de Cegid requieren credenciales específicas
4. TikTok scraper necesita Playwright instalado
