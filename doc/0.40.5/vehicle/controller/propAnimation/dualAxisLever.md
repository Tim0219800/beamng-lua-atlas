# `controller_propAnimation_dualAxisLever`

*File: `lua/vehicle/controller/propAnimation/dualAxisLever.lua` · VM: Vehicle · 378 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `propAnimation/dualAxisLever` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

Auxiliary two-axis lever animation controller (automatic gearbox lever of the P R N D S M type with a gate). Reads the current mode name (electrics.values.gear by default), queues it then moves the virtual lever mode by mode (passing through the intermediate modes), optionally via intermediate coordinates (modeChanges), and publishes the position in electrics dualAxisX / dualAxisY. Handles the S and M modes (with impulse modes M+ and M-).

## Notes

- jbeam keys read: orderedModeCoordinates (header table modeName, x, y; the order defines the position of the modes), impulseModeCoordinates (impulse modes whose name is the base mode followed by a character, typically + or -), modeChanges (mode1, mode2, intermediateCoordinates: gate path between two modes), electricsNameXAxis ("dualAxisX"), electricsNameYAxis ("dualAxisY"), electricsNameMode ("gear"), moveSoundNode_nodes (first element = sound node, otherwise 0 + log W), moveSoundEventDualAxisDirectionChange ("event:>Vehicle>Interior>Gearshift>manual_modern_01_in"), moveSoundVolumeDualAxisDirectionChange (0.5), smootherRateX and smootherRateY (4), demoModes (table of names for demonstration animation).
- The mode name read is reduced to "S" for any mode starting with S, and to "M" (or M+ / M-) for M<n> depending on whether the number increases or decreases.
- An impulse name of fewer than 2 characters or without a base mode logs an E and stops init (return): the following structures are then not initialized.
- In handleMSModes, the M<n> gear indices are compared as strings extracted from the name (the gearIndex > lastMModeGearIndex comparison operates on strings), which may misorder 9 and 10 (inferred from code).
- M.updateGFX is nop at declaration and is only assigned to updateGFX at the end of init (dualAxisLever.init).

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_propAnimation_dualAxisLever.init(jbeamData)` | Reads mode coordinates, impulse modes, mode changes, sounds and smoothers; starts on the first mode of the list. *(internal)* | 271 |
| `controller_propAnimation_dualAxisLever.reset(jbeamData)` | Resets position, mode queue, movement states and smoothers to zero. *(internal)* | 249 |

### Parameter details

#### `controller_propAnimation_dualAxisLever.init(jbeamData)`

Reads mode coordinates, impulse modes, mode changes, sounds and smoothers; starts on the first mode of the list.

- `jbeamData` (*table*) : Controller jbeam data.

#### `controller_propAnimation_dualAxisLever.reset(jbeamData)`

Resets position, mode queue, movement states and smoothers to zero.

- `jbeamData` (*table*) : Jbeam data.

## Fields

| Field | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |
| `updateGFX` | function | nop at load, then internal updateGFX after init. |

## Calls into the engine (C++)

- `obj:` `playSFXOnceCT`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/propAnimation/dualAxisLever.lua`.*
