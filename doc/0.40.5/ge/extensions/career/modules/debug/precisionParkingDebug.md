# `career_modules_debug_precisionParkingDebug`

*File: `lua/ge/extensions/career/modules/debug/precisionParkingDebug.lua` · VM: Game Engine (GE) · 409 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `career_modules_debug_precisionParkingDebug`: `extensions.load("career_modules_debug_precisionParkingDebug")`, then the global `career_modules_debug_precisionParkingDebug`

"Precision Parking" career debug tab. A button toggles the debug; when active, the module looks (every 0.1 s) for the delivery parking spot nearest to the player vehicle (accessPointsByName of the deliveryProviders), computes parking precision data and displays it in ImGui, with 3D drawings (spheres, lines, arrows via debugDrawer).

## Notes

- Development tool; debugOrder = 10.
- If there is no player vehicle, debugData.error is displayed in red.

## Functions

| Function | Description | Line |
|---|---|---|
| `career_modules_debug_precisionParkingDebug.drawDebugMenu()` | Draws the toggle button and, if active, updates then displays the parking precision data. *(internal)* | 154 |
| `career_modules_debug_precisionParkingDebug.drawDebugVisualization()` | Draws the 3D debug visualization if the mode is active. *(internal)* | 396 |
| `career_modules_debug_precisionParkingDebug.onDebugDisabled()` | Cleanup when the debug is disabled: turns off the mode and clears debugData. *(internal)* *(hook)* | 403 |

## Fields

| Field | Type | Description |
|---|---|---|
| `debugName` | string | 'Precision Parking'. |
| `debugOrder` | number | Sort order (10). |

## Calls into the engine (C++)

- `be:` `getPlayerVehicleID`
- `debugDrawer:` `drawArrow`, `drawLine`, `drawSphere`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/career/modules/debug/precisionParkingDebug.lua`.*
