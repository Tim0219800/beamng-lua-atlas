# `flowgraph_nodes_gameplay_crawl_getDynamicObjects`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/crawl/getDynamicObjects.lua` · VM: Game Engine (GE) · 37 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/crawl/getDynamicObjects")` (file under extensions/ but not a regular extension)

Flowgraph node "Get Dynamic Objects" (category repeat_instant, crawl). Gets the objects of a prefab that have a given dynamic field. Input pins: prefabId (0 = nothing) and dynamicName ('crawlDynamic' by default). Output: dynamicObjects (table of ids) via bridge.getDynamicObjectsFromPrefab.

**Dependencies (loaded first):** `gameplay_crawl_flowgraphBridge`

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:init(mgr)` | Loads the crawl bridge. | 19 |
| `C:work()` | Returns {} if prefabId is nil or 0, otherwise the list provided by the bridge. | 23 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/crawl/getDynamicObjects.lua`.*
