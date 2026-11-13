# `util_saveDynamicData`

*Fichier : `lua/ge/extensions/util/saveDynamicData.lua` · VM : Game Engine (GE) · 214 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_saveDynamicData` : `extensions.load("util_saveDynamicData")`, puis la globale `util_saveDynamicData`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_saveDynamicData.heartbeat()` |  | 197 |
| `util_saveDynamicData.onClientStartMission(levelPath)` | *(hook)* | 135 |
| `util_saveDynamicData.onExtensionLoaded()` | *(hook)* | 160 |
| `util_saveDynamicData.onExtensionUnloaded()` | *(hook)* | 201 |
| `util_saveDynamicData.onInit()` | called when the module is loaded. Note: not all system may be up and running at this point *(hook)* | 26 |
| `util_saveDynamicData.vehicleDone()` |  | 193 |
| `util_saveDynamicData.work(pcFile, vehicle)` |  | 142 |

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicle`, `setPhysicsSpeedFactor`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/saveDynamicData.lua`.*
