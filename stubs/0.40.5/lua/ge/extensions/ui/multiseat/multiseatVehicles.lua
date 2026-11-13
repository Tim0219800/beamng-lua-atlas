---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/multiseat/multiseatVehicles.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `ui_multiseat_multiseatVehicles` : `extensions.load("ui_multiseat_multiseatVehicles")`, puis la globale `ui_multiseat_multiseatVehicles`
---@class ui_multiseat_multiseatVehicles
---@field dependencies table
ui_multiseat_multiseatVehicles = {}

--- stop tracking a player's vehicle without deleting it, so it survives the multiseat teardown.
---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1943
---@param player any
function ui_multiseat_multiseatVehicles.abandonPlayerVehicle(player) end

---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1596
---@param player any
---@param veh any
function ui_multiseat_multiseatVehicles.adoptFreeroamVehicle(player, veh) end

---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1834
function ui_multiseat_multiseatVehicles.applyStagedChanges() end

---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1986
---@param spawned any
function ui_multiseat_multiseatVehicles.areVehiclesReady(spawned) end

---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1853
function ui_multiseat_multiseatVehicles.cancelPreparedChanges() end

---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:683
function ui_multiseat_multiseatVehicles.clearCustomSplitPlayers() end

---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1928
function ui_multiseat_multiseatVehicles.clearSession() end

---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1062
---@param vehicle any
---@param playerId any
function ui_multiseat_multiseatVehicles.configurePlayerVehicle(vehicle, playerId) end

---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1108
---@param deviceId any
function ui_multiseat_multiseatVehicles.cycleDevicePlayer(deviceId) end

---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1857
function ui_multiseat_multiseatVehicles.discardStagedChanges() end

---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1057
---@param buttonId any
---@param payload any
function ui_multiseat_multiseatVehicles.executeDigestAction(buttonId, payload) end

---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1793
---@param changes any
---@param committedConfig any
function ui_multiseat_multiseatVehicles.finalizeStagedChanges(changes, committedConfig) end

---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1370
---@param target any
function ui_multiseat_multiseatVehicles.gatherVehicles(target) end

---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:128
function ui_multiseat_multiseatVehicles.getAutomaticColorEnabled() end

---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:983
function ui_multiseat_multiseatVehicles.getDigestData() end

---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1308
function ui_multiseat_multiseatVehicles.getGatherVehicleOptions() end

---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1951
function ui_multiseat_multiseatVehicles.getOwnedVehicles() end

---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:905
function ui_multiseat_multiseatVehicles.getPersonaSelectorData() end

---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:924
function ui_multiseat_multiseatVehicles.getSettingsData() end

---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1222
function ui_multiseat_multiseatVehicles.getSharedVehicleOptions() end

---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:833
function ui_multiseat_multiseatVehicles.getStagedChanges() end

---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:896
function ui_multiseat_multiseatVehicles.getStagedPlayers() end

---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:70
---@param levelName any
---@param playerCount any
function ui_multiseat_multiseatVehicles.getSuggestedVehicles(levelName, playerCount) end

---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:61
---@param levelName any
---@param playerCount any
function ui_multiseat_multiseatVehicles.getSuggestedVehiclesForLevel(levelName, playerCount) end

---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1874
---@param player any
function ui_multiseat_multiseatVehicles.getVehicleForPlayer(player) end

---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:891
function ui_multiseat_multiseatVehicles.hasUserChanges() end

---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1996
function ui_multiseat_multiseatVehicles.isSynchronizing() end

---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1138
---@param groupId any
function ui_multiseat_multiseatVehicles.joinDeviceGroup(groupId) end

---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1144
---@param player any
function ui_multiseat_multiseatVehicles.leaveDeviceGroup(player) end

---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1120
---@param deviceId any
---@param direction any
function ui_multiseat_multiseatVehicles.moveDevicePlayer(deviceId, direction) end

--- the level teardown takes the vehicles with it, so only the bookkeeping has to go
---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:2107
function ui_multiseat_multiseatVehicles.onClientEndMission() end

---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:2038
---@param data any
function ui_multiseat_multiseatVehicles.onDeserialized(data) end

---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:2131
function ui_multiseat_multiseatVehicles.onExtensionUnloaded() end

---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1581
---@param context any
---@param toRoute any
---@param fromRoute any
---@param data any
function ui_multiseat_multiseatVehicles.onQuickVehicleSelectorEnter(context, toRoute, fromRoute, data) end

---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1589
---@param context any
---@param toRoute any
---@param fromRoute any
---@param data any
function ui_multiseat_multiseatVehicles.onQuickVehicleSelectorLeave(context, toRoute, fromRoute, data) end

---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1585
---@param context any
---@param toRoute any
---@param fromRoute any
---@param data any
function ui_multiseat_multiseatVehicles.onQuickVehicleSelectorMount(context, toRoute, fromRoute, data) end

---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:2000
---@param reason any
function ui_multiseat_multiseatVehicles.onSerialize(reason) end

---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:2098
function ui_multiseat_multiseatVehicles.onUiWaitingState() end

---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:2068
function ui_multiseat_multiseatVehicles.onUpdate() end

---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1466
---@param toRoute any
function ui_multiseat_multiseatVehicles.onVehicleSelectorLeave(toRoute) end

---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1557
---@param player any
function ui_multiseat_multiseatVehicles.openQuickVehicleSelectorForPlayer(player) end

---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1440
function ui_multiseat_multiseatVehicles.openVehicleSelectorForAllPlayers() end

---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1415
---@param player any
function ui_multiseat_multiseatVehicles.openVehicleSelectorForPlayer(player) end

---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1711
function ui_multiseat_multiseatVehicles.prepareStagedChanges() end

---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1635
---@param options any
function ui_multiseat_multiseatVehicles.reconcileFreeroamVehicles(options) end

---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1893
---@param spawnPlan any
---@param options any
function ui_multiseat_multiseatVehicles.reconcileSpawnPlan(spawnPlan, options) end

---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1922
function ui_multiseat_multiseatVehicles.removeAll() end

---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1132
---@param deviceId any
function ui_multiseat_multiseatVehicles.removeDevice(deviceId) end

---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1973
function ui_multiseat_multiseatVehicles.repaintOwnedVehicles() end

---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1509
---@param player any
---@param model any
---@param config any
---@param additionalData any
function ui_multiseat_multiseatVehicles.replacePlayerVehicle(player, model, config, additionalData) end

---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1403
function ui_multiseat_multiseatVehicles.reseatAllPlayers() end

---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1866
function ui_multiseat_multiseatVehicles.resetSettingsSnapshots() end

---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:678
---@param players any
function ui_multiseat_multiseatVehicles.setCustomSplitPlayers(players) end

---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1126
---@param deviceId any
---@param personaNumber any
function ui_multiseat_multiseatVehicles.setDevicePlayer(deviceId, personaNumber) end

---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1962
---@param spawned any
---@param frozen any
function ui_multiseat_multiseatVehicles.setFrozen(spawned, frozen) end

---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1614
---@param player any
---@param vehicle any
function ui_multiseat_multiseatVehicles.setPlayerVehicleSelection(player, vehicle) end

---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1880
---@param spawnPlan any
function ui_multiseat_multiseatVehicles.spawnAll(spawnPlan) end

---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1204
---@param automaticColor any
function ui_multiseat_multiseatVehicles.stageAutomaticColorForAllPlayers(automaticColor) end

---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1189
---@param player any
---@param icon any
function ui_multiseat_multiseatVehicles.stagePlayerIcon(player, icon) end

---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1101
---@param player any
---@param optedIn any
function ui_multiseat_multiseatVehicles.stagePlayerOptIn(player, optedIn) end

---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1167
---@param player any
---@param preferences any
function ui_multiseat_multiseatVehicles.stagePlayerVehiclePreferences(player, preferences) end

---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1296
---@param source any
function ui_multiseat_multiseatVehicles.stageSameVehicleForAllPlayers(source) end

---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1114
---@param deviceId any
function ui_multiseat_multiseatVehicles.toggleDevicePlayer(deviceId) end

