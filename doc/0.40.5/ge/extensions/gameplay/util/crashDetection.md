# `gameplay_util_crashDetection`

*Fichier : `lua/ge/extensions/gameplay/util/crashDetection.lua` · VM : Game Engine (GE) · 770 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_util_crashDetection` : `extensions.load("gameplay_util_crashDetection")`, puis la globale `gameplay_util_crashDetection`

**Dépendances (chargées avant) :** `gameplay_util_damageAssessment`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_util_crashDetection.addTrackedVehicleById(vehId_, crashSettings, owner)` |  | 633 |
| `gameplay_util_crashDetection.isVehCrashing(vehId)` |  | 728 |
| `gameplay_util_crashDetection.isVehTracked(vehId)` |  | 733 |
| `gameplay_util_crashDetection.onDeserialized(data)` | *(hook)* | 745 |
| `gameplay_util_crashDetection.onSerialize()` | *(hook)* | 737 |
| `gameplay_util_crashDetection.onUpdate(dtReal, _dtSim)` | *(hook)* | 599 |
| `gameplay_util_crashDetection.onVehicleDestroyed(vehId)` | *(hook)* | 751 |
| `gameplay_util_crashDetection.removeTrackedVehicleById(vehId)` |  | 718 |
| `gameplay_util_crashDetection.resetCrashData(vehId)` |  | 73 |
| `gameplay_util_crashDetection.setDebug(_debug)` |  | 724 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onNewImpactStarted`
- `onVehicleCrashEnded` — écouté par 2 module(s)
- `onVehicleCrashStarted` — écouté par 2 module(s)

## Appels vers le moteur (C++)

- `be:` `getObjectByID`
- `debugDrawer:` `drawSphere`, `drawText`, `drawTextAdvanced`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/util/crashDetection.lua`.*
