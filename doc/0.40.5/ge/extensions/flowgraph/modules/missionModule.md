# `flowgraph_modules_missionModule`

*Fichier : `lua/ge/extensions/flowgraph/modules/missionModule.lua` · VM : Game Engine (GE) · 133 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/modules/missionModule")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

| Méthode | Description | Ligne |
|---|---|---|
| `C:clear()` |  | 11 |
| `C:executionStarted()` |  | 127 |
| `C:executionStopped()` |  | 114 |
| `C:getOriginalPlayerId()` |  | 87 |
| `C:init()` |  | 7 |
| `C:missionHook(name, data)` |  | 107 |
| `C:onClear()` |  | 124 |
| `C:prepareVehicle(id, addDummyDriver)` |  | 63 |
| `C:processVehicles(params)` |  | 15 |
| `C:removeStashedPlayerVehicle()` |  | 93 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onMissionFinished`

**Évènements UI (guihooks.trigger) :** `hotlappingReevaluateControlsEnabled`

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`
- `core_environment.` `getTimeOfDay`
- `obj:` `queueLuaCommand`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/modules/missionModule.lua`.*
