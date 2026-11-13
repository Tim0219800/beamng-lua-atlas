# `editor_sitesEditor_sortedListDisplay`

*Fichier : `lua/ge/extensions/editor/sitesEditor/sortedListDisplay.lua` · VM : Game Engine (GE) · 320 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/sitesEditor/sortedListDisplay")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

Le module renvoie un constructeur : `local obj = require("editor_sitesEditor_sortedListDisplay")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:adoptElement(id)` | Switch list selection without calling elementEditor:select (keeps in-progress gizmo drag). | 112 |
| `C:draw(mouseInfo)` |  | 139 |
| `C:drawCustomFields(fields)` |  | 288 |
| `C:drawList()` |  | 194 |
| `C:getCurrentSelected()` |  | 308 |
| `C:init(sitesEditor, key, elementEditor)` |  | 9 |
| `C:input()` |  | 147 |
| `C:selectElement(id, mode)` |  | 66 |
| `C:selected()` |  | 45 |
| `C:setField(name, value)` |  | 187 |
| `C:setSites(sites)` |  | 24 |
| `C:unselect()` |  | 57 |
| `C:updateActiveTags()` |  | 32 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/sitesEditor/sortedListDisplay.lua`.*
