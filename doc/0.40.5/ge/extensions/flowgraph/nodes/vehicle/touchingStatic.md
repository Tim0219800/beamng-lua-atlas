# `flowgraph_nodes_vehicle_touchingStatic`

*File: `lua/ge/extensions/flowgraph/nodes/vehicle/touchingStatic.lua` · VM: Game Engine (GE) · 111 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/vehicle/touchingStatic")` (file under extensions/ but not a regular extension)

"Static Object Touch" node (category `repeat_instant`, tags collision/static). Detects an intersection of the vehicle with static objects or the terrain, using rays (`castRayStatic`) cast from the center toward 8 offset points (FL, F, FR, R, BR, B, BL, L) of the OOBB. Input pins: `vehId`, `widthOffset`, `lengthOffset`, `heightOffset` (default 0.5), `debugMode`. Outputs: `touching`, flow `touchFL/F/FR/R/BR/B/BL/L` (hidden), `isTouching`.

## Notes

- No input flow and no `flow` output: only the touch outputs.
- Debug: red (touched) or green spheres drawn in `onPreRender`.

## Class `C`

Flowgraph node class (returned by `_flowgraph_createNode(C)`). Definition fields: name, description, category, pinSchema, tags.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Creates the 8 points and the working vectors. | 42 |
| `C:_executionStopped()` | Frees the points and resets the outputs. | 47 |
| `C:init()` | Constructor; calls `reset`. | 38 |
| `C:onPreRender()` | Render hook: draws the debug spheres if `debugMode` is active. | 101 |
| `C:reset()` | Sets all outputs to false and disables the node. | 52 |
| `C:work()` | Computes the 8 points, casts the rays and fills the outputs. | 59 |

## Calls into the engine (C++)

- `debugDrawer:` `drawSphere`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/vehicle/touchingStatic.lua`.*
