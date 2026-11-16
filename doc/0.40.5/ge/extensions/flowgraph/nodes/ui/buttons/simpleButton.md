# `flowgraph_nodes_ui_buttons_simpleButton`

*File: `lua/ge/extensions/flowgraph/nodes/ui/buttons/simpleButton.lua` · VM: Game Engine (GE) · 82 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/ui/buttons/simpleButton")` (file under extensions/ but not a regular extension)

Flowgraph node "Simple Button" (category once_instant): creates an all-in-one button whose values can no longer be changed. Inputs: "hideWhenDone" (disables the button after the first click), "label", "order" (hidden), "style" (hidden). Outputs: "clicked" (pulse), "used" / "unused" (hidden), "buttonId" (hidden).

## Notes

- Bug: workOnce reads self.pinIn.active while the 'active' pin does not exist in pinSchema (nil -> index error); and the key passed to addButton is 'stlye' (typo), so the style is not passed.
- Bug: work() uses button.used.value for hideWhenDone while the other lines use button.complete.
- There are two definitions of C:workOnce; the second (empty) replaces the first.
- On reset, the button is disabled, then re-enabled at the next work().

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)).

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Resets hiddenAfterDone and hiddenAfterReset to false. | 30 |
| `C:onNodeReset()` | Disables the button (active=false) once and resets hiddenAfterDone to false. | 39 |
| `C:postInit()` | Defines the value template of the style pin. | 35 |
| `C:work()` | Re-enables the button after a reset, updates clicked/used/unused and disables it if hideWhenDone is set and it was already clicked. | 63 |
| `C:workOnce()` | Creates the button and writes its id (see notes: bugs). | 50 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/ui/buttons/simpleButton.lua`.*
