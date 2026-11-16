# `gameplay_util_damageAssessment`

*File: `lua/ge/extensions/gameplay/util/damageAssessment.lua` · VM: Game Engine (GE) · 444 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_util_damageAssessment`: `extensions.load("gameplay_util_damageAssessment")`, then the global `gameplay_util_damageAssessment`

Assesses a vehicle's damage: overall level (none, light, moderate, severe) based on map.objects[id].damage, and per-zone breakdown. For the breakdown, the vehicle's oriented box is split into 27 cells (3x3x3) whose beam and collision damage is read; the cells are grouped into named zones (Front, Front Left, Rear, Top, Left...). Used by gameplay_util_crashDetection to tell where an impact occurred.

## Example

```lua
local lvl = gameplay_util_damageAssessment.getOverallDamageLevel(be:getPlayerVehicleID(0))
print(lvl.damageName, lvl.damageSeverity)
local avant = gameplay_util_damageAssessment.getSectionsDamageInfoRaw(vehId)
-- ... collision ...
local res = gameplay_util_damageAssessment.getTextualCollisionDamageLocations({vehId = vehId, oldSectionsDamageRaw = avant})
print(res.mostDamagedLocation)
```

## Notes

- getOverallDamageLevel thresholds: <= 50 "No damage" (severity 0); above that, Minor up to 10000, Moderate from 10000, Severe from 30000 (and beyond 50000).
- Cells are indexed from 0 to 26; x = floor((i%9)/3), y = floor(i/9), z = i%3.
- Probable BUG: damageLocationScore is never set (only damageScore is), so bestDamageLocation is always nil and bestDamageScore 0; only mostDamagedLocation is usable.
- Probable BUG: the zone key is named `fontLeft` (typo, with no effect on the displayed name "Front Left"). The ids 7 are duplicated (rearCenter and top) and the name "Rear" is used by both rearCenter and rear: in damagedLocations, the second entry overwrites the first.
- If no cell has taken damage, intensity divides by 0 (maxCellDamage = 0) and can produce NaN.
- getTextualCollisionDamageLocations / getTextualBeamDamageLocations modify the received `data` table: its oldSectionsDamageRaw (and newSectionsDamageInfoRaw if provided) are replaced by plain per-cell numbers.
- Without oldSectionsDamageRaw, the previous state is assumed to be 0 for all cells; without vehId, player 0's vehicle is used.
- Damage shown in debug (setDebug(true)) draws the 27 cells in magenta every frame.

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_util_damageAssessment.calculateDamageVariation(tableNumbers, maxValue)` | Measures the heterogeneity of a damage series: standard deviation divided by half of maxValue, capped at 1. | 272 |
| `gameplay_util_damageAssessment.getOverallDamageLevel(vehId)` | Returns a vehicle's overall damage level based on map.objects[vehId].damage. | 149 |
| `gameplay_util_damageAssessment.getSectionsDamageInfoRaw(vehId)` | Reads the beam and collision damage of the vehicle's 27 cells. | 182 |
| `gameplay_util_damageAssessment.getTextualBeamDamageLocations(data)` | Same as getTextualCollisionDamageLocations but on beam damage (deformation), to know where the vehicle was damaged. | 408 |
| `gameplay_util_damageAssessment.getTextualCollisionDamageLocations(data)` | Compares current collision damage to a previous state and returns, per named zone, total, maximum, average, variation, intensity and score. Used to know where an impact occurred. | 403 |
| `gameplay_util_damageAssessment.onDeserialized(data)` | Hook called after reload: restores the debug flag. *(internal)* *(hook)* | 418 |
| `gameplay_util_damageAssessment.onSerialize()` | Hook called when extensions are reloaded: saves the debug flag. *(internal)* *(hook)* | 412 |
| `gameplay_util_damageAssessment.onUpdate()` | Hook called every frame; in debug mode, redraws the player vehicle's cells. *(internal)* *(hook)* | 422 |
| `gameplay_util_damageAssessment.setDebug(newDebug)` | Enables or disables debug drawing of the damage cells. | 428 |

### Parameter details

#### `gameplay_util_damageAssessment.calculateDamageVariation(tableNumbers, maxValue)`

Measures the heterogeneity of a damage series: standard deviation divided by half of maxValue, capped at 1.

- `tableNumbers` (*number[]*) : Damage per cell.
- `maxValue` (*number|nil*) : Reference value (500000 by default).
- **returns**: number 0 (uniform or fewer than 2 values) to 1.

#### `gameplay_util_damageAssessment.getOverallDamageLevel(vehId)`

Returns a vehicle's overall damage level based on map.objects[vehId].damage.

- `vehId` (*integer*) : Vehicle id (must exist in map.objects).
- **returns**: table {damageName = "No damage"|"Minor"|"Moderate"|"Severe", damageSeverity = 0..3}

#### `gameplay_util_damageAssessment.getSectionsDamageInfoRaw(vehId)`

Reads the beam and collision damage of the vehicle's 27 cells.

- `vehId` (*integer|nil*) : Vehicle id; player 0 if nil.
- **returns**: table<integer, table> Indices 0 to 26 -> {sectionBeamDamage, sectionCollisionDamage}.

#### `gameplay_util_damageAssessment.getTextualBeamDamageLocations(data)`

Same as getTextualCollisionDamageLocations but on beam damage (deformation), to know where the vehicle was damaged.

- `data` (*table|nil*) : Same format.
- **returns**: table Same format.

#### `gameplay_util_damageAssessment.getTextualCollisionDamageLocations(data)`

Compares current collision damage to a previous state and returns, per named zone, total, maximum, average, variation, intensity and score. Used to know where an impact occurred.

- `data` (*table|nil*) : {vehId, oldSectionsDamageRaw (output of getSectionsDamageInfoRaw), newSectionsDamageInfoRaw (optional)}.
- **returns**: table {damagedLocations (by zone name), mostDamagedLocation, totalDamage, bestDamageLocation, bestDamageScore}

#### `gameplay_util_damageAssessment.onDeserialized(data)`

Hook called after reload: restores the debug flag.

- `data` (*table*) : onSerialize table.

#### `gameplay_util_damageAssessment.onSerialize()`

Hook called when extensions are reloaded: saves the debug flag.

- **returns**: table {debug}

#### `gameplay_util_damageAssessment.setDebug(newDebug)`

Enables or disables debug drawing of the damage cells.

- `newDebug` (*boolean*) : true to enable.

## Calls into the engine (C++)

- `be:` `getPlayerVehicleID`
- `debugDrawer:` `drawLine`, `drawText`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/util/damageAssessment.lua`.*
