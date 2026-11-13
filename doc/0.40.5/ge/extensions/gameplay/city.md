# `gameplay_city`

*Fichier : `lua/ge/extensions/gameplay/city.lua` · VM : Game Engine (GE) · 140 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_city` : `extensions.load("gameplay_city")`, puis la globale `gameplay_city`

**Dépendances (chargées avant) :** `gameplay_sites_sitesManager`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_city.getHighestPrioZone(pos)` |  | 30 |
| `gameplay_city.getMergedFieldsFromZones(pos, fieldName)` |  | 47 |
| `gameplay_city.getRandomParkingSpots(minDist, startName)` |  | 61 |
| `gameplay_city.getSites()` |  | 112 |
| `gameplay_city.getZonesByPrioForPosition(pos)` |  | 13 |
| `gameplay_city.loadSites(file)` |  | 97 |
| `gameplay_city.onClientEndMission(levelPath)` | *(hook)* | 124 |
| `gameplay_city.onClientStartMission(levelPath)` | *(hook)* | 120 |
| `gameplay_city.reset()` |  | 116 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

## Appels vers le moteur (C++)

- `FS:` `fileExists`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/city.lua`.*
