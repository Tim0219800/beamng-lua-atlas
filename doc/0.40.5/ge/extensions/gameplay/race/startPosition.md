# `gameplay_race_startPosition`

*Fichier : `lua/ge/extensions/gameplay/race/startPosition.lua` · VM : Game Engine (GE) · 237 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/race/startPosition")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

Le module renvoie un constructeur : `local obj = require("gameplay_race_startPosition")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:calculateVehiclePosRot(vehId, lowPrecision)` |  | 139 |
| `C:drawDebug(drawMode, clr)` |  | 63 |
| `C:getFrontCorners(width, length)` |  | 52 |
| `C:getRoutePoint()` |  | 218 |
| `C:getStaticRoutePoint()` |  | 227 |
| `C:init(race, name)` |  | 7 |
| `C:moveResetVehicleTo(vehId, lowPrecision, repair)` |  | 170 |
| `C:onDeserialized(data)` |  | 36 |
| `C:onSerialize()` |  | 25 |
| `C:set(pos, rot)` |  | 47 |
| `C:setRoutePoint(rp)` |  | 211 |
| `C:setStaticRoutePoint(rp)` |  | 222 |
| `C:setToVehicle(vehId)` |  | 190 |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawSquarePrism`, `drawTextAdvanced`, `drawTriSolid`
- `scenetree.` `findClassObjects`, `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/race/startPosition.lua`.*
