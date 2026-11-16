# `flowgraph_nodes_gameplay_crawl_setupCrawl`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/crawl/setupCrawl.lua` · VM: Game Engine (GE) · 99 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/crawl/setupCrawl")` (file under extensions/ but not a regular extension)

Flowgraph node "Setup Crawl" (category once_instant, crawl). Prepares a crawl course: loads the trail, teleports the vehicle to the start and loads the prefabs, without starting the timer (use Start Crawl). Input pins: trailId (trail path) and vehicleId (0 = player vehicle). Outputs: success, failed, isSetup.

## Notes

- If trailId is empty: looks for the flowgraph variable "trailFile", then the first *.trail.json in the mission folder (mgr.activity.missionFolder).
- Writes a lot of logs (tag SetupCrawl).

**Dependencies (loaded first):** `gameplay_crawl_flowgraphBridge`

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:init(mgr)` | Loads the crawl bridge. | 25 |
| `C:work()` | Resolves the trail, calls bridge.loadCrawlTrail then bridge.setupCrawl(vehicleId, trail) and fills the outputs. | 29 |

## Calls into the engine (C++)

- `FS:` `findFiles`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/crawl/setupCrawl.lua`.*
