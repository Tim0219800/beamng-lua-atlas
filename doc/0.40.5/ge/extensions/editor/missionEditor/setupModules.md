# `editor_missionEditor_setupModules`

*Fichier : `lua/ge/extensions/editor/missionEditor/setupModules.lua` · VM : Game Engine (GE) · 817 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/missionEditor/setupModules")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

Le module renvoie un constructeur : `local obj = require("editor_missionEditor_setupModules")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:displayDiffSetup(veh)` |  | 762 |
| `C:draw()` |  | 226 |
| `C:getMissionIssues(m)` |  | 163 |
| `C:init(missionEditor)` |  | 8 |
| `C:setBackwardsCompatibility()` |  | 149 |
| `C:setMission(mission)` |  | 114 |

## Appels vers le moteur (C++)

- `core_environment.` `getTimeOfDay`, `getTimeOfDayValueForNormalizedTime`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/missionEditor/setupModules.lua`.*
