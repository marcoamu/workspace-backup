# MiMax App - Documentación

## Ubicación
`/root/.openclaw/workspace/mibimax-app/`

## Stack Tecnológico
- **Frontend:** Vue.js 3 + Vite + TailwindCSS
- **Backend:** FastAPI (Python) + uvicorn
- **Base de datos:** PostgreSQL 16
- **Proxy:** Node.js custom proxy

## Puertos
- Frontend: 3000
- Backend: 8000

## Estructura
```
mibimax-app/
├── backend/
│   ├── main.py           # API principal
│   ├── server.py         # Server chat
│   ├── .env              # API keys
│   └── requirements.txt
├── frontend/
│   ├── src/
│   │   ├── views/        # Vistas Vue
│   │   └── router/       # Rutas
│   ├── dist/             # Build producción
│   └── package.json
└── package.json
```

## Comandos
```bash
# Backend
cd backend && python3 -m uvicorn main:app --host 0.0.0.0 --port 8000

# Frontend (desarrollo)
cd frontend && npm run dev

# Frontend (producción)
cd frontend && npm run build
```

## APIs Principales
- `/api/finanzas/*` - Finanzas personales
- `/api/cron/*` - Sistema de crons
- `/api/cegid/*` - Automatización Cegid
- `/api/tiktok/*` - TikTok trends
- `/api/music/*` - Gestión música
- `/api/lyrics/*` - Letras de canciones

## Dependencias Python
```
fastapi
uvicorn
psycopg2-binary
python-dotenv
pydantic
```
