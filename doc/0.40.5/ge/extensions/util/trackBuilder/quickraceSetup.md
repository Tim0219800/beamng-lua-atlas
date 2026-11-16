# `util_trackBuilder_quickraceSetup`

*File: `lua/ge/extensions/util/trackBuilder/quickraceSetup.lua` · VM: Game Engine (GE) · 31 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `util_trackBuilder_quickraceSetup`: `extensions.load("util_trackBuilder_quickraceSetup")`, then the global `util_trackBuilder_quickraceSetup`

Link extension between quick race mode (scenario) and the Track Builder: when a scenario is loaded, it unloads the tracks in place, loads the scenario's custom track (sc.track.customData.name) via util_trackBuilder_splineTrack, adds the checkpoints and positions the vehicle, optionally in the reverse direction.

## Notes

- A done flag avoids redoing the setup until onClientStartMission has been called again.
- The arguments passed to load(…, true, true, true) are not named in this file; see splineTrack.

## Functions

| Function | Description | Line |
|---|---|---|
| `util_trackBuilder_quickraceSetup.onClientStartMission()` | Hook called at the start of a level load; resets the done flag to allow a new setup. *(internal)* *(hook)* | 23 |
| `util_trackBuilder_quickraceSetup.onScenarioLoaded(sc)` | Hook called when a scenario is loaded. If the setup is not already done: unloadAll, load of the scenario's track, addCheckPointPositions(reverse), positionVehicle(reverse). *(internal)* *(hook)* | 10 |

### Parameter details

#### `util_trackBuilder_quickraceSetup.onScenarioLoaded(sc)`

Hook called when a scenario is loaded. If the setup is not already done: unloadAll, load of the scenario's track, addCheckPointPositions(reverse), positionVehicle(reverse).

- `sc` (*table*) : Scenario; uses sc.track.customData.name (track name) and sc.track.reverse (reverse direction).

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/util/trackBuilder/quickraceSetup.lua`.*
