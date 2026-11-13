# `gameplay_sites_parkingSpot`

*Fichier : `lua/ge/extensions/gameplay/sites/parkingSpot.lua` · VM : Game Engine (GE) · 479 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/sites/parkingSpot")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

Le module renvoie un constructeur : `local obj = require("gameplay_sites_parkingSpot")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:boxFits(extentsX, extentsY, extentsZ)` |  | 347 |
| `C:calcVerts()` |  | 244 |
| `C:checkParking(vehId, precision, drivingSpeed, parkingSpeed)` |  | 294 |
| `C:containsPoint(pos)` |  | 257 |
| `C:drawDebug(drawMode, clr, customHeight, drawDirection)` |  | 87 |
| `C:drawSide(a, b, z, clrI)` |  | 176 |
| `C:generateMultiSpots(parkingSpotList, skipSort)` |  | 198 |
| `C:getPath()` |  | 83 |
| `C:hasAnyVehicles(playerId)` |  | 359 |
| `C:init(sites, name, forceId)` |  | 17 |
| `C:moveResetVehicleTo(vehId, lowPrecision, backwards, addedOffsetPos, addedOffsetRot, useSafeTeleport, removeTraffic, resetVehicleInSafeTeleport, options)` |  | 399 |
| `C:onDeserialized(data)` |  | 55 |
| `C:onSerialize()` |  | 35 |
| `C:set(pos, rot, scl)` |  | 70 |
| `C:vehicleFits(vehId)` |  | 351 |

## Appels vers le moteur (C++)

- `be:` `getObjectOOBBCenterXYZ`, `getObjectOOBBHalfAxisXYZ`
- `debugDrawer:` `drawTextAdvanced`, `drawTriSolid`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/sites/parkingSpot.lua`.*
