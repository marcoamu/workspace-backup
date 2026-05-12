#!/bin/bash
# ============================================================
# VERIFY INSTALLATION - Run after setup
# ============================================================

echo "=========================================="
echo "   VERIFYING INSTALLATION"
echo "=========================================="

check_service() {
    local name=$1
    local port=$2
    if curl -s http://localhost:$port/health > /dev/null 2>&1; then
        echo "✓ $name (port $port)"
    else
        echo "✗ $name FAILED (port $port)"
    fi
}

echo ""
echo "Services:"
check_service "Backend API" 8000
check_service "MD to Word" 8001
check_service "Docs Service" 8002
check_service "Frontend" 3000

echo ""
echo "Databases:"
PGPASSWORD=moncli123 psql -h localhost -U moncli -d knowledge_base -c "SELECT COUNT(*) FROM pg_tables;" > /dev/null 2>&1 && echo "✓ PostgreSQL (knowledge_base)" || echo "✗ PostgreSQL FAILED"
PGPASSWORD=moncli123 psql -h localhost -U moncli -d mibimax -c "SELECT COUNT(*) FROM pg_tables;" > /dev/null 2>&1 && echo "✓ PostgreSQL (mibimax)" || echo "✗ PostgreSQL FAILED"

echo ""
echo "GitHub:"
git ls-remote https://github.com/marcoamu/monmax-workspace.git > /dev/null 2>&1 && echo "✓ GitHub repos accessible" || echo "✗ GitHub NOT accessible"

echo ""
echo "OpenClaw:"
systemctl is-active openclaw > /dev/null 2>&1 && echo "✓ OpenClaw Gateway active" || echo "✗ OpenClaw FAILED"

echo ""
echo "=========================================="
echo "   If all ✓, migration is complete!"
echo "=========================================="
