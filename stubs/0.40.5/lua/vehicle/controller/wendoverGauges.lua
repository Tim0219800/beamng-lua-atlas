---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/wendoverGauges.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- OBSOLETE auxiliary controller (replaced by 'genericGauges') for the digital dashboard screen of the Wendover: HTML texture (1024 x jbeam height, 161 by default) fed with electrics values and a computed average fuel consumption.
--- Access: controller `wendoverGauges` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_wendoverGauges
---@field type string 'auxiliary': controller type.
local controller_wendoverGauges = {}

--- Called at initialization: creates the HTML texture and determines the gearbox type.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/wendoverGauges.lua:67
---@param jbeamData table Controller jbeam data.
function controller_wendoverGauges.init(jbeamData) end

--- Called at reset; does nothing (the consumption counters are not reset).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/wendoverGauges.lua:94
function controller_wendoverGauges.reset() end

--- Called every frame: sends the dashboard values to the HTML texture about 10 times per second.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/wendoverGauges.lua:26
---@param dt number Time step in seconds.
function controller_wendoverGauges.updateGFX(dt) end

return controller_wendoverGauges
