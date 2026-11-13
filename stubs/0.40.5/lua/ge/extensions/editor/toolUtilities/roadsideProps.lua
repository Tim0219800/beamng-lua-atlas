---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/roadsideProps.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_toolUtilities_roadsideProps` : `extensions.load("editor_toolUtilities_roadsideProps")`, puis la globale `editor_toolUtilities_roadsideProps`
---@class editor_toolUtilities_roadsideProps
---@field presets table
editor_toolUtilities_roadsideProps = {}

--- The stock-art presets above are all a roadside tool asks for. The kit-baked furniture and civic pieces are cut by the
---  prop kit, which is not part of a release, so they live over there and register themselves through here.
---Source : lua/ge/extensions/editor/toolUtilities/roadsideProps.lua:517
---@param t any
function editor_toolUtilities_roadsideProps.addPresets(t) end

--- Point-prop declustering.
---Source : lua/ge/extensions/editor/toolUtilities/roadsideProps.lua:244
---@param minGap any
function editor_toolUtilities_roadsideProps.beginPointBatch(minGap) end

--- Burn: flip one pool's transient props, and the lights its lamps throw, to persistent (canSave=true) and detach them from
---  the pool.
---Source : lua/ge/extensions/editor/toolUtilities/roadsideProps.lua:301
---@param poolId any
function editor_toolUtilities_roadsideProps.commitPool(poolId) end

---Source : lua/ge/extensions/editor/toolUtilities/roadsideProps.lua:248
function editor_toolUtilities_roadsideProps.endPointBatch() end

--- The light record (see siteLights) for a lamp preset standing at (px, py, pz) turned by `q`, or nil for a preset that is
---  not a lamp. `scale`, `col`, `bright` and `reach` are optional, the last three overriding the catalogue's.
---Source : lua/ge/extensions/editor/toolUtilities/roadsideProps.lua:210
---@param presetKey any
---@param px any
---@param py any
---@param pz any
---@param q any
---@param scale any
---@param col any
---@param bright any
---@param reach any
function editor_toolUtilities_roadsideProps.lampLight(presetKey, px, py, pz, q, scale, col, bright, reach) end

--- The rotation a placement gets (see orient), for a tool that stands its own pieces. Shared: use or copy before the next call.
---Source : lua/ge/extensions/editor/toolUtilities/roadsideProps.lua:179
---@param along any
---@param up any
---@param preIdx any
---@param sideSign any
function editor_toolUtilities_roadsideProps.orientation(along, up, preIdx, sideSign) end

--- Place a preset at each supplied world point. `keepPool` and `ownerTag` work as they do in runLine.
---  A point may carry `scl` (a number, or {x,y,z} in the piece's frame) to fit that one instance.
---Source : lua/ge/extensions/editor/toolUtilities/roadsideProps.lua:314
---@param opts any
function editor_toolUtilities_roadsideProps.placePoints(opts) end

--- Scatter loose meshes at world points (random shape, yaw, lean, size, burial), into a pool. Deterministic in opts.seed.
---    poolId, folder, shapePaths, points ({x=,y=,z=}), seed, base, var, tiltMax, buryBase, buryVar, collidable, outPositions
---Source : lua/ge/extensions/editor/toolUtilities/roadsideProps.lua:340
---@param opts any
function editor_toolUtilities_roadsideProps.placeScatter(opts) end

--- Number of placed pieces currently in a pool (0 if empty / not built / committed). O(1) array length -- cheap enough to read
---  every frame for a stats readout.
---Source : lua/ge/extensions/editor/toolUtilities/roadsideProps.lua:289
---@param poolId any
function editor_toolUtilities_roadsideProps.poolCount(poolId) end

--- A pool's placed pieces, for a bake reading them back off the scene. Read only.
---Source : lua/ge/extensions/editor/toolUtilities/roadsideProps.lua:295
---@param poolId any
function editor_toolUtilities_roadsideProps.poolList(poolId) end

--- Deletes a caller's pool of placed pieces.
---Source : lua/ge/extensions/editor/toolUtilities/roadsideProps.lua:278
---@param poolId any
function editor_toolUtilities_roadsideProps.removePool(poolId) end

--- Build (or rebuild) one line of props along a rail. `keepPool` adds to the pool instead of replacing it, which is how
---  a run made of several rails is built -- a parapet broken by its flights arrives as a handful of open spans.
---Source : lua/ge/extensions/editor/toolUtilities/roadsideProps.lua:372
---@param opts any
function editor_toolUtilities_roadsideProps.runLine(opts) end

