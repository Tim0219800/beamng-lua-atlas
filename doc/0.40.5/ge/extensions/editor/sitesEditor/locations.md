# `editor_sitesEditor_locations`

*Fichier : `lua/ge/extensions/editor/sitesEditor/locations.lua` · VM : Game Engine (GE) · 152 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/sitesEditor/locations")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

Le module renvoie un constructeur : `local obj = require("editor_sitesEditor_locations")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:beginDrag()` |  | 69 |
| `C:create(pos)` |  | 121 |
| `C:dragging()` |  | 74 |
| `C:drawElement(loc)` |  | 134 |
| `C:endDragging()` |  | 93 |
| `C:hitTest(mouseInfo, objects)` |  | 28 |
| `C:init(sitesEditor, key)` |  | 9 |
| `C:remove(loc)` |  | 128 |
| `C:select(loc)` |  | 21 |
| `C:setSites(sites)` |  | 15 |
| `C:updateTransform()` |  | 45 |

## Appels vers le moteur (C++)

- `worldEditorCppApi.` `getAxisGizmoScale`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/sitesEditor/locations.lua`.*
