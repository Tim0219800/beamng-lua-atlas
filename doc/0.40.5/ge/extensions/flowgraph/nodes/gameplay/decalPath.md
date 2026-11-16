# `flowgraph_nodes_gameplay_decalPath`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/decalPath.lua` · VM: Game Engine (GE) · 103 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/decalPath")` (file under extensions/ but not a regular extension)

Flowgraph node "Decal Path" (category repeat_instant, util/draw/route). Draws animated decals (groundmarker arrows) along a route from posA to posB. Input pins: posA, posB, speed (10), spacing (15), decalColor (hidden). The route is computed by gameplay/route/route.

## Notes

- The animation depends on os.clock() * speed % spacing.
- The first and last markers have a gradient alpha for fades.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Resets the decal pool. | 44 |
| `C:getNewDecal()` | Creates a decal (texture arrow_groundmarkers_1, scale 8x12x4, fade 400 to 500). | 30 |
| `C:increaseDecalPool(max)` | Grows the decal pool up to max. | 49 |
| `C:init()` | Empty. | 27 |
| `C:work()` | Computes the route, positions the spaced markers along the path and submits them to Engine.Render.DynamicDecalMgr.addDecals. | 58 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/decalPath.lua`.*
