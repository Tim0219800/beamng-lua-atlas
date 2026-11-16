# `flowgraph_nodes_gameplay_race_pathDefaultStartTransform`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/race/pathDefaultStartTransform.lua` · VM: Game Engine (GE) · 76 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/race/pathDefaultStartTransform")` (file under extensions/ but not a regular extension)

Flowgraph node "Race Start Transform" (category repeat_instant, tags scenario and race). Gives the transform of a start position of a pathData, useful for creating custom triggers. Inputs: pathData and name (string or number: name or id of the position; default = defaultStartPosition). Outputs: existing, pos (position shifted backward by half of startBoxLength and raised by half of startBoxHeight, hence the center of the start box), origPos (original position), rot (quat), scl ({width, length, height}). Computed only once (as long as self.path is nil).

## Notes

- Data options: startBoxWidth = 2, startBoxLength = 5, startBoxHeight = 1.5, useStringMatch = false (if true, the first position whose name contains the given string is used).
- If the position is absent or 'missing', existing is false and the other outputs are not updated.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:_executionStopped()` | Forgets the stored path. | 36 |
| `C:init(mgr, ...)` | Initializes self.path, disables clearOutPinsOnStart and sets the start box options. | 27 |
| `C:work(args)` | Looks for the start position and computes pos, origPos, rot, scl and existing. | 40 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/race/pathDefaultStartTransform.lua`.*
