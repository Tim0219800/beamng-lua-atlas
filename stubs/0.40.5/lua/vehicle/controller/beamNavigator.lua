---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/beamNavigator.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Auxiliary controller that displays a live navigation map on a vehicle screen. It creates an HTML texture (`htmlTexture` module) on a screen material, asks the game for the dashboard map (`ui_uinavi.requestVehicleDashboardMap`) and sends it 15 times per second the vehicle's position, orientation, speed and ignition, as long as a player is seated.
--- Access: controller `beamNavigator` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_beamNavigator
---@field reset function nop: avoids calling init again on vehicle reset.
---@field type string "auxiliary".
local controller_beamNavigator = {}

--- Creates the screen's HTML texture, asks the game for the map and displays the boot image if `bootscreenImage` is provided.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/beamNavigator.lua:40
---@param jbeamData table Controller jbeam data.
function controller_beamNavigator.init(jbeamData) end

--- Sends the GPS data to the HTML texture at 15 Hz when a player is seated.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/beamNavigator.lua:21
---@param dt number Time step in seconds.
function controller_beamNavigator.updateGFX(dt) end

return controller_beamNavigator
