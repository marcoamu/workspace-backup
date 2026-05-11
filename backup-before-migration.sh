#!/bin/bash
# ============================================================
# BACKUP SCRIPT - Before Migration
# Run this on the CURRENT VPS before migration
# ============================================================

set -e

BACKUP_DIR="/root/.openclaw/workspace/backups/$(date +%Y%m%d_%H%M%S)"
mkdir -p $BACKUP_DIR

echo "=========================================="
echo "   BACKUP BEFORE MIGRATION"
echo "   Target: $BACKUP_DIR"
echo "=========================================="

# 1. Backup workspace files
echo "[1/6] Backup workspace files..."
rsync -av --exclude='node_modules' --exclude='venv' --exclude='venv_langgraph' \
    /root/.openclaw/workspace/ $BACKUP_DIR/workspace/

# 2. Export PostgreSQL databases
echo "[2/6] Export PostgreSQL databases..."
PGPASSWORD=postgres pg_dump -h localhost -U postgres knowledge_base > $BACKUP_DIR/knowledge_base.sql
PGPASSWORD=postgres pg_dump -h localhost -U postgres mibimax > $BACKUP_DIR/mibimax.sql

# 3. Backup GitHub credentials and configs
echo "[3/6] Backup config files..."
cp ~/.git-credentials $BACKUP_DIR/ 2>/dev/null || true
cp ~/.gitconfig $BACKUP_DIR/ 2>/dev/null || true

# 4. Export OpenClaw memory
echo "[4/6] Export OpenClaw memory..."
cp -r /root/.openclaw/workspace/memory/ $BACKUP_DIR/memory/
cp /root/.openclaw/workspace/MEMORY.md $BACKUP_DIR/ 2>/dev/null || true
cp /root/.openclaw/workspace/SOUL.md $BACKUP_DIR/ 2>/dev/null || true
cp /root/.openclaw/workspace/USER.md $BACKUP_DIR/ 2>/dev/null || true

# 5. Compress everything
echo "[5/6] Compressing backup..."
cd $BACKUP_DIR
tar -czf moncli-backup-$(date +%Y%m%d).tar.gz ./

# 6. Upload to Google Drive or external storage
# (You'll need gdrive or rclone configured)
# rclone copy $BACKUP_DIR/moncli-backup-*.tar.gz gdrive:backups/

echo "[6/6] Creating restoration script..."
cat > $BACKUP_DIR/restore.sh << 'RESTORE_EOF'
#!/bin/bash
# Run this on the NEW Mini PC to restore everything
set -e
BACKUP_DIR=$(dirname "$0")

echo "Restoring from backup..."
cd $BACKUP_DIR

# Restore workspace
rsync -av workspace/ /root/.openclaw/workspace/

# Restore databases
PGPASSWORD=postgres psql -h localhost -U postgres -d postgres -c "CREATE DATABASE knowledge_base;" 2>/dev/null || true
PGPASSWORD=postgres psql -h localhost -U postgres -d postgres -c "CREATE DATABASE mibimax;" 2>/dev/null || true
PGPASSWORD=postgres psql -h localhost -U postgres knowledge_base < knowledge_base.sql
PGPASSWORD=postgres psql -h localhost -U postgres mibimax < mibimax.sql

# Restore configs
cp memory/*.md /root/.openclaw/workspace/ 2>/dev/null || true
cp SOUL.md /root/.openclaw/workspace/ 2>/dev/null || true
cp USER.md /root/.openclaw/workspace/ 2>/dev/null || true

echo "✅ Restore complete!"
RESTORE_EOF

chmod +x $BACKUP_DIR/restore.sh

echo ""
echo "=========================================="
echo "   ✅ BACKUP COMPLETE!"
echo "=========================================="
echo ""
echo "Backup location: $BACKUP_DIR"
echo "Compressed: $BACKUP_DIR/moncli-backup-$(date +%Y%m%d).tar.gz"
echo ""
echo "Next steps:"
echo "  1. Download backup to local computer"
echo "  2. Copy to USB drive"
echo "  3. Carry to Mini PC location"
echo ""
