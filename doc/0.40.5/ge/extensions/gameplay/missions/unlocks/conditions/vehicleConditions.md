# `gameplay_missions_unlocks_conditions_vehicleConditions`

*File: `lua/ge/extensions/gameplay/missions/unlocks/conditions/vehicleConditions.lua` · VM: Game Engine (GE) · 25 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_missions_unlocks_conditions_vehicleConditions`: `extensions.load("gameplay_missions_unlocks_conditions_vehicleConditions")`, then the global `gameplay_missions_unlocks_conditions_vehicleConditions`

Vehicle-related mission unlock condition type: vehicleDriven. Loaded by gameplay_missions_unlocks.

## Notes

- vehicleDriven announces "the player must be in a vehicle" but conditionMet always returns true without checking anything.
- busDriven is commented out in the code (inactive).

## Fields

| Field | Type | Description |
|---|---|---|
| `vehicleDriven` | table | Condition {type='vehicleDriven'}: label 'Driving a vehicle', conditionMet always returns true, {}. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/missions/unlocks/conditions/vehicleConditions.lua`.*
