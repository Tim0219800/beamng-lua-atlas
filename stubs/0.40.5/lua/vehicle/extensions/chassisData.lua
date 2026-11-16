---@meta
-- tim19Atlas stub generated from lua/vehicle/extensions/chassisData.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension that computes the vehicle's wheelbase (wheelBase) and track width (trackWidth) from the wheel node positions in the jbeam data, then returns them by Lua command to another object (vehicle or VM). Used by tools that need the chassis geometry.
--- Access: extension `chassisData`: `extensions.load (vehicle VM)("chassisData")`, then the global `chassisData`
---@class chassisData
chassisData = {}

--- Computes (or reads from cache) the chassis data and sends it to the object objID by calling the Lua function callback with the data JSON as argument.
---Source: lua/vehicle/extensions/chassisData.lua:101
---@param objID integer Identifier of the destination object.
---@param callback string Name of the Lua function to call on the destination.
---@param forceRefresh boolean|nil true to ignore the cache.
function chassisData.requestChassisData(objID, callback, forceRefresh) end

