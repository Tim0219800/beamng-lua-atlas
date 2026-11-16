# `gameplay_drag_dragTypes_headsUpRace`

*File: `lua/ge/extensions/gameplay/drag/dragTypes/headsUpRace.lua` · VM: Game Engine (GE) · 174 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_drag_dragTypes_headsUpRace`: `extensions.load("gameplay_drag_dragTypes_headsUpRace")`, then the global `gameplay_drag_dragTypes_headsUpRace`

"Heads-up" race type: simultaneous start with no handicap, the best time of the important timer wins. Loaded by gameplay_drag_core when dragType is 'headsUpRace'. Every frame, onUpdate advances each local racer (updateRacer then the phaseHandlers phase function: stage, countdown, race, stop, emergencyStop) and triggers the group phase changes according to the mode (solo, MP host, MP client). startActivity sets all dials to 0.

## Notes

- Ranking (generateWinData): sorted by ascending time of the important timer (getImportantTimerValueForWin); the disqualified come last (players first, then lane, then vehId).
- Unlike bracketRace, startActivity forces dial = 0 for everyone: no start offset.
- Remote racers in MP (isLocalRacer == false) are not simulated locally; in MP the transition from staging to countdown is handled by the host (checkTimerDrift) via the network.
- A phase whose name matches no phaseHandlers function produces a log error and is ignored.
- The activity ends (dragData.isCompleted = true) when all local racers are finished.

**Dependencies (loaded first):** `gameplay_drag_core`, `gameplay_drag_phaseHandlers`

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_drag_dragTypes_headsUpRace.generateWinData(dragData)` | Builds the ranked list of results: each entry contains vehId, lane, time, isPlayable, disqualified. The smallest time wins, the disqualified come last. | 134 |
| `gameplay_drag_dragTypes_headsUpRace.onExtensionLoaded()` | Load hook: retrieves the references to core and phaseHandlers and resets the activity. *(internal)* *(hook)* | 36 |
| `gameplay_drag_dragTypes_headsUpRace.onUpdate(dtReal, dtSim, dtRaw)` | Per-frame hook, active only when the activity is started: simulates the local racers, calls the function of their phase, changes phase when it is completed (without dependency), marks the race as finished and handles the grouped phase advancement according to solo/host/client. *(internal)* *(hook)* | 61 |
| `gameplay_drag_dragTypes_headsUpRace.resetDragRace()` | Stops the activity (hasActivityStarted = false). | 42 |
| `gameplay_drag_dragTypes_headsUpRace.startActivity()` | Starts the activity: dragData.isStarted = true and sets a dial delay of 0 for each racer (phaseHandlers.setDialsData). Called by core.startDragRaceActivity. | 46 |

### Parameter details

#### `gameplay_drag_dragTypes_headsUpRace.generateWinData(dragData)`

Builds the ranked list of results: each entry contains vehId, lane, time, isPlayable, disqualified. The smallest time wins, the disqualified come last.

- `dragData` (*table*) : Race data with racers.
- **returns**: table[] List of results, {} if no racers.

#### `gameplay_drag_dragTypes_headsUpRace.onUpdate(dtReal, dtSim, dtRaw)`

Per-frame hook, active only when the activity is started: simulates the local racers, calls the function of their phase, changes phase when it is completed (without dependency), marks the race as finished and handles the grouped phase advancement according to solo/host/client.

- `dtReal` (*number*) : Real time delta (s).
- `dtSim` (*number*) : Simulated time delta (s).
- `dtRaw` (*number*) : Raw delta (s).

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | gameplay_drag_core, gameplay_drag_phaseHandlers. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/drag/dragTypes/headsUpRace.lua`.*
