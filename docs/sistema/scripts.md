# Scripts de Automatización

## Ubicación
`/root/.openclaw/workspace/scripts/`

## Scripts Principales

### TikTok Trends Scraper
- **Archivo:** `tiktok-trends-scraper.js`
- **Función:** Extrae trends de TikTok por hashtags de IA
- **Hashtags monitorizados:** AI, ChatGPT, Agent, MachineLearning, etc.
- **Dependencias:** Playwright, Node.js

### Cegid Automation
- **Carpeta:** `automation/cegid-login.js`
- **Función:** Login automático y click ENTRAR/SALIR
- **Credenciales:** GBESRAGUILAR / BCD123|@#
- **Browser:** Playwright (headless)

### Music/Lyrics
- **Script:** `notebooklm/podcast_generator.py`
- **Función:** Genera podcasts desde URLs

## Dependencias Globales
```bash
npm install playwright
pip install python-dotenv
```

## Notas
- Los scripts de Node usan `node` directamente
- Los de Python usan el venv en `/root/.openclaw/workspace/venv_langgraph/`
