# `util_surfaceMaskWheels`

*File: `lua/ge/extensions/util/surfaceMaskWheels.lua` · VM: Game Engine (GE) · 559 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `util_surfaceMaskWheels`: `extensions.load("util_surfaceMaskWheels")`, then the global `util_surfaceMaskWheels`

Makes the player vehicle's wheels leave a trace in the "surface mask" (SurfaceMaskClipmap, a C++ object that keeps a dynamic mask of the terrain surface, for example flattened grass). Every 0.05 s, for each wheel, it converts the position (wheel axle node) to world and calls maskCircleWorld (first contact) or maskLineWorld (segment since the last position) with a width of 1.8 m (3.2 m in mower mode). It also owns the clipmap lifecycle: tile storage under /temp/levels/<level>/dynamicTiles, recentering on the vehicle, clearing. It offers a mower mode (cut grass particles) and debug tools (console line, "SurfaceMask Pages" ImGui window, 3D outlines of the 16 m pages). Other extensions (for example util_lawnMower) use it as a service via isReady, setCenter, maskCircleWorld and maskLineWorld.

## Example

```lua
extensions.load('util_surfaceMaskWheels') -- active as soon as loaded (onExtensionLoaded calls setEnabled(true))
util_surfaceMaskWheels.setMowingEnabled(true)
util_surfaceMaskWheels.setDebugMode(1) -- statistics line in the console every second
```

## Notes

- Only player 0's vehicle is processed; the data (wheel offsets, previous positions) is kept per vehicle id and removed on onVehicleDestroyed and onVehicleResetted (rebuilt after reset or part changes).
- Internal parameters (not exposed but serialized): maskInterval 0.05 s, maskWidth 1.8 m, mowerWidth 3.2 m, flattenStrength 1, markStrength 0.75, mowerMarkStrength 1, movement thresholds per interval minMoveSq 0.04 (0.2 m) and maxMoveSq 100 (10 m; beyond that the wheel is considered teleported and ignored), pageWorldSize 16 m.
- Mower mode sends the obj:addParticleByNodesRelative command (particle type 21, 3 particles) to the vehicle for each marked segment.
- Debug modes: 0 none, 1 console line (tag surfaceMask) throttled to 1 Hz, 2 full ImGui window plus 3D outlines of the pages around the vehicle. setDebugMode enables C++-side statistics collection only when the mode is > 0.
- M.enabled is false at declaration but onExtensionLoaded sets it to true immediately; onSerialize/onDeserialized keep the state across reloads (wheelMaskEnabled, an internal test switch, is not serialized).
- All the functions that touch SurfaceMaskClipmap do nothing if this global does not exist (build without clipmap); isReady() checks it.

**Dependencies (loaded first):** `ui_imgui`

## Functions

| Function | Description | Line |
|---|---|---|
| `util_surfaceMaskWheels.clear()` | Clears the whole surface mask (SurfaceMaskClipmap:clear()). | 448 |
| `util_surfaceMaskWheels.cycleDebug()` | Switches to the next debug mode (0, 1, 2, then back to 0). | 538 |
| `util_surfaceMaskWheels.getPerformanceStats()` | Returns a copy of the Lua-side performance statistics. | 512 |
| `util_surfaceMaskWheels.isReady()` | Indicates whether the SurfaceMaskClipmap object exists. Lets consumer modules skip their work. | 455 |
| `util_surfaceMaskWheels.maskCircleWorld(x, y, radius, flatten, mark)` | Stamps a disc into the mask. | 463 |
| `util_surfaceMaskWheels.maskLineWorld(x1, y1, x2, y2, width, flatten, mark)` | Stamps a thick segment into the mask. | 467 |
| `util_surfaceMaskWheels.onClientStartMission()` | Hook called when a level starts: repoints the clipmap's tile storage to the current level. *(internal)* *(hook)* | 427 |
| `util_surfaceMaskWheels.onDeserialized(data)` | Hook called after reload with the serialized state; restores the parameters (debug tile size limited to 36). *(internal)* *(hook)* | 492 |
| `util_surfaceMaskWheels.onExtensionLoaded()` | Hook called on extension load: enables the module, turns off debugging and initializes the tile storage. *(internal)* *(hook)* | 421 |
| `util_surfaceMaskWheels.onPreRender(dtReal, dtSim)` | Hook called every frame before rendering: accumulates the simulated time, runs the player vehicle's wheel marking every maskInterval, then the debug if any. *(internal)* *(hook)* | 391 |
| `util_surfaceMaskWheels.onSerialize()` | Serialization hook before extension reload: returns the state and the parameters (enabled, widths, strengths, thresholds, debug mode, mower, particles). *(internal)* *(hook)* | 471 |
| `util_surfaceMaskWheels.onVehicleDestroyed(vehId)` | Hook called when a vehicle is destroyed: removes its wheel data. *(internal)* *(hook)* | 431 |
| `util_surfaceMaskWheels.onVehicleResetted(vehId)` | Hook called after a vehicle reset: removes its wheel data so it is rebuilt. *(internal)* *(hook)* | 435 |
| `util_surfaceMaskWheels.setCenter(x, y)` | Recenters the clipmap: the C++ side saves the modified tiles that leave and loads those that enter. | 459 |
| `util_surfaceMaskWheels.setDebug(enabled)` | Compatibility: true enables mode 2, false mode 0. | 534 |
| `util_surfaceMaskWheels.setDebugMode(mode)` | Chooses the debug mode (0 none, 1 console, 2 window + 3D); the value is clamped to 0..2 and the first console line is emitted right away. | 527 |
| `util_surfaceMaskWheels.setDebugPageRadius(radius)` | Sets the radius (in pages) of the debug grid displayed around the vehicle (0 = current page only). | 554 |
| `util_surfaceMaskWheels.setEnabled(enabled)` | Enables or disables wheel marking and resets the timer. | 439 |
| `util_surfaceMaskWheels.setMowerWidth(width)` | Sets the mower's cutting width. | 550 |
| `util_surfaceMaskWheels.setMowingEnabled(enabled)` | Enables or disables mower mode (width 3.2 m, marking 1, grass particles). | 542 |
| `util_surfaceMaskWheels.toggle()` | Toggles the enabled state. | 444 |
| `util_surfaceMaskWheels.toggleMowing()` | Toggles mower mode. | 546 |

### Parameter details

#### `util_surfaceMaskWheels.getPerformanceStats()`

Returns a copy of the Lua-side performance statistics.

- **returns**: table {maskTicks, lastLuaFrameMs, avgLuaFrameMs, lastLuaMaskMs, avgLuaMaskMs, lastWheelCount, lastMovedWheels, lastSkippedWheels, lastMaskCalls, lastParticleCalls}.

#### `util_surfaceMaskWheels.isReady()`

Indicates whether the SurfaceMaskClipmap object exists. Lets consumer modules skip their work.

- **returns**: boolean true if SurfaceMaskClipmap is available.

#### `util_surfaceMaskWheels.maskCircleWorld(x, y, radius, flatten, mark)`

Stamps a disc into the mask.

- `x` (*number*) : World X of the center (m).
- `y` (*number*) : World Y of the center (m).
- `radius` (*number*) : Radius (m).
- `flatten` (*number*) : Grass flattening strength (0 to 1 based on the values used).
- `mark` (*number*) : Marking strength (0 to 1 based on the values used).

#### `util_surfaceMaskWheels.maskLineWorld(x1, y1, x2, y2, width, flatten, mark)`

Stamps a thick segment into the mask.

- `x1` (*number*) : World X of the start (m).
- `y1` (*number*) : World Y of the start (m).
- `x2` (*number*) : World X of the end (m).
- `y2` (*number*) : World Y of the end (m).
- `width` (*number*) : Line width (m).
- `flatten` (*number*) : Flattening strength.
- `mark` (*number*) : Marking strength.

#### `util_surfaceMaskWheels.onDeserialized(data)`

Hook called after reload with the serialized state; restores the parameters (debug tile size limited to 36).

- `data` (*table|nil*) : Serialized state.

#### `util_surfaceMaskWheels.onPreRender(dtReal, dtSim)`

Hook called every frame before rendering: accumulates the simulated time, runs the player vehicle's wheel marking every maskInterval, then the debug if any.

- `dtReal` (*number*) : Real frame time (s).
- `dtSim` (*number*) : Simulated duration (s), takes priority over dtReal.

#### `util_surfaceMaskWheels.onSerialize()`

Serialization hook before extension reload: returns the state and the parameters (enabled, widths, strengths, thresholds, debug mode, mower, particles).

- **returns**: table State to restore.

#### `util_surfaceMaskWheels.onVehicleDestroyed(vehId)`

Hook called when a vehicle is destroyed: removes its wheel data.

- `vehId` (*integer*) : Vehicle identifier.

#### `util_surfaceMaskWheels.onVehicleResetted(vehId)`

Hook called after a vehicle reset: removes its wheel data so it is rebuilt.

- `vehId` (*integer*) : Vehicle identifier.

#### `util_surfaceMaskWheels.setCenter(x, y)`

Recenters the clipmap: the C++ side saves the modified tiles that leave and loads those that enter.

- `x` (*number*) : World X coordinate (m).
- `y` (*number*) : World Y coordinate (m).

#### `util_surfaceMaskWheels.setDebug(enabled)`

Compatibility: true enables mode 2, false mode 0.

- `enabled` (*boolean*) : Enable full debugging.

#### `util_surfaceMaskWheels.setDebugMode(mode)`

Chooses the debug mode (0 none, 1 console, 2 window + 3D); the value is clamped to 0..2 and the first console line is emitted right away.

- `mode` (*integer|nil*) : Debug mode.

#### `util_surfaceMaskWheels.setDebugPageRadius(radius)`

Sets the radius (in pages) of the debug grid displayed around the vehicle (0 = current page only).

- `radius` (*integer|nil*) : Radius in pages, minimum 0.

#### `util_surfaceMaskWheels.setEnabled(enabled)`

Enables or disables wheel marking and resets the timer.

- `enabled` (*boolean*) : true to enable.

#### `util_surfaceMaskWheels.setMowerWidth(width)`

Sets the mower's cutting width.

- `width` (*number|nil*) : Width in meters; nil keeps the current value.

#### `util_surfaceMaskWheels.setMowingEnabled(enabled)`

Enables or disables mower mode (width 3.2 m, marking 1, grass particles).

- `enabled` (*boolean*) : true to enable.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | Extension loaded before: ui_imgui. |
| `enabled` | boolean | true when wheel marking is active (changed by setEnabled/toggle). |

## Calls into the engine (C++)

- `be:` `getPlayerVehicle`
- `debugDrawer:` `drawLineInstance`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/util/surfaceMaskWheels.lua`.*
