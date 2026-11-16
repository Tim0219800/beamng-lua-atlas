# `flowgraph_nodes_gameplay_crawl_resetCrawl`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/crawl/resetCrawl.lua` · VM: Game Engine (GE) · 40 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/crawl/resetCrawl")` (file under extensions/ but not a regular extension)

Flowgraph node "Reset Crawl" (category once_instant, crawl). Resets the active crawl: teleports the vehicle to the start and resets data and timers. The system stays active but the timer is stopped until Start Crawl. Outputs: success, failed, isActive.

**Dependencies (loaded first):** `gameplay_crawl_flowgraphBridge`

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:init(mgr)` | Loads the crawl bridge. | 23 |
| `C:work()` | Calls bridge.resetCrawl(). Success: isActive true; failure: isActive = bridge.isCrawlActive(). | 27 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/crawl/resetCrawl.lua`.*
