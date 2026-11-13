# `gameplay_sites_sitesManager`

*Fichier : `lua/ge/extensions/gameplay/sites/sitesManager.lua` · VM : Game Engine (GE) · 134 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_sites_sitesManager` : `extensions.load("gameplay_sites_sitesManager")`, puis la globale `gameplay_sites_sitesManager`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_sites_sitesManager.getAllLevelSites()` |  | 13 |
| `gameplay_sites_sitesManager.getBestParkingSpotForVehicleFromList(vehId, parkingSpots)` |  | 121 |
| `gameplay_sites_sitesManager.getCurrentLevelSitesFileByName(name)` |  | 112 |
| `gameplay_sites_sitesManager.getCurrentLevelSitesFiles(name)` |  | 108 |
| `gameplay_sites_sitesManager.getSitesFilesByLevel()` | UTIL functions | 104 |
| `gameplay_sites_sitesManager.loadSites(filepath, force, ignoreCache)` |  | 30 |
| `gameplay_sites_sitesManager.onClientEndMission()` | *(hook)* | 62 |
| `gameplay_sites_sitesManager.onClientStartMission()` | *(hook)* | 58 |
| `gameplay_sites_sitesManager.onDeserialized(data)` | *(hook)* | 89 |
| `gameplay_sites_sitesManager.onModManagerReady()` | *(hook)* | 54 |
| `gameplay_sites_sitesManager.onSerialize()` | *(hook)* | 73 |

## Appels vers le moteur (C++)

- `FS:` `findFiles`
- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/sites/sitesManager.lua`.*
