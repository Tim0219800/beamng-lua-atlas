# `util_windDebug`

*File: `lua/ge/extensions/util/windDebug.lua` · VM: Game Engine (GE) · 70 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `util_windDebug`: `extensions.load("util_windDebug")`, then the global `util_windDebug`

Visualizes the shared wind field: samples `be:getWindAt()` on a 21 x 21 grid of points spaced 5 m apart centered on the camera, and draws one arrow per point (direction = wind, length and color = speed, from blue to red at 20 m/s). Text in the center shows the wind speed in m/s and km/h. Gusts are animated because the field varies over time.

## Example

```lua
extensions.load('util_windDebug'); util_windDebug.toggle()
```

## Notes

- Disabled by default (enabled = false); draws only if enabled is true.
- The arrows are placed 1 m above the terrain (core_terrain.getTerrainHeight) or 2 m below the camera if the terrain is not available.
- Cells where the wind is below 0.05 m/s are not drawn. Arrow length: 0.15 m per m/s, capped at 4.5 m.

## Functions

| Function | Description | Line |
|---|---|---|
| `util_windDebug.onPreRender(dtReal, dtSim)` | Pre-render hook: if enabled, draws the grid of wind arrows around the camera and the speed text in the center. *(internal)* *(hook)* | 43 |
| `util_windDebug.setEnabled(v)` | Enables or disables the display. | 66 |
| `util_windDebug.toggle()` | Toggles the display state. | 67 |

### Parameter details

#### `util_windDebug.onPreRender(dtReal, dtSim)`

Pre-render hook: if enabled, draws the grid of wind arrows around the camera and the speed text in the center.

- `dtReal` (*number*) : real time elapsed, in seconds
- `dtSim` (*number*) : simulated time elapsed, in seconds

#### `util_windDebug.setEnabled(v)`

Enables or disables the display.

- `v` (*any*) : any value; converted to a boolean (true if truthy)

## Fields

| Field | Type | Description |
|---|---|---|
| `enabled` | boolean | True when the wind visualization is active. |

## Calls into the engine (C++)

- `be:` `getWindAt`
- `debugDrawer:` `drawLineInstance`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/util/windDebug.lua`.*
