---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/sbrGauges.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- OBSOLETE auxiliary controller (log E at load: to be replaced by genericGauges) that feeds an HTML dashboard screen (htmlTexture) for an electric vehicle: speed, gear, sensors, navigation map, average/instantaneous consumption (W, kWh/100 km) and estimated range based on the energy of the electric motors' batteries.
--- Access: controller `sbrGauges` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_sbrGauges
---@field type string "auxiliary".
local controller_sbrGauges = {}

--- Creates the HTML texture, finds the electric motors' batteries and initializes the consumption smoothers.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/sbrGauges.lua:95
---@param jbeamData table Controller jbeam data.
function controller_sbrGauges.init(jbeamData) end

--- Returns the length unit to the HTML page.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/sbrGauges.lua:137
function controller_sbrGauges.reset() end

--- Applies external parameters: if modeName and modeColor are present, calls setUIMode.
---Source: lua/vehicle/controller/sbrGauges.lua:145
---@param parameters table Table {modeName, modeColor}.
function controller_sbrGauges.setParameters(parameters) end

--- Displays the name and color of the driving mode on the HTML screen (updateMode).
---Source: lua/vehicle/controller/sbrGauges.lua:141
---@param modeName string Mode text.
---@param modeColor string Color (inferred from code: CSS value passed as is).
function controller_sbrGauges.setUIMode(modeName, modeColor) end

--- Every frame: computes power and consumption and sends the data to the HTML page.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/sbrGauges.lua:37
---@param dt number Time step in seconds.
function controller_sbrGauges.updateGFX(dt) end

return controller_sbrGauges
