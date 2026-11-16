# `ui_cameraDistanceApp`

*File: `lua/ge/extensions/ui/cameraDistanceApp.lua` · VM: Game Engine (GE) · 34 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_cameraDistanceApp`: `extensions.load("ui_cameraDistanceApp")`, then the global `ui_cameraDistanceApp`

"Camera distance" debug UI app. Every frame, measures the distance between the player vehicle and the camera, pushes it to the UI via guihooks.trigger('cameraDistance', distance) and draws in the world a red sphere of radius 0.5 m on the vehicle with the label "camera distance target".

## Notes

- Without a player vehicle, sends cameraDistance(-1, "no vehicle") and draws nothing.
- Distance in meters. A TODO in the code plans to replace the guihooks.trigger with a stream.

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_cameraDistanceApp.onUpdate(dtReal, dtSim, dtRaw)` | Hook called every frame: draws the sphere and the debug text on the player vehicle and sends the vehicle-camera distance to the UI. *(internal)* *(hook)* | 11 |

### Parameter details

#### `ui_cameraDistanceApp.onUpdate(dtReal, dtSim, dtRaw)`

Hook called every frame: draws the sphere and the debug text on the player vehicle and sends the vehicle-camera distance to the UI.

- `dtReal` (*number*) : Elapsed real time (s), unused.
- `dtSim` (*number*) : Elapsed simulation time (s), unused.
- `dtRaw` (*number*) : Elapsed raw time (s), unused.

**UI events (guihooks.trigger):** `cameraDistance`

## Calls into the engine (C++)

- `debugDrawer:` `drawSphere`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/cameraDistanceApp.lua`.*
