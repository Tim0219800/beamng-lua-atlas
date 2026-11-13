---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/vehicleSelector/vehicleOperations.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `ui_vehicleSelector_vehicleOperations` : `extensions.load("ui_vehicleSelector_vehicleOperations")`, puis la globale `ui_vehicleSelector_vehicleOperations`
---@class ui_vehicleSelector_vehicleOperations
---@field managementButtonsEnabled boolean
ui_vehicleSelector_vehicleOperations = {}

--- Expose button instance methods for external use
---Source : lua/ge/extensions/ui/vehicleSelector/vehicleOperations.lua:537
---@param ... any
function ui_vehicleSelector_vehicleOperations.addButton(...) end

---Source : lua/ge/extensions/ui/vehicleSelector/vehicleOperations.lua:538
---@param ... any
function ui_vehicleSelector_vehicleOperations.clearButtonFunctions(...) end

--- Execute button callback by ID with additional logic
---Source : lua/ge/extensions/ui/vehicleSelector/vehicleOperations.lua:40
---@param buttonId any
---@param additionalData any
function ui_vehicleSelector_vehicleOperations.executeButton(buttonId, additionalData) end

---Source : lua/ge/extensions/ui/vehicleSelector/vehicleOperations.lua:497
---@param itemDetails any
function ui_vehicleSelector_vehicleOperations.executeDoubleClick(itemDetails) end

--- Get current vehicle thumbnail similar to inventory.lua
---Source : lua/ge/extensions/ui/vehicleSelector/vehicleOperations.lua:316
---@param veh any
function ui_vehicleSelector_vehicleOperations.getCurrentVehicleThumb(veh) end

---Source : lua/ge/extensions/ui/vehicleSelector/vehicleOperations.lua:539
---@param ... any
function ui_vehicleSelector_vehicleOperations.getFreeButtonId(...) end

--- Get management details for vehicle operations
---Source : lua/ge/extensions/ui/vehicleSelector/vehicleOperations.lua:332
function ui_vehicleSelector_vehicleOperations.getManagementDetails() end

--- Get vehicle name similar to quickAccess.lua
---Source : lua/ge/extensions/ui/vehicleSelector/vehicleOperations.lua:289
---@param veh any
function ui_vehicleSelector_vehicleOperations.getVehicleName(veh) end

---Source : lua/ge/extensions/ui/vehicleSelector/vehicleOperations.lua:225
---@param configDetails any
---@param spawnOnly any
function ui_vehicleSelector_vehicleOperations.makeSpawningButtons(configDetails, spawnOnly) end

--- Handle fade screen state changes
---Source : lua/ge/extensions/ui/vehicleSelector/vehicleOperations.lua:52
---@param state any
function ui_vehicleSelector_vehicleOperations.onScreenFadeState(state) end

---Source : lua/ge/extensions/ui/vehicleSelector/vehicleOperations.lua:59
---@param state any
function ui_vehicleSelector_vehicleOperations.onUiWaitingState(state) end

--- Set custom details buttons for challenge mode
---Source : lua/ge/extensions/ui/vehicleSelector/vehicleOperations.lua:520
---@param buttons any
function ui_vehicleSelector_vehicleOperations.setCustomDetailsButtons(buttons) end

--- Set details button for freeroam mode
---Source : lua/ge/extensions/ui/vehicleSelector/vehicleOperations.lua:515
---@param enabled any
function ui_vehicleSelector_vehicleOperations.setDetailsButtonForFreeroam(enabled) end

--- Set management buttons enabled/disabled state
---Source : lua/ge/extensions/ui/vehicleSelector/vehicleOperations.lua:510
---@param enabled any
function ui_vehicleSelector_vehicleOperations.setManagementButtonsEnabled(enabled) end

