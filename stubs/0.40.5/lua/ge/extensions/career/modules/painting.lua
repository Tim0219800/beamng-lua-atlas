---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/painting.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Career paint shop, accessible from the garage computer. It prepares the scene (enters the vehicle, freezes it, orbital camera, blocks the walkingMode and bigMap actions), sends the original colors, prices and paint classes to the UI, applies the chosen paints live (setPaints), then charges and saves (apply) or cancels (close/cleanup). Data stays in the vehicle's inventory entry (config.paints and partConditions).
--- Access: extension `career_modules_painting`: `extensions.load("career_modules_painting")`, then the global `career_modules_painting`
---@class career_modules_painting
---@field dependencies table<integer, string> Extensions loaded before: career_career, gameplay_achievement.
career_modules_painting = {}

--- Confirms the selection: checks and pays the total price (tags vehiclePainting, buying), plays the purchase sound, saves the paints into the inventory vehicle, unlocks VEHICLE_MODIFIED, closes the mode and starts the vehicle save. Does nothing if the player cannot pay.
---Source: lua/ge/extensions/career/modules/painting.lua:186
function career_modules_painting.apply() end

--- Restores the state of the vehicle (respawn from the inventory), camera, walking mode and inputs. Does not navigate (the UI router handles it); no effect if painting is not active.
---Source: lua/ge/extensions/career/modules/painting.lua:128
function career_modules_painting.cleanup() end

--- Leaves paint mode (cleanup) then reopens the computer menu or closes the menus; if autosave is active and _closeMenuAfterSaving is true, closing the menu waits for onVehicleSaveFinished.
---Source: lua/ge/extensions/career/modules/painting.lua:153
---@param _closeMenuAfterSaving boolean|nil Wait for the save to finish before closing the menu.
function career_modules_painting.close(_closeMenuAfterSaving) end

--- Returns the factory paints of the model of the vehicle being painted.
---Source: lua/ge/extensions/career/modules/painting.lua:282
---@return table  Model paints ({} if none).
function career_modules_painting.getFactoryPaint() end

--- Returns the data sent to the UI: colors (original paints of the "body" part or of the first painted part), prices and colorClassData.
---Source: lua/ge/extensions/career/modules/painting.lua:75
---@return {colors: table|nil, prices: table, colorClassData: table}  Paint data.
function career_modules_painting.getPaintData() end

--- Returns the gray primer paint (baseColor {0.58, 0.58, 0.585}, roughness 0.475, clearcoat 0).
---Source: lua/ge/extensions/career/modules/painting.lua:45
---@return table  Paint table.
function career_modules_painting.getPrimerColor() end

--- Computer hook: adds the "painting" function _anon(order 15) for each vehicle present in the garage, with any disabling reasons.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/painting.lua:215
---@param menuData table Menu data (computerFacility, vehiclesInGarage, hasBoughtStarterVehicle).
---@param computerFunctions table Computer functions to fill (vehicleSpecific[inventoryId]).
function career_modules_painting.onComputerAddFunctions(menuData, computerFunctions) end

--- UI router lifecycle: sends the paint data once the view is mounted.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/painting.lua:296
---@param context any Router context.
---@param toRoute any Target route.
---@param fromRoute any Previous route.
---@param data table routeData.
function career_modules_painting.onRouteMount(context, toRoute, fromRoute, data) end

--- Hook called when the UI opens: enters the vehicle (with a one-frame delay), freezes it, sets the orbital camera (rotation 145, -15) and offsets the framing; emits onVehiclePaintingUiOpened.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/painting.lua:300
function career_modules_painting.onUIOpened() end

--- Hook called when the vehicle save is finished: closes the menu if close() requested it.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/painting.lua:165
function career_modules_painting.onVehicleSaveFinished() end

--- Sends the paint data and the factory paint to the UI (guihooks paintingData) if painting is active.
---Source: lua/ge/extensions/career/modules/painting.lua:288
function career_modules_painting.sendPaintingDataToUI() end

--- Records the player's choice, sends the cart price to the UI (sendPaintingShoppingCartData) and applies the paints to the vehicle (all parts, or only partName).
---Source: lua/ge/extensions/career/modules/painting.lua:258
---@param paints table[] Up to 3 paints.
---@param paintOptions table[] Per-paint options (paintClass, clearCoat, clearCoatPolish) used for the price calculation.
---@param partName string|nil Target part; all parts if nil.
function career_modules_painting.setPaints(paints, paintOptions, partName) end

--- Opens paint mode for an inventory vehicle (the nearest garage one if inventoryId is nil). Does nothing if the vehicle has not spawned in the world. Goes through an insurance repair first if needed.
---Source: lua/ge/extensions/career/modules/painting.lua:105
---@param _inventoryId integer|nil Inventory id of the vehicle.
---@param _originComputerId string|nil Id of the originating computer; if provided, navigates to career.computer.painting.
function career_modules_painting.start(_inventoryId, _originComputerId) end

