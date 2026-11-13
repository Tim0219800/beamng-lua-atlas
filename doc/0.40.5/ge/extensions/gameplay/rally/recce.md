# `gameplay_rally_recce`

*Fichier : `lua/ge/extensions/gameplay/rally/recce.lua` · VM : Game Engine (GE) · 295 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/rally/recce")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

Le module renvoie un constructeur : `local obj = require("gameplay_rally_recce")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_resetState()` |  | 50 |
| `C:createPacenotesData(notebook)` |  | 165 |
| `C:drawDebugCuts()` |  | 95 |
| `C:drawDebugRecce(drawLabels, mouseInfo)` |  | 89 |
| `C:drawLittleCar(pos, quat, txt)` |  | 106 |
| `C:drivelineAndCutsLoaded()` |  | 46 |
| `C:init(missionDir)` |  | 36 |
| `C:loadCuts()` |  | 75 |
| `C:loadDriveline()` |  | 80 |
| `C:loadDrivelineAndCuts()` |  | 55 |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawSphere`, `drawSquarePrism`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/recce.lua`.*
