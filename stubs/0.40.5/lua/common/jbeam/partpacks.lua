---@meta
-- tim19Atlas stub generated from lua/common/jbeam/partpacks.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Management of "part packs": predefined sets of parts described in *.partpacks.json files in the vehicle folders (array of objects {path, filters, ...}). The module collects them (cached by folder list), gathers what is installed in the parts tree (slots, empty slots, part names, paths) and keeps only the packs whose filters match the current vehicle. Used by the customization UI to offer only the relevant packs.
--- Access: `require("jbeam/partpacks")`
---@class jbeam_partpacks
local jbeam_partpacks = {}

--- Reads all the *.partpacks.json files (recursive search) of the given folders and returns the catalog path -> definition. Result cached by folder list.
---Source: lua/common/jbeam/partpacks.lua:48
---@param vehicleDirectories string[]|nil Vehicle folders (e.g. {'/vehicles/pickup/', '/vehicles/common/'}).
---@return table<string, table>  Catalog of packs by path.
function jbeam_partpacks.collectAllPartPacks(vehicleDirectories) end

--- Recursively walks the parts tree (id, chosenPartName, path, children) and gathers what is installed.
---Source: lua/common/jbeam/partpacks.lua:146
---@param partsTree table Parts tree of the vehicle config (config.partsTree).
---@return table  {slots, emptySlots, partNames, partNamesList, paths, pathsList}: sets (name=true) and ordered lists.
function jbeam_partpacks.collectInstalled(partsTree) end

--- Applies the filters of each pack of the catalog to the installed data and to the vehicle model.
---Source: lua/common/jbeam/partpacks.lua:324
---@param partPacksCatalog table<string, table> Catalog returned by collectAllPartPacks.
---@param installedData table Data returned by collectInstalled.
---@param vehicleModel string|nil Vehicle model name (for vehicleWhitelist/Blacklist).
---@return table<string, table>  Visible packs.
---@return table  Statistics {total, shown, hidden, invalid}.
function jbeam_partpacks.filter(partPacksCatalog, installedData, vehicleModel) end

--- Empties the pack catalog cache.
---Source: lua/common/jbeam/partpacks.lua:44
function jbeam_partpacks.invalidateCollectCache() end

--- Chains collectAllPartPacks, collectInstalled and filter, with timing logs.
---Source: lua/common/jbeam/partpacks.lua:410
---@param vehicleDirectories string[] Vehicle folders.
---@param partsTree table Installed parts tree.
---@param vehicleModel string|nil Model name.
---@return table<string, table>  Visible packs.
function jbeam_partpacks.process(vehicleDirectories, partsTree, vehicleModel) end

return jbeam_partpacks
