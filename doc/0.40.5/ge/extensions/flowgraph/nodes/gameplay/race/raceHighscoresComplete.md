# `flowgraph_nodes_gameplay_race_raceHighscoresComplete`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/race/raceHighscoresComplete.lua` · VM: Game Engine (GE) · 111 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/race/raceHighscoresComplete")` (file under extensions/ but not a regular extension)

Flowgraph node "Race Highscores" (category repeat_instant, tag scenario), "complete race" variant. Records the time of the vehicle's last pass (state.historicTimes[#...].endTime in ms) in core_highscores.setScenarioHighscoresCustom, with a record (license name, make, config name, config file, model), the level key, the identifier "mission-<trackName>" and a configuration key (standing/rolling, Reverse, number of laps). Then rereads the scores and places them in state.raceComepleteHighscores = {place, scores} (used by Race End Screen). Inputs: flow, raceData, vehId; output: flow.

## Notes

- Runs every frame as long as flow is active: it writes the highscores continuously (with a print "Writing Highscores..."). Give it flow only once.
- Requires self.mgr.activity.missionTypeData.trackName (so a graph launched as a mission).
- Same display name as raceHighscoresLap.lua; the difference is the identifier "mission-<trackName>" versus "<trackName>" alone.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:init()` | Initializes self.markers to nil (not used afterwards). | 29 |
| `C:work()` | Copies flow; on reset calls _executionStopped; otherwise records the highscore and stores the result in the vehicle's state. | 49 |

## Calls into the engine (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/race/raceHighscoresComplete.lua`.*
