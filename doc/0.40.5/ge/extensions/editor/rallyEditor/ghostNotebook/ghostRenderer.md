# `editor_rallyEditor_ghostNotebook_ghostRenderer`

*Fichier : `lua/ge/extensions/editor/rallyEditor/ghostNotebook/ghostRenderer.lua` · VM : Game Engine (GE) · 269 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/rallyEditor/ghostNotebook/ghostRenderer")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

Le module renvoie un constructeur : `local obj = require("editor_rallyEditor_ghostNotebook_ghostRenderer")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:buildCache(path, snaproad)` |  | 137 |
| `C:draw(path, snaproad, globalOpacity, pacenoteToolsState, activePath)` |  | 205 |
| `C:drawEntry(entry, lineColor, textAlpha, textBgAlpha, drawLabel, prismWidth)` |  | 179 |
| `C:getCache(path, snaproad)` |  | 172 |
| `C:init(rallyEditor)` |  | 13 |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawSquarePrism`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/rallyEditor/ghostNotebook/ghostRenderer.lua`.*
