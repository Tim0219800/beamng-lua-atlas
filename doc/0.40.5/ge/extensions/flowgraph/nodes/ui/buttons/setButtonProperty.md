# `flowgraph_nodes_ui_buttons_setButtonProperty`

*File: `lua/ge/extensions/flowgraph/nodes/ui/buttons/setButtonProperty.lua` · VM: Game Engine (GE) · 37 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/ui/buttons/setButtonProperty")` (file under extensions/ but not a regular extension)

Flowgraph node "Set Button Property" (category repeat_instant): modifies the properties of an existing button. Inputs: "buttonId", "label", "active", "order", "style". Only the properties whose pin has a non-nil value are applied (module button:set).

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)).

| Method | Description | Line |
|---|---|---|
| `C:postInit()` | Defines the value template of the style pin. | 19 |
| `C:work()` | If the button exists, applies active/order/style/label whose pins are not nil. | 24 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/ui/buttons/setButtonProperty.lua`.*
