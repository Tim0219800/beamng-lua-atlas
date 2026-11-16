# `scenario_race_marker`

*File: `lua/ge/extensions/scenario/race_marker.lua` · VM: Game Engine (GE) · 135 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `scenario_race_marker`: `extensions.load("scenario_race_marker")`, then the global `scenario_race_marker`

Manager of the 3D checkpoint markers of a scenario race. It creates one marker per waypoint with the chosen type (module scenario/raceMarkers/<type>, sideColumnMarker by default), hides or shows them, sets their mode (current, next, hidden...) and updates them every frame. The markers are hidden in photo mode.

## Notes

- M.idToMarker is copied at export: clearMarkerList reassigns the local variable idToMarker, so M.idToMarker no longer follows the table actually used after a first cleanup.
- In setupMarkers, marker:createMarkers() is called twice per marker (once in createRaceMarker, once afterwards).
- The modes passed to setModes are mode names specific to each marker type (see scenario/raceMarkers/*); a waypoint absent from the table receives 'hidden'.
- The global variable photoModeOpen is read to hide the markers.

## Functions

| Function | Description | Line |
|---|---|---|
| `scenario_race_marker.createRaceMarker(detached, type)` | Creates a marker of the given type (or the current type by default), calls createMarkers() and, unless detached, registers it for updates and hiding. | 29 |
| `scenario_race_marker.drawOnMinimap(td)` | Asks each marker that supports it (drawOnMinimap) to draw itself on the minimap. | 106 |
| `scenario_race_marker.hide()` | Hides all managed markers. | 17 |
| `scenario_race_marker.init()` | Clears the previous markers and hides those that remain. *(internal)* | 50 |
| `scenario_race_marker.onClientEndMission()` | Mission end hook: removes the markers and resets the marker type to default. *(internal)* *(hook)* | 115 |
| `scenario_race_marker.render(dt, dtSim)` | To be called every frame: hides the markers in photo mode (and restores them on exit), otherwise calls marker:update(dt, dtSim) on each. *(internal)* | 76 |
| `scenario_race_marker.setModes(wpModes)` | Sets the mode of each marker from a table waypoint name -> mode; absent names go to 'hidden'. | 93 |
| `scenario_race_marker.setToCheckpoints(data)` | Places each marker back on the checkpoint data matching its name. | 98 |
| `scenario_race_marker.setupMarkers(wps, marker)` | Chooses the marker type then creates one marker per waypoint and places it on its checkpoint (setToCheckpoint). The old markers are removed first. The markers are indexed by wp.name. | 57 |
| `scenario_race_marker.show()` | Shows all managed markers. | 23 |

### Parameter details

#### `scenario_race_marker.createRaceMarker(detached, type)`

Creates a marker of the given type (or the current type by default), calls createMarkers() and, unless detached, registers it for updates and hiding.

- `detached` (*boolean|nil*) : If true, the marker is not managed by this module (no automatic update).
- `type` (*string|nil*) : Module name in scenario/raceMarkers/, for example 'ringMarker'.
- **returns**: table The created marker.

#### `scenario_race_marker.drawOnMinimap(td)`

Asks each marker that supports it (drawOnMinimap) to draw itself on the minimap.

- `td` (*any*) : Drawing context passed as is to the markers (inferred from code).

#### `scenario_race_marker.render(dt, dtSim)`

To be called every frame: hides the markers in photo mode (and restores them on exit), otherwise calls marker:update(dt, dtSim) on each.

- `dt` (*number*) : Real frame duration (s).
- `dtSim` (*number*) : Simulation duration (s).

#### `scenario_race_marker.setModes(wpModes)`

Sets the mode of each marker from a table waypoint name -> mode; absent names go to 'hidden'.

- `wpModes` (*table<string, string>*) : Mode per waypoint name.

#### `scenario_race_marker.setToCheckpoints(data)`

Places each marker back on the checkpoint data matching its name.

- `data` (*table<string, table>*) : Checkpoint data per waypoint name.

#### `scenario_race_marker.setupMarkers(wps, marker)`

Chooses the marker type then creates one marker per waypoint and places it on its checkpoint (setToCheckpoint). The old markers are removed first. The markers are indexed by wp.name.

- `wps` (*table[]*) : List of waypoints, each with a name field.
- `marker` (*string|nil*) : Module name in scenario/raceMarkers/; nil for the default type sideColumnMarker.

## Fields

| Field | Type | Description |
|---|---|---|
| `idToMarker` | table | Table id -> marker, initial copy of the internal table (see notes). |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/scenario/race_marker.lua`.*
