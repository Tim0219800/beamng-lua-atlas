---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/paths.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- GE extension `core_paths`: management of camera paths (*.camPath.json files) used by the 'path' camera and by the path editor. It loads, creates, saves and deletes paths, plays them via core_camera, and provides the evaluation of transform tracks (position, orientation, FOV) with temporal Bezier curves. When a level starts, it loads all camPaths from the `camPaths` folder next to the level file.
--- Access: extension `core_paths`: `extensions.load("core_paths")`, then the global `core_paths`
---@class core_paths
---@field motionPrefixes string[] Temporal Bezier families: 'motion' (position), 'rotMotion' (whole orientation), then 'yawMotion', 'pitchMotion', 'rollMotion' (one Euler axis each).
---@field transformChannels string[] Transform track channels: posX, posY, posZ, yaw, pitch, roll, fov.
core_paths = {}

--- Adds a path to the list and assigns it the smallest free id (path.id field modified).
---Source: lua/ge/extensions/core/paths.lua:241
---@param path table Path to add.
function core_paths.addPath(path) end

--- Clean copy of the transform tracks, keeping only the channels of transformChannels and the fields t, v, slopeIn, slopeOut, timeIn, timeOut.
---Source: lua/ge/extensions/core/paths.lua:132
---@param tracks table|nil Table channel -> list of keys.
---@return table|nil  Copy, or nil if tracks is not a table.
function core_paths.cloneTransformTracks(tracks) end

--- Creates an empty path { name, markers = {}, manualFov = true, dirty = true } and adds it.
---Source: lua/ge/extensions/core/paths.lua:246
---@param name string Path name (not automatically made unique).
---@return table  The created path.
function core_paths.createPath(name) end

--- Removes from the list the first path with the same name as the given one. Does not delete any file.
---Source: lua/ge/extensions/core/paths.lua:251
---@param path table Path (compared by name).
function core_paths.deletePath(path) end

--- Evaluates all channels (pos, yaw/pitch/roll, fov) of the path at time t.
---Source: lua/ge/extensions/core/paths.lua:166
---@param path table|nil Path with transformTracks.
---@param t number Time in seconds.
---@return table|nil  Table channel -> value; nil if the path has no tracks or if no channel gives a value.
function core_paths.evalTransform(path, t) end

--- Evaluates a track of keys { t, v, ... } at time t by Bezier interpolation between keys, handling cuts and wrapping (wrap).
---Source: lua/ge/extensions/core/paths.lua:98
---@param keys table[] Keys sorted by t.
---@param t number Time in seconds.
---@param wrap table|nil { duration, fromT, unwrapDeg } for the end transition to the first key.
---@param cuts number[]|nil Times of the hard cuts.
---@return number|nil  Value, or nil if the track is empty or t is nil.
function core_paths.evalTransformTrack(keys, t, wrap, cuts) end

--- Index of the last playable segment: number of markers if the path loops, otherwise number minus 1.
---Source: lua/ge/extensions/core/paths.lua:269
---@param path table Camera path.
---@return integer  Last segment index.
function core_paths.getEndIdx(path) end

--- Returns the 4 marker indices (previous, current, next, next+1) used to interpolate segment idx. Handles looping (modulo) and cuts (`cut`), which duplicate the neighboring index.
---Source: lua/ge/extensions/core/paths.lua:223
---@param path table Camera path.
---@param idx integer Index (1-based) of the segment's start marker.
---@return integer  index1, index2, index3, index4 (four values).
function core_paths.getMarkerIds(path, idx) end

--- Old function _anon(getPath_Deprecated): reads a SimPath from the scene and returns its markers. With no argument, takes the first SimPath of the level.
---Source: lua/ge/extensions/core/paths.lua:439
---@param pathName string|nil Name of the SimPath object.
---@return table|nil  { markers, looped, nodeCount }, or nil if not found.
function core_paths.getPath(pathName) end

--- Returns the internal table of loaded paths (not a copy).
---Source: lua/ge/extensions/core/paths.lua:265
---@return table[]  List of paths.
function core_paths.getPaths() end

--- Returns a name not used by the loaded paths: the name as is, otherwise with a numeric suffix (name1, name2...).
---Source: lua/ge/extensions/core/paths.lua:208
---@param name string Desired name.
---@return string  Unique name.
function core_paths.getUniquePathName(name) end

--- Inverse of a monotonic cubic Bezier x(t) = cubicBezier(a, b, t) on [0, 1], by Newton (8 iterations). Exact at the bounds: u<=0 gives 0, u>=1 gives 1.
---Source: lua/ge/extensions/core/paths.lua:31
---@param a number First control point (x coordinate).
---@param b number Second control point (x coordinate).
---@param u number Target value, clamped to [0, 1].
---@return number  Parameter t in [0, 1].
function core_paths.invertCubicBezier(a, b, u) end

--- Loads a path from a camPath.json file and adds it to the list; returns the existing path if that file is already loaded.
---Source: lua/ge/extensions/core/paths.lua:329
---@param pathFileName string|nil File to read; nil returns nil.
---@return table|nil  The path, or nil if the file is not found (error in the log).
function core_paths.loadPath(pathFileName) end

--- Duration of a path's loop transition: 0 if the path is not `looped`, otherwise loopTime (min 0), or 2 s if loopTime is absent.
---Source: lua/ge/extensions/core/paths.lua:65
---@param path table|nil Camera path.
---@return number  Duration in seconds.
function core_paths.loopDuration(path) end

--- Hook called when a level starts: clears the list and loads all *.camPath.json files from the 'camPaths' folder next to the level file.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/paths.lua:415
function core_paths.onClientStartMission() end

--- Restore hook after Lua reload: puts the saved paths back.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/paths.lua:411
---@param data table Table returned by onSerialize.
function core_paths.onDeserialized(data) end

--- Hook called when the extension loads; does nothing.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/paths.lua:402
function core_paths.onExtensionLoaded() end

--- Save hook before Lua reload: returns a deep copy of the paths.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/paths.lua:405
---@return table  { paths = ... }
function core_paths.onSerialize() end

--- Plays a path with the 'path' camera (core_camera.setByName(0, 'path', ...)). initData receives useJsonVersion, hasIntro, path, offset, and default reset/getNextPath.
---Source: lua/ge/extensions/core/paths.lua:491
---@param path table Path to play.
---@param offset number|nil Start offset (0 by default; unit inferred: seconds).
---@param initData table|nil Extra options for the camera; modified in place.
function core_paths.playPath(path, offset, initData) end

--- Writes the path to a JSON file (version 6) and updates cameraPath.filename and dirty = false.
---Source: lua/ge/extensions/core/paths.lua:277
---@param cameraPath table Path to save.
---@param filename string Destination file (e.g. .camPath.json).
function core_paths.savePath(cameraPath, filename) end

--- If the active camera is 'path', switches to the free camera (commands.setFreeCamera).
---Source: lua/ge/extensions/core/paths.lua:503
function core_paths.stopCurrentPath() end

