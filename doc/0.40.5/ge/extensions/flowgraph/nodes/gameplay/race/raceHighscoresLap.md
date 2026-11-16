# `flowgraph_nodes_gameplay_race_raceHighscoresLap`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/race/raceHighscoresLap.lua` · VM: Game Engine (GE) · 111 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/race/raceHighscoresLap")` (file under extensions/ but not a regular extension)

Flowgraph node "Race Highscores" (category repeat_instant, tag scenario), "lap" variant. Identical to raceHighscoresComplete but records under the identifier missionTypeData.trackName (without the "mission-" prefix). Writes the time of the vehicle's last pass in core_highscores.setScenarioHighscoresCustom then stores {place, scores} in state.raceComepleteHighscores. Inputs: flow, raceData, vehId; output: flow.

## Notes

- Runs every frame as long as flow is active (print "Writing Highscores..." and repeated writing): give it flow only once.
- Requires self.mgr.activity.missionTypeData.trackName.
- The old pin 'clear' is redirected to 'reset' (legacyPins), but no reset pin is declared in the pinSchema of this file.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:init()` | Initializes self.markers to nil (not used afterwards). | 29 |
| `C:work()` | Copies flow and records the vehicle's highscore, then stores the result in its state. | 49 |

## Calls into the engine (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/race/raceHighscoresLap.lua`.*
