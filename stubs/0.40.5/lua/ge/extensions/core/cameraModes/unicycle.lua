---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/cameraModes/unicycle.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Pedestrian camera mode. Fields: pos (vec3), rotVec (vec3 degrees, y = 180 to look horizontally).
---@class core_cameraModes_unicycle
local core_cameraModes_unicycle = {}

--- Current position and rotation of the camera.
---Source: lua/ge/extensions/core/cameraModes/unicycle.lua:164
---@return vec3  position
---@return quat  rotation
function core_cameraModes_unicycle:getPosRot() end

--- Prepares the zoom smoothing and reads the settings.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/cameraModes/unicycle.lua:20
function core_cameraModes_unicycle:init() end

--- Hook: loads or leaves the "unicycle" interface layout (see notes).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/cameraModes/unicycle.lua:33
---@param focused boolean true if the mode takes focus
function core_cameraModes_unicycle:onCameraChanged(focused) end

--- Hook: re-reads the OpenXR snap turn settings.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/cameraModes/unicycle.lua:28
function core_cameraModes_unicycle:onSettingsChanged() end

--- Resets the zoom smoothing to zero.
---Source: lua/ge/extensions/core/cameraModes/unicycle.lua:47
function core_cameraModes_unicycle:reset() end

--- Sets the initial position and/or orientation; called by setGlobalCameraByName.
---Source: lua/ge/extensions/core/cameraModes/unicycle.lua:153
---@param customData table|nil pos (vec3, brought to eye level), front and up (vec3, starting direction)
function core_cameraModes_unicycle:setCustomData(customData) end

--- Applies rotation, zoom and position, and sends the rotation to the player's controller.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/cameraModes/unicycle.lua:173
---@param data table camData (data.unicycleZoom, data.player read)
---@return boolean  true
function core_cameraModes_unicycle:update(data) end

