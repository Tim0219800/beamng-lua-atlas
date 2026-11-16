---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/computer.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Garage "computer" menu in career mode. openMenu builds the list of vehicles in the nearest garage, lets other modules add their buttons via the onComputerAddFunctions hook, starts a tether (the menu closes if the player moves away), then navigates to the 'career.computer' UI screen. A modder adds a button by implementing onComputerAddFunctions(menuData, computerFunctions) in their extension.
--- Access: extension `career_modules_computer`: `extensions.load("career_modules_computer")`, then the global `career_modules_computer`
---@class career_modules_computer
---@field dependencies string[] {"career_career"}: extensions loaded before this module.
---@field reasons table<string, table> Standard reasons for disabling a button: tutorialActive, hasBoughtStarterVehicle (type 'text') and needsRepair (type 'needsRepair'), each with a translation label.
career_modules_computer = {}

--- Closes all career menus (career_career.closeAllMenus). Also serves as the tether callback when the player moves away.
---Source: lua/ge/extensions/career/modules/computer.lua:111
function career_modules_computer.closeMenu() end

--- Called by the UI on a click: finds the button (vehicleSpecific[inventoryId] if inventoryId is given, otherwise general) and runs its callback(computerId).
---Source: lua/ge/extensions/career/modules/computer.lua:57
---@param buttonId string Button key in computerFunctions.
---@param inventoryId integer|nil Inventory id of the vehicle for a vehicle-specific button.
function career_modules_computer.computerButtonCallback(buttonId, inventoryId) end

--- Returns to the UI a copy of the menu data: computerFunctions (reason labels translated, inventoryId keys converted to strings), vehicles (with thumbnail and inventoryId as a string), facilityName, resetActiveVehicleIndex, computerId. Empty table if the menu has not been opened.
---Source: lua/ge/extensions/career/modules/computer.lua:68
---@return table  Data for the career.computer screen.
function career_modules_computer.getComputerUIData() end

--- Hook called when the menu closes; removes the tether (tether.remove = true).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/computer.lua:107
function career_modules_computer.onMenuClosed() end

--- Gets the 'computer' facility by its id via freeroam_facilities.getFacility, then calls openMenu.
---Source: lua/ge/extensions/career/modules/computer.lua:115
---@param computerId string Computer facility identifier.
function career_modules_computer.openComputerMenuById(computerId) end

--- Opens the computer menu for a facility: lists the vehicles in the nearest garage (name, repair need, dirt date), fires onComputerAddFunctions, starts the tether, navigates to 'career.computer', then fires onComputerMenuOpened.
---Source: lua/ge/extensions/career/modules/computer.lua:18
---@param computerFacility table 'computer' facility (fields id, name, doors).
---@param resetActiveVehicleIndex boolean|nil Passed to the UI in menuData.resetActiveVehicleIndex.
---@param activityElement any Not used in the function.
function career_modules_computer.openMenu(computerFacility, resetActiveVehicleIndex, activityElement) end

