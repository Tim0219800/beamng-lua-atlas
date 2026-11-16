# `flowgraph_nodes_ui_imgui_imDialogue`

*File: `lua/ge/extensions/flowgraph/nodes/ui/imgui/imDialogue.lua` · VM: Game Engine (GE) · 159 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/ui/imgui/imDialogue")` (file under extensions/ but not a regular extension)

Flowgraph node "im Dialogue" (category repeat_instant, singleActive, tag imgui): imgui window with title, description and buttons. Inputs: "title", "description"; for each option (editable list, default accept / decline) a string input pin (label) and a flow output pin set to true on click. Word wrap width: data.wrapSize (500).

## Notes

- Bug: work() calls self:closeDialogue() and self:closed(), which are not defined in this file (error on first click if the base class does not provide them).
- Showing two of these at the same time will break everything (todo from the code).
- updateButtons: all output links are put in flowLinks, and strLinks stays empty (input links are not recreated correctly).

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)).

| Method | Description | Line |
|---|---|---|
| `C:_executionStopped()` | Calls onNodeReset. | 127 |
| `C:_onDeserialized(nodeData)` | Restores options. | 122 |
| `C:_onSerialize(res)` | Saves options. | 118 |
| `C:drawCustomProperties()` | Button list editing. | 35 |
| `C:init()` | Default options {accept, decline}, wrapSize = 500. | 26 |
| `C:onNodeReset()` | Closes the window (open = false). | 135 |
| `C:postInit()` | Creates the option pins. | 31 |
| `C:updateButtons()` | Recreates the option pins. | 72 |
| `C:work()` | If open, draws the window, the text and the buttons. | 139 |
| `C:workOnce()` | Opens the window (open = true). | 131 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/ui/imgui/imDialogue.lua`.*
