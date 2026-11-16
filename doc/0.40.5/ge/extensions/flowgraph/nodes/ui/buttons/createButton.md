# `flowgraph_nodes_ui_buttons_createButton`

*File: `lua/ge/extensions/flowgraph/nodes/ui/buttons/createButton.lua` · VM: Game Engine (GE) · 33 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/ui/buttons/createButton")` (file under extensions/ but not a regular extension)

Flowgraph node "Create Button" (once_instant category): creates a button in the flowgraph 'button' module (self.mgr.modules.button:addButton) and outputs its identifier. Inputs: "label" (default 'Button'), "active" (hidden, true), "order" (hidden, empty = automatic order), "style" (hidden, 'default'). Output "buttonId" (number) to use with Get Button, Set Button Property, etc.

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)).

| Method | Description | Line |
|---|---|---|
| `C:postInit()` | Defines the value template of the style pin (only 'default'). | 20 |
| `C:workOnce()` | Creates the button with label/active/order/style and writes its id to "buttonId". | 24 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/ui/buttons/createButton.lua`.*
