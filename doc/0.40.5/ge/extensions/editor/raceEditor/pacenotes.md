# `editor_raceEditor_pacenotes`

*Fichier : `lua/ge/extensions/editor/raceEditor/pacenotes.lua` · VM : Game Engine (GE) · 433 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/raceEditor/pacenotes")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

Le module renvoie un constructeur : `local obj = require("editor_raceEditor_pacenotes")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:beginDrag()` |  | 87 |
| `C:createManualPacenote()` |  | 174 |
| `C:dragging()` |  | 101 |
| `C:draw(mouseInfo)` |  | 165 |
| `C:drawPacenoteList()` |  | 273 |
| `C:endDragging()` |  | 140 |
| `C:init(raceEditor)` |  | 17 |
| `C:input()` |  | 247 |
| `C:mouseOverPacenotes()` |  | 230 |
| `C:onEditModeActivate()` |  | 159 |
| `C:selectPacenote(id)` |  | 49 |
| `C:selected()` |  | 27 |
| `C:selector(name, fieldName, tt)` |  | 401 |
| `C:setPath(path)` |  | 23 |
| `C:unselect()` |  | 41 |
| `C:updateTransform(index)` |  | 67 |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawSphere`, `drawSquarePrism`, `drawTextAdvanced`
- `scenetree.` `findClassObjects`
- `worldEditorCppApi.` `getAxisGizmoScale`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/raceEditor/pacenotes.lua`.*
