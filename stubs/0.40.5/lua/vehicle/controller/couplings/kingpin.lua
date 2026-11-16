---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/couplings/kingpin.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Auxiliary kingpin controller of a semi-trailer. It only answers the tractor's `couplings/fifthwheel` controller: if the fifth wheel's key matches its own, it returns its node cid and its world position. It can also display its node in debug when the fifth wheel requests the indicator display.
--- Access: controller `couplings/kingpin` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_couplings_kingpin
---@field debugDraw function|nil nil by default; drawing function of the kingpin node when the indicator is visible.
---@field type string "auxiliary".
local controller_couplings_kingpin = {}

--- Finds the kingpin node by name and reads the key.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/couplings/kingpin.lua:42
---@param jbeamData table Controller jbeam data.
function controller_couplings_kingpin.init(jbeamData) end

--- Empty.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/couplings/kingpin.lua:39
---@param jbeamData table Jbeam data.
function controller_couplings_kingpin.reset(jbeamData) end

--- Called remotely by a fifth wheel: if `couplerTag` equals this kingpin's key, returns {nodeId, nodePosition} to `kingpinDataCallback` of the requesting vehicle's fifth wheel controller.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/couplings/kingpin.lua:13
---@param objId integer Id of the requesting vehicle (tractor).
---@param controllerName string Name of the fifth wheel controller to call back.
---@param couplerTag string Requested fifth wheel key.
function controller_couplings_kingpin.sendDataToVehicle(objId, controllerName, couplerTag) end

--- Enables or removes the kingpin node debug display if the key matches.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/couplings/kingpin.lua:31
---@param key string Fifth wheel key concerned.
---@param visible boolean true to show.
function controller_couplings_kingpin.setKingpinVisibility(key, visible) end

return controller_couplings_kingpin
