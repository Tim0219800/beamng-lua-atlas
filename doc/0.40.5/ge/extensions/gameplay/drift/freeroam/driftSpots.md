# `gameplay_drift_freeroam_driftSpots`

*File: `lua/ge/extensions/gameplay/drift/freeroam/driftSpots.lua` · VM: Game Engine (GE) · 532 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_drift_freeroam_driftSpots`: `extensions.load("gameplay_drift_freeroam_driftSpots")`, then the global `gameplay_drift_freeroam_driftSpots`

Manages the drift spots of free roaming (and of career): start/finish zones as lines (lineOne/lineTwo), to be crossed while drifting. It detects the start (the player drifts in a line's rectangle, in the direction of startDir), switches to the inFreeroamChallenge context, configures the bounds (gameplay_drift_bounds) and the route (gameplay_drift_destination), then detects a clean end (finish line crossed against its startDir) or an unclean one (wrong way, off road, stop, vehicle reset). Records the score (top 10), validates the objectives and exposes the spots as POIs on the map.

## Notes

- Settings: maxWrongWayDist 5 m, maxDistToIntendedRoad 30 m, concluding phase 2.5 s, stopping (speed < 2 m/s) for more than 1 s = abandonment (reason stopped).
- Failure reasons: wrongWay, outOfBounds, stopped, vehReset (translation keys missions.drift.display.endReason.*).
- lineTwo is driven in the opposite direction: the route is loaded with reverse = (line.name == "lineTwo"). The finish line is the corresponding line (lineOne <-> lineTwo) of the same spot.
- Keeps only 10 scores per spot; achieved objectives give rewards, paid out in career via career_modules_playerAttributes.
- The spots are only offered as POIs if career is active or if the enableDriftInFreeroam setting is true. Ignored in multiseat and during a multiplayer gamemode.
- Emitted hooks: onDriftSpotStarted({lineId}), onDriftSpotFinishLineCrossed(), onDriftSpotCompleted({duration, score, newRecord}), onDriftSpotFailed({reason, concludingPhaseDuration, lineId}), onFreeroamDriftZoneNewHighscore(), onDriftSpotForcedEnd({lineId}).
- Bug: in onDriftCompletedScored, the done field of the "New Highscore!" message uses the variable `completed`, which does not exist in this scope (global nil).
- Minor bug: in onUpdate, an early return (no vehicle position) skips profiler:finish(false) when general debug is active.
- findNearestStartLine is defined but never called (dead code).

**Dependencies (loaded first):** `gameplay_drift_general`, `gameplay_drift_drift`, `gameplay_drift_scoring`, `gameplay_drift_saveLoad`

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_drift_freeroam_driftSpots.detectStart(lineId)` | Tests whether the player starts a spot through the given line: they must be in the line's rectangle, drive in the direction of startDir (dot product > 0) and be drifting. If so, starts the spot (inFreeroamChallenge context, bounds, route, onDriftSpotStarted hook, tasklist). No effect if already in a challenge, in multiseat or in a multiplayer gamemode. Logs an error if the line id is unknown. | 244 |
| `gameplay_drift_freeroam_driftSpots.getDriftDebugInfo()` | Returns {default=false, canBeChanged=true} for the drift debug window. | 379 |
| `gameplay_drift_freeroam_driftSpots.getGC()` | Returns the amount of garbage measured by the profiler (0 outside debug). | 387 |
| `gameplay_drift_freeroam_driftSpots.getIsInFreeroamChallenge()` | Indicates whether a drift spot is in progress. | 391 |
| `gameplay_drift_freeroam_driftSpots.getIsInTheConcludingPhase()` | Indicates whether the spot is in its concluding phase (success or failure), during which the drift is frozen. | 383 |
| `gameplay_drift_freeroam_driftSpots.onClientEndMission()` | Hook: level end; cleans up the tasklist and the state of the current spot. *(internal)* *(hook)* | 482 |
| `gameplay_drift_freeroam_driftSpots.onClientStartMission()` | Hook: level start; empties the gameplay_drift_saveLoad cache and rebuilds the lines. *(internal)* *(hook)* | 491 |
| `gameplay_drift_freeroam_driftSpots.onDeserialized(data)` | Hook: if a spot was in progress before the reload, emits onDriftSpotForcedEnd then ends it. *(internal)* *(hook)* | 497 |
| `gameplay_drift_freeroam_driftSpots.onDriftCompletedScored()` | Hook: at the end of a scored drift chain, updates the objectives tasklist and shows "New Highscore!" (once per spot) if the record is beaten. *(internal)* *(hook)* | 446 |
| `gameplay_drift_freeroam_driftSpots.onGetRawPoiListForLevel(levelIdentifier, elements)` | Hook: reloads the level's lines then adds one POI per line (drift line marker); lineOne also adds a big map marker with name, preview, best score and teleport position. *(internal)* *(hook)* | 409 |
| `gameplay_drift_freeroam_driftSpots.onMultiplayerGamemodeStarted()` | Hook: a multiplayer gamemode starts; forces the end of a spot in progress (onDriftSpotForcedEnd), disables the spots and empties the POIs. *(internal)* *(hook)* | 468 |
| `gameplay_drift_freeroam_driftSpots.onMultiplayerGamemodeStopped()` | Hook: end of the multiplayer gamemode; re-enables the spots and empties the POIs. *(internal)* *(hook)* | 477 |
| `gameplay_drift_freeroam_driftSpots.onSerialize()` | Hook: saves isInFreeroamChallenge and activeLine before a Lua reload. *(internal)* *(hook)* | 504 |
| `gameplay_drift_freeroam_driftSpots.onUpdate(dtReal, dtSim, dtRaw)` | Called every frame: updates the player's position/speed then, during a spot, checks the clean end and the unclean ends. *(internal)* *(hook)* | 358 |
| `gameplay_drift_freeroam_driftSpots.onVehicleResetted(id)` | Hook: if the vehicle put back in place is the drift vehicle during a spot, ends the spot as a failure (reason vehReset). *(internal)* *(hook)* | 395 |

### Parameter details

#### `gameplay_drift_freeroam_driftSpots.detectStart(lineId)`

Tests whether the player starts a spot through the given line: they must be in the line's rectangle, drive in the direction of startDir (dot product > 0) and be drifting. If so, starts the spot (inFreeroamChallenge context, bounds, route, onDriftSpotStarted hook, tasklist). No effect if already in a challenge, in multiseat or in a multiplayer gamemode. Logs an error if the line id is unknown.

- `lineId` (*string*) : Line id of the form spotId..lineName (key of the lines table).

#### `gameplay_drift_freeroam_driftSpots.getDriftDebugInfo()`

Returns {default=false, canBeChanged=true} for the drift debug window.

- **returns**: table {default = false, canBeChanged = true}

#### `gameplay_drift_freeroam_driftSpots.getGC()`

Returns the amount of garbage measured by the profiler (0 outside debug).

- **returns**: number Garbage of the "Drift driftSpots" section.

#### `gameplay_drift_freeroam_driftSpots.getIsInFreeroamChallenge()`

Indicates whether a drift spot is in progress.

- **returns**: boolean true during a spot challenge.

#### `gameplay_drift_freeroam_driftSpots.getIsInTheConcludingPhase()`

Indicates whether the spot is in its concluding phase (success or failure), during which the drift is frozen.

- **returns**: boolean true during the ~2.5 s of conclusion.

#### `gameplay_drift_freeroam_driftSpots.onDeserialized(data)`

Hook: if a spot was in progress before the reload, emits onDriftSpotForcedEnd then ends it.

- `data` (*table*) : Table returned by onSerialize.

#### `gameplay_drift_freeroam_driftSpots.onGetRawPoiListForLevel(levelIdentifier, elements)`

Hook: reloads the level's lines then adds one POI per line (drift line marker); lineOne also adds a big map marker with name, preview, best score and teleport position.

- `levelIdentifier` (*string*) : Level identifier (unused).
- `elements` (*table*) : List of raw POIs to fill.

#### `gameplay_drift_freeroam_driftSpots.onSerialize()`

Hook: saves isInFreeroamChallenge and activeLine before a Lua reload.

- **returns**: table {isInFreeroamChallenge, activeLine}

#### `gameplay_drift_freeroam_driftSpots.onUpdate(dtReal, dtSim, dtRaw)`

Called every frame: updates the player's position/speed then, during a spot, checks the clean end and the unclean ends.

- `dtReal` (*number*) : Real time delta (unused).
- `dtSim` (*number*) : Simulated time delta, used for the stop timer.
- `dtRaw` (*number*) : Raw time delta (unused).

#### `gameplay_drift_freeroam_driftSpots.onVehicleResetted(id)`

Hook: if the vehicle put back in place is the drift vehicle during a spot, ends the spot as a failure (reason vehReset).

- `id` (*integer*) : Vehicle id.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | gameplay_drift_general, gameplay_drift_drift, gameplay_drift_scoring, gameplay_drift_saveLoad. |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onDriftSpotCompleted` — listened to by 1 module(s)
- `onDriftSpotFailed` — listened to by 2 module(s)
- `onDriftSpotFinishLineCrossed` — listened to by 1 module(s)
- `onDriftSpotForcedEnd`
- `onDriftSpotStarted` — listened to by 1 module(s)
- `onFreeroamDriftZoneNewHighscore` — listened to by 1 module(s)

**UI events (guihooks.trigger):** `ClearTasklist`, `SetTasklistTask`

## Calls into the engine (C++)

- `debugDrawer:` `drawSphere`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/drift/freeroam/driftSpots.lua`.*
