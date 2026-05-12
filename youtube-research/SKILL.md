# YouTube Research Skill

## Descripción
Skill para investigar y obtener transcripciones de YouTube de forma gratuita.

## Herramientas

### 1. Transcripciones
```bash
# Obtener transcripción de un video
youtube-transcript-api "VIDEO_ID"

# Obtener en español
youtube-transcript-api "VIDEO_ID" --lang es
```

### 2. Búsqueda (necesita API key o scraper)
```bash
# Usar yt-dlp para buscar (gratuito)
yt-dlp --dump-json "https://youtube.com/results?search_query=TEMA" | jq '.title'
```

### 3. Videos de un canal
```bash
# Obtener últimos videos de un canal
yt-dlp --flat-playlist -j "https://youtube.com/@CANAL/videos" | jq '.title'
```

## Uso en código Node.js

```javascript
const YouTubeTranscript = require('youtube-transcript-api');

// Obtener transcripción
const transcript = await YouTubeTranscript.getTranscript('VIDEO_ID');
const text = transcript.map(t => t.text).join(' ');
```

## Alternativas Gratuitas

| Herramienta | Costo | Notas |
|-------------|-------|-------|
| yt-dlp | ✅ Gratis | Transcripciones, metadata |
| youtube-transcript-api | ✅ Gratis | Solo transcripciones |
| Invidious | ✅ Gratis | API alternativa a YouTube |

## Endpoints Gratuitos (Invidious)

```
https://yewtu.be/api/v1/search?q=TEMA
https://yewtu.be/api/v1/videos/VIDEO_ID
```

## Ejemplo de Investigación

```bash
# 1. Buscar videos sobre arquitectura AI
yt-dlp --flat-playlist -j "https://youtube.com/results?search_query=AI+software+architecture" | jq -r '.title, .id' | head -20

# 2. Obtener transcripción del primero
youtube-transcript-api "VIDEO_ID_DEL_PRIMERO"

# 3. Guardar en archivo
youtube-transcript-api "VIDEO_ID" > transcripcion.txt
```
