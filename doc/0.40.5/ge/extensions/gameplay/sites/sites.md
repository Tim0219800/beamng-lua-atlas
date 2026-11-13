# `gameplay_sites_sites`

*Fichier : `lua/ge/extensions/gameplay/sites/sites.lua` · VM : Game Engine (GE) · 233 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/sites/sites")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

Le module renvoie un constructeur : `local obj = require("gameplay_sites_sites")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:drawDebug()` | Debug and Serialization | 26 |
| `C:finalizeSites()` |  | 59 |
| `C:getClosestParkingSpot(pos)` |  | 173 |
| `C:getNextUniqueIdentifier()` |  | 11 |
| `C:getRadialLocations(pos, minRadius, maxRadius)` | gets a list of all locations within a min/max distance around a position. | 135 |
| `C:getRadialParkingSpots(pos, minRadius, maxRadius)` | gets a list of all parking spots within a min/max distance around a position. | 155 |
| `C:getTagsForZonesAtPosition(pos)` |  | 209 |
| `C:getZonesForPosition(pos)` |  | 178 |
| `C:init(name)` |  | 16 |
| `C:onDeserialized(data, oldIdMap)` |  | 45 |
| `C:onSerialize()` |  | 32 |
| `C:zonesForPositionIterator(pos, ctx)` |  | 201 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/sites/sites.lua`.*
