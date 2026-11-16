---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/cameraModes/transition.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Transition filter.
---@class core_cameraModes_transition
local core_cameraModes_transition = {}

--- Says whether the blend is allowed between two points: always for a "camera"-type request (false), otherwise only if distance <= 100 m and mutual visibility (static rays).
---Source: lua/ge/extensions/core/cameraModes/transition.lua:29
---@param origin vec3 position of the new camera
---@param target vec3 position of the old camera
---@return boolean  true if allowed
function core_cameraModes_transition:canTransition(origin, target) end

--- isGlobal, isFilter, hidden, runningOrder 0.2, initial state and settings reading.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/cameraModes/transition.lua:8
function core_cameraModes_transition:init() end

--- Hook: re-reads cameraTransitionTime and cameraVehicleTransitionTime (milliseconds).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/cameraModes/transition.lua:22
function core_cameraModes_transition:onSettingsChanged() end

--- Requests a blend from the last pose; it starts on the next frame.
---Source: lua/ge/extensions/core/cameraModes/transition.lua:102
---@param isVehicleSwitch boolean true for a vehicle change (vehicle duration, visibility test)
---@param camPathTransitionData table|nil camera path transition data (with callback(res))
---@param duration number|nil duration in seconds that replaces the configured duration for this transition
function core_cameraModes_transition:start(isVehicleSwitch, camPathTransitionData, duration) end

--- Records the pose or applies the blend to data.res.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/cameraModes/transition.lua:39
---@param data table camData
---@return boolean  true
function core_cameraModes_transition:update(data) end

