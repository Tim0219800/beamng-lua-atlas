---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/gauges/genericGauges.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Auxiliary controller that displays an HTML dashboard on a 3D material (htmlTexture) and continuously sends it data: electrics values, powertrain device properties and custom module data (controllers in gauges/customModules/). A modder uses it to create an HTML instrument cluster by declaring the controller in the jbeam with materialName, htmlPath, displayWidth/displayHeight and displayData. Data is only sent if a player is seated in the vehicle and the engine's UI update flag is raised.
--- Access: controller `gauges/genericGauges` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_gauges_genericGauges
---@field init function Alias of nop (nothing to do at init).
---@field type string "auxiliary".
local controller_gauges_genericGauges = {}

--- Removes all popup messages (JS call messageClearAll).
---Source: lua/vehicle/controller/gauges/genericGauges.lua:54
function controller_gauges_genericGauges.clearAllPopupMessages() end

--- Removes a popup message by identifier (JS call messageClearById).
---Source: lua/vehicle/controller/gauges/genericGauges.lua:47
---@param msgId string Identifier returned by displayPopupMessage.
function controller_gauges_genericGauges.clearPopupMessage(msgId) end

--- Queues a popup message in the HTML page (JS call messageQueue). No effect if hasPopupMessageSupport is false.
---Source: lua/vehicle/controller/gauges/genericGauges.lua:30
---@param message string Message text.
---@param iconId string Icon identifier (inferred from code).
---@param timeout number Display duration in seconds (durationSec).
---@param highlightColor string Highlight color (inferred from code).
---@return string|nil  Message identifier ("test" + random number), nil if popups are not supported.
function controller_gauges_genericGauges.displayPopupMessage(message, iconId, timeout, highlightColor) end

--- Reads the configuration, creates the HTML texture (htmlTexture.new at 60 FPS), prepares the electrics/powertrain/customModules lists and sends the configuration (UI units + jbeam configuration) to the page via callJS("setup").
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/gauges/genericGauges.lua:164
---@param jbeamData table jbeam data (see notes).
function controller_gauges_genericGauges.initSecondStage(jbeamData) end

--- Does nothing.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/gauges/genericGauges.lua:161
function controller_gauges_genericGauges.reset() end

--- If parameters contains modeName and modeColor, passes the parameters to the HTML page (JS call updateMode).
---Source: lua/vehicle/controller/gauges/genericGauges.lua:229
---@param parameters table Table with at least modeName and modeColor.
function controller_gauges_genericGauges.setParameters(parameters) end

--- Every graphics frame: if a player is seated and the UI needs updating, refreshes the electrics, powertrain and module data then sends them to the HTML page.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/gauges/genericGauges.lua:81
---@param dt number Graphics time step (s).
function controller_gauges_genericGauges.updateGFX(dt) end

return controller_gauges_genericGauges
