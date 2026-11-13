---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/multiseat/multiseatSettings.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `ui_multiseat_multiseatSettings` : `extensions.load("ui_multiseat_multiseatSettings")`, puis la globale `ui_multiseat_multiseatSettings`
---@class ui_multiseat_multiseatSettings
---@field dependencies table
ui_multiseat_multiseatSettings = {}

---Source : lua/ge/extensions/ui/multiseat/multiseatSettings.lua:319
---@param options any
function ui_multiseat_multiseatSettings.applyStagedSettings(options) end

---Source : lua/ge/extensions/ui/multiseat/multiseatSettings.lua:516
function ui_multiseat_multiseatSettings.cancelExit() end

---Source : lua/ge/extensions/ui/multiseat/multiseatSettings.lua:470
---@param route any
---@param params any
---@param context any
function ui_multiseat_multiseatSettings.confirmExit(route, params, context) end

---Source : lua/ge/extensions/ui/multiseat/multiseatSettings.lua:525
function ui_multiseat_multiseatSettings.confirmExitApplying() end

--- No explicit discard needed: leaving the flow drops the staged values in closeSettings
---Source : lua/ge/extensions/ui/multiseat/multiseatSettings.lua:521
function ui_multiseat_multiseatSettings.confirmExitDiscarding() end

---Source : lua/ge/extensions/ui/multiseat/multiseatSettings.lua:432
function ui_multiseat_multiseatSettings.confirmMultiseatExit() end

---Source : lua/ge/extensions/ui/multiseat/multiseatSettings.lua:543
---@param deviceId any
function ui_multiseat_multiseatSettings.cycleDevicePlayer(deviceId) end

---Source : lua/ge/extensions/ui/multiseat/multiseatSettings.lua:399
function ui_multiseat_multiseatSettings.discardStagedSettings() end

---Source : lua/ge/extensions/ui/multiseat/multiseatSettings.lua:213
function ui_multiseat_multiseatSettings.getScreenData() end

---Source : lua/ge/extensions/ui/multiseat/multiseatSettings.lua:583
---@param groupId any
function ui_multiseat_multiseatSettings.joinDeviceGroup(groupId) end

---Source : lua/ge/extensions/ui/multiseat/multiseatSettings.lua:591
---@param player any
function ui_multiseat_multiseatSettings.leaveDeviceGroup(player) end

---Source : lua/ge/extensions/ui/multiseat/multiseatSettings.lua:559
---@param deviceId any
---@param direction any
function ui_multiseat_multiseatSettings.moveDevicePlayer(deviceId, direction) end

---Source : lua/ge/extensions/ui/multiseat/multiseatSettings.lua:625
function ui_multiseat_multiseatSettings.notifyScreenChanged() end

---Source : lua/ge/extensions/ui/multiseat/multiseatSettings.lua:661
function ui_multiseat_multiseatSettings.onClientEndMission() end

---Source : lua/ge/extensions/ui/multiseat/multiseatSettings.lua:671
function ui_multiseat_multiseatSettings.onExtensionUnloaded() end

---Source : lua/ge/extensions/ui/multiseat/multiseatSettings.lua:629
function ui_multiseat_multiseatSettings.onLocalParticipantsChanged() end

---Source : lua/ge/extensions/ui/multiseat/multiseatSettings.lua:634
function ui_multiseat_multiseatSettings.onSettingsEnter() end

---Source : lua/ge/extensions/ui/multiseat/multiseatSettings.lua:639
---@param context any
---@param toRoute any
---@param fromRoute any
---@param data any
function ui_multiseat_multiseatSettings.onSettingsLeave(context, toRoute, fromRoute, data) end

---Source : lua/ge/extensions/ui/multiseat/multiseatSettings.lua:644
---@param context any
---@param toRoute any
---@param fromRoute any
---@param data any
function ui_multiseat_multiseatSettings.onVehicleSelectorEnter(context, toRoute, fromRoute, data) end

---Source : lua/ge/extensions/ui/multiseat/multiseatSettings.lua:654
---@param context any
---@param toRoute any
---@param fromRoute any
---@param data any
function ui_multiseat_multiseatSettings.onVehicleSelectorLeave(context, toRoute, fromRoute, data) end

---Source : lua/ge/extensions/ui/multiseat/multiseatSettings.lua:650
---@param context any
---@param toRoute any
---@param fromRoute any
---@param data any
function ui_multiseat_multiseatSettings.onVehicleSelectorMount(context, toRoute, fromRoute, data) end

---Source : lua/ge/extensions/ui/multiseat/multiseatSettings.lua:599
---@param player any
function ui_multiseat_multiseatSettings.openVehicleSelectorForPlayer(player) end

---Source : lua/ge/extensions/ui/multiseat/multiseatSettings.lua:619
function ui_multiseat_multiseatSettings.play() end

---Source : lua/ge/extensions/ui/multiseat/multiseatSettings.lua:575
---@param deviceId any
function ui_multiseat_multiseatSettings.removeDevice(deviceId) end

---Source : lua/ge/extensions/ui/multiseat/multiseatSettings.lua:410
function ui_multiseat_multiseatSettings.requestMultiseatExit() end

--- action fields do not carry a value, the owning provider performs the change right away
---Source : lua/ge/extensions/ui/multiseat/multiseatSettings.lua:298
---@param providerId any
---@param fieldId any
---@param value any
function ui_multiseat_multiseatSettings.runSettingAction(providerId, fieldId, value) end

---Source : lua/ge/extensions/ui/multiseat/multiseatSettings.lua:567
---@param deviceId any
---@param personaNumber any
function ui_multiseat_multiseatSettings.setDevicePlayer(deviceId, personaNumber) end

---Source : lua/ge/extensions/ui/multiseat/multiseatSettings.lua:611
---@param player any
---@param icon any
function ui_multiseat_multiseatSettings.stagePlayerIcon(player, icon) end

---Source : lua/ge/extensions/ui/multiseat/multiseatSettings.lua:535
---@param player any
---@param optedIn any
function ui_multiseat_multiseatSettings.stagePlayerOptIn(player, optedIn) end

---Source : lua/ge/extensions/ui/multiseat/multiseatSettings.lua:603
---@param player any
---@param preferences any
function ui_multiseat_multiseatSettings.stagePlayerVehiclePreferences(player, preferences) end

---Source : lua/ge/extensions/ui/multiseat/multiseatSettings.lua:275
---@param providerId any
---@param fieldId any
---@param value any
function ui_multiseat_multiseatSettings.stageSetting(providerId, fieldId, value) end

---Source : lua/ge/extensions/ui/multiseat/multiseatSettings.lua:551
---@param deviceId any
function ui_multiseat_multiseatSettings.toggleDevicePlayer(deviceId) end

