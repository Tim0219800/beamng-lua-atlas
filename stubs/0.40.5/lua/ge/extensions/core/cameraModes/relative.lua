---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/cameraModes/relative.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Relative mode. Fields: pos (vec3 vehicle frame), rot (vec3 degrees), slots, lightIntensity, nearClip (nil = level), manualzoom, camMaxDist.
---@class core_cameraModes_relative
local core_cameraModes_relative = {}

--- Applies an intensity (>= 0) to the camera light, creating it if needed.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/cameraModes/relative.lua:48
---@param intensity number|nil lumens; nil = keeps the current value
function core_cameraModes_relative:_updateLight(intensity) end

--- Restores the state from serialize.
---Source: lua/ge/extensions/core/cameraModes/relative.lua:202
---@param s table serialize table
function core_cameraModes_relative:deserialize(s) end

--- Slot keyboard shortcut; ignored without focus.
---Source: lua/ge/extensions/core/cameraModes/relative.lua:236
---@param hotkey integer slot number
---@param modifier integer 0 = load, 1 = save
function core_cameraModes_relative:hotkey(hotkey, modifier) end

--- Default values (resetCameraOnVehicleReset = false, disabledByDefault, canUseVehicleTriggerCrosshair) then onVehicleCameraConfigChanged and reset.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/cameraModes/relative.lua:23
function core_cameraModes_relative:init() end

--- UI settings: light, nearClip, slots, fov.
---Source: lua/ge/extensions/core/cameraModes/relative.lua:214
---@return table[]  descriptors
function core_cameraModes_relative:listParams() end

--- Loads a slot; UI message if empty.
---Source: lua/ge/extensions/core/cameraModes/relative.lua:159
---@param slot integer|string slot number or name
---@return boolean  true if loaded
function core_cameraModes_relative:loadSlot(slot) end

--- Hook: on focus gain, adds the menus and turns the light back on; on loss, turns the light off.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/cameraModes/relative.lua:250
---@param focused boolean true if the mode takes focus
function core_cameraModes_relative:onCameraChanged(focused) end

--- Hook: guarantees refNodes (default 0,1,2) and schedules the camera recomputation.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/cameraModes/relative.lua:39
function core_cameraModes_relative:onVehicleCameraConfigChanged() end

--- Returns to the initial position and rotation and recreates the smoothers.
---Source: lua/ge/extensions/core/cameraModes/relative.lua:259
function core_cameraModes_relative:reset() end

--- Restores the light stored by storeLightInfo.
---Source: lua/ge/extensions/core/cameraModes/relative.lua:143
function core_cameraModes_relative:restoreLightInfo() end

--- Saves position, rotation and FOV in the given slot.
---Source: lua/ge/extensions/core/cameraModes/relative.lua:150
---@param slot integer slot number (1 to 10)
function core_cameraModes_relative:saveSlot(slot) end

--- Adds the quickAccess radial menu entries (light, nearClip, slots) while the camera has focus.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/cameraModes/relative.lua:64
function core_cameraModes_relative:sendMenus() end

--- State for video stream views: pos, rot, fov, light, nearClip.
---Source: lua/ge/extensions/core/cameraModes/relative.lua:192
---@return table  state
function core_cameraModes_relative:serialize() end

--- Sets the manual zoom FOV.
---Source: lua/ge/extensions/core/cameraModes/relative.lua:178
---@param fov number degrees
function core_cameraModes_relative:setFOV(fov) end

--- Limits the distance from the ref node.
---Source: lua/ge/extensions/core/cameraModes/relative.lua:269
---@param d number|nil meters, nil = unlimited
function core_cameraModes_relative:setMaxDistance(d) end

--- Sets the camera position in the vehicle frame.
---Source: lua/ge/extensions/core/cameraModes/relative.lua:186
---@param pos vec3 relative position
function core_cameraModes_relative:setOffset(pos) end

--- Changes light, nearClip, fov or slots (saves or loads the given slot).
---Source: lua/ge/extensions/core/cameraModes/relative.lua:226
---@param key string light, nearClip, fov, slots
---@param value any new value
function core_cameraModes_relative:setParam(key, value) end

--- Sets the vehicle's reference nodes.
---Source: lua/ge/extensions/core/cameraModes/relative.lua:389
---@param centerNodeID integer center node
---@param leftNodeID integer left node
---@param backNodeID integer rear node
function core_cameraModes_relative:setRefNodes(centerNodeID, leftNodeID, backNodeID) end

--- Sets the camera rotation.
---Source: lua/ge/extensions/core/cameraModes/relative.lua:182
---@param rot vec3 x yaw, y pitch, z roll in degrees
function core_cameraModes_relative:setRotation(rot) end

--- Stores the intensity and turns the light off.
---Source: lua/ge/extensions/core/cameraModes/relative.lua:245
function core_cameraModes_relative:storeLightInfo() end

--- Integrates the inputs, moves the camera in the vehicle frame and writes data.res (pos, rot, nearClip); positions the light.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/cameraModes/relative.lua:273
---@param data table camData
---@return boolean  false if the nodes are degenerate, otherwise true
function core_cameraModes_relative:update(data) end

