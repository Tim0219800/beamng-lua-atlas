---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/vehicleSelector/detailsInteraction.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Facade of the vehicle selector's details panel. It assembles the specifications (ui_vehicleSelector_vehicleSpecifications) and the action buttons (ui_vehicleSelector_vehicleOperations) of an item, and exposes a few actions (open a folder, go to a mod's page). A custom buttons mode lets other systems (challenge mode) replace the freeroam buttons.
--- Access: extension `ui_vehicleSelector_detailsInteraction`: `extensions.load("ui_vehicleSelector_detailsInteraction")`, then the global `ui_vehicleSelector_detailsInteraction`
---@class ui_vehicleSelector_detailsInteraction
---@field customDetailsButtons table Custom buttons ({callback, meta}); empty by default.
---@field dependencies string[] ui_vehicleSelector_vehicleOperations, ui_vehicleSelector_vehicleSpecifications.
---@field exitCallback function Exit callback, nop by default; modified by setExitCallback.
---@field managementButtonsEnabled boolean Initial value true (configuration).
ui_vehicleSelector_detailsInteraction = {}

--- Delegates to ui_vehicleSelector_vehicleOperations.executeButton with the same arguments.
---Source: lua/ge/extensions/ui/vehicleSelector/detailsInteraction.lua:79
---@param ... any Arguments passed as is.
---@return any  Result of vehicleOperations.executeButton.
function ui_vehicleSelector_detailsInteraction.executeButton(...) end

--- Delegates to ui_vehicleSelector_vehicleOperations.executeDoubleClick with the same arguments.
---Source: lua/ge/extensions/ui/vehicleSelector/detailsInteraction.lua:80
---@param ... any Arguments passed as is.
---@return any  Result of vehicleOperations.executeDoubleClick.
function ui_vehicleSelector_detailsInteraction.executeDoubleClick(...) end

--- Opens a folder in the system file explorer (Engine.Platform.exploreFolder).
---Source: lua/ge/extensions/ui/vehicleSelector/detailsInteraction.lua:65
---@param path string Folder path.
function ui_vehicleSelector_detailsInteraction.exploreFolder(path) end

--- Returns the details of an item (specifications from vehicleSpecifications) completed with `buttonInfo`: custom buttons if defined, otherwise the standard launch buttons of vehicleOperations.
---Source: lua/ge/extensions/ui/vehicleSelector/detailsInteraction.lua:13
---@param itemDetails table Selected item (passed to vehicleSpecifications.getDetails).
---@return table  Details with a buttonInfo field.
function ui_vehicleSelector_detailsInteraction.getDetails(itemDetails) end

--- Returns the details of the management buttons provided by vehicleOperations.getManagementDetails().
---Source: lua/ge/extensions/ui/vehicleSelector/detailsInteraction.lua:55
---@return table  Management information (inferred from code).
function ui_vehicleSelector_detailsInteraction.getManagementDetails() end

--- Navigates to a mod's details page in the interface (route 'menu.mods.details').
---Source: lua/ge/extensions/ui/vehicleSelector/detailsInteraction.lua:70
---@param modId string Mod identifier.
function ui_vehicleSelector_detailsInteraction.goToMod(modId) end

--- Sets the list of custom buttons that replace the standard buttons in getDetails.
---Source: lua/ge/extensions/ui/vehicleSelector/detailsInteraction.lua:83
---@param buttons table List of {callback, meta} objects.
function ui_vehicleSelector_detailsInteraction.setCustomDetailsButtons(buttons) end

--- Delegates to ui_vehicleSelector_vehicleOperations.setDetailsButtonForFreeroam.
---Source: lua/ge/extensions/ui/vehicleSelector/detailsInteraction.lua:82
---@param ... any Arguments passed as is.
function ui_vehicleSelector_detailsInteraction.setDetailsButtonForFreeroam(...) end

--- Sets the function called on exit; nop if nil.
---Source: lua/ge/extensions/ui/vehicleSelector/detailsInteraction.lua:59
---@param callback function|nil Exit callback.
function ui_vehicleSelector_detailsInteraction.setExitCallback(callback) end

--- Delegates to ui_vehicleSelector_vehicleOperations.setManagementButtonsEnabled.
---Source: lua/ge/extensions/ui/vehicleSelector/detailsInteraction.lua:81
---@param ... any Arguments passed as is.
function ui_vehicleSelector_detailsInteraction.setManagementButtonsEnabled(...) end

