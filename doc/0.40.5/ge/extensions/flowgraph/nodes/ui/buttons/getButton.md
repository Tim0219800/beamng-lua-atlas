# `flowgraph_nodes_ui_buttons_getButton`

*File: `lua/ge/extensions/flowgraph/nodes/ui/buttons/getButton.lua` · VM: Game Engine (GE) · 46 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/ui/buttons/getButton")` (file under extensions/ but not a regular extension)

Flowgraph node "Get Button" (once_instant category): reads the state of a button created with Create Button. Input "buttonId". Outputs: "clicked" (impulse on click), "used" / "unused" (already clicked or not, hidden; old names complete/incomplete), "label", "active", "order", "style" (hidden).

## Notes

- Bug: the 'unused' line reads self.pinOut.complete.value, but the pin is named 'used' in pinSchema (complete only exists in legacyPins); depending on how legacyPins are handled this can yield nil.
- Category once_instant: workOnce reads the state only once; to watch a click continuously, use Get Multiple Buttons or Simple Button instead.

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)).

| Method | Description | Line |
|---|---|---|
| `C:workOnce()` | Gets the button by id and copies clicked, used, unused, label, active, order, style to the output pins. | 30 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/ui/buttons/getButton.lua`.*
