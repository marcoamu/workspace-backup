---
name: finance_analyzer
description: Analiza datos financieros, detecta patrones de gasto y sugiere ahorro.
---

# Finance Analyzer

Analiza transacciones financieras y proporciona insights.

## Cuándo usarla
- Cuando el usuario pide análisis de gastos
- Para detectar categorías de alto gasto
- Para sugerir áreas de ahorro

## Pasos
1. Obtén datos de /api/finanzas/dashboard
2. Analiza los gastos por categoría
3. Calcula totales y promedios
4. Genera recomendaciones de ahorro

## Herramientas
- exec: Consultas a PostgreSQL
- read/write: Guardar análisis

## Ejemplo de uso
Usuario: "Analiza mis gastos de los últimos 3 meses"
→ Ejecuta análisis y devuelve recomendaciones
