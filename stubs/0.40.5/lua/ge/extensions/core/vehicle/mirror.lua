---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/vehicle/mirror.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- GE extension `core_vehicle_mirror`: adjustment of a vehicle's mirror angles. Reads the mirror list from vdata.mirrors, applies an angle offset (offsetNormal) to the mirrors through veh:getMirror(id), stores the settings per model and per config in settings/mirrorOffsets.json, reapplies them each time the vehicle spawns, handles mouse dragging (vehicleEvent) and moves the driver camera to a mirror (focusOnMirror). Also contains a small ImGui debug window.
--- Access: extension `core_vehicle_mirror`: `extensions.load("core_vehicle_mirror")`, then the global `core_vehicle_mirror`
---@class core_vehicle_mirror
---@field dependencies string[] {'ui_imgui', 'core_vehicle_configTarget'}
---@field onClientEndMission nil Equals nil (undefined local variable, see notes).
---@field onExtensionUnloaded nil Equals nil (undefined local variable, see notes).
core_vehicle_mirror = {}

--- Switches to the driver camera and, if the mirror is outside the field of view, orients the camera (relativeYaw/relativePitch) toward it. Without a name, restores the orientation from before the focus.
---Source: lua/ge/extensions/core/vehicle/mirror.lua:250
---@param mirror_name string|nil mirror mesh name; nil = return to the previous orientation
function core_vehicle_mirror.focusOnMirror(mirror_name) end

--- Lists the vehicle's mirrors with their current angle offset (stored setting or 0) and their limits.
---Source: lua/ge/extensions/core/vehicle/mirror.lua:73
---@param vid integer|nil vehicle id; nil = that of `v`
---@param v userdata|nil vehicle object; nil = configured vehicle
---@return table<string, table>  [meshName] = {name, id, angleOffset = {x, z}, clampX, clampZ, position (UiColumn), icon, row (UiRow), label}; {} if no mirrors
function core_vehicle_mirror.getAnglesOffset(vid, v) end

--- Hook: restores the debug window and recomputes the screen ratio.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/vehicle/mirror.lua:49
---@param data table data from onSerialize
function core_vehicle_mirror.onDeserialized(data) end

--- Hook: loads the settings from settings/mirrorOffsets.json.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/vehicle/mirror.lua:297
function core_vehicle_mirror.onExtensionLoaded() end

--- Hook: saves the open state of the debug window.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/vehicle/mirror.lua:43
---@return table  {windowOpen}
function core_vehicle_mirror.onSerialize() end

--- Hook: recomputes the mouse degrees/pixel ratio from the resolution (20° over the average of width+height).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/vehicle/mirror.lua:54
function core_vehicle_mirror.onSettingsChanged() end

--- Per-frame hook: applies the ongoing mouse drag and shows the debug window if open.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/vehicle/mirror.lua:166
---@param dtReal number real time (s)
---@param dtSim number simulation time (s)
---@param dtRaw number raw time (s)
function core_vehicle_mirror.onUpdate(dtReal, dtSim, dtRaw) end

--- Hook: a vehicle is destroyed (does nothing).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/vehicle/mirror.lua:59
---@param vid integer vehicle
function core_vehicle_mirror.onVehicleDestroyed(vid) end

--- Hook: a vehicle spawns; reapplies the stored settings of all its mirrors.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/vehicle/mirror.lua:62
---@param vid integer vehicle
---@param veh userdata vehicle object
function core_vehicle_mirror.onVehicleSpawned(vid, veh) end

--- Applies an angle offset to a mirror (offsetNormal = (0,1,0) rotated by x and z) and stores the setting for the model/config.
---Source: lua/ge/extensions/core/vehicle/mirror.lua:119
---@param mirrorName string mirror mesh name
---@param x number X angle in degrees
---@param z number Z angle in degrees
---@param v userdata|nil vehicle; nil = configured vehicle
---@param save boolean|nil true: writes settings/mirrorOffsets.json
function core_vehicle_mirror.setAngleOffset(mirrorName, x, z, v, save) end

--- Opens or closes the "core_vehicle_mirror Debugger" ImGui window (X/Z sliders per mirror).
---Source: lua/ge/extensions/core/vehicle/mirror.lua:215
---@param newValue boolean true to open
function core_vehicle_mirror.setDebug(newValue) end

--- Mouse event on a mirror in the world: 'onDown' starts a drag adjustment, 'onUp' ends it and saves. Any other value: error log.
---Source: lua/ge/extensions/core/vehicle/mirror.lua:223
---@param evtType string 'onDown' or 'onUp'
---@param vid integer vehicle
---@param mirror_name string mirror mesh name
function core_vehicle_mirror.vehicleEvent(evtType, vid, mirror_name) end

