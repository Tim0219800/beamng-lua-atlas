# `flowgraph_nodes_ui_customUiLayout`

*File: `lua/ge/extensions/flowgraph/nodes/ui/customUiLayout.lua` · VM: Game Engine (GE) · 96 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/ui/customUiLayout")` (file under extensions/ but not a regular extension)

Flowgraph node "Custom UI Layout" (category provider): stores a UI apps layout in the node for reuse. Output "layout" (table layoutData: {apps, layoutName = 'procedural Layout <id>'}) to connect to Set UI Layout. Properties: Capture (reads the current layout via 'getCurrentLayoutToLua'), Clear, Load Stored Layout, Load Freeroam layout.

## Notes

- The "Copy Layout from..." list is empty (layouts = {} , call to ui_apps.getLayouts commented out).
- setLayout is called by the UI via getCmd(), which returns a function name without parentheses (command that receives the data from the UI).

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)).

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Writes {apps = storedLayout, layoutName = ...} to "layout". | 25 |
| `C:_onDeserialized(data)` | Restores storedLayout. | 90 |
| `C:_onSerialize(res)` | Saves storedLayout. | 86 |
| `C:drawCustomProperties()` | Capture, Clear, Load Stored Layout, Load Freeroam layout buttons and copy list. | 30 |
| `C:getCmd(action)` | Returns the string of this node's Lua callback function (setLayout). | 82 |
| `C:init()` | Empty. | 21 |
| `C:setLayout(data)` | Receives the layout captured by the UI and stores data.apps in storedLayout. | 77 |
| `C:uniqueId()` | Returns "<idManager>_<nodeId>", used to name the temporary game state. | 29 |

**UI events (guihooks.trigger):** `getCurrentLayoutToLua`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/ui/customUiLayout.lua`.*
