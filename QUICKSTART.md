# 🖥️ GUÍA RÁPIDA DE MIGRACIÓN - MINI PC

## 📦 Esto es lo que hay que hacer cuando ENCIENDAS el Mini PC por primera vez

---

## PASO 1: Instalar Ubuntu Server 24.04 LTS

1. Descargar Ubuntu: https://ubuntu.com/download/server
2. Crear USB bootable con Balena Etcher o Raspberry Pi Imager
3. Boot desde USB
4. Instalar con:
   - Usuario: **moncli**
   - Contraseña: **moncli123**
   - SSH: Enable

---

## PASO 2: Primera conexión y actualizar

```bash
# Conectar por SSH
ssh moncli@192.168.x.x

# Actualizar sistema
sudo apt update && sudo apt upgrade -y
```

---

## PASO 3: Clonar repositorios de GitHub

```bash
# Crear estructura
mkdir -p ~/.openclaw/workspace
cd ~/.openclaw/workspace

# Clonar repos (necesitas el token)
git clone https://github.com/marcoamu/workspace-backup.git .
git clone https://github.com/marcoamu/mibimax-app.git mibimax-app
git clone https://github.com/marcoamu/scripts-mimax.git scripts
```

**Token GitHub:** `<TOKEN_REMOVIDO>`

---

## PASO 4: Instalar todo automáticamente

```bash
cd ~/.openclaw/workspace/migration
chmod +x setup-minipc.sh
./setup-minipc.sh
```

Este script instala:
- ✅ Docker
- ✅ Node.js 20
- ✅ Python con venv
- ✅ PostgreSQL
- ✅ Todos los packages
- ✅ OpenClaw
- ✅ Servicios systemd

---

## PASO 5: Restaurar desde backup

```bash
cd /root/.openclaw/workspace/backups/final-*
./restore.sh
```

---

## PASO 6: Verificar todo funciona

```bash
# Servicios
curl http://localhost:8000/api/system/status
curl http://localhost:3000/

# Base de datos
psql -h localhost -U moncli -d knowledge_base -c "SELECT COUNT(*) FROM cron_tasks;"

# OpenClaw
systemctl status openclaw
```

---

## 📋 LISTA DE VERIFICACIÓN

- [ ] Ubuntu Server 24.04 instalado
- [ ] SSH configurado
- [ ] Git clone hecho
- [ ] Script setup ejecutado
- [ ] Backup restaurado
- [ ] Servicios funcionando
- [ ] OpenClaw accediendo
- [ ] Dashboard carga
- [ ] Crons activos
- [ ] Telegram conectando

---

## 🔑 CREDENCIALES

| Servicio | Usuario | Contraseña |
|----------|----------|------------|
| SSH | moncli | moncli123 |
| PostgreSQL | moncli | moncli123 |
| GitHub | marcoamu | Token en configs |

---

## 🌐 URLs del Mini PC (IP local)

| Servicio | URL |
|----------|-----|
| Dashboard | http://192.168.x.x:3000 |
| Backend API | http://192.168.x.x:8000 |
| OpenClaw | http://192.168.x.x:18789 |

---

## ⚡ COMANDOS ÚTILES

```bash
# Reiniciar servicios
sudo systemctl restart mibimax-backend
sudo systemctl restart openclaw

# Ver logs
journalctl -u mibimax-backend -f

# Estado
systemctl status mibimax-backend
```

---

## 📞 SI HAY PROBLEMAS

1. Verificar que PostgreSQL está corriendo:
   ```bash
   sudo systemctl status postgresql
   ```

2. Ver logs del backend:
   ```bash
   journalctl -u mibimax-backend -n 50
   ```

3. Reiniciar todo:
   ```bash
   sudo reboot
   ```

---

**¡Listo! Moncli estará funcionando en el Mini PC 🇪🇸→🏠**
