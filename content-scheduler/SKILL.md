---
name: content_scheduler
description: Programa contenido para publicarse en el futuro.
---

# Content Scheduler

Programa contenido para publicarse automáticamente.

## Cuándo usarla
- Usuario quiere publicar algo más tarde
- Necesita cola de contenido
- Quiere automatización de posting

## Pasos
1. Guarda el contenido con timestamp
2. Registra en la cola de scheduler
3. El cron ejecuta la publicación

## Almacenamiento
- JSON en /root/.openclaw/workspace/data/scheduler/
