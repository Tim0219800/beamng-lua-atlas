# `flowgraph_nodes_gameplay_careerActive`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/careerActive.lua` · VM: Game Engine (GE) · 38 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/careerActive")` (file under extensions/ but not a regular extension)

Flowgraph node "Career Active" (category repeat_instant). Tests whether career mode is active via career_career.isActive(). Outputs: enabled (flow if active), disabled (flow otherwise), active (hidden bool). Also sets flow to true.

## Notes

- Declares a dependency on gameplay_walk although it uses career_career (probable copy-paste).
- The output pin "flow" is not declared in pinSchema but work writes to it.

**Dependencies (loaded first):** `gameplay_walk`

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:drawMiddle(builder, style)` | Displays a check or cross icon. | 30 |
| `C:work(args)` | Fills enabled, disabled and active according to career_career.isActive(). | 23 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/careerActive.lua`.*
