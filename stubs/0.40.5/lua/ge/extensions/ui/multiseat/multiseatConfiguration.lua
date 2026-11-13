---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/multiseat/multiseatConfiguration.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `ui_multiseat_multiseatConfiguration` : `extensions.load("ui_multiseat_multiseatConfiguration")`, puis la globale `ui_multiseat_multiseatConfiguration`
---@class ui_multiseat_multiseatConfiguration
---@field AUTOMATIC_COLOR_DEFAULT boolean
---@field dependencies table
ui_multiseat_multiseatConfiguration = {}

---Source : lua/ge/extensions/ui/multiseat/multiseatConfiguration.lua:328
---@param options any
function ui_multiseat_multiseatConfiguration.begin(options) end

---Source : lua/ge/extensions/ui/multiseat/multiseatConfiguration.lua:823
function ui_multiseat_multiseatConfiguration.clearCachedAssignments() end

---Source : lua/ge/extensions/ui/multiseat/multiseatConfiguration.lua:895
function ui_multiseat_multiseatConfiguration.commit() end

---Source : lua/ge/extensions/ui/multiseat/multiseatConfiguration.lua:860
function ui_multiseat_multiseatConfiguration.commitCore() end

---Source : lua/ge/extensions/ui/multiseat/multiseatConfiguration.lua:873
function ui_multiseat_multiseatConfiguration.completeCommit() end

---Source : lua/ge/extensions/ui/multiseat/multiseatConfiguration.lua:506
---@param deviceId any
function ui_multiseat_multiseatConfiguration.cycleDevicePlayer(deviceId) end

---Source : lua/ge/extensions/ui/multiseat/multiseatConfiguration.lua:367
function ui_multiseat_multiseatConfiguration.discard() end

---Source : lua/ge/extensions/ui/multiseat/multiseatConfiguration.lua:658
function ui_multiseat_multiseatConfiguration.getCommitConfiguration() end

---Source : lua/ge/extensions/ui/multiseat/multiseatConfiguration.lua:575
---@param personaNumber any
function ui_multiseat_multiseatConfiguration.getPersona(personaNumber) end

---Source : lua/ge/extensions/ui/multiseat/multiseatConfiguration.lua:651
function ui_multiseat_multiseatConfiguration.getPlayers() end

---Source : lua/ge/extensions/ui/multiseat/multiseatConfiguration.lua:581
function ui_multiseat_multiseatConfiguration.getPreview() end

---Source : lua/ge/extensions/ui/multiseat/multiseatConfiguration.lua:834
function ui_multiseat_multiseatConfiguration.hasChanges() end

---Source : lua/ge/extensions/ui/multiseat/multiseatConfiguration.lua:814
function ui_multiseat_multiseatConfiguration.hasUserChanges() end

---Source : lua/ge/extensions/ui/multiseat/multiseatConfiguration.lua:363
function ui_multiseat_multiseatConfiguration.isActive() end

---Source : lua/ge/extensions/ui/multiseat/multiseatConfiguration.lua:531
---@param groupId any
function ui_multiseat_multiseatConfiguration.joinDeviceGroup(groupId) end

---Source : lua/ge/extensions/ui/multiseat/multiseatConfiguration.lua:547
---@param player any
function ui_multiseat_multiseatConfiguration.leavePlayer(player) end

---Source : lua/ge/extensions/ui/multiseat/multiseatConfiguration.lua:456
---@param deviceId any
---@param direction any
function ui_multiseat_multiseatConfiguration.moveDevicePlayer(deviceId, direction) end

---Source : lua/ge/extensions/ui/multiseat/multiseatConfiguration.lua:902
function ui_multiseat_multiseatConfiguration.onClientEndMission() end

---Source : lua/ge/extensions/ui/multiseat/multiseatConfiguration.lua:908
function ui_multiseat_multiseatConfiguration.onInputBindingsChanged() end

---Source : lua/ge/extensions/ui/multiseat/multiseatConfiguration.lua:437
---@param deviceId any
function ui_multiseat_multiseatConfiguration.removeDevice(deviceId) end

---Source : lua/ge/extensions/ui/multiseat/multiseatConfiguration.lua:886
function ui_multiseat_multiseatConfiguration.rollbackCommit() end

--- personaNumber 1..MAX_PLAYERS assigns the device to that player, nil or 0 unassigns it
---Source : lua/ge/extensions/ui/multiseat/multiseatConfiguration.lua:418
---@param deviceId any
---@param personaNumber any
function ui_multiseat_multiseatConfiguration.setDevicePlayer(deviceId, personaNumber) end

---Source : lua/ge/extensions/ui/multiseat/multiseatConfiguration.lua:566
---@param personaNumber any
---@param data any
---@param emitChange any
function ui_multiseat_multiseatConfiguration.setPersonaData(personaNumber, data, emitChange) end

---Source : lua/ge/extensions/ui/multiseat/multiseatConfiguration.lua:397
---@param deviceId any
function ui_multiseat_multiseatConfiguration.toggleDevicePlayer(deviceId) end

