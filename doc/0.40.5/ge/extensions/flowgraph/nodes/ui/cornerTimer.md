# `flowgraph_nodes_ui_cornerTimer`

*File: `lua/ge/extensions/flowgraph/nodes/ui/cornerTimer.lua` · VM: Game Engine (GE) · 65 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/ui/cornerTimer")` (file under extensions/ but not a regular extension)

Flowgraph node "Set UI Timer" (category repeat_instant, author BeamNG, duration): displays a time in the stopwatch UI app. Inputs: "value" (seconds; if not connected, clears), "color" (white/red/green/blue; empty = white), "useGenericMissionDataApp" (uses the Generic Mission Data app instead of the corner timer). Hooks used: 'raceTime' and 'ScenarioResetTimer'; or ui_apps_genericMissionData.setData.

## Notes

- In Generic Mission Data mode, the time is formatted MM:SS (no milliseconds) with category 'cornerTimer_virtual' and order 100.
- In legacy timer mode, 'time' is sent in seconds and the color as 'timeColor'.

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)).

| Method | Description | Line |
|---|---|---|
| `C:postInit()` | Defines the templates of the color pin (white, red, green, blue). | 24 |
| `C:work()` | Sends the time to the UI (Generic Mission Data app or 'raceTime' hook), or clears the display if 'value' is nil. | 33 |

**UI events (guihooks.trigger):** `ScenarioResetTimer`, `raceTime`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/ui/cornerTimer.lua`.*
