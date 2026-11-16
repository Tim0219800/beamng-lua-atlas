---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/etkGauges.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Old HTML instruments controller (type "auxiliary"), deprecated: init logs an error asking to switch to genericGauges. It creates an HTML texture (htmlTexture.create) and sends 30 times per second: engaged gear, average consumption, consumption display, outside temperature, time (HH:MM), wheel speed. Not to be used for new vehicles.
--- Access: controller `etkGauges` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_etkGauges
---@field type string "auxiliary".
local controller_etkGauges = {}

--- Logs the deprecation warning, resets the smoothers and creates the HTML texture.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/etkGauges.lua:68
---@param jbeamData table Controller jbeam data.
function controller_etkGauges.init(jbeamData) end

--- To be called when the HTML page is loaded: sends setUnits with unitType and allows updates.
---Source: lua/vehicle/controller/etkGauges.lua:96
function controller_etkGauges.uiReady() end

--- Periodically sends the data to the HTML dashboard via htmlTexture.call("updateData").
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/etkGauges.lua:28
---@param dt number Time step (s).
function controller_etkGauges.updateGFX(dt) end

return controller_etkGauges
