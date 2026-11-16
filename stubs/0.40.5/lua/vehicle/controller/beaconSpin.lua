---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/beaconSpin.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Minimal auxiliary controller that animates the rotating elements of a light bar: as long as `electrics.values.lightbar` is greater than 0, it rotates an electrics value (angle in degrees, modulo 360); otherwise it resets it to 0.
--- Access: controller `beaconSpin` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_beaconSpin
---@field type string "auxiliary".
local controller_beaconSpin = {}

--- Reads `spinSpeed` and `electricsName` and initializes the electrics value to 1.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/beaconSpin.lua:17
---@param jbeamData table Controller jbeam data.
function controller_beaconSpin.init(jbeamData) end

--- Every frame: advances the angle by dt × spinSpeed (modulo 360) if the light bar is active, otherwise sets the value to 0.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/beaconSpin.lua:13
---@param dt number Time step in seconds.
function controller_beaconSpin.updateGFX(dt) end

return controller_beaconSpin
