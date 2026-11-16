# `flowgraph_nodes_ui_showMonitor`

*File: `lua/ge/extensions/flowgraph/nodes/ui/showMonitor.lua` · VM: Game Engine (GE) · 35 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/ui/showMonitor")` (file under extensions/ but not a regular extension)

Flowgraph node "Show Monitor" (category once_instant, author BeamNG): enables the flowgraph monitor (small window) and hides the editor. Hidden inputs: "showStates" (States section), "showLog" (Log section).

## Notes

- workOnce calls dumpz(self.mgr.fgEditor, 1) before and after (debug traces).

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)).

| Method | Description | Line |
|---|---|---|
| `C:workOnce()` | Switches the editor to a small window (switchToSmallWindow) and forces the States/Log sections open. | 24 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/ui/showMonitor.lua`.*
