---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/cameraModes/pacenoteOrbit.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Orbit around a point. Fields: fixedTargetPos, fov, camRot (vec3 degrees: x yaw, y pitch), camDist, defaultDistance, camMinDist, camMaxDist.
---@class core_cameraModes_pacenoteOrbit
local core_cameraModes_pacenoteOrbit = {}

--- isGlobal = true, FOV 65, then setupStuff, onSettingsChanged, reset.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/cameraModes/pacenoteOrbit.lua:10
function core_cameraModes_pacenoteOrbit:init() end

--- Hook: re-reads the cameraOrbit* settings (fovModifier, relaxation, maxDynamicFov, maxDynamicPitch, maxDynamicOffset, smoothing).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/cameraModes/pacenoteOrbit.lua:35
function core_cameraModes_pacenoteOrbit:onSettingsChanged() end

--- Dead code (see notes).
---Source: lua/ge/extensions/core/cameraModes/pacenoteOrbit.lua:45
function core_cameraModes_pacenoteOrbit:reset() end

--- Changes defaultDistance (without modifying the current distance camDist).
---Source: lua/ge/extensions/core/cameraModes/pacenoteOrbit.lua:56
---@param d number meters
function core_cameraModes_pacenoteOrbit:setDefaultDistance(d) end

--- Sets the point to orbit around; only center is used.
---Source: lua/ge/extensions/core/cameraModes/pacenoteOrbit.lua:52
---@param center vec3 world target point
---@param left any ignored
---@param back any ignored
function core_cameraModes_pacenoteOrbit:setRef(center, left, back) end

--- Sets default rotation (0, -17, 0), distance limits 10-1500 m and default distance 300 m.
---Source: lua/ge/extensions/core/cameraModes/pacenoteOrbit.lua:22
function core_cameraModes_pacenoteOrbit:setupStuff() end

--- Computes the orbital position, clips it to the terrain and writes data.res (collisionCompatible = true).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/cameraModes/pacenoteOrbit.lua:60
---@param data table camData
---@return boolean  true
function core_cameraModes_pacenoteOrbit:update(data) end

