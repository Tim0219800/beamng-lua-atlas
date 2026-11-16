---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/cameraModes/partFocus.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Part framing mode. Fields: camRot, targetPos, currentPos, targetDistance, currentDistance, fov, transitionElapsed/Duration, hopDistance.
---@class core_cameraModes_partFocus
local core_cameraModes_partFocus = {}

--- Default values (see notes).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/cameraModes/partFocus.lua:21
function core_cameraModes_partFocus:init() end

--- Forgets the current offset and distance (next update: jump) and resets the orbit to default.
---Source: lua/ge/extensions/core/cameraModes/partFocus.lua:83
function core_cameraModes_partFocus:reset() end

--- Prepares the switch to the next part: snap jumps directly (when the global camera transition does the blend); otherwise the view glides from its current position over duration, with a faster start if brisk. During the glide the camera pulls back in proportion to the distance traveled (up to 6 m).
---Source: lua/ge/extensions/core/cameraModes/partFocus.lua:53
---@param snap boolean direct jump without gliding
---@param duration number|nil seconds (min 0.001)
---@param brisk boolean|nil fast acceleration curve
function core_cameraModes_partFocus:retarget(snap, duration, brisk) end

--- Sets the target distance, clamped to [0.6, 80] m.
---Source: lua/ge/extensions/core/cameraModes/partFocus.lua:77
---@param d number|nil meters (> 0)
function core_cameraModes_partFocus:setDefaultDistance(d) end

--- Sets the aimed point; if the part moved more than 5 m at once outside a glide (vehicle reset/teleport), the view jumps to it.
---Source: lua/ge/extensions/core/cameraModes/partFocus.lua:66
---@param pos vec3|nil world point; nil is ignored
function core_cameraModes_partFocus:setRef(pos) end

--- Calls extensions.core_vehicle_partFocusCamera.updateTarget(dt, self), smooths the position, handles orbit/zoom and writes data.res.pos/rot/fov.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/cameraModes/partFocus.lua:90
---@param data table camData
---@return boolean  true while the core_vehicle_partFocusCamera driver is active, otherwise false
function core_cameraModes_partFocus:update(data) end

