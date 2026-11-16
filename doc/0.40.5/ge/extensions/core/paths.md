# `core_paths`

*File: `lua/ge/extensions/core/paths.lua` · VM: Game Engine (GE) · 530 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_paths`: `extensions.load("core_paths")`, then the global `core_paths`

GE extension `core_paths`: management of camera paths (*.camPath.json files) used by the 'path' camera and by the path editor. It loads, creates, saves and deletes paths, plays them via core_camera, and provides the evaluation of transform tracks (position, orientation, FOV) with temporal Bezier curves. When a level starts, it loads all camPaths from the `camPaths` folder next to the level file.

## Example

```lua
local p = core_paths.loadPath('/levels/gridmap_v2/camPaths/intro.camPath.json')
if p then core_paths.playPath(p, 0) end
-- later
core_paths.stopCurrentPath()
```

## Notes

- A path is a table { name, markers = {...}, looped, loopTime, filename, id, dirty, manualFov, transformTracks, advancedMode, replay }. Each marker has pos (vec3), rot (quat), time, fov, positionSmooth, bullettime, cut, movingStart, movingEnd, trackPosition, attachToVehicle, trackOffset, plus the Bezier families <prefix>In/Out/InTime/OutTime.
- On save, pos and rot are converted to {x,y,z[,w]} tables, the written version is "6", and default values (positionSmooth 0.5, Bezier 1 and 1/3, bullettime 1) are removed to keep files compact. savePath does not handle a nil marker.pos or marker.rot.
- loadPath reuses an already loaded path with the same `filename`. It flips the sign of a quaternion if the dot product with the previous one is negative (avoids the long way around). It does not check that `markers` exists in the JSON.
- Transform tracks (transformTracks) are lists of keys { t, v, slopeIn, slopeOut, timeIn, timeOut } per channel (see transformChannels). The yaw and roll angles are in degrees, interpolated by the shortest path when looping.
- A `cut` marker is a hard jump: the keys before and after the cut are not interpolated between each other.
- getPath (old, named getPath_Deprecated in the code) reads a SimPath object from the scene, not a camPath file; with no argument it takes the first SimPath. It returns nothing if no SimPath exists. Loop `for i = 0, res.nodeCount`: iterates one index more than the number of nodes (inferred from code).
- onClientStartMission: replaces the path list; duplicate names get a '(n)' suffix. It crashes if loadPath returns nil for a file (path.name on nil).

## Functions

| Function | Description | Line |
|---|---|---|
| `core_paths.addPath(path)` | Adds a path to the list and assigns it the smallest free id (path.id field modified). | 241 |
| `core_paths.cloneTransformTracks(tracks)` | Clean copy of the transform tracks, keeping only the channels of transformChannels and the fields t, v, slopeIn, slopeOut, timeIn, timeOut. | 132 |
| `core_paths.createPath(name)` | Creates an empty path { name, markers = {}, manualFov = true, dirty = true } and adds it. | 246 |
| `core_paths.deletePath(path)` | Removes from the list the first path with the same name as the given one. Does not delete any file. | 251 |
| `core_paths.evalTransform(path, t)` | Evaluates all channels (pos, yaw/pitch/roll, fov) of the path at time t. | 166 |
| `core_paths.evalTransformTrack(keys, t, wrap, cuts)` | Evaluates a track of keys { t, v, ... } at time t by Bezier interpolation between keys, handling cuts and wrapping (wrap). | 98 |
| `core_paths.getEndIdx(path)` | Index of the last playable segment: number of markers if the path loops, otherwise number minus 1. | 269 |
| `core_paths.getMarkerIds(path, idx)` | Returns the 4 marker indices (previous, current, next, next+1) used to interpolate segment idx. Handles looping (modulo) and cuts (`cut`), which duplicate the neighboring index. | 223 |
| `core_paths.getPath(pathName)` | Old function (getPath_Deprecated): reads a SimPath from the scene and returns its markers. With no argument, takes the first SimPath of the level. | 439 |
| `core_paths.getPaths()` | Returns the internal table of loaded paths (not a copy). | 265 |
| `core_paths.getUniquePathName(name)` | Returns a name not used by the loaded paths: the name as is, otherwise with a numeric suffix (name1, name2...). | 208 |
| `core_paths.invertCubicBezier(a, b, u)` | Inverse of a monotonic cubic Bezier x(t) = cubicBezier(a, b, t) on [0, 1], by Newton (8 iterations). Exact at the bounds: u<=0 gives 0, u>=1 gives 1. | 31 |
| `core_paths.loadPath(pathFileName)` | Loads a path from a camPath.json file and adds it to the list; returns the existing path if that file is already loaded. | 329 |
| `core_paths.loopDuration(path)` | Duration of a path's loop transition: 0 if the path is not `looped`, otherwise loopTime (min 0), or 2 s if loopTime is absent. | 65 |
| `core_paths.onClientStartMission()` | Hook called when a level starts: clears the list and loads all *.camPath.json files from the 'camPaths' folder next to the level file. *(internal)* *(hook)* | 415 |
| `core_paths.onDeserialized(data)` | Restore hook after Lua reload: puts the saved paths back. *(internal)* *(hook)* | 411 |
| `core_paths.onExtensionLoaded()` | Hook called when the extension loads; does nothing. *(internal)* *(hook)* | 402 |
| `core_paths.onSerialize()` | Save hook before Lua reload: returns a deep copy of the paths. *(internal)* *(hook)* | 405 |
| `core_paths.playPath(path, offset, initData)` | Plays a path with the 'path' camera (core_camera.setByName(0, 'path', ...)). initData receives useJsonVersion, hasIntro, path, offset, and default reset/getNextPath. | 491 |
| `core_paths.savePath(cameraPath, filename)` | Writes the path to a JSON file (version 6) and updates cameraPath.filename and dirty = false. | 277 |
| `core_paths.stopCurrentPath()` | If the active camera is 'path', switches to the free camera (commands.setFreeCamera). | 503 |

### Parameter details

#### `core_paths.addPath(path)`

Adds a path to the list and assigns it the smallest free id (path.id field modified).

- `path` (*table*) : Path to add.

#### `core_paths.cloneTransformTracks(tracks)`

Clean copy of the transform tracks, keeping only the channels of transformChannels and the fields t, v, slopeIn, slopeOut, timeIn, timeOut.

- `tracks` (*table|nil*) : Table channel -> list of keys.
- **returns**: table|nil Copy, or nil if tracks is not a table.

#### `core_paths.createPath(name)`

Creates an empty path { name, markers = {}, manualFov = true, dirty = true } and adds it.

- `name` (*string*) : Path name (not automatically made unique).
- **returns**: table The created path.

#### `core_paths.deletePath(path)`

Removes from the list the first path with the same name as the given one. Does not delete any file.

- `path` (*table*) : Path (compared by name).

#### `core_paths.evalTransform(path, t)`

Evaluates all channels (pos, yaw/pitch/roll, fov) of the path at time t.

- `path` (*table|nil*) : Path with transformTracks.
- `t` (*number*) : Time in seconds.
- **returns**: table|nil Table channel -> value; nil if the path has no tracks or if no channel gives a value.

#### `core_paths.evalTransformTrack(keys, t, wrap, cuts)`

Evaluates a track of keys { t, v, ... } at time t by Bezier interpolation between keys, handling cuts and wrapping (wrap).

- `keys` (*table[]*) : Keys sorted by t.
- `t` (*number*) : Time in seconds.
- `wrap` (*table|nil*) : { duration, fromT, unwrapDeg } for the end transition to the first key.
- `cuts` (*number[]|nil*) : Times of the hard cuts.
- **returns**: number|nil Value, or nil if the track is empty or t is nil.

#### `core_paths.getEndIdx(path)`

Index of the last playable segment: number of markers if the path loops, otherwise number minus 1.

- `path` (*table*) : Camera path.
- **returns**: integer Last segment index.

#### `core_paths.getMarkerIds(path, idx)`

Returns the 4 marker indices (previous, current, next, next+1) used to interpolate segment idx. Handles looping (modulo) and cuts (`cut`), which duplicate the neighboring index.

- `path` (*table*) : Camera path.
- `idx` (*integer*) : Index (1-based) of the segment's start marker.
- **returns**: integer index1, index2, index3, index4 (four values).

#### `core_paths.getPath(pathName)`

Old function (getPath_Deprecated): reads a SimPath from the scene and returns its markers. With no argument, takes the first SimPath of the level.

- `pathName` (*string|nil*) : Name of the SimPath object.
- **returns**: table|nil { markers, looped, nodeCount }, or nil if not found.

#### `core_paths.getPaths()`

Returns the internal table of loaded paths (not a copy).

- **returns**: table[] List of paths.

#### `core_paths.getUniquePathName(name)`

Returns a name not used by the loaded paths: the name as is, otherwise with a numeric suffix (name1, name2...).

- `name` (*string*) : Desired name.
- **returns**: string Unique name.

#### `core_paths.invertCubicBezier(a, b, u)`

Inverse of a monotonic cubic Bezier x(t) = cubicBezier(a, b, t) on [0, 1], by Newton (8 iterations). Exact at the bounds: u<=0 gives 0, u>=1 gives 1.

- `a` (*number*) : First control point (x coordinate).
- `b` (*number*) : Second control point (x coordinate).
- `u` (*number*) : Target value, clamped to [0, 1].
- **returns**: number Parameter t in [0, 1].

#### `core_paths.loadPath(pathFileName)`

Loads a path from a camPath.json file and adds it to the list; returns the existing path if that file is already loaded.

- `pathFileName` (*string|nil*) : File to read; nil returns nil.
- **returns**: table|nil The path, or nil if the file is not found (error in the log).

#### `core_paths.loopDuration(path)`

Duration of a path's loop transition: 0 if the path is not `looped`, otherwise loopTime (min 0), or 2 s if loopTime is absent.

- `path` (*table|nil*) : Camera path.
- **returns**: number Duration in seconds.

#### `core_paths.onDeserialized(data)`

Restore hook after Lua reload: puts the saved paths back.

- `data` (*table*) : Table returned by onSerialize.

#### `core_paths.onSerialize()`

Save hook before Lua reload: returns a deep copy of the paths.

- **returns**: table { paths = ... }

#### `core_paths.playPath(path, offset, initData)`

Plays a path with the 'path' camera (core_camera.setByName(0, 'path', ...)). initData receives useJsonVersion, hasIntro, path, offset, and default reset/getNextPath.

- `path` (*table*) : Path to play.
- `offset` (*number|nil*) : Start offset (0 by default; unit inferred: seconds).
- `initData` (*table|nil*) : Extra options for the camera; modified in place.

#### `core_paths.savePath(cameraPath, filename)`

Writes the path to a JSON file (version 6) and updates cameraPath.filename and dirty = false.

- `cameraPath` (*table*) : Path to save.
- `filename` (*string*) : Destination file (e.g. .camPath.json).

## Fields

| Field | Type | Description |
|---|---|---|
| `motionPrefixes` | string[] | Temporal Bezier families: 'motion' (position), 'rotMotion' (whole orientation), then 'yawMotion', 'pitchMotion', 'rollMotion' (one Euler axis each). |
| `transformChannels` | string[] | Transform track channels: posX, posY, posZ, yaw, pitch, roll, fov. |

## Calls into the engine (C++)

- `FS:` `findFiles`
- `scenetree.` `findClassObjects`, `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/paths.lua`.*
