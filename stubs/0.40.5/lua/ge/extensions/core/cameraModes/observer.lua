---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/cameraModes/observer.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Observer camera.
---@class core_cameraModes_observer
local core_cameraModes_observer = {}

--- isGlobal = true, hidden = true, no associated camera object.
---Source: lua/ge/extensions/core/cameraModes/observer.lua:8
function core_cameraModes_observer:init() end

--- Hook: when this mode takes focus, sends onCameraNameChanged to the UI and the hook onCameraModeChanged('observer'); on losing it, reloads the 'scenario' apps layout and forgets the camera.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/cameraModes/observer.lua:98
---@param focused boolean true if the mode takes focus
function core_cameraModes_observer:onCameraChanged(focused) end

--- Hook: forgets the camera if the scenario disappears.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/cameraModes/observer.lua:111
---@param scenario table|nil new scenario
function core_cameraModes_observer:onScenarioChange(scenario) end

--- Hook: forgets the associated camera.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/cameraModes/observer.lua:108
function core_cameraModes_observer:onScenarioRestarted() end

--- Chooses the camera object (by its name), restarts the blend and restores the normal simulation speed.
---Source: lua/ge/extensions/core/cameraModes/observer.lua:84
---@param cam any
---@param targetOverride string|nil name of a scenetree object to aim at instead of the vehicle
function core_cameraModes_observer:setCamera(cam, targetOverride) end

--- Called by setGlobalCameraByName when switching to this mode: calls setCamera(customData.cam, customData.targetOverride).
---Source: lua/ge/extensions/core/cameraModes/observer.lua:80
---@param customData table {cam = camera object, targetOverride = name of the object to aim at}
function core_cameraModes_observer:setCustomData(customData) end

--- Computes position, rotation and FOV from the camera object; position blend toward PositionMove at speed blendSpeed (50).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/cameraModes/observer.lua:17
---@param data table camData
---@return boolean|nil  true if applied; nil without an associated camera
function core_cameraModes_observer:update(data) end

