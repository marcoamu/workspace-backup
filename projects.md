# 📁 Proyectos

> Actualizado: 2026-04-02

## mibimax-app (Finanzas Personales)

### Ubicación
`/root/.openclaw/workspace/mibimax-app/`

### URLs
- Dashboard: http://212.227.107.120:3000/
- Finanzas: http://212.227.107.120:3000/finanzas
- Import CSV: http://212.227.107.120:3000/import-csv
- Artemis Tracker: http://212.227.107.120:3000/artemis

### Stack
- Frontend: Vue 3 + Vite + Axios
- Backend: FastAPI (Python) + Uvicorn
- DB: PostgreSQL 16

### Base de Datos
- **Host:** localhost:5432
- **User:** postgres
- **Password:** postgres
- **Database:** knowledge_base
- **Tablas:** transacciones, categoria_reglas, categorias

### CSV Import
- Formato: `#;FECHA;DESCRIPCION;IMPORTE;TIPO`
- Separador: `;`
- Fecha: DD/MM/YYYY
- Números: Formato europeo (1.234,56)
- Importes: **Siempre positivos**, `tipo` = "egreso" o "ingreso"
- Categoría por defecto: "Otros"

### Endpoints Clave
| Método | Endpoint | Descripción |
|--------|----------|-------------|
| GET | `/api/finanzas/transacciones` | Lista con filtros |
| POST | `/api/finanzas/import` | Importar CSV |
| POST | `/api/finanzas/aplicar-regla` | Aplicar 1 regla |
| POST | `/api/finanzas/aplicar-reglas-todas` | Aplicar todas las reglas |
| PUT | `/api/finanzas/transacciones/{id}/categoria` | Actualizar categoría |

### Archivos Clave
- Frontend: `frontend/src/views/Finanzas.vue`
- Import: `frontend/src/views/ImportCSV.vue`
- Backend: `backend/server.py`
- Vite config: `frontend/vite.config.js` (con proxy /api)

### Bugs Conocidos (2026-04-02)
- ⚠️ server.py se trunca durante ediciones - hacer backup antes de editar
- ⚠️ PostgreSQL puede caer bajo mucha carga
- ⚠️ Frontend necesita reinicio manual si se cae

## Artemis Tracker

### Ubicación
- Frontend: `frontend/src/views/Artemis.vue`
- Links tracking: NASA AROW, ISS Info, Artemis 3D Tracker

### Links
- NASA AROW: https://www.nasa.gov/exploration/systems/artemis/Artemis-II-RTW.html
- ISS Info: https://issinfo.net/artemis
- 3D Tracker: https://artemistracker.com/

## Otros Proyectos

### Bot Trading Alpaca
- Estado: Configurado
- Monclair lo usa para trading

### OpenClaw
- Gateway: ws://127.0.0.1:18789
- Telegram bot configurado
- Modelo: MiniMax-M2.7

## Backlog
📍 `/root/.openclaw/workspace/BACKLOG.md`
