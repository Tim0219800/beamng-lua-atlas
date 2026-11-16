# `flowgraph_nodes_gameplay_crawl_stopCrawl`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/crawl/stopCrawl.lua` · VM: Game Engine (GE) · 40 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/crawl/stopCrawl")` (file under extensions/ but not a regular extension)

Flowgraph node "Stop Crawl" (category once_instant, crawl). Stops the active crawl. Outputs: success, failed (no active crawl) and isActive (always false).

**Dependencies (loaded first):** `gameplay_crawl_flowgraphBridge`

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:init(mgr)` | Loads the crawl bridge. | 23 |
| `C:work()` | Calls bridge.stopCrawl() and fills success/failed; isActive = false. | 27 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/crawl/stopCrawl.lua`.*
