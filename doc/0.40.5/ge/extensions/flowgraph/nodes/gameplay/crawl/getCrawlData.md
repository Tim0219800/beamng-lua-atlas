# `flowgraph_nodes_gameplay_crawl_getCrawlData`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/crawl/getCrawlData.lua` · VM: Game Engine (GE) · 112 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/crawl/getCrawlData")` (file under extensions/ but not a regular extension)

Flowgraph node "Get Crawl Data" (category repeat_instant, crawl). Reads the runtime data of the active crawl via the bridge. Outputs: onCompleted, onDisqualified, onCheckpointReached (flow on edge), isCompleted, disqualified, crawlerPosition (vec3), crawlerDirection (quat, yaw only), vehicleId, hasRecoveryCheckpoint, recoveryPosition, recoveryRotation. Without an active crawl: node error and null default values ({0,0,0}, {0,0,0,1}).

**Dependencies (loaded first):** `gameplay_crawl_flowgraphBridge`

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:init(mgr)` | Loads the bridge and initializes the last states (completed, disqualified, checkpoint index). | 31 |
| `C:work()` | Calls bridge.getCrawlRuntimeData and getLastRecoveryCheckpoint, detects state changes and fills the pins. | 38 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/crawl/getCrawlData.lua`.*
