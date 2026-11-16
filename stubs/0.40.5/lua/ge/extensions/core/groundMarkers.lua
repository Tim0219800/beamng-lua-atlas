---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/groundMarkers.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- GE extension `core_groundMarkers`: ground navigation. Computes a route (route planner) from the player vehicle to one or more points, draws blue arrow decals on the road ahead of the vehicle (rendered by DynamicDecalMgr), updates the floating arrows at intersections (core_groundMarkerArrows) and sends the path to the UI (navigation app). A modder uses it to guide the player to a destination: setPath(points).
--- Access: extension `core_groundMarkers`: `extensions.load("core_groundMarkers")`, then the global `core_groundMarkers`
---@class core_groundMarkers
---@field colorSet string Active color set: 'blue' (default) or 'green' (keys of colorSets).
---@field colorSets table<string, {decals: number[], arrows: number[]}> RGB colors 0..1 of the decals and arrows: blue {0,0.4,1}/{0,0.48,0.77}, green {0,1,0}/{0,1,0}.
---@field debugPath boolean true = draws the path points (spheres, prisms, numbers) on each render. False by default.
---@field decalBlendEnd number 100 m: distance from which opacity decreases toward 0 at decalDrawingDistance.
---@field decalBlendOffset number 1 m: distance under which the decals are invisible.
---@field decalBlendStart number 10 m: distance from which opacity is full.
---@field decalDrawingDistance number 120: maximum distance of the decals ahead of the vehicle, in meters.
---@field decalPool table[] Pool of decal data reused every frame (fields texture, position, forwardVec, color, scale, fadeStart, fadeEnd).
---@field decalPoolCount integer Number of entries in decalPool.
---@field dependencies string[] {'core_groundMarkerArrows'}.
---@field routePlanner table Instance of gameplay/route/route (path computation, trackVehicle, path[] with pos, distToTarget, wp, linkCount).
core_groundMarkers = {}

--- Indicates whether a path is active.
---Source: lua/ge/extensions/core/groundMarkers.lua:396
---@return boolean  true if a destination is set.
function core_groundMarkers.currentlyHasTarget() end

--- Fills the decal pool along the path from the given position (up to decalDrawingDistance) with the computed opacity, then updates the floating arrows if the setting is enabled. Called on every render by onPreRender.
---Source: lua/ge/extensions/core/groundMarkers.lua:142
---@param startPos vec3 Start position (player vehicle or camera).
function core_groundMarkers.generateRouteDecals(startPos) end

--- Remaining path length to the destination, from distToTarget of the first point.
---Source: lua/ge/extensions/core/groundMarkers.lua:45
---@return number  Meters; math.huge if an asynchronous computation is in progress; 0 if there is no path.
function core_groundMarkers.getPathLength() end

--- First remaining destination as provided to setPath.
---Source: lua/ge/extensions/core/groundMarkers.lua:399
---@return vec3|string|table|nil  Destination (may be a node name) or nil.
function core_groundMarkers.getTargetPos() end

--- Mission state change hook: clears the path when the state is 'started' or 'stopped'.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/groundMarkers.lua:426
---@param state string Mission state.
function core_groundMarkers.onAnyMissionChanged(state) end

--- Level end hook: calls resetAll.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/groundMarkers.lua:384
function core_groundMarkers.onClientEndMission() end

--- Extension unload hook: calls resetAll.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/groundMarkers.lua:388
function core_groundMarkers.onExtensionUnloaded() end

--- Render hook: tracks the vehicle on the path, regenerates the decals if needed, draws the debug, adds the decals to Engine.Render.DynamicDecalMgr and sends the path to the UI every 0.25 s. Does nothing without a destination or in photo mode.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/groundMarkers.lua:185
---@param dt number Render time delta in seconds.
function core_groundMarkers.onPreRender(dt) end

--- Hook before extensions reload: removes the arrows; returns nothing.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/groundMarkers.lua:392
function core_groundMarkers.onSerialize() end

--- Settings change hook: creates or removes the floating arrows according to showNavigationArrows and forces the decals to regenerate according to showNavigationGroundmarkers.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/groundMarkers.lua:405
function core_groundMarkers.onSettingsChanged() end

--- Clears the path (setPath(nil)), resets the router parameters and removes the arrows.
---Source: lua/ge/extensions/core/groundMarkers.lua:367
function core_groundMarkers.resetAll() end

--- Sends the current path to the UI: guihooks 'NavigationGroundMarkersUpdate' {markers = flat x,y, color = '#RRGGBBFF'}.
---Source: lua/ge/extensions/core/groundMarkers.lua:234
function core_groundMarkers.sendToApp() end

--- Deprecated: old API converted to options for setPath (warning logged once). The parameters _fadeStart, _fadeEnd, _endPos, _disableVeh are ignored.
---Source: lua/ge/extensions/core/groundMarkers.lua:354
---@param wp any Destination(s), like setPath.
---@param step number|nil Decal spacing.
---@param _fadeStart any Ignored.
---@param _fadeEnd any Ignored.
---@param _endPos any Ignored.
---@param _disableVeh any Ignored.
---@param _color number[]|nil RGB color.
---@param _cutOffDrivability number|nil See setPath.
---@param _penaltyAboveCutoff number|nil See setPath.
---@param _penaltyBelowCutoff number|nil See setPath.
---@param _renderDecals boolean|nil See setPath.
function core_groundMarkers.setFocus(wp, step, _fadeStart, _fadeEnd, _endPos, _disableVeh, _color, _cutOffDrivability, _penaltyAboveCutoff, _penaltyBelowCutoff, _renderDecals) end

--- Sets (or clears) the navigation route to one or more points. Resets the decal pool, computes the path from the player vehicle's (or camera's) position, creates the arrows and notifies the UI.
---Source: lua/ge/extensions/core/groundMarkers.lua:249
---@param wp vec3|string|table|table[]|nil Destination(s): vec3, map node name, {x,y,z}, or list of these. nil clears.
---@param options table|nil See notes: step, color, cutOffDrivability, penaltyAboveCutoff, penaltyBelowCutoff, dirMult, wD, wZ, renderDecals, lockFixedNodes, clearPathOnReachingTarget, async, onComplete.
function core_groundMarkers.setPath(wp, options) end

--- Removes the first destination from the list (waypoint reached) and the corresponding fixed node marking in the router; if there are none left, clears everything.
---Source: lua/ge/extensions/core/groundMarkers.lua:333
---@return boolean  false if there was no active path, otherwise true.
function core_groundMarkers.unflagFirstFixedNode() end

