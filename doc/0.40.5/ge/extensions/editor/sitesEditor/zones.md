# `editor_sitesEditor_zones`

*Fichier : `lua/ge/extensions/editor/sitesEditor/zones.lua` · VM : Game Engine (GE) · 412 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/sitesEditor/zones")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

Le module renvoie un constructeur : `local obj = require("editor_sitesEditor_zones")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:beginDrag()` |  | 154 |
| `C:create()` |  | 294 |
| `C:dragging()` |  | 167 |
| `C:drawElement(zone)` |  | 307 |
| `C:dropToTerrain(pos)` |  | 234 |
| `C:endDragging()` |  | 257 |
| `C:findVert(mouseInfo, objects)` |  | 33 |
| `C:findZone(mouseInfo, objects)` |  | 389 |
| `C:init(sitesEditor, key)` |  | 11 |
| `C:input(mouseInfo)` |  | 88 |
| `C:remove(zone)` |  | 301 |
| `C:select(zone)` |  | 24 |
| `C:setSites(sites)` |  | 18 |
| `C:tryInsert(mouseInfo)` |  | 67 |
| `C:updateTransform()` |  | 128 |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawLine`, `drawSphere`
- `obj:` `rayIntersectsZone`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/sitesEditor/zones.lua`.*
