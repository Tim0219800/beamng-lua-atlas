# `flowgraph_nodes_gameplay_crawl_getCrawlStartTransform`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/crawl/getCrawlStartTransform.lua` · VM: Game Engine (GE) · 48 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/crawl/getCrawlStartTransform")` (file under extensions/ but not a regular extension)

Flowgraph node "Get Crawl Start Transform" (category repeat_instant, crawl). Gives the start position (startPosition, vec3) and rotation (startRotation, quat) of the active crawl via bridge.getCrawlSpawnTransform. Without an active crawl: node error and values {0,0,0} and {0,0,0,1}.

**Dependencies (loaded first):** `gameplay_crawl_flowgraphBridge`

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:init(mgr)` | Loads the crawl bridge. | 22 |
| `C:work()` | Reads the spawn transform and converts it to tables. | 26 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/crawl/getCrawlStartTransform.lua`.*
