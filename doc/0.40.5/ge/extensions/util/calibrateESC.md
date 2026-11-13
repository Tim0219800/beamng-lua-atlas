# `util_calibrateESC`

*Fichier : `lua/ge/extensions/util/calibrateESC.lua` · VM : Game Engine (GE) · 220 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_calibrateESC` : `extensions.load("util_calibrateESC")`, puis la globale `util_calibrateESC`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_calibrateESC.heartbeat()` |  | 203 |
| `util_calibrateESC.onClientStartMission(levelPath)` | *(hook)* | 141 |
| `util_calibrateESC.onExtensionLoaded()` | *(hook)* | 165 |
| `util_calibrateESC.onExtensionUnloaded()` | *(hook)* | 207 |
| `util_calibrateESC.onInit()` | called when the module is loaded. Note: not all system may be up and running at this point *(hook)* | 24 |
| `util_calibrateESC.vehicleDone()` |  | 199 |
| `util_calibrateESC.work(pcFile, vehicle)` |  | 147 |

## Appels vers le moteur (C++)

- `be:` `setPhysicsSpeedFactor`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/calibrateESC.lua`.*
