# `gameplay_traffic_roadTracking`

*Fichier : `lua/ge/extensions/gameplay/traffic/roadTracking.lua` · VM : Game Engine (GE) · 352 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/traffic/roadTracking")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

Le module renvoie un constructeur : `local obj = require("gameplay_traffic_roadTracking")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:calcVehOnRoad()` |  | 109 |
| `C:init(vehId)` |  | 16 |
| `C:onDeserialized(data)` |  | 338 |
| `C:onSerialize()` |  | 328 |
| `C:onUpdate(dt)` |  | 193 |
| `C:refresh()` |  | 38 |
| `C:resetValues()` |  | 68 |
| `C:updateCurrentRoad()` |  | 152 |
| `C:updateVehicle()` |  | 97 |

## Appels vers le moteur (C++)

- `be:` `getObjectOOBBCenterXYZ`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/traffic/roadTracking.lua`.*
