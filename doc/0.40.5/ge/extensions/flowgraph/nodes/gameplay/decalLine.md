# `flowgraph_nodes_gameplay_decalLine`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/decalLine.lua` · VM: Game Engine (GE) · 127 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/decalLine")` (file under extensions/ but not a regular extension)

Flowgraph node "Decal Line" (category repeat_instant, util/draw). Draws a line of decals from point posA to point posB, like a loading bar. Input pins: posA, posB, decalScale, amount (32), inverted, decalPath, filling1, filling2 (0 to 100), and four colors (filledColor, fillingColor1, fillingColor2, backgroundColor). Submits the decals to Engine.Render.DynamicDecalMgr.addDecals.

## Notes

- data.snapToTerrain = false is defined but unused in this file.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Resets the decal pool and the color caches. | 59 |
| `C:init()` | Sets data.snapToTerrain = false. | 41 |
| `C:work()` | Places the decals by interpolation between posA and posB, chooses their color according to filling1/filling2 and submits them to the renderer. | 75 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/decalLine.lua`.*
