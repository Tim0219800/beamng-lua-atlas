# `gameplay_util_damageAssessment`

*Fichier : `lua/ge/extensions/gameplay/util/damageAssessment.lua` · VM : Game Engine (GE) · 444 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_util_damageAssessment` : `extensions.load("gameplay_util_damageAssessment")`, puis la globale `gameplay_util_damageAssessment`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_util_damageAssessment.calculateDamageVariation(tableNumbers, maxValue)` |  | 272 |
| `gameplay_util_damageAssessment.getOverallDamageLevel(vehId)` |  | 149 |
| `gameplay_util_damageAssessment.getSectionsDamageInfoRaw(vehId)` |  | 182 |
| `gameplay_util_damageAssessment.getTextualBeamDamageLocations(data)` | used to know where damage on the vehicle happened | 408 |
| `gameplay_util_damageAssessment.getTextualCollisionDamageLocations(data)` | used to know where an impact happened | 403 |
| `gameplay_util_damageAssessment.onDeserialized(data)` | *(hook)* | 418 |
| `gameplay_util_damageAssessment.onSerialize()` | *(hook)* | 412 |
| `gameplay_util_damageAssessment.onUpdate()` | *(hook)* | 422 |
| `gameplay_util_damageAssessment.setDebug(newDebug)` |  | 428 |

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`
- `debugDrawer:` `drawLine`, `drawText`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/util/damageAssessment.lua`.*
