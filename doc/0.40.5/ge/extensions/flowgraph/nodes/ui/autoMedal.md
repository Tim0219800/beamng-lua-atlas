# `flowgraph_nodes_ui_autoMedal`

*File: `lua/ge/extensions/flowgraph/nodes/ui/autoMedal.lua` · VM: Game Engine (GE) · 77 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/ui/autoMedal")` (file under extensions/ but not a regular extension)

Flowgraph node "Medal" (repeat_instant category, UI): determines the medal from a score. Inputs: "points", thresholds "bronze" (50), "silver" (85), "gold" (100), "platinium" (125), "ascending" (hidden, true: more points = better; otherwise smaller = better) and texts "woodText/bronzeText/silverText/goldText". Outputs: "medal" (wood/bronze/silver/gold/platinium), booleans bronze/silver/gold/platinium (hidden), "text", "nextScore", "nextMedal", "passed", "completed", "failed". To be connected to End Screen.

## Notes

- The medal name is 'platinium' (misspelling in the code, used for the pins).
- There is no "platiniumText" pin: for the platinium medal, the output text stays that of the last medal reached with text (pinIn['platiniumText'] is nil).
- 'completed' = platinium medal; 'passed' = bronze, silver, gold or platinium; 'failed' = not passed.
- Without 'points', the medal output is nil and nothing else is computed.

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)).

| Method | Description | Line |
|---|---|---|
| `C:work()` | Sets the output flow to true, compares 'points' to the thresholds (>= or <= depending on 'ascending'), then fills medal, the booleans, text, nextMedal/nextScore, passed, completed and failed. | 42 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/ui/autoMedal.lua`.*
