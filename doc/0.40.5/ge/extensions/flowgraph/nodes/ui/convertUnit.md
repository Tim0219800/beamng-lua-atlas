# `flowgraph_nodes_ui_convertUnit`

*File: `lua/ge/extensions/flowgraph/nodes/ui/convertUnit.lua` · VM: Game Engine (GE) · 37 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/ui/convertUnit")` (file under extensions/ but not a regular extension)

Flowgraph node "ConvertUnit" (category repeat_instant): converts an SI value to the player's preferred unit (UI setting) using translateDistance or translateVelocity. Inputs: "value", "velocity" (speed instead of distance), "big" (large unit: km, mi, h), "format" (default '%0.2f%s'). Outputs: "value" (converted number), "unit" (string) and "full" (formatted value+unit, computed only if the pin is used).

## Notes

- The input pin and the output pin are both named "value" (different directions).

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)).

| Method | Description | Line |
|---|---|---|
| `C:work()` | Converts pinIn.value and writes value, unit and (if the pin is connected) full via string.format. | 22 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/ui/convertUnit.lua`.*
