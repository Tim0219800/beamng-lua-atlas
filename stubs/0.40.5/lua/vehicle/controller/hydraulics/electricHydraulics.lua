---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/hydraulics/electricHydraulics.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Small auxiliary controller for an electric hydraulic unit: sets the electrics value motorThrottleElectricsName to 1 as soon as one of the listed command values is non-zero, otherwise to 0 (to power the pump motor only when a hydraulic function is requested).
--- Access: controller `hydraulics/electricHydraulics` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_hydraulics_electricHydraulics
---@field type string "auxiliary".
local controller_hydraulics_electricHydraulics = {}

--- Reads the electrics names.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/hydraulics/electricHydraulics.lua:26
---@param jbeamData table Controller jbeam data.
function controller_hydraulics_electricHydraulics.init(jbeamData) end

--- Does nothing.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/hydraulics/electricHydraulics.lua:23
---@param jbeamData table Controller jbeam data.
function controller_hydraulics_electricHydraulics.reset(jbeamData) end

--- Updates the 0/1 output value.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/hydraulics/electricHydraulics.lua:13
---@param dt number Time step (s).
function controller_hydraulics_electricHydraulics.updateGFX(dt) end

return controller_hydraulics_electricHydraulics
