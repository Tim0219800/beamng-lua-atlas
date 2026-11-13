# `editor_raceEditor_testing`

*Fichier : `lua/ge/extensions/editor/raceEditor/testing.lua` · VM : Game Engine (GE) · 170 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/raceEditor/testing")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

Le module renvoie un constructeur : `local obj = require("editor_raceEditor_testing")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:draw(dt)` |  | 44 |
| `C:drawEventLog()` |  | 154 |
| `C:drawRace(dt)` |  | 110 |
| `C:drawSetup()` |  | 55 |
| `C:drawStopped()` |  | 131 |
| `C:drawTimes()` |  | 142 |
| `C:init(raceEditor)` |  | 9 |
| `C:setPath(path)` |  | 15 |
| `C:setupRace()` |  | 19 |
| `C:startRace(vehIds, enableAi, rollingStart)` |  | 29 |

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/raceEditor/testing.lua`.*
