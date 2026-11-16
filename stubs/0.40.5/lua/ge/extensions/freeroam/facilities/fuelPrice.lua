---@meta
-- tim19Atlas stub generated from lua/ge/extensions/freeroam/facilities/fuelPrice.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Generates the fuel prices of the level's gas stations and displays them on the scene's 7-segment display signs. When the level starts, for each station that has `prices`, computes a price (base + randomness) and replaces the display objects with TSStatic copies of the digits (`art/shapes/quarter_mile_display/display_<c>.dae`). Unloads itself if there is no price data. Global: freeroam_facilities_fuelPrice.
--- Access: extension `freeroam_facilities_fuelPrice`: `extensions.load("freeroam_facilities_fuelPrice")`, then the global `freeroam_facilities_fuelPrice`
---@class freeroam_facilities_fuelPrice
freeroam_facilities_fuelPrice = {}

--- Current price (metric unit) of a fuel at a station.
---Source: lua/ge/extensions/freeroam/facilities/fuelPrice.lua:99
---@param stationId string Station id.
---@param fuelType string Energy type (e.g. gasoline, diesel).
---@return number|nil  Price or nil.
function freeroam_facilities_fuelPrice.getFuelPrice(stationId, fuelType) end

--- Hook at level start: calls setDisplayPrices; if there is no price data, unloads the extension.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/freeroam/facilities/fuelPrice.lua:108
---@param levelPath string Level path (unused).
function freeroam_facilities_fuelPrice.onClientStartMission(levelPath) end

--- Called after a Lua reload: restores the prices if in the same level, otherwise regenerates the prices (onClientStartMission).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/freeroam/facilities/fuelPrice.lua:130
---@param data table Table returned by onSerialize.
function freeroam_facilities_fuelPrice.onDeserialized(data) end

--- Called before a Lua reload: saves cachedPriceData, the current level and the local unit.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/freeroam/facilities/fuelPrice.lua:122
---@return table  {cachedPriceData, currentLevel, levelUnit}
function freeroam_facilities_fuelPrice.onSerialize() end

--- Deletes the digit copies and restores the original signs (display 8), optionally hidden. Useful before moving a sign in the editor.
---Source: lua/ge/extensions/freeroam/facilities/fuelPrice.lua:141
---@param hide boolean|nil true = hide the original signs.
function freeroam_facilities_fuelPrice.restoreSign(hide) end

--- Computes the prices of all the stations of the current level and updates the displays.
---Source: lua/ge/extensions/freeroam/facilities/fuelPrice.lua:29
---@return boolean  true if at least one price was generated.
function freeroam_facilities_fuelPrice.setDisplayPrices() end

