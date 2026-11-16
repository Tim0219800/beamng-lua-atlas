# `flowgraph_nodes_ui_contextTranslation`

*File: `lua/ge/extensions/flowgraph/nodes/ui/contextTranslation.lua` · VM: Game Engine (GE) · 105 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/ui/contextTranslation")` (file under extensions/ but not a regular extension)

Flowgraph node "Context Translation" (category repeat_instant): creates a translation object with context. Input "translationString" (translation key, fixed pin) plus custom input pins (all types except flow): each becomes a context variable. Output "value" (table of type translationObject): {txt = key, context = {name = value}}. The "Load Variables" button in the properties creates a string pin for each {{name}} variable found in the translation.

## Notes

- The translation key is resolved with _tr() to find the {{%a+}} variables (letters only).
- drawCustomProperties calls dump('string: ...') on every load (debug trace).
- The custom pins are saved (savePins = true).

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)).

| Method | Description | Line |
|---|---|---|
| `C:drawCustomProperties()` | Displays the variable loading state (red/green/white icon) and the "Load Variables" button that recreates the context pins. | 51 |
| `C:init()` | Enables savePins and allowCustomInPins; creates the reused output table {context = {}}. | 33 |
| `C:work()` | Fills txt and context (value of each custom pin) in the reused output table and writes it to "value". | 39 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/ui/contextTranslation.lua`.*
