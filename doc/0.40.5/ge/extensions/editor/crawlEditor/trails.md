# `editor_crawlEditor_trails`

*Fichier : `lua/ge/extensions/editor/crawlEditor/trails.lua` · VM : Game Engine (GE) · 603 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/crawlEditor/trails")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

Le module renvoie un constructeur : `local obj = require("editor_crawlEditor_trails")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:clearSelection()` |  | 563 |
| `C:draw(mouseInfo)` |  | 577 |
| `C:drawTrailDetail(trail)` |  | 150 |
| `C:drawTrailsList(allTrails, selection)` |  | 95 |
| `C:getNewTrail()` |  | 534 |
| `C:getPrefabFiles()` |  | 77 |
| `C:init()` |  | 71 |
| `C:input(mouseInfo)` |  | 571 |
| `C:setCurrentTab(tab)` |  | 567 |
| `C:setFields(trail)` |  | 138 |
| `C:setTrail(trailParam)` |  | 559 |

## Appels vers le moteur (C++)

- `FS:` `fileExists`, `findFiles`, `removeFile`
- `be:` `getPlayerVehicle`
- `debugDrawer:` `drawSphere`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/crawlEditor/trails.lua`.*
