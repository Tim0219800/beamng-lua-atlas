---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/pneumatics/crossFlowValve.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Auxiliary controller simulating an air transfer valve between two tanks (energyStorage): air passes from the source tank to the target tank as long as the source pressure exceeds a minimum and that of the target. The flow depends on the valve cross-section and the pressure difference (orifice equation).
--- Access: controller `pneumatics/crossFlowValve` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_pneumatics_crossFlowValve
---@field type string "auxiliary".
local controller_pneumatics_crossFlowValve = {}

--- Gets the source/target tanks and computes the cross-sections and pressure thresholds from the jbeam keys.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/pneumatics/crossFlowValve.lua:66
---@param jbeamData table Controller jbeam data.
function controller_pneumatics_crossFlowValve.init(jbeamData) end

--- Does nothing.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/pneumatics/crossFlowValve.lua:62
function controller_pneumatics_crossFlowValve.reset() end

--- Physics step: computes the air flow between the tanks and transfers the stored energy from the source to the target, updating currentPressure of both.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/pneumatics/crossFlowValve.lua:34
---@param dt number Physics step in seconds.
function controller_pneumatics_crossFlowValve.updateFixedStep(dt) end

return controller_pneumatics_crossFlowValve
