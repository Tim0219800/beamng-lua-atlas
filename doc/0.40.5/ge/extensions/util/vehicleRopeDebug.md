# `util_vehicleRopeDebug`

*File: `lua/ge/extensions/util/vehicleRopeDebug.lua` · VM: Game Engine (GE) · 1200 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `util_vehicleRopeDebug`: `extensions.load("util_vehicleRopeDebug")`, then the global `util_vehicleRopeDebug`

ImGui debug tool "Rope Visual Sandbox" for the player vehicle's visual ropes (rope visuals). It lists the ropes of `be:getPlayerVehicle(0).ropeIds` (via `getRopeVisual`), draws their nodes and directions with `debugDrawer`, lets you hover and drag nodes with the mouse, edit the positions of anchors A and B, and displays performance statistics (simulation and render time per rope, spikes). Loaded manually from the console.

## Example

```lua
extensions.load('util_vehicleRopeDebug')
```

## Notes

- No function is called by the game except the onUpdate hook: all the work (statistics, mouse interaction, drawing, ImGui window) is done in M.onUpdate each frame.
- The window is open by default (windowOpen = true); the rope is selected automatically: the first one of the player vehicle.
- Dragging a node is done in the horizontal plane at the Z height of the grabbed node (rope:setDraggedNode, -1 to release).
- The performance statistics assume a 16.67 ms frame (60 FPS) and keep 60 frames of history; a spike = more than 2 times the average.

## Functions

| Function | Description | Line |
|---|---|---|
| `util_vehicleRopeDebug.onUpdate(dt)` | Per-frame update: updates the performance statistics, handles hovering and dragging of rope nodes with the mouse (if debugNodes is active), draws the nodes of the player vehicle's ropes, then builds the ImGui window "Rope Visual Sandbox". *(internal)* *(hook)* | 572 |

### Parameter details

#### `util_vehicleRopeDebug.onUpdate(dt)`

Per-frame update: updates the performance statistics, handles hovering and dragging of rope nodes with the mouse (if debugNodes is active), draws the nodes of the player vehicle's ropes, then builds the ImGui window "Rope Visual Sandbox".

- `dt` (*number*) : frame time step, in seconds (onUpdate hook)

## Calls into the engine (C++)

- `be:` `getPlayerVehicle`
- `debugDrawer:` `drawArrow`, `drawLineInstance`, `drawSphere`, `drawText`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/util/vehicleRopeDebug.lua`.*
