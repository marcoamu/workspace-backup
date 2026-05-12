#!/bin/bash
# ============================================================
# MONCLI MIGRATION SCRIPT - Complete Setup for Mini PC
# ============================================================
# Run this on a FRESH Ubuntu 24.04 installation
# 
# Usage: chmod +x setup-minipc.sh && ./setup-minipc.sh
# ============================================================

set -e

echo "=========================================="
echo "   MONCLI SETUP SCRIPT"
echo "   Migration from VPS to Mini PC"
echo "=========================================="
echo ""

# Variables
USER_HOME="$HOME"
OPENCLAW_DIR="$USER_HOME/.openclaw"
WORKSPACE_DIR="$OPENCLAW_DIR/workspace"

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

log() { echo -e "${GREEN}[✓]${NC} $1"; }
warn() { echo -e "${YELLOW}[!]${NC} $1"; }
error() { echo -e "${RED}[✗]${NC} $1"; }

# Check if running as root
if [ "$EUID" -eq 0 ]; then
    warn "Running as root. Creating new user..."
    # Create user if needed
    if ! id -u moncli > /dev/null 2>&1; then
        useradd -m -s /bin/bash moncli
        usermod -aG sudo moncli
        echo "moncli:moncli123" | chpasswd
    fi
    USER_HOME="/home/moncli"
fi

echo ""
echo "1. Updating system..."
apt update && apt upgrade -y

echo ""
echo "2. Installing essential packages..."
apt install -y curl wget git vim htop net-tools \
    build-essential python3 python3-pip \
    nginx certbot \
    postgresql postgresql-contrib \
    redis-server

log "Essential packages installed"

echo ""
echo "3. Installing Docker..."
curl -fsSL https://get.docker.com | sh
usermod -aG docker $USER

log "Docker installed"

echo ""
echo "4. Installing Node.js 20..."
curl -fsSL https://deb.nodesource.com/setup_20.x | bash -
apt install -y nodejs
npm install -g npm@latest

log "Node.js 20 installed"

echo ""
echo "5. Installing Python packages..."
pip3 install --break-system-packages \
    fastapi uvicorn psycopg2-binary python-dotenv pydantic \
    playwright pyppeteer python-docx markdown requests

log "Python packages installed"

echo ""
echo "6. Installing Playwright browsers..."
playwright install chromium --with-deps

log "Playwright browsers installed"

echo ""
echo "7. Cloning GitHub repositories..."
cd $USER_HOME

# Clone workspace from GitHub
if [ -d "$WORKSPACE_DIR" ]; then
    warn "Workspace exists, updating..."
    cd $WORKSPACE_DIR && git pull
else
    git clone https://github.com/marcoamu/monmax-workspace.git $WORKSPACE_DIR
fi

log "Workspace cloned"

echo ""
echo "8. Setting up PostgreSQL..."
systemctl enable postgresql
systemctl start postgresql

# Create databases and users
su - postgres -c "psql -c \"CREATE USER moncli WITH PASSWORD 'moncli123';\"" 2>/dev/null || true
su - postgres -c "psql -c \"CREATE DATABASE knowledge_base OWNER moncli;\"" 2>/dev/null || true
su - postgres -c "psql -c \"CREATE DATABASE mibimax OWNER moncli;\"" 2>/dev/null || true

log "PostgreSQL configured"

echo ""
echo "9. Creating virtual environment..."
python3 -m venv $OPENCLAW_DIR/venv
source $OPENCLAW_DIR/venv/bin/activate
pip install -r $WORKSPACE_DIR/mibimax-app/backend/requirements.txt 2>/dev/null || true

log "Virtual environment created"

echo ""
echo "10. Installing OpenClaw..."
curl -fsSL https://get.openclaw.ai | sh

log "OpenClaw installed"

echo ""
echo "11. Restoring configuration from GitHub..."
cd $WORKSPACE_DIR

# Create docs structure
mkdir -p docs/sistema docs/templates

# Restore templates
cp docs/templates/templates.json $OPENCLAW_DIR/docs/templates/ 2>/dev/null || true

log "Configuration restored"

echo ""
echo "12. Setting up services..."
# Create systemd services for auto-start

# Backend service
cat > /etc/systemd/system/mibimax-backend.service << 'BACKEND_EOF'
[Unit]
Description=MiMax Backend API
After=network.target postgresql.service

[Service]
Type=simple
User=moncli
WorkingDirectory=/home/moncli/.openclaw/workspace/mibimax-app/backend
ExecStart=/home/moncli/.openclaw/workspace/venv/bin/python -m uvicorn main:app --host 0.0.0.0 --port 8000
Restart=always

[Install]
WantedBy=multi-user.target
BACKEND_EOF

# Documentation Service
cat > /etc/systemd/system/documentation-service.service << 'DOC_EOF'
[Unit]
Description=Documentation Service (MD to Word)
After=network.target

[Service]
Type=simple
User=moncli
WorkingDirectory=/home/moncli/.openclaw/workspace/scripts
ExecStart=/home/moncli/.openclaw/workspace/venv/bin/python documentation-service.py
Restart=always

[Install]
WantedBy=multi-user.target
DOC_EOF

systemctl daemon-reload
systemctl enable mibimax-backend
systemctl enable documentation-service

log "Services configured"

echo ""
echo "13. Starting all services..."
systemctl start mibimax-backend
systemctl start documentation-service
systemctl start nginx

log "All services started"

echo ""
echo "=========================================="
echo "   🎉 SETUP COMPLETE!"
echo "=========================================="
echo ""
echo "Services running:"
echo "  - Backend API:     http://localhost:8000"
echo "  - Docs Service:     http://localhost:8002"
echo "  - Frontend:        http://localhost:3000"
echo "  - PostgreSQL:      localhost:5432"
echo ""
echo "Next steps:"
echo "  1. Reboot:         sudo reboot"
echo "  2. Check status:   systemctl status mibimax-backend"
echo "  3. Access:         http://YOUR_IP:3000"
echo ""
echo "=========================================="
