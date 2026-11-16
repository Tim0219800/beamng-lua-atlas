# `flowgraph_nodes_mission_selectHeistMissionSpots`

*File: `lua/ge/extensions/flowgraph/nodes/mission/selectHeistMissionSpots.lua` · VM: Game Engine (GE) · 168 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/mission/selectHeistMissionSpots")` (file under extensions/ but not a regular extension)

Flowgraph node 'Select Heist Spots' (once_p_duration category, author BeamNG). Picks, among the spots of sitesData.parkingSpots whose first tag contains 'start', 'hiest' (sic) or 'escape', a start point, a heist point and an escape point with distance constraints: start less than 400 m from 'position', heist at least 250 m from the start, escape at least 300 m from the heist. State machine (state 1 to 6), outputs start, hiest, escape, their zones (startLocation, hiestLocation, escapeLocation), flow and impulse loaded.

## Notes

- The word 'hiest' (for heist) is used in pin and variable names.
- The reset input pin contains the typo 'hindexStart den = true' (unfortunate replacement of 'hidden'): the key 'hindexStartden' has no effect.
- State 4: the new escape is taken from self.names[self.indexStart] (list of all spots) and not from escapeLoc, which is inconsistent with states 2 and 3.
- States 2 to 4 call dump(...) every frame (console traces).
- Crashes if a list (start, hiest, escape) is empty.

## Class `C`

Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Calls resetData. | 56 |
| `C:init()` | Initializes the location lists and the outputs. | 36 |
| `C:resetData()` | Resets the lists, the state machine and the outputs to zero. | 60 |
| `C:work()` | On reset: resetData. If flow, advances the state machine: 1 sorts the spots by tag and shuffles, 2 validates the start, 3 validates the heist location, 4 validates the escape, 5 writes the zones and loaded=true, 6 loaded=false. | 80 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/mission/selectHeistMissionSpots.lua`.*
