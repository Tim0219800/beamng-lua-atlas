# `backwardsCompatibility`

*File: `lua/vehicle/backwardsCompatibility.lua` · VM: Vehicle · 404 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** global `backwardsCompatibility`

Converts old vehicle data (v.data) to the current format at initialization: old drivetrain (engine/differentials) to a powertrain, hard-coded ESC (escConfig) to an 'esc' controller, and heuristic trailer detection to limit ignition levels. A modder does not need to call it: it serves old vehicles/mods whose jbeam has not been migrated. It modifies v.data in place.

## Notes

- Order in init: checkOldESC, then checkOldDrivetrain, then checkTrailerIgnitionStates (must come after the drivetrain->powertrain conversion because it uses powertrain data).
- Presumed trailer (no torque source nor vehicleController): v.data.electrics.allowedIgnitionLevels = {0} and ignitionLevelOverrideType = 'none', unless the jbeam already provides allowedIgnitionLevels.
- Possible inconsistency: checkOldESC tests `v.filename == "esc"` while the controller is inserted with the key `fileName`; detection of an existing esc controller may therefore fail and duplicate the controller. Also, the loop shadows the global variable `v` with the loop variable.

## Functions

| Function | Description | Line |
|---|---|---|
| `backwardsCompatibility.init()` | Applies all backward-compatibility conversions to v.data (ESC, drivetrain, trailer ignition states). Called by vehicle loading before systems are initialized. *(internal)* | 393 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/backwardsCompatibility.lua`.*
