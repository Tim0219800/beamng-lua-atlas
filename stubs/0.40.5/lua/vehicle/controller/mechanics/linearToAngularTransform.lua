---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/mechanics/linearToAngularTransform.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Mechanics controller (type "auxiliary") that converts the displacement of a sensor beam into pulley rotation: the length change since the start, divided by an effective radius, gives an angle; the fraction of a turn (0..1, modulo 1) is multiplied by a factor (360 by default) and written into an electrics value to animate a rotating part.
--- Access: controller `mechanics/linearToAngularTransform` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_mechanics_linearToAngularTransform
---@field type string "auxiliary".
local controller_mechanics_linearToAngularTransform = {}

--- Hook: called when a beam breaks; marks the controller inactive if it is the sensor (no real effect, see notes).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/mechanics/linearToAngularTransform.lua:31
---@param id integer Identifier (cid) of the broken beam.
---@param energy number Break energy.
function controller_mechanics_linearToAngularTransform.beamBroken(id, energy) end

--- Finds the sensor beam and validates the configuration.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/mechanics/linearToAngularTransform.lua:46
---@param jbeamData table Controller jbeam data.
function controller_mechanics_linearToAngularTransform.init(jbeamData) end

--- Stores the sensor's starting length and resets the output to 0.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/mechanics/linearToAngularTransform.lua:38
---@param jbeamData table Controller jbeam data.
function controller_mechanics_linearToAngularTransform.reset(jbeamData) end

--- Writes the converted fraction of a turn into the output electrics value. (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/mechanics/linearToAngularTransform.lua:dyn
---@param dt number Time step (s).
function controller_mechanics_linearToAngularTransform.updateGFX(dt) end

return controller_mechanics_linearToAngularTransform
