# `career_modules_delivery_precisionParking`

*Fichier : `lua/ge/extensions/career/modules/delivery/precisionParking.lua` · VM : Game Engine (GE) · 436 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_delivery_precisionParking` : `extensions.load("career_modules_delivery_precisionParking")`, puis la globale `career_modules_delivery_precisionParking`

**Dépendances (chargées avant) :** `util_stepHandler`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_delivery_precisionParking.calculateCargoPrecisionParking(cargo, targetLocation)` | Main function to calculate and apply precision parking for cargo delivery | 400 |
| `career_modules_delivery_precisionParking.calculateVehiclePrecisionParking(taskData)` | Main function to calculate and apply precision parking for vehicle delivery | 380 |
| `career_modules_delivery_precisionParking.calculateVehiclePrecisionScore(vehId, targetParkingSpot)` | Calculate precision parking score for a vehicle (based on parkingPointsNode.lua) | 64 |
| `career_modules_delivery_precisionParking.debugPrecisionParking(vehId, targetParkingSpot)` | Debug function to test precision parking | 426 |
| `career_modules_delivery_precisionParking.getPrecisionParkingBonus(precisionData)` | Get precision parking bonus for rewards | 171 |
| `career_modules_delivery_precisionParking.getPrecisionParkingConfig()` | Get precision parking configuration (for UI/debugging) | 415 |
| `career_modules_delivery_precisionParking.onCareerActivated()` | *(hook)* | 9 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/delivery/precisionParking.lua`.*
