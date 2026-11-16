# `flowgraph_nodes_gameplay_crawl_getCrawlResults`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/crawl/getCrawlResults.lua` · VM: Game Engine (GE) · 65 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/crawl/getCrawlResults")` (file under extensions/ but not a regular extension)

Flowgraph node "Get Crawl Results" (category repeat_instant, crawl). Reads the results of a finished crawl (bridge.getCrawlEndData). Outputs: time, points (penalties), damage, recoveries, completed, disqualified, pathnodeTimings (table). If the data is missing: node error and values at 0, false or {}.

**Dependencies (loaded first):** `gameplay_crawl_flowgraphBridge`

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:init(mgr)` | Loads the crawl bridge. | 27 |
| `C:work()` | Copies the fields of getCrawlEndData to the output pins. | 31 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/crawl/getCrawlResults.lua`.*
