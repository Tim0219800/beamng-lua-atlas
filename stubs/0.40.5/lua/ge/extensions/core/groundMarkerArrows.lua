---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/groundMarkerArrows.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- GE extension `core_groundMarkerArrows`: manages the large floating arrows displayed at the intersections of the navigation route (model s_mm_arrow_floating.dae, TSStatic objects in the SimGroup 'arrowPool'). It is driven by core_groundMarkers (createArrowPool, updateArrows, clearArrows); a modder normally does not need to call it directly. It also displays the "wrong way" message when the vehicle moves away from the path.
--- Access: extension `core_groundMarkerArrows`: `extensions.load("core_groundMarkerArrows")`, then the global `core_groundMarkerArrows`
---@class core_groundMarkerArrows
core_groundMarkerArrows = {}

--- Deletes all arrow objects and the SimGroup 'arrowPool', clears the tracking tables and resets the wrong way counter to -20.
---Source: lua/ge/extensions/core/groundMarkerArrows.lua:29
function core_groundMarkerArrows.clearArrows() end

--- Creates the SimGroup 'arrowPool' with 11 hidden TSStatic arrows (no collision, canSave = false) and their proxies. If the pool already exists, resets all proxies to 'unused' and hides the arrows.
---Source: lua/ge/extensions/core/groundMarkerArrows.lua:50
---@param floatingArrowColor number[]|nil Unused (the color comes from core_groundMarkers.floatingArrowColor).
function core_groundMarkerArrows.createArrowPool(floatingArrowColor) end

--- Engine exit hook: alias of clearArrows.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/groundMarkerArrows.lua:29
function core_groundMarkerArrows.onExit() end

--- Render hook: applies to each non-'unused' arrow its position, rotation and scale (smoothed size x alpha) and fades arrows to the 'unused' state once invisible. Hides everything in photo mode.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/groundMarkerArrows.lua:246
---@param dt number Render time delta in seconds.
function core_groundMarkerArrows.onPreRender(dt) end

--- Updates the arrows from the path: creates/reuses those of the intersections to guide, fades out those that are no longer useful, and handles the wrong way message.
---Source: lua/ge/extensions/core/groundMarkerArrows.lua:122
---@param path table[] Router path: elements {pos = vec3, distToTarget, wp, linkCount}.
---@param pathLength number Total distance from the vehicle to the destination in meters (distToVehicle = pathLength - path[i].distToTarget).
function core_groundMarkerArrows.updateArrows(path, pathLength) end

