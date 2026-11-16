# `flowgraph_nodes_input_blacklistAction`

*File: `lua/ge/extensions/flowgraph/nodes/input/blacklistAction.lua` · VM: Game Engine (GE) · 301 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/input/blacklistAction")` (file under extensions/ but not a regular extension)

Flowgraph node "Set Input Actions" (once_instant, depends on core_input_actionFilter). Blocks or allows a list of input actions, as a scenario does. The list (self.list) is chosen in the properties (Empty/Scenario presets, search, categories). Pins: block (default true: blocks, otherwise allows), ignoreUnrestriced (ignores the node if "restrictScenarios" is disabled in the settings), input id (reuse an existing list) and output id (identifier of the list, to cancel it later).

**Dependencies (loaded first):** `core_input_actionFilter`

## Class `C`

Flowgraph node class (created via `_flowgraph_createNode(C)`).

| Method | Description | Line |
|---|---|---|
| `C:_onDeserialized(data)` | Restores the node's own settings from the saved data. | 264 |
| `C:_onSerialize(res)` | Adds the node's own settings to the `res` table when saving the graph. | 260 |
| `C:drawCustomProperties()` | Draws the action list editor (presets, add by search or category, current list). | 113 |
| `C:drawMiddle(builder, style)` | Displays the number of actions and renames the node to Block/Allow Input Actions if block is hard-coded. | 271 |
| `C:drawSearchInput()` | Draws the action search field and updates the results. | 60 |
| `C:highlightText(label, highlightText)` | Draws `label`, highlighting the occurrences of `highlightText`. | 87 |
| `C:init()` | Initializes the list with the Scenario preset and the search engine. | 31 |
| `C:workOnce()` | Registers the list in the flowgraph action module (registerList) if not already done, then calls blockActions(id) or allowActions(id). | 282 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/input/blacklistAction.lua`.*
