---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/hydraulicSuspension.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Auxiliary hydraulic suspension controller (type "auxiliary"): drives the reference length of beams (suspension cylinders) grouped into named groups. A virtual pump limits the extension speed; lowering is done at a fixed speed; in "bleed" mode the beam is released (zero spring, variable damping) and follows freely. It also plays the pump and release sounds. A modder calls setGroupsPosition / setGroupsBleed / setGroupsMomentaryIncrease from inputs or other controllers.
--- Access: controller `hydraulicSuspension` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_hydraulicSuspension
---@field type string "auxiliary".
local controller_hydraulicSuspension = {}

--- Returns the state of all beams for saving/synchronization.
---Source: lua/vehicle/controller/hydraulicSuspension.lua:238
---@return table<string, number>  State table (reused).
function controller_hydraulicSuspension.getState() end

--- Builds the beam groups from the jbeam hydraulic table, stores the pump parameters.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/hydraulicSuspension.lua:166
---@param jbeamData table Controller jbeam data.
function controller_hydraulicSuspension.init(jbeamData) end

--- Creates the pump and release sound sources on pumpNode. Called by the controller manager during sound initialization.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/hydraulicSuspension.lua:289
---@param jbeamData table Controller jbeam data.
function controller_hydraulicSuspension.initSounds(jbeamData) end

--- Returns all beams to their original position and to released mode.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/hydraulicSuspension.lua:153
function controller_hydraulicSuspension.reset() end

--- Resets the state of the pump and release sounds.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/hydraulicSuspension.lua:305
function controller_hydraulicSuspension.resetSounds() end

--- Releases the groups: bleedCoef > 0 removes the spring and lets the beam follow freely; the damping depends on 1 - bleedCoef.
---Source: lua/vehicle/controller/hydraulicSuspension.lua:61
---@param groupNames string[] Group names.
---@param bleedCoef number 0 (no release) to 1 (full release), bounded.
function controller_hydraulicSuspension.setGroupsBleed(groupNames, bleedCoef) end

--- Enables/disables the continuous increase of the groups' target (at the pump's base speed) as long as enabled is true, within the min/max limits of each beam.
---Source: lua/vehicle/controller/hydraulicSuspension.lua:77
---@param groupNames string[] Group names.
---@param enabled boolean True to raise continuously.
---@param speedCoef number|nil Speed multiplier (1 by default).
function controller_hydraulicSuspension.setGroupsMomentaryIncrease(groupNames, enabled, speedCoef) end

--- Sets the target position of all named groups: position 0 = min extension, 1 = max extension of each beam. Disables the bleed of these beams.
---Source: lua/vehicle/controller/hydraulicSuspension.lua:42
---@param groupNames string[] Group names (groupName in the hydraulic table).
---@param position number 0..1, interpolation between min and max of each beam.
---@param speedCoef number|nil Pump speed multiplier (1 by default).
function controller_hydraulicSuspension.setGroupsPosition(groupNames, position, speedCoef) end

--- Restores the state returned by getState (valid numeric values only).
---Source: lua/vehicle/controller/hydraulicSuspension.lua:248
---@param data table|nil State table.
function controller_hydraulicSuspension.setState(data) end

--- Every physics step: advances each beam toward its target position at the pump speed and applies the length and the spring/damping.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/hydraulicSuspension.lua:132
---@param dt number Time step (s).
function controller_hydraulicSuspension.updateFixedStep(dt) end

--- Every frame: handles the pump sound (volume 0.5, pitch depending on the flow) and the release sound according to the released beams that shorten.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/hydraulicSuspension.lua:95
---@param dt number Time step (s).
function controller_hydraulicSuspension.updateGFX(dt) end

return controller_hydraulicSuspension
