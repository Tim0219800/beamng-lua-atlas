# `editor_drivePathEditor_playback`

*File: `lua/ge/extensions/editor/drivePathEditor/playback.lua` · VM: Game Engine (GE) · 205 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_drivePathEditor_playback`: `extensions.load("editor_drivePathEditor_playback")`, then the global `editor_drivePathEditor_playback`

Playback of Drive Path Editor paths (splines): associates each vehicle with its linked spline, moves it back to the start, then, once the spline's delay has elapsed, sends the vehicle a vLua command ai.driveUsingPath generated from the spline. Two modes: free (script of nodes x,y,z,r[,v|vl] after Catmull-Rom smoothing and RDP simplification, tolerance 1.0) or navigation graph (wpTargetList and wpSpeeds).

## Notes

- A vehicle is only considered if its spline is linked (isVehicleLink), has the link id (vehicle.linkSplineId), the right linkVehId == vehicle.vid, and isEnabled.
- The actual start happens in handlePlayback, called every frame: startPlayback does not start the AI yet.
- Free mode: widths are divided by 2 (half-widths); in loop mode (isLoop) the first start node is appended at the end; noOfLaps is only passed for loops.
- speedProfileMode: 0 no profile, 1 per-node speeds v, 2 per-node speed limits vl (free mode); in graph mode only mode 1 produces wpSpeeds.
- driveInLane is only passed in graph mode (free mode: empty string, with a code comment).
- The arguments passed to ai.driveUsingPath include aggression, routeSpeed/routeSpeedMode (if different from off) and avoidCars.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_drivePathEditor_playback.getPlaybackTime()` | Time elapsed since the start of playback. | 25 |
| `editor_drivePathEditor_playback.handlePlayback()` | To be called every frame: starts the AI of vehicles whose delayTime is reached (only once per vehicle) then advances the playback time. *(internal)* | 77 |
| `editor_drivePathEditor_playback.startPlayback(splines, vehicles)` | Prepares playback: clears the table of ongoing playbacks, adds each vehicle with a linked and enabled spline, moves these vehicles back to their start pose (splineMgr.resetVehiclePose), then resets the time counters to zero. | 30 |
| `editor_drivePathEditor_playback.stopPlayback()` | Sends ai.setState({mode = "stop"}) to each vehicle being played back, moves them back to their start pose, then clears the table and resets the counters to zero. | 58 |

### Parameter details

#### `editor_drivePathEditor_playback.getPlaybackTime()`

Time elapsed since the start of playback.

- **returns**: number seconds

#### `editor_drivePathEditor_playback.startPlayback(splines, vehicles)`

Prepares playback: clears the table of ongoing playbacks, adds each vehicle with a linked and enabled spline, moves these vehicles back to their start pose (splineMgr.resetVehiclePose), then resets the time counters to zero.

- `splines` (*table*) : path splines (fields id, isVehicleLink, linkVehId, isEnabled, delayTime...)
- `vehicles` (*table*) : scene vehicles (fields vid, veh, linkSplineId)

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/drivePathEditor/playback.lua`.*
