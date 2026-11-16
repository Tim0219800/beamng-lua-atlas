# `flowgraph_nodes_ui_imgui_elemental_imBegin`

*File: `lua/ge/extensions/flowgraph/nodes/ui/imgui/elemental/imBegin.lua` · VM: Game Engine (GE) · 83 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/ui/imgui/elemental/imBegin")` (file under extensions/ but not a regular extension)

Flowgraph node "im Begin" (category repeat_instant, tag imgui): opens an imgui window (to be ended with "im End"). Inputs: "title" (no title = title bar hidden), "width" (200), "height" (150), "posX", "posY" (100), "anchor" (TL, TR, BL, BR: reference corner of the window relative to the game window). Output "wasClosed" (pulse when the user closes the window).

## Notes

- Size and position are applied only once (done flag); afterwards the window can be freely moved.
- If anchor is nil, it equals 100 in the code (mistake: numeric value) and no position is applied.

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)).

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | done = false and outputs to false. | 33 |
| `C:init()` | done = false. | 27 |
| `C:work()` | Sets size/position (only once, via the anchor) then calls im.Begin and writes wasClosed. | 41 |

## Calls into the engine (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/ui/imgui/elemental/imBegin.lua`.*
