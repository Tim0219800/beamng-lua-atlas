# `flowgraph_nodes_input_blacklistActionFilter`

*File: `lua/ge/extensions/flowgraph/nodes/input/blacklistActionFilter.lua` · VM: Game Engine (GE) · 100 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/input/blacklistActionFilter")` (file under extensions/ but not a regular extension)

Flowgraph node "Set Input Actions by Filters" (once_instant, depends on core_input_actionFilter; recommended for missions). Like "Set Input Actions" but the list is built from action templates (core_input_actionFilter.getActionTemplates) ticked in the properties; default: vehicleTeleporting, vehicleMenues, physicsControls, aiControls, vehicleSwitching, freeCam, funStuff, walkingMode. Pins: block, ignoreUnrestriced, id (input and output).

**Dependencies (loaded first):** `core_input_actionFilter`

## Class `C`

Flowgraph node class (created via `_flowgraph_createNode(C)`).

| Method | Description | Line |
|---|---|---|
| `C:_onDeserialized(data)` | Restores the node's own settings from the saved data. | 58 |
| `C:_onSerialize(res)` | Adds the node's own settings to the `res` table when saving the graph. | 54 |
| `C:drawCustomProperties()` | Draws one checkbox per action template, with the number of actions in a tooltip. | 32 |
| `C:drawMiddle(builder, style)` | Renames the node to Block/Allow Input Actions by Filters if block is hard-coded. | 65 |
| `C:init()` | Enables the default templates. | 25 |
| `C:workOnce()` | Creates the list via core_input_actionFilter.createActionTemplate(active templates), registers it then blocks or allows the actions. | 74 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/input/blacklistActionFilter.lua`.*
