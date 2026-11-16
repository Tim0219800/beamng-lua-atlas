# `flowgraph_nodes_career_onGarageEvent`

*File: `lua/ge/extensions/flowgraph/nodes/career/onGarageEvent.lua` · VM: Game Engine (GE) · 48 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/career/onGarageEvent")` (file under extensions/ but not a regular extension)

Flowgraph node "On Garage Event" (category repeat_instant, ui color/icon). One-frame impulses on career garage events: beforeGarageInventoryOpened (selection menu before garage opened), beforeGarageVehicleSelected (vehicle chosen), endMode (garage mode ended).

## Notes

- work() sets back to false only the first two outputs; endMode is never explicitly set back to false (it stays at the last written value, true after an event), probably an oversight.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:init()` | Creates the flag table. | 22 |
| `C:onBeforeGarageVehicleSelected(data)` | Hook: raises beforeGarageVehicleSelected. | 39 |
| `C:onBeforeGarageVehicleSelectionMenuOpened(data)` | Hook: raises beforeGarageInventoryOpened. | 35 |
| `C:onEndGarageMode(data)` | Hook: raises endMode. | 43 |
| `C:work(args)` | Every frame: sets two outputs back to false, applies then clears the flags. | 26 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/career/onGarageEvent.lua`.*
