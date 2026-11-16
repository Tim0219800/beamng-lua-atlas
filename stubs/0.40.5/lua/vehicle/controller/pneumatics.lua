---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/pneumatics.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Simple pneumatic suspension/cylinder auxiliary controller (type "auxiliary"): it drives the pressure of "pressurized" beams (obj:setBeamPressureRel) grouped into named groups, with named pressure levels (minPressure, maxPressure, defaultPressure...), rise/fall speeds and inflation/deflation sounds. Unlike pneumatics/actuators, no gas physics or tank is modeled: the pressure simply follows the target at a limited speed. The public functions are called from inputs or other controllers with a list of group names.
--- Access: controller `pneumatics` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_pneumatics
---@field type string "auxiliary".
local controller_pneumatics = {}

--- Builds the beam groups from the jbeam tables and the pressure levels.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/pneumatics.lua:245
---@param jbeamData table Controller jbeam data.
function controller_pneumatics.init(jbeamData) end

--- Creates the rise/fall sound sources of each group. Called by the controller manager.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/pneumatics.lua:317
---@param jbeamData table Controller jbeam data.
function controller_pneumatics.initSounds(jbeamData) end

--- Indicates whether all beams of a group are exactly at the named pressure level.
---Source: lua/vehicle/controller/pneumatics.lua:167
---@param groupName string Group name.
---@param levelName string Level name (e.g. "maxPressure").
---@return boolean  True if the group is at this level; also false if the group does not exist.
function controller_pneumatics.isBeamGroupAtPressureLevel(groupName, levelName) end

--- Returns all beams to their default pressure.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/pneumatics.lua:235
function controller_pneumatics.reset() end

--- Cuts the sound volume and resets their state.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/pneumatics.lua:344
function controller_pneumatics.resetSounds() end

--- Targets the default pressure (defaultPressure) of the groups.
---Source: lua/vehicle/controller/pneumatics.lua:104
---@param groupNames string[] Beam group names (groupName of the pressurized beams table).
function controller_pneumatics.setBeamDefault(groupNames) end

--- Targets the maximum pressure (maxPressure) of the groups.
---Source: lua/vehicle/controller/pneumatics.lua:100
---@param groupNames string[] Beam group names (groupName of the pressurized beams table).
function controller_pneumatics.setBeamMax(groupNames) end

--- Targets the minimum pressure (minPressure) of the groups.
---Source: lua/vehicle/controller/pneumatics.lua:96
---@param groupNames string[] Beam group names (groupName of the pressurized beams table).
function controller_pneumatics.setBeamMin(groupNames) end

--- Enables/disables the continuous pressure decrease of the groups; disables the increase.
---Source: lua/vehicle/controller/pneumatics.lua:147
---@param groupNames string[] Beam group names (groupName of the pressurized beams table).
---@param enabled boolean True to decrease.
function controller_pneumatics.setBeamMomentaryDecrease(groupNames, enabled) end

--- Enables/disables the continuous pressure increase of the groups (as long as enabled is true); disables the decrease.
---Source: lua/vehicle/controller/pneumatics.lua:127
---@param groupNames string[] Beam group names (groupName of the pressurized beams table).
---@param enabled boolean True to increase.
function controller_pneumatics.setBeamMomentaryIncrease(groupNames, enabled) end

--- Directly sets the target pressure of the groups, bounded by the min and max of each beam.
---Source: lua/vehicle/controller/pneumatics.lua:61
---@param groupNames string[] Beam group names (groupName of the pressurized beams table).
---@param pressure number Target pressure in PSI.
function controller_pneumatics.setBeamPressure(groupNames, pressure) end

--- Targets a named pressure level (beam key, e.g. "maxPressure" or a level defined in pressureLevels).
---Source: lua/vehicle/controller/pneumatics.lua:90
---@param groupNames string[] Beam group names (groupName of the pressurized beams table).
---@param pressureName string Name of the pressure level.
function controller_pneumatics.setBeamPressureLevel(groupNames, pressureName) end

--- For each group: switches to the minimum if everything is at the maximum, otherwise to the maximum.
---Source: lua/vehicle/controller/pneumatics.lua:108
---@param groupNames string[] Beam group names (groupName of the pressurized beams table).
function controller_pneumatics.toggleBeamMinMax(groupNames) end

--- Every frame: applies the momentary increases/decreases, advances the current pressure toward the target at a limited speed and handles stopping the sounds.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/pneumatics.lua:181
---@param dt number Time step (s).
function controller_pneumatics.updateGFX(dt) end

return controller_pneumatics
