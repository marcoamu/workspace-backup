# 📚 Documentación del Sistema MiMax

Esta carpeta contiene toda la información necesaria para migrar o recrear el sistema.

## 📁 Archivos

| Archivo | Descripción |
|---------|-------------|
| `SISTEMA.md` | Vista general del sistema, puertos, servicios |
| `mibimax-app.md` | Detalles de la app principal |
| `scripts.md` | Scripts de automatización |
| `openclaw.md` | Configuración de OpenClaw |

## 🚀 Guía Rápida de Recuperación

1. **Clonar repos:**
   ```bash
   git clone https://github.com/<user>/docs-mimax.git
   git clone https://github.com/<user>/scripts-mimax.git
   ```

2. **Reconstruir estructura:**
   ```bash
   # Recrear carpetas según SISTEMA.md
   mkdir -p /root/.openclaw/workspace/{mibimax-app,scripts,data,docs}
   ```

3. **Instalar dependencias:**
   ```bash
   # Node apps
   cd mibimax-app/frontend && npm install
   cd mibimax-app/backend && pip install -r requirements.txt
   
   # Python venv
   python3 -m venv /root/.openclaw/workspace/venv_langgraph
   ```

4. **Iniciar servicios:**
   ```bash
   # PostgreSQL
   pg_ctlcluster 16 main start
   
   # Backend
   cd mibimax-app/backend && python3 -m uvicorn main:app --host 0.0.0.0 --port 8000
   
   # Frontend
   cd mibimax-app/frontend && node proxy.cjs
   ```

## 🔑 API Keys Necesarias

Ver `SISTEMA.md` para variables entorno.

## 📝 Mantenimiento

Después de cambios importantes:
1. Actualizar esta documentación
2. Ejecutar backup script
3. Push a GitHub

```bash
/root/.openclaw/workspace/scripts/backup-to-github.sh
```
