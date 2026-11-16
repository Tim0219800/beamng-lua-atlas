# `flowgraph_nodes_gameplay_crash_onCrashDetected`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/crash/onCrashDetected.lua` · VM : Game Engine (GE) · 60 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/crash/onCrashDetected")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « On Crash Detected » (catégorie repeat_instant). Émet un flux quand un véhicule suivi commence ou finit un crash (hooks onVehicleCrashStarted/onVehicleCrashEnded de gameplay_util_crashDetection). Sorties : startCrash, endCrash (impulsions) et vehId. Les crashs simultanés sont mis en file et sortis un par frame.

## Remarques

- Si début et fin sortent la même frame, vehId est écrasé par celui de la fin.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStopped()` | Appelle reset. | 24 |
| `C:init()` | Appelle reset. | 20 |
| `C:onVehicleCrashEnded(crashEndData)` | Hook : ajoute vehId à la file de fins de crash. | 55 |
| `C:onVehicleCrashStarted(crashStartData)` | Hook : ajoute vehId à la file de débuts de crash. | 51 |
| `C:reset()` | Vide les files crashStartQueue et crashEndQueue. | 28 |
| `C:work()` | Dépile un crash début et un crash fin par frame et renseigne startCrash, endCrash, vehId. | 33 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/crash/onCrashDetected.lua`.*
