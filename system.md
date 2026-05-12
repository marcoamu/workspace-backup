# ⚙️ Sistema - Infraestructura

> Actualizado: 2026-04-02

## Servidor
- **IP:** 212.227.107.120
- **OS:** Ubuntu 24.04 / Linux 6.8.0
- **RAM:** 3.8GB total, ~2GB disponible
- **Swap:** 4GB

## Puertos

| Servicio | Puerto | Estado |
|----------|--------|--------|
| Frontend (Vite) | 3000 | ✅ |
| Backend (FastAPI) | 8000 | ✅ |
| PostgreSQL | 5432 | ✅ |
| OpenClaw Gateway | 18789 | ✅ |
| Static Files | 4000 | ✅ |

## Comandos

### Reiniciar Backend
```bash
cd /root/.openclaw/workspace/mibimax-app/backend
pkill -f uvicorn
rm -rf __pycache__
python3 server.py &
```

### Reiniciar Frontend
```bash
cd /root/.openclaw/workspace/mibimax-app/frontend
npm run dev -- --host 0.0.0.0 --port 3000 &
```

### Check Servicios
```bash
curl http://localhost:8000/api/system/status
```

### PostgreSQL
```bash
# Ver estado
pg_isready -h localhost -p 5432

# Conectar
PGPASSWORD=postgres psql -h localhost -U postgres -d knowledge_base

# Reiniciar
sudo pg_ctlcluster 16 main restart
```

## Logs
- Backend: `/tmp/backend.log` o stdout
- OpenClaw: `openclaw logs`

## Seguridad
- UFW activo con puertos necesarios abiertos
- PostgreSQL: password "postgres" (local only)

## Issues Conocidos
1. PostgreSQL a veces no responde - reiniciar con `sudo pg_ctlcluster 16 main restart`
2. Backend puede no iniciar si el puerto 8000 está ocupado
3. Vite proxy a veces no funciona - reiniciar frontend
