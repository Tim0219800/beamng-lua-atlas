# `flowgraph_nodes_ui_onBigmapPoiSelected`

*File: `lua/ge/extensions/flowgraph/nodes/ui/onBigmapPoiSelected.lua` · VM: Game Engine (GE) · 64 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/ui/onBigmapPoiSelected")` (file under extensions/ but not a regular extension)

Flowgraph node "On Bigmap Poi" (category repeat_instant): detects the selection of a point of interest on the big map. Outputs: "selected" and "deselected" (pulses), "poiId" (string), "navigated" and "denavigated" (pulses), "pos" (navigated vec3). Fed by the hooks onPoiSelectedFromBigmap and onSetBigmapNavFocus.

## Notes

- Pulses last one frame: work() resets them to false then applies the received flags.

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)).

| Method | Description | Line |
|---|---|---|
| `C:init()` | Initializes the flags and the position. | 26 |
| `C:onPoiSelectedFromBigmap(poiId)` | Hook: POI selected (poiId) or nil if deselected. | 45 |
| `C:onSetBigmapNavFocus(pos)` | Hook: navigation to pos, or nil if cancelled. | 54 |
| `C:work(args)` | Resets the pulses to false, applies the flags recorded by the hooks then clears them and writes poiId and pos. | 31 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/ui/onBigmapPoiSelected.lua`.*
