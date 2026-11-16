---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/vehicleMirrors.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- GE extension `core_vehicleMirrors`: draft of mirror reflection rendering. Follows player 0's vehicle, requests its mirror data through the onVehicleMirrorsChanged hook, then contains (renderMirrors) the code that computes the reflection direction and calls veh:renderCameraToMaterial to a 128x128 texture (FOV 70). As is, this rendering is disabled: the call to renderMirrors and to the adjustment UI are commented out in onPreRender. The extension is therefore practically inert.
--- Access: extension `core_vehicleMirrors`: `extensions.load("core_vehicleMirrors")`, then the global `core_vehicleMirrors`
---@class core_vehicleMirrors
core_vehicleMirrors = {}

--- Per-frame hook before rendering: detects a vehicle change of player 0 and triggers a mirror data request (onVehicleMirrorsChanged hook). The mirror rendering itself is commented out.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/vehicleMirrors.lua:108
---@param dtReal number real time (s)
---@param dtSim number simulation time (s)
---@param dtRaw number raw time (s)
function core_vehicleMirrors.onPreRender(dtReal, dtSim, dtRaw) end

--- Hook (emitted by this module): receives the mirror data of the followed vehicle (ignored for another vehicle), stores it and adds to each mirror a userCorrection field (zero vec3).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/vehicleMirrors.lua:128
---@param id integer vehicle
---@param data table mirror table
function core_vehicleMirrors.onVehicleMirrorsChanged(id, data) end

--- Hook: the player changes vehicle (does nothing).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/vehicleMirrors.lua:9
---@param oldVehId integer old vehicle
---@param newVehId integer new vehicle
function core_vehicleMirrors.onVehicleSwitched(oldVehId, newVehId) end

