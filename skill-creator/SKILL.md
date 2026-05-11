---
name: skill_creator
description: Crea nuevas skills de OpenClaw automáticamente basándose en requisitos del usuario.
---

# Skill Creator

Esta skill te ayuda a crear nuevas skills para OpenClaw.

## Cómo usar

Cuando el usuario quiera crear una nueva skill:

1. **Pregunta los detalles:**
   - Nombre de la skill
   - Descripción (qué hace)
   - Funcionalidad necesaria

2. **Crea la estructura:**
   ```
   /root/.openclaw/workspace/skills/[nombre]/
   ├── SKILL.md
   └── README.md (opcional)
   ```

3. **Usa esta plantilla:**

```markdown
---
name: nombre_skill
description: Descripción clara de qué hace la skill.
---

# Nombre de la Skill

## Cuándo usarla
Describe cuándo debe activarse esta skill.

## Pasos
1. Primer paso
2. Segundo paso
3. Tercer paso

## Ejemplos
- Ejemplo 1
- Ejemplo 2
```

4. **Añade herramientas** si es necesario:
   - exec (shell commands)
   - read/write (archivos)
   - browser (automatización web)

5. **Guarda en:** `/root/.openclaw/workspace/skills/[nombre]/`

## Tips
- Mantén el nombre en inglés: `research_agent`, `finance_analyzer`
- La descripción debe ser clara para que la IA sepa cuándo usarla
- Incluye ejemplos concretos
