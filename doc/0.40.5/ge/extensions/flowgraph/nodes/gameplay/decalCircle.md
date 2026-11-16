# `flowgraph_nodes_gameplay_decalCircle`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/decalCircle.lua` · VM: Game Engine (GE) · 132 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/decalCircle")` (file under extensions/ but not a regular extension)

Flowgraph node "Decal Circle" (category repeat_instant, util/draw). Draws a circle of decals on the ground, like a radial loading bar. Input pins: pos (center), radius, decalScale ({1,1,3}), amount (32 decals), inverted, decalPath, filling1 (0 to 100, progress), filling2 (0 to 100, refill), colors filledColor, fillingColor1, fillingColor2, backgroundColor. Sends the decals to Engine.Render.DynamicDecalMgr.addDecals every frame.

## Notes

- data.snapToTerrain = true is defined but unused in this file.
- The decals have fadeStart 200 and fadeEnd 250.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Resets the decal pool and the color caches. | 59 |
| `C:init()` | Sets data.snapToTerrain = true. | 41 |
| `C:work()` | Updates the color caches, computes the position, direction, color and scale of each decal on the circle and submits them to the renderer. | 74 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/decalCircle.lua`.*
