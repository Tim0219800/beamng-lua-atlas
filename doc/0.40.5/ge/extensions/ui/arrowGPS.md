# `ui_arrowGPS`

*File: `lua/ge/extensions/ui/arrowGPS.lua` · VM: Game Engine (GE) · 196 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_arrowGPS`: `extensions.load("ui_arrowGPS")`, then the global `ui_arrowGPS`

Displays a 3D GPS arrow (TSStatic art/shapes/interface/s_mm_arrow_floating.dae) floating in front of the camera, at the location of the arrowGPS interface app, and oriented toward a world target. Several sources can register a target with a priority (setTarget); the highest-priority one (smallest number) is followed. The arrow is created on demand, hidden if there is no target or no player vehicle, and deleted on unload.

## Example

```lua
ui_arrowGPS.setTarget('myMission', 10, {pos = vec3(100, 200, 50), color = {1, 0.4, 0.2}})
ui_arrowGPS.removeTarget('myMission')
```

## Notes

- Priority: the smallest value wins (comparison "reg.priority < bestPriority").
- setTarget accepts pos as vec3, {x,y,z} or {1,2,3}. A registration without pos is ignored when choosing the active target. color = {r,g,b} with values from 0 to 1, default {1, 0.4, 0.2}.
- The app's screen position (0 to 1) is set on the Vue side by setAppScreenPos; the arrow is placed at arrowDepth (0.15 m by default) in front of the camera, taking the FOV and the screen ratio into account.
- Default scale 0.04. The arrow stays hidden if the player has no vehicle (getPlayerVehicle(0)) or if the target is less than 0.1 m away.

**Dependencies (loaded first):** `core_camera`

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_arrowGPS.onExtensionUnloaded()` | Unload hook: deletes the arrow object and empties all registrations. *(internal)* *(hook)* | 179 |
| `ui_arrowGPS.onPreRender(dt)` | Hook called before each render: creates the arrow if needed, computes its screen-to-world position, orients it toward the active target (quatFromDir) and shows it; hides it if there is no target or no player vehicle. *(internal)* *(hook)* | 144 |
| `ui_arrowGPS.removeTarget(key)` | Removes a source's target and recomputes the active target (the arrow hides if none remains). | 68 |
| `ui_arrowGPS.setAppScreenPos(sx, sy)` | Sets the app's screen position (fractions from 0 to 1) where the arrow is drawn; called from the interface side. | 128 |
| `ui_arrowGPS.setDepth(depth)` | Changes the distance in front of the camera at which the arrow is placed (0.15 by default). | 140 |
| `ui_arrowGPS.setScale(scale)` | Changes the arrow's scale (0.04 by default). | 133 |
| `ui_arrowGPS.setTarget(key, priority, data)` | Registers or replaces a source's target (key) with its priority, then recomputes the active target and the arrow's color. | 54 |

### Parameter details

#### `ui_arrowGPS.onPreRender(dt)`

Hook called before each render: creates the arrow if needed, computes its screen-to-world position, orients it toward the active target (quatFromDir) and shows it; hides it if there is no target or no player vehicle.

- `dt` (*number*) : Elapsed time (not used).

#### `ui_arrowGPS.removeTarget(key)`

Removes a source's target and recomputes the active target (the arrow hides if none remains).

- `key` (*string*) : Source identifier.

#### `ui_arrowGPS.setAppScreenPos(sx, sy)`

Sets the app's screen position (fractions from 0 to 1) where the arrow is drawn; called from the interface side.

- `sx` (*number*) : Horizontal position, 0 left, 1 right.
- `sy` (*number*) : Vertical position, 0 top, 1 bottom.

#### `ui_arrowGPS.setDepth(depth)`

Changes the distance in front of the camera at which the arrow is placed (0.15 by default).

- `depth` (*number*) : Distance in meters.

#### `ui_arrowGPS.setScale(scale)`

Changes the arrow's scale (0.04 by default).

- `scale` (*number*) : Uniform scale factor.

#### `ui_arrowGPS.setTarget(key, priority, data)`

Registers or replaces a source's target (key) with its priority, then recomputes the active target and the arrow's color.

- `key` (*string*) : Source identifier.
- `priority` (*number*) : Priority; the smallest value wins.
- `data` (*table|nil*) : {pos=vec3|{x,y,z}, color={r,g,b}|nil}.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | { "core_camera" }: loaded before this module. |

## Calls into the engine (C++)

- `Sim.` `getUniqueName`
- `obj:` `delete`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/arrowGPS.lua`.*
