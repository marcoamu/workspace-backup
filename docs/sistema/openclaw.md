# OpenClaw - Configuración

## Ubicación
`/root/.openclaw/`

## Configuración Principal
- **Workspace:** `/root/.openclaw/workspace/`
- **Agents:** `/root/.openclaw/agents/`
- **Memory:** `/root/.openclaw/workspace/memory/`
- **Sessions:** `/root/.openclaw/agents/main/sessions/`

## Gateway
- **Puerto:** 18789
- **Config:** `/root/.openclaw/workspace/.openclaw/`
- **PID actual:** Verificar con `ps aux | grep openclaw`

## Skills Instalados
- 59 skills en `/root/.openclaw/workspace/skills/`
- Skills principales: react, nextjs, python, docker, etc.

## Comandos
```bash
# Status
openclaw gateway status

# Reiniciar
openclaw gateway restart
```

## Archivos Importantes
- `SOUL.md` - Personalidad del asistente
- `MEMORY.md` - Memoria a largo plazo
- `USER.md` - Datos del usuario
- `HEARTBEAT.md` - Tareas automáticas
