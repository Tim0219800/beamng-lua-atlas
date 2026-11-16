# `gameplay_drag_dragTypes_bracketRace`

*File: `lua/ge/extensions/gameplay/drag/dragTypes/bracketRace.lua` · VM: Game Engine (GE) · 188 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_drag_dragTypes_bracketRace`: `extensions.load("gameplay_drag_dragTypes_bracketRace")`, then the global `gameplay_drag_dragTypes_bracketRace`

"Bracket race" race type: each driver announces a dial (target time) and wins by getting close to it without beating it. Loaded by gameplay_drag_core when dragType is 'bracketRace'. Every frame, onUpdate advances each local racer (updateRacer then the phaseHandlers phase function named like the phase: stage, countdown, race, stop, emergencyStop), then triggers the group phase changes according to the mode (solo, MP host, MP client). startActivity sets the start delays from the dials (setDialsData).

## Notes

- Ranking (generateWinData): first those who finished slower than their dial (dialDiff >= 0, from smallest to largest gap), then those who did better than their dial ("breakout", dialDiff < 0, from smallest absolute gap), then the disqualified or those without a dial.
- A dial <= 0 is considered unset (case of an MP driver who arrived late): dialNotSet = true, dialDiff = 0, ranked with the disqualified.
- Remote racers in MP (isLocalRacer == false) are not simulated locally; MP clients wait for the host's broadcast for phase transitions.
- A phase whose name matches no phaseHandlers function produces a log error and is ignored.
- The activity ends (dragData.isCompleted = true) when all local racers are finished.
- Other modules only call startActivity, resetDragRace and generateWinData (via core.getExtension).

**Dependencies (loaded first):** `gameplay_drag_core`, `gameplay_drag_phaseHandlers`

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_drag_dragTypes_bracketRace.generateWinData(dragData)` | Builds the ranked list of results: each entry contains vehId, lane, time (important timer), dialDiff, dialNotSet, isPlayable, disqualified. Order: positive gaps ascending, then breakouts (absolute gap ascending), then disqualified/no dial (players first, then lane, then vehId). | 127 |
| `gameplay_drag_dragTypes_bracketRace.onExtensionLoaded()` | Load hook: retrieves the references to core and phaseHandlers and resets the activity. *(internal)* *(hook)* | 34 |
| `gameplay_drag_dragTypes_bracketRace.onUpdate(dtReal, dtSim, dtRaw)` | Per-frame hook, active only when the activity is started: simulates the local racers, calls the function of their phase, changes phase when it is completed (without dependency), marks the race as finished and handles the grouped phase advancement according to solo/host/client. *(internal)* *(hook)* | 59 |
| `gameplay_drag_dragTypes_bracketRace.resetDragRace()` | Stops the activity (hasActivityStarted = false). | 40 |
| `gameplay_drag_dragTypes_bracketRace.startActivity()` | Starts the activity: dragData.isStarted = true and computes each racer's start delays from the value of its dial timer (phaseHandlers.setDialsData). Called by core.startDragRaceActivity. | 44 |

### Parameter details

#### `gameplay_drag_dragTypes_bracketRace.generateWinData(dragData)`

Builds the ranked list of results: each entry contains vehId, lane, time (important timer), dialDiff, dialNotSet, isPlayable, disqualified. Order: positive gaps ascending, then breakouts (absolute gap ascending), then disqualified/no dial (players first, then lane, then vehId).

- `dragData` (*table*) : Race data with racers.
- **returns**: table[] List of results, {} if no racers.

#### `gameplay_drag_dragTypes_bracketRace.onUpdate(dtReal, dtSim, dtRaw)`

Per-frame hook, active only when the activity is started: simulates the local racers, calls the function of their phase, changes phase when it is completed (without dependency), marks the race as finished and handles the grouped phase advancement according to solo/host/client.

- `dtReal` (*number*) : Real time delta (s).
- `dtSim` (*number*) : Simulated time delta (s).
- `dtRaw` (*number*) : Raw delta (s).

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | gameplay_drag_core, gameplay_drag_phaseHandlers. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/drag/dragTypes/bracketRace.lua`.*
