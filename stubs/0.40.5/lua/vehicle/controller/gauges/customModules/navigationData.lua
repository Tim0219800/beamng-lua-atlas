---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/gauges/customModules/navigationData.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Data module for genericGauges: feeds a navigation map in the HTML page. At setup it asks ui_uiNavi (game engine) to initialize the dashboard map; at each update it sends the vehicle's position (x, y) and orientation (degrees) via streamJS("updateMap").
--- Access: controller `gauges/customModules/navigationData` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_gauges_customModules_navigationData
---@field type string "auxiliary".
local controller_gauges_customModules_navigationData = {}

--- Does nothing.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/gauges/customModules/navigationData.lua:37
---@param jbeamData table Controller jbeam data.
function controller_gauges_customModules_navigationData.init(jbeamData) end

--- Resets the module's internal state.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/gauges/customModules/navigationData.lua:34
function controller_gauges_customModules_navigationData.reset() end

--- Called by genericGauges with the properties requested in displayData.customModules: no property is read.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/gauges/customModules/navigationData.lua:29
---@param properties table Requested properties (unused).
---@param htmlTexture table Dashboard HTML texture (htmlTexture.new).
function controller_gauges_customModules_navigationData.setupGaugeData(properties, htmlTexture) end

--- Does nothing (the update is done by updateGaugeData).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/gauges/customModules/navigationData.lua:19
---@param dt number Time step (s).
function controller_gauges_customModules_navigationData.updateGFX(dt) end

--- Called by genericGauges before each send: fills moduleData with the requested values.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/gauges/customModules/navigationData.lua:22
---@param moduleData table Module data table, then sent to the HTML page.
---@param dt number Time elapsed since the last send (s).
function controller_gauges_customModules_navigationData.updateGaugeData(moduleData, dt) end

return controller_gauges_customModules_navigationData
