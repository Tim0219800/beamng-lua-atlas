# `flowgraph_nodes_environment_setFogDensity`

*File: `lua/ge/extensions/flowgraph/nodes/environment/setFogDensity.lua` · VM: Game Engine (GE) · 70 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/environment/setFogDensity")` (file under extensions/ but not a regular extension)

Flowgraph node "Set Fog" (category dynamic_instant). Sets the fog density (density, 0 to 1) and the fog atmosphere height (atmosphereHeight) via core_environment. When the graph starts it stores the current values and restores them on stop (data.restoreTod).

## Notes

- Old pin "fog" renamed to "density" (legacyPins).
- The restore key is called restoreTod (copied from the Time of Day node).

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Stores the current fog density and height. | 40 |
| `C:_executionStopped()` | Restores the stored values if data.restoreTod is true. | 46 |
| `C:init(mgr)` | Sets data.restoreTod = true. | 27 |
| `C:postInit()` | Configures the density pin as a 0 to 1 slider. | 31 |
| `C:setFogParameters()` | Calls core_environment.setFogDensity and setFogAtmosphereHeight with the pin values. | 64 |
| `C:work()` | In repeat mode, applies the parameters every frame. | 58 |
| `C:workOnce()` | Applies the parameters once. | 54 |

## Calls into the engine (C++)

- `core_environment.` `getFogAtmosphereHeight`, `getFogDensity`, `setFogAtmosphereHeight`, `setFogDensity`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/environment/setFogDensity.lua`.*
