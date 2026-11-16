---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/freeformDelivery/loader.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Loads a freeform delivery definition file (JSON): reads the data, loads the sites file (sitesFile), spawns the prefabs (prefabFile or prefabFiles) at the world origin, indexes the vehicles they contain by their internalName, then reloads collision and the navgraph if the prefabs contain any. Used by gameplay_freeformDelivery_freeformDelivery.load.
--- Access: extension `gameplay_freeformDelivery_loader`: `extensions.load("gameplay_freeformDelivery_loader")`, then the global `gameplay_freeformDelivery_loader`
---@class gameplay_freeformDelivery_loader
gameplay_freeformDelivery_loader = {}

--- Loads a delivery: returns the JSON data table enriched with sites, prefabs and vehicle index. Returns nil (logged error) if the file, the sites or a prefab cannot be loaded.
---Source: lua/ge/extensions/gameplay/freeformDelivery/loader.lua:142
---@param deliveryPath string Path of the delivery's JSON file.
---@return table|nil  Delivery data (vehicles, targetAreas, sites, _prefabIds, _vehicleIndex, ...).
function gameplay_freeformDelivery_loader.load(deliveryPath) end

