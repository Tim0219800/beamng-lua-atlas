---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/gauges/analogOdometer.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Auxiliary controller for an analog odometer displayed by an HTML texture (htmlTexture). It sends the total (electrics.values.odometer) and the trip (extensions.odometer.getRelativeRecording()) to the page only when one of them has changed by more than one update step (1000 m, or 1609.34 m in imperial, divided by 10 with a decimal separator).
--- Access: controller `gauges/analogOdometer` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_gauges_analogOdometer
---@field init function nop.
---@field type string "auxiliary".
local controller_gauges_analogOdometer = {}

--- Reads the configuration, computes the update step, creates the HTML texture and sends the configuration to the page.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/gauges/analogOdometer.lua:50
---@param jbeamData table Controller jbeam data.
function controller_gauges_analogOdometer.initSecondStage(jbeamData) end

--- Forces a new data send at the next updateGFX.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/gauges/analogOdometer.lua:46
function controller_gauges_analogOdometer.reset() end

--- Does nothing.
---Source: lua/vehicle/controller/gauges/analogOdometer.lua:95
---@param parameters table Ignored.
function controller_gauges_analogOdometer.setParameters(parameters) end

--- Sends trip and odometer to the page when they have changed by at least one step.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/gauges/analogOdometer.lua:25
---@param dt number Time step (s).
function controller_gauges_analogOdometer.updateGFX(dt) end

return controller_gauges_analogOdometer
