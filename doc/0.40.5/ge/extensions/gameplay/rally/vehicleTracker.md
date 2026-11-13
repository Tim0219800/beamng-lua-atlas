# `gameplay_rally_vehicleTracker`

*Fichier : `lua/ge/extensions/gameplay/rally/vehicleTracker.lua` · VM : Game Engine (GE) · 253 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/rally/vehicleTracker")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

Le module renvoie un constructeur : `local obj = require("gameplay_rally_vehicleTracker")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:damage()` |  | 185 |
| `C:didJustHaveDamage()` |  | 193 |
| `C:drawDebugInfo()` |  | 204 |
| `C:getVehicle()` |  | 54 |
| `C:getVehicleId()` |  | 48 |
| `C:init(damageThreshold)` |  | 9 |
| `C:onUpdate(dtReal, dtSim, dtRaw)` | function C:onUpdate(dt, raceData) | 70 |
| `C:pos()` |  | 151 |
| `C:setDebugDraw(enabled)` |  | 200 |
| `C:speedMs()` |  | 180 |
| `C:updateVehicleDamage()` |  | 115 |
| `C:updateVehicleData(vehicleId)` |  | 145 |
| `C:velocity()` |  | 168 |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawLine`, `drawSphere`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/vehicleTracker.lua`.*
