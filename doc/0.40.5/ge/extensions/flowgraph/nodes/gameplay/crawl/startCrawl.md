# `flowgraph_nodes_gameplay_crawl_startCrawl`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/crawl/startCrawl.lua` · VM: Game Engine (GE) · 43 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/crawl/startCrawl")` (file under extensions/ but not a regular extension)

Flowgraph node "Start Crawl" (category once_instant, crawl). Starts the run and the crawl timer; requires Setup Crawl to have been executed (uses its trail and vehicle). Outputs: success, failed.

**Dependencies (loaded first):** `gameplay_crawl_flowgraphBridge`

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:init(mgr)` | Loads the crawl bridge. | 22 |
| `C:work()` | Calls bridge.startCrawl(nil, nil) and fills success/failed. | 26 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/crawl/startCrawl.lua`.*
