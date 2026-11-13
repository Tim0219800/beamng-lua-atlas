---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/bindingsLegend.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `ui_bindingsLegend` : `extensions.load("ui_bindingsLegend")`, puis la globale `ui_bindingsLegend`
---@class ui_bindingsLegend
---@field dependencies table
ui_bindingsLegend = {}

---Source : lua/ge/extensions/ui/bindingsLegend.lua:754
---@param label any
---@param actions any
---@param additionalData any
function ui_bindingsLegend.addActions(label, actions, additionalData) end

---Source : lua/ge/extensions/ui/bindingsLegend.lua:925
---@param enable any
function ui_bindingsLegend.enableShowVehicleSpecificActions(enable) end

---Source : lua/ge/extensions/ui/bindingsLegend.lua:979
function ui_bindingsLegend.onActionFilterUpdated() end

---Source : lua/ge/extensions/ui/bindingsLegend.lua:951
function ui_bindingsLegend.onClientEndMission() end

---Source : lua/ge/extensions/ui/bindingsLegend.lua:948
function ui_bindingsLegend.onClientStartMission() end

---Source : lua/ge/extensions/ui/bindingsLegend.lua:1069
---@param data any
function ui_bindingsLegend.onDeserialized(data) end

---Source : lua/ge/extensions/ui/bindingsLegend.lua:1063
function ui_bindingsLegend.onDeviceChanged() end

---Source : lua/ge/extensions/ui/bindingsLegend.lua:1050
function ui_bindingsLegend.onExtensionLoaded() end

---Source : lua/ge/extensions/ui/bindingsLegend.lua:791
---@param newModifiers any
function ui_bindingsLegend.onModifierChanged(newModifiers) end

---Source : lua/ge/extensions/ui/bindingsLegend.lua:996
function ui_bindingsLegend.onSettingsChanged() end

---Source : lua/ge/extensions/ui/bindingsLegend.lua:869
---@param dtReal any
---@param dtSim any
---@param dtRaw any
function ui_bindingsLegend.onUpdate(dtReal, dtSim, dtRaw) end

---Source : lua/ge/extensions/ui/bindingsLegend.lua:969
---@param vehId any
function ui_bindingsLegend.onVehicleResetted(vehId) end

---Source : lua/ge/extensions/ui/bindingsLegend.lua:969
---@param vehId any
function ui_bindingsLegend.onVehicleSpawned(vehId) end

---Source : lua/ge/extensions/ui/bindingsLegend.lua:1027
---@param oldId any
---@param newId any
---@param player any
function ui_bindingsLegend.onVehicleSwitched(oldId, newId, player) end

---Source : lua/ge/extensions/ui/bindingsLegend.lua:107
function ui_bindingsLegend.resetFade() end

---Source : lua/ge/extensions/ui/bindingsLegend.lua:630
---@param forceResetFade any
function ui_bindingsLegend.sendDataToUI(forceResetFade) end

--- Debug ImGui window to test fade behavior quickly
---Source : lua/ge/extensions/ui/bindingsLegend.lua:82
---@param enabled any
function ui_bindingsLegend.setDebug(enabled) end

---Source : lua/ge/extensions/ui/bindingsLegend.lua:901
---@param enable any
function ui_bindingsLegend.setShowBasicDrivingControls(enable) end

---Source : lua/ge/extensions/ui/bindingsLegend.lua:1007
function ui_bindingsLegend.showToggleVehicleSpecificActionsMessage() end

---Source : lua/ge/extensions/ui/bindingsLegend.lua:1075
function ui_bindingsLegend.toggleShowApp() end

---Source : lua/ge/extensions/ui/bindingsLegend.lua:944
function ui_bindingsLegend.toggleShowVehicleSpecificActions() end

---Source : lua/ge/extensions/ui/bindingsLegend.lua:1058
---@param action any
---@param value any
function ui_bindingsLegend.triggerInputAction(action, value) end

