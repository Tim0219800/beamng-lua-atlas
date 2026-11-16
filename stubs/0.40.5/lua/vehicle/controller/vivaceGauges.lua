---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/vivaceGauges.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- OBSOLETE auxiliary controller (replaced by the 'genericGauges' controller) that feeds the digital dashboard screen of the Vivace: it creates an HTML texture (1024x256) and periodically sends it electrics values (turn signals, indicators, RPM, speed, ESC/TCS, average power of the electric motors). Loaded via the jbeam; do not use for new vehicles.
--- Access: controller `vivaceGauges` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_vivaceGauges
---@field type string 'auxiliary': controller type in the controller system.
local controller_vivaceGauges = {}

--- Called at controller initialization: creates the HTML texture, gets the powertrain's electric motors and sends the configuration to the page ('setup').
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/vivaceGauges.lua:63
---@param jbeamData table Controller jbeam data (materialName, htmlPath, ...).
function controller_vivaceGauges.init(jbeamData) end

--- Called at vehicle reset; does nothing.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/vivaceGauges.lua:91
function controller_vivaceGauges.reset() end

--- Changes the displayed mode (JS call 'updateMode' with {txt, col}) if modeName and modeColor are present.
---Source: lua/vehicle/controller/vivaceGauges.lua:98
---@param parameters table Table with modeName (text) and modeColor (color, format used by the HTML page).
function controller_vivaceGauges.setParameters(parameters) end

--- Called every frame: sends the dashboard values to the HTML texture when the UI needs updating. Is nop if the configuration is invalid.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/vivaceGauges.lua:20
---@param dt number Time step in seconds.
function controller_vivaceGauges.updateGFX(dt) end

return controller_vivaceGauges
