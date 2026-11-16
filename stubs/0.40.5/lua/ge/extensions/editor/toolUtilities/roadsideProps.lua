---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/roadsideProps.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Shared placer of lines of objects at the roadside (guardrails, barriers, fences, lampposts, bollards, bins, bus shelters...). A presets table describes each piece (.dae shape, rotation, gap between pieces, normal mode, alternating pieces, end caps); runLine places a line of pieces along a rail, placePoints one piece at each given point, placeScatter random scattered elements. The pieces go into "pools" identified by poolId (scene via kitPlacer), which the tool can delete, count or burn (commitPool) into persistent objects. Lampposts also create their light (siteLights).
--- Access: extension `editor_toolUtilities_roadsideProps`: `extensions.load("editor_toolUtilities_roadsideProps")`, then the global `editor_toolUtilities_roadsideProps`
---@class editor_toolUtilities_roadsideProps
---@field presets table<string, table> Table of piece presets, by key. Usual fields: name, shapePath, preRot (0 to 3, quarter turns around Z), gapM (gap between pieces, negative = overlap), nativeLenM, normalMode ('surface' or 'global'), altPaths (alternating shapes), capMode/capPath/capPreRot (end caps), reach/bright (lampposts).
editor_toolUtilities_roadsideProps = {}

--- Merges additional presets into the presets table (by key). Used by the props kit, outside the shipped version, to register street furniture and civic pieces.
---Source: lua/ge/extensions/editor/toolUtilities/roadsideProps.lua:517
---@param t table<string, table> Presets to add or replace.
function editor_toolUtilities_roadsideProps.addPresets(t) end

--- Starts a batch of spot props with spatial deduplication: any point within minGap of a point already placed in this batch is rejected (breaks up places where lines meet). Without a positive minGap, disables deduplication.
---Source: lua/ge/extensions/editor/toolUtilities/roadsideProps.lua:244
---@param minGap number|nil Minimum distance between points, in meters.
function editor_toolUtilities_roadsideProps.beginPointBatch(minGap) end

--- Burns a pool: makes the transient pieces and the lights of its lampposts persistent (canSave=true), then detaches them from the pool without deleting them.
---Source: lua/ge/extensions/editor/toolUtilities/roadsideProps.lua:301
---@param poolId string Pool identifier.
---@return table  List of identifiers/names of the objects made persistent.
function editor_toolUtilities_roadsideProps.commitPool(poolId) end

--- Ends the batch of spot props.
---Source: lua/ge/extensions/editor/toolUtilities/roadsideProps.lua:248
function editor_toolUtilities_roadsideProps.endPointBatch() end

--- Builds the light record (see siteLights) of a lamppost placed at (px, py, pz) and rotated by q; the head is placed under the top of the mesh's box, at the end of the arm if there is one. Returns nil if the preset is not a lamppost.
---Source: lua/ge/extensions/editor/toolUtilities/roadsideProps.lua:210
---@param presetKey string Preset key.
---@param px number x of the foot.
---@param py number y of the foot.
---@param pz number z of the foot.
---@param q quat Rotation of the piece.
---@param scale number|nil Scale (default 1).
---@param col any|nil Glow color (default siteLights.TONES.warm).
---@param bright number|nil Brightness (default that of the preset).
---@param reach number|nil Light radius (default that of the preset).
---@return table|nil  { px, py, pz, glow, radius, brightness }.
function editor_toolUtilities_roadsideProps.lampLight(presetKey, px, py, pz, q, scale, col, bright, reach) end

--- Rotation given to a placed piece (see orient) for a tool that stands up its own pieces. Shared quaternion: use or copy it before the next call.
---Source: lua/ge/extensions/editor/toolUtilities/roadsideProps.lua:179
---@param along vec3 Direction along the rail.
---@param up vec3 Upward direction.
---@param preIdx integer Pre-rotation of the piece, 0 to 3 (0, 90, 180, 270 degrees around Z).
---@param sideSign number|nil Side: a negative value flips the piece by 180 degrees (default 1).
---@return quat  Rotation (shared instance of the module).
function editor_toolUtilities_roadsideProps.orientation(along, up, preIdx, sideSign) end

--- Places a preset at each world point provided. Replaces the pool unless keepPool. Each point can carry ax, ay (horizontal direction along) and scl (number, or {x,y,z} in the piece's frame) to adjust that instance. For a lamppost, also creates the light.
---Source: lua/ge/extensions/editor/toolUtilities/roadsideProps.lua:314
---@param opts table poolId, presetKey, folder (parent scene group), points ({x,y,z,ax,ay,scl}), sideSign (default 1), keepPool, ownerTag, outPositions (receives the placed positions), outLights (receives the lights).
---@return integer  Number of pieces placed (0 if preset or points are missing).
function editor_toolUtilities_roadsideProps.placePoints(opts) end

--- Scatters free meshes at the given points (random shape, yaw, tilt, size and burial) into a pool. Deterministic for opts.seed. Always replaces the pool.
---Source: lua/ge/extensions/editor/toolUtilities/roadsideProps.lua:340
---@param opts table poolId, folder, shapePaths (shapes to choose from), points ({x,y,z}), seed, base (base scale, default 1), var (relative variation, default 0), tiltMax (max tilt in radians, default 0.2), buryBase (default 0.03 m), buryVar (default 0.12), collidable (boolean), outPositions.
---@return integer  Number of pieces placed.
function editor_toolUtilities_roadsideProps.placeScatter(opts) end

--- Number of pieces currently in a pool (0 if empty, not built or burned). O(1) read, usable every frame.
---Source: lua/ge/extensions/editor/toolUtilities/roadsideProps.lua:289
---@param poolId string Pool identifier.
---@return integer  Number of pieces.
function editor_toolUtilities_roadsideProps.poolCount(poolId) end

--- Returns the placed pieces of a pool, for a bake that rereads them from the scene. Read-only.
---Source: lua/ge/extensions/editor/toolUtilities/roadsideProps.lua:295
---@param poolId string Pool identifier.
---@return table|nil  List of scene objects, or nil.
function editor_toolUtilities_roadsideProps.poolList(poolId) end

--- Deletes the pool of pieces placed by the caller (pieces and lights).
---Source: lua/ge/extensions/editor/toolUtilities/roadsideProps.lua:278
---@param poolId string Pool identifier.
function editor_toolUtilities_roadsideProps.removePool(poolId) end

--- Builds (or rebuilds) a line of props along a rail. keepPool adds to the pool instead of replacing it, which allows building a line made of several rails (a parapet interrupted by flights of stairs comes as a few open sections). Spot props (global mode) are placed at regular intervals, with lockEnds to lock both ends and distribute the interior.
---Source: lua/ge/extensions/editor/toolUtilities/roadsideProps.lua:372
---@param opts table poolId, presetKey ('none' = nothing), folder, railPts (at least 2 points), railUps (normals), sideSign, stepM, extraGapM, lockEnds, isLoop, keepPool, ownerTag, outPositions, outLights, rejectFn (returns true to reject a sample).
---@return integer  Number of pieces placed.
function editor_toolUtilities_roadsideProps.runLine(opts) end

