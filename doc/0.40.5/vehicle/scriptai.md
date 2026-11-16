# `scriptai`

*File: `lua/vehicle/scriptai.lua` · VM: Vehicle · 866 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** global `scriptai`

"Script" AI: records the vehicle trajectory (front bumper position + time, optionally speed) then replays it by driving the vehicle with simulated inputs (steering, throttle, brake, parking brake) to follow the path on schedule. Used for scenarios, trajectory replays (crash replays) and scripted stunts. Can also assist the following with an "external force" (thrusters.applyAccel) and loop the course.

## Example

```lua
-- record
scriptai.startRecording(true)
-- ... drive ...
local rec = scriptai.stopRecording() -- {path = {{x,y,z,t,v?}, ...}}
-- replay 2 loops
rec.loopCount = 2
scriptai.startFollowing(rec)
print(scriptai.scriptState().status)
```

## Notes

- Script format: list of points {x, y, z, t [, v] [, forceSpeed] [, dir, up on the first]} where (x,y,z) is the position of the vehicle's front point (obj:getFrontPosition), t the time in seconds, v the speed in m/s (if recordSpeed). A script can be either the direct list or {path = list, timeOffset, startDelay, loopCount, loopTimeOffset, externalForce}.
- Recording removes redundant points (almost straight movement at constant acceleration, tolerance 0.1 m) and stores the initial direction and up in the first point (dir, up).
- At the start of following, startFollowing: copies the script, applies timeOffset (time offset) and startDelay (delay before departure), computes the start position/orientation (with wheelToGroundDist to place the wheels on the ground), resets the vehicle to that place according to loopType ('alwaysReset' by default, 'startReset' = only on the first lap, other = no reset), sets the gearbox to 'arcade' mode (ai.saveGearboxMode) and the ABS to 'arcade' (wheels.setABSBehavior).
- Limitation: wheels.setABSBehavior('arcade') is not restored on stop (only the gearbox is, via ai.restoreSavedGearboxMode).
- Following uses a regulator on the time gap (timeDiff) and the required speed estimated by fitting s(t) = v0*t + a0*t²/2 on three points, with understeer/oversteer guard, simple ABS/TCS based on wheels.wheels[i].lastSlip and downForceRaw, and automatic reverse if the target is behind.
- The inputs sent go through input.event: steering (inverted), throttle, brake, parkingbrake with channel 2 for pedals and 1 for steering. Following is only active if M.updateGFX == updateGFXfollow; isDriving() tests it.
- debugMode is 'all' by default; other values used: 'target', 'path', 'externalForce' (what debugDraw draws).
- Bug/inconsistency: at the end of the script, updateGFXfollow calls ai.stopFollowing() (ai module) and not scriptai.stopFollowing; the old script following is therefore not properly stopped from scriptai (the end is not detected in the same way).
- Bug/inconsistency: getInitialSpawnPositionOrientation ignores startDelay (unlike startFollowing) and, if no sufficiently distant point is found (k nil), dir stays nil and the call dir:cross(up) raises an error.
- Bug/inconsistency: scriptState() reads script[#script].t and inScript.startDelay: error if the script is empty or inScript is nil during following; in the last phase of following the script can be emptied (scriptLen == 0) before the stop.
- Detail: scriptStop writes a debug CSV if setLogDataToCSV was enabled (file 'scriptaiFollowTrajectory' or the given name, plus 'settings_<file>').

## Functions

| Function | Description | Line |
|---|---|---|
| `scriptai.debugDraw()` | Draws the target, the path and the external force according to debugMode (called by the vehicle's debug loop). *(internal)* | 814 |
| `scriptai.getInitialSpawnPositionOrientation(inScript, vehPosType, _timeOffset)` | Computes the respawn position and orientation of the vehicle to start a script (time offset taken into account) without starting the following. | 126 |
| `scriptai.isDriving()` | Indicates whether the script AI is following a script. | 846 |
| `scriptai.scriptState()` | Returns the current state of the script AI (recording or following). | 837 |
| `scriptai.scriptStop(centerWheel, engageParkingbrake)` | Same function as stopFollowing (M.stopFollowing = M.scriptStop). | 328 |
| `scriptai.setLogDataToCSV(val)` | Enables or disables writing a debug CSV of the following (time, position, time gap, smoother rate). The file is written on stop. | 38 |
| `scriptai.setSpeedDiffSmootherOutRate(outRate)` | Sets the decay rate of the speed-error smoother (fine tuning of the following responsiveness), capped at 1e30. | 51 |
| `scriptai.startFollowing(_inScript, _timeOffset, _loopCounter, _loopType, _externalForce)` | Starts following a script: prepares the script (time offset, start delay), places the vehicle back at the start of the path according to the loop type, sets the gearbox and ABS to arcade mode and activates the following loop. Does nothing if the script has fewer than 2 points. | 660 |
| `scriptai.startRecording(recordSpeed)` | Starts recording the trajectory (front position of the vehicle at each frame) and stores the initial orientation. Resets the timer to 0. | 636 |
| `scriptai.stopFollowing(centerWheel, engageParkingbrake)` | Stops following (alias of scriptStop). Resets the inputs to 0, restores the saved gearbox mode and empties the script. Writes the debug CSV if it was enabled. | 328 |
| `scriptai.stopRecording()` | Stops the recording and returns the resulting script; the first point receives dir and up (initial orientation). | 648 |
| `scriptai.wheelToGroundDist(pos, dir, up)` | Computes by how much the wheels will be above (positive: too low, must be raised) or below the ground for a given respawn position and orientation (static ray cast from the average position of the wheel nodes). | 64 |

### Parameter details

#### `scriptai.getInitialSpawnPositionOrientation(inScript, vehPosType, _timeOffset)`

Computes the respawn position and orientation of the vehicle to start a script (time offset taken into account) without starting the following.

- `inScript` (*table*) : Script (list or {path, timeOffset, ...}).
- `vehPosType` (*any*) : Not used in the code.
- `_timeOffset` (*number|nil*) : Start offset in seconds (inScript.timeOffset by default).
- **returns**: vec3|nil Position of the ref node at the start (nil if the script is invalid).
- **returns**: quat|nil Initial rotation.

#### `scriptai.isDriving()`

Indicates whether the script AI is following a script.

- **returns**: boolean true while following.

#### `scriptai.scriptState()`

Returns the current state of the script AI (recording or following).

- **returns**: table|nil {status='recording', time} or {status='following', scriptTime, time, endScriptTime, posError, targetPos, startDelay}; nil at rest.

#### `scriptai.scriptStop(centerWheel, engageParkingbrake)`

Same function as stopFollowing (M.stopFollowing = M.scriptStop).

- `centerWheel` (*boolean|nil*) : Reset the inputs to 0.
- `engageParkingbrake` (*boolean|nil*) : Apply the parking brake.

#### `scriptai.setLogDataToCSV(val)`

Enables or disables writing a debug CSV of the following (time, position, time gap, smoother rate). The file is written on stop.

- `val` (*boolean|string*) : true or 'on': default name; other string (≠ 'off'): file name; otherwise disables.

#### `scriptai.setSpeedDiffSmootherOutRate(outRate)`

Sets the decay rate of the speed-error smoother (fine tuning of the following responsiveness), capped at 1e30.

- `outRate` (*number|nil*) : New rate (keeps the old one if nil).

#### `scriptai.startFollowing(_inScript, _timeOffset, _loopCounter, _loopType, _externalForce)`

Starts following a script: prepares the script (time offset, start delay), places the vehicle back at the start of the path according to the loop type, sets the gearbox and ABS to arcade mode and activates the following loop. Does nothing if the script has fewer than 2 points.

- `_inScript` (*table*) : Script: list of points, or table {path, timeOffset, startDelay, loopCount, loopTimeOffset, externalForce}.
- `_timeOffset` (*number|nil*) : Start offset in the script in seconds (replaces inScript.timeOffset).
- `_loopCounter` (*integer|nil*) : Number of laps remaining (inScript.loopCount by default, 1 otherwise). Also used by the auto-recall at the end of a lap.
- `_loopType` (*string|nil*) : 'alwaysReset' (default), 'startReset' or other: when to place the vehicle back at the start point.
- `_externalForce` (*boolean|number|nil*) : Following assistance by external acceleration (true = 1, number clamped to 1; replaces inScript.externalForce).

#### `scriptai.startRecording(recordSpeed)`

Starts recording the trajectory (front position of the vehicle at each frame) and stores the initial orientation. Resets the timer to 0.

- `recordSpeed` (*boolean|string|nil*) : true/'on'/'yes' to also record the speed (v, m/s) at each point.

#### `scriptai.stopFollowing(centerWheel, engageParkingbrake)`

Stops following (alias of scriptStop). Resets the inputs to 0, restores the saved gearbox mode and empties the script. Writes the debug CSV if it was enabled.

- `centerWheel` (*boolean|nil*) : Reset steering, throttle and brake to 0 (true by default if the argument is nil).
- `engageParkingbrake` (*boolean|nil*) : Apply the parking brake (true by default if centerWheel is nil).

#### `scriptai.stopRecording()`

Stops the recording and returns the resulting script; the first point receives dir and up (initial orientation).

- **returns**: table {path = list of points {x, y, z, t [, v]}}.

#### `scriptai.wheelToGroundDist(pos, dir, up)`

Computes by how much the wheels will be above (positive: too low, must be raised) or below the ground for a given respawn position and orientation (static ray cast from the average position of the wheel nodes).

- `pos` (*vec3*) : Position of the vehicle's ref node.
- `dir` (*vec3*) : Front direction (normalized).
- `up` (*vec3*) : Up vector (normalized).
- **returns**: number Height (m) to add along up so that the wheels touch the ground: max wheel radius minus the measured distance to the ground.

## Fields

| Field | Type | Description |
|---|---|---|
| `debugMode` | string | What debugDraw draws: 'all' (default), 'target', 'path' or 'externalForce'. |
| `updateGFX` | function | nop at rest; becomes updateGFXrecord during recording and updateGFXfollow during following. ⚠ nop is a game global. |

## Calls into the engine (C++)

- `debugDrawer:` `drawCylinder`, `drawSphere`
- `obj:` `castRayStatic`, `getCenterPosition`, `getClusterVelocityWithoutWheels`, `getDirectionVector`, `getDirectionVectorUp`, `getFrontPosition`, `getGravityVector`, `getId`, `getInitialHeight`, `getOriginalFrontPositionRelative`, `getOriginalNodePositionRelative`, `getPosition`, `getSmoothRefVelocityXYZ`, `getVelocity`, `isCollidingWithObject`, `queueGameEngineLua`, `requestReset`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/scriptai.lua`.*
