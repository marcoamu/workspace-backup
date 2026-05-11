# HEARTBEAT.md

## Servicios a verificar (cada 30 min)
1. Backend mibimax (8000) - `curl localhost:8000/api/ideas`
2. Frontend mibimax (3000) - `curl localhost:3000/`
3. Base de datos PostgreSQL (5432) - Verificar queries
4. OpenClaw Gateway (18789) - Health check

## Acciones automáticas
- Si servicio caído → Reiniciar automáticamente
- Si DB caída → Verificar con: `sudo -u postgres psql -d mibimax -c "SELECT 1"`
- Si memory > 90% → Limpiar cache

## Patrones a recordar (para M2.7)
- Monclair programa en Python y JS
- Prefiere soluciones simples
- Le gusta la automatización
- Trabaja con API keys de MiniMax, Tavily, etc.
- Tiene bot de trading con Alpaca
- Proyecto principal: mibimax-app (finanzas)
