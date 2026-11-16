# `flowgraph_nodes_gameplay_decalSingle`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/decalSingle.lua` · VM: Game Engine (GE) · 62 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/decalSingle")` (file under extensions/ but not a regular extension)

Flowgraph node "Decal Single" (category repeat_instant, util/draw). Draws a single decal in the world. Input pins: pos, rot (quat), scl, decalPath (parkDecalStripes.png by default), clrA, clrB (colors, ping-pong alternation) and clrFrequency (2).

## Notes

- The color oscillates between clrA and clrB according to os.clockhp() * clrFrequency.
- work reads pinIn.clrA.value[i] without a check: crashes if the colors are nil (they have a hardcoded default value).

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:init()` | Empty. | 32 |
| `C:work()` | Computes the color, builds the decal and sends it to Engine.Render.DynamicDecalMgr.addDecals. | 44 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/decalSingle.lua`.*
