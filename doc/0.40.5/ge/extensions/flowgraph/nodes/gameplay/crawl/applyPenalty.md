# `flowgraph_nodes_gameplay_crawl_applyPenalty`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/crawl/applyPenalty.lua` · VM: Game Engine (GE) · 50 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/crawl/applyPenalty")` (file under extensions/ but not a regular extension)

Flowgraph node "Apply Penalty" (category impulse, crawl). Manually applies penalty points to the active crawl, choosing a type from the bridge list (gameplay/crawl/flowgraphBridge). Input pins: flow (pulse) and penaltyType (string).

## Notes

- work writes self.pinOut.success and failed, but pinSchema declares no output pin: these accesses crash if penaltyType is empty.
- If penaltyType is valid, the result of bridge.applyPenalty is not exposed.

**Dependencies (loaded first):** `gameplay_crawl_flowgraphBridge`

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:init(mgr)` | Loads the crawl bridge. | 22 |
| `C:postInit()` | Fills the templates of the penaltyType pin with bridge.getPenaltyTypes(). | 26 |
| `C:work()` | Calls bridge.applyPenalty(penaltyType) if the type is set. | 35 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/crawl/applyPenalty.lua`.*
