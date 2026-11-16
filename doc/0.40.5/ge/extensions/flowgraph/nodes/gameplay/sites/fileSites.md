# `flowgraph_nodes_gameplay_sites_fileSites`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/sites/fileSites.lua` · VM: Game Engine (GE) · 75 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/sites/fileSites")` (file under extensions/ but not a regular extension)

Flowgraph node "File Sites" (category once_p_duration, tags scenario). Loads a .sites.json file via gameplay_sites_sitesManager.loadSites and finalizes it. Input pin: file; output pin: sitesData (table of type sitesData) to connect to the Sites nodes (location, zone, parking spot...). The editor offers to open the Sites Editor and to hardcode the currently opened file. On failure, node error "Failed to find sites file".

**Dependencies (loaded first):** `gameplay_sites_sitesManager`

## Class `C`

Flowgraph node class (created via `_flowgraph_createNode(C)`).

| Method | Description | Line |
|---|---|---|
| `C:_executionStopped()` | Called when the flowgraph project execution stops; releases the internal state. | 55 |
| `C:drawCustomProperties()` | Draws the node's custom properties in the flowgraph editor panel (ImGui). | 33 |
| `C:init(mgr, ...)` | Initializes the node's internal state at creation (called by the flowgraph engine). | 22 |
| `C:onNodeReset()` | Forgets the loaded sites to force a new load. | 51 |
| `C:postInit()` | Called after the node's pins are created; used to adjust the pins (value templates, file filters, dynamic keys). | 27 |
| `C:work(args)` | On the first call, resolves the path (with or without .sites.json extension), loads and finalizes the sites, then publishes the table on sitesData. Subsequent calls do nothing as long as self.sites is set. | 59 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/sites/fileSites.lua`.*
