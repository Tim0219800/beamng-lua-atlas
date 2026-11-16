---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/cameraModes/autozoom.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Filter object returned by the constructor. Fields: steps, fov, baseFov, userFov, mustReset, fovSmoother, smooth.
---@class core_cameraModes_autozoom
local core_cameraModes_autozoom = {}

--- Computes the FOV for a distance: chooses the step, adds the user's manual correction (2.5 * dt * (zoomIn - zoomOut) * current FOV, clamped) then smooths toward the target (instant if mustReset).
---Source: lua/ge/extensions/core/cameraModes/autozoom.lua:37
---@param distance number Camera-target distance (m)
---@param dt number Time step (s)
---@return number  FOV in degrees
function core_cameraModes_autozoom:getFov(distance, dt) end

--- Initializes (or reinitializes) the filter: chooses the FOV smoother (default newTemporalSpring(30, 10)), resets mustReset, fov=60, userFov=0 and the default steps. Can be called again to change the smoother.
---Source: lua/ge/extensions/core/cameraModes/autozoom.lua:8
---@param smoother table|nil Temporal smoother (get/getUncapped, set); keeps the current one by default
function core_cameraModes_autozoom:init(smoother) end

--- Cancels the user's manual zoom (userFov = 0), numpad keys 9/3.
---Source: lua/ge/extensions/core/cameraModes/autozoom.lua:65
function core_cameraModes_autozoom:reset() end

--- Computes the distance between data.res.targetPos and data.res.pos and writes data.res.fov. Called by the owning camera.
---Source: lua/ge/extensions/core/cameraModes/autozoom.lua:68
---@param data table Frame data: dt, res {pos, targetPos, fov}
---@return boolean  Always true
function core_cameraModes_autozoom:update(data) end

