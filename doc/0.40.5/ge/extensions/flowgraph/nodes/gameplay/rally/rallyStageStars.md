# `flowgraph_nodes_gameplay_rally_rallyStageStars`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageStars.lua` · VM: Game Engine (GE) · 44 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/rally/rallyStageStars")` (file under extensions/ but not a regular extension)

Flowgraph node "Rally Stage Stars" (category once_instant, tags rally, mission, stars). Awards the bronze/silver/gold medals of an attempt by comparing its time (attempt.data.time) to the mission thresholds (missionTypeData.goldTime, silverTime, bronzeTime): attempt.unlockedStars.<threshold> = time <= threshold. Nothing is evaluated if the attempt is abandoned (dnf) or has no positive time. Input and output: attempt ('attemptData' table).

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:workOnce()` | If the flow is active, updates the attempt's unlockedStars and returns it in the attempt output pin. | 20 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageStars.lua`.*
