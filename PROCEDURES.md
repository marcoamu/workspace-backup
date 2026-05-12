# Procedimientos - Actualización de la Interfaz Vue.js

## ✅ Añadir nueva página/pestaña

### 1. Crear componente Vue
- Ubicación: `/root/.openclaw/workspace/mibimax-app/frontend/src/views/`
- Nombre: `NombrePagina.vue`

### 2. Registrar en router
- Archivo: `/root/.openclaw/workspace/mibimax-app/frontend/src/router/index.js`
- Importar: `import NombrePagina from '../views/NombrePagina.vue'`
- Añadir ruta: `{ path: '/nombre-ruta', name: 'NombrePagina', component: NombrePagina }`

### 3. Añadir al menú de navegación
- Archivo: `/root/.openclaw/workspace/mibimax-app/frontend/src/App.vue`
- En `menuItems`: `{ path: '/nombre-ruta', icon: 'emoji', label: 'Nombre' }`

### 4. Añadir a Home (acciones rápidas)
- Archivo: `/root/.openclaw/workspace/mibimax-app/frontend/src/views/Home.vue`
- Añadir botón en `actions-grid`:
```html
<button class="action-btn" @click="$router.push('/nombre-ruta')">
  <span class="action-icon">emoji</span>
  <span class="action-text">Nombre</span>
</button>
```

### 5. Añadir endpoint API si es necesario
- Archivo: `/root/.openclaw/workspace/mibimax-app/backend/server.py`
- Añadir funciones FastAPI

### 6. Reconstruir
```bash
cd /root/.openclaw/workspace/mibimax-app/frontend && npm run build
```

## ✅ Estado de endpoints nuevos

- Backend (FastAPI): Puerto 8000
- Frontend (Vue): Puerto 3000 → proxy → 8000
- Base de datos: PostgreSQL knowledge_base
