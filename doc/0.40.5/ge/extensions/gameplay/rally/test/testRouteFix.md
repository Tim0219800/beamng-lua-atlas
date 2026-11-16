# `gameplay_rally_test_testRouteFix`

*File: `lua/ge/extensions/gameplay/rally/test/testRouteFix.lua` · VM: Game Engine (GE) · 80 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_rally_test_testRouteFix`: `extensions.load("gameplay_rally_test_testRouteFix")`, then the global `gameplay_rally_test_testRouteFix`

Development test extension for the gameplay/route/route module: on load, it creates a Route with a small hard-coded 3-point path, then every frame draws the path (spheres, prisms, numbers) via debugDrawer and makes the player vehicle follow it with route:trackVehicle. Loaded with extensions.load('gameplay_rally_test_testRouteFix'). Of no use in normal gameplay.

## Notes

- The path coordinates are fixed (test world); the drawMousePos and drawPath functions exist but their call is commented out in onUpdate.
- The file's header comment mentions "extension name: gameplay_rally", which does not match the extension's real name.

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_rally_test_testRouteFix.onExtensionLoaded()` | Hook called when the extension loads: creates the Route and calls setupPathMulti on the test path. *(internal)* *(hook)* | 72 |
| `gameplay_rally_test_testRouteFix.onExtensionUnloaded()` | Hook called when the extension unloads; empty body. *(internal)* *(hook)* | 77 |
| `gameplay_rally_test_testRouteFix.onUpdate()` | Hook called every frame: draws the route and calls route:trackVehicle on player vehicle 0 if it exists. *(internal)* *(hook)* | 56 |
| `gameplay_rally_test_testRouteFix.onVehicleResetted()` | Hook called when a vehicle is put back in place; empty body. *(internal)* *(hook)* | 69 |

## Calls into the engine (C++)

- `debugDrawer:` `drawSphere`, `drawSquarePrism`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/rally/test/testRouteFix.lua`.*
