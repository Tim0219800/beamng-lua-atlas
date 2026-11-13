---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/taxi.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `gameplay_taxi` : `extensions.load("gameplay_taxi")`, puis la globale `gameplay_taxi`
---@class gameplay_taxi
---@field dependencies table
gameplay_taxi = {}

---Source : lua/ge/extensions/gameplay/taxi.lua:1160
function gameplay_taxi.callForTaxi() end

---Source : lua/ge/extensions/gameplay/taxi.lua:1092
function gameplay_taxi.cancelTaxiCall() end

---Source : lua/ge/extensions/gameplay/taxi.lua:1765
function gameplay_taxi.confirmTaxiDestination() end

---Source : lua/ge/extensions/gameplay/taxi.lua:498
---@param vehId any
function gameplay_taxi.getTaxiState(vehId) end

---Source : lua/ge/extensions/gameplay/taxi.lua:356
function gameplay_taxi.getTaxiViewData() end

---Source : lua/ge/extensions/gameplay/taxi.lua:1869
function gameplay_taxi.isTaxiRideActive() end

---Source : lua/ge/extensions/gameplay/taxi.lua:1870
function gameplay_taxi.isTaxiViewActive() end

---Source : lua/ge/extensions/gameplay/taxi.lua:1698
---@param vehId any
function gameplay_taxi.onAiRouteDone(vehId) end

---Source : lua/ge/extensions/gameplay/taxi.lua:841
function gameplay_taxi.onAnyMissionChanged() end

---Source : lua/ge/extensions/gameplay/taxi.lua:1588
function gameplay_taxi.onChangeDestinationCalled() end

---Source : lua/ge/extensions/gameplay/taxi.lua:866
function gameplay_taxi.onClientEndMission() end

---Source : lua/ge/extensions/gameplay/taxi.lua:1771
function gameplay_taxi.onDeactivateBigMapCallback() end

---Source : lua/ge/extensions/gameplay/taxi.lua:2048
function gameplay_taxi.onExtensionUnloaded() end

---Source : lua/ge/extensions/gameplay/taxi.lua:1705
function gameplay_taxi.onGameplayInteract() end

---Source : lua/ge/extensions/gameplay/taxi.lua:1624
function gameplay_taxi.onHurryUpCalled() end

---Source : lua/ge/extensions/gameplay/taxi.lua:1824
function gameplay_taxi.onRegisterQuickAccessMenus() end

---Source : lua/ge/extensions/gameplay/taxi.lua:1752
---@param pos any
function gameplay_taxi.onSetBigmapNavFocus(pos) end

---Source : lua/ge/extensions/gameplay/taxi.lua:1627
function gameplay_taxi.onSkipCalled() end

---Source : lua/ge/extensions/gameplay/taxi.lua:1625
function gameplay_taxi.onSlowDownCalled() end

---Source : lua/ge/extensions/gameplay/taxi.lua:1677
function gameplay_taxi.onStopTaxiCalled() end

---Source : lua/ge/extensions/gameplay/taxi.lua:1799
---@param context any
---@param toRoute any
---@param fromRoute any
---@param data any
function gameplay_taxi.onTaxiViewEnter(context, toRoute, fromRoute, data) end

---Source : lua/ge/extensions/gameplay/taxi.lua:250
function gameplay_taxi.onTrafficSpecialVehiclesProviders() end

---Source : lua/ge/extensions/gameplay/taxi.lua:837
function gameplay_taxi.onTrafficStarted() end

---Source : lua/ge/extensions/gameplay/taxi.lua:866
function gameplay_taxi.onTrafficStopped() end

---Source : lua/ge/extensions/gameplay/taxi.lua:845
---@param id any
function gameplay_taxi.onTrafficVehicleAdded(id) end

---Source : lua/ge/extensions/gameplay/taxi.lua:1804
---@param vehId any
function gameplay_taxi.onTrafficVehicleCrashed(vehId) end

---Source : lua/ge/extensions/gameplay/taxi.lua:854
---@param id any
function gameplay_taxi.onTrafficVehicleRemoved(id) end

---Source : lua/ge/extensions/gameplay/taxi.lua:1470
---@param dtReal any
---@param dtSim any
---@param dtRaw any
function gameplay_taxi.onUpdate(dtReal, dtSim, dtRaw) end

---Source : lua/ge/extensions/gameplay/taxi.lua:1791
---@param id any
function gameplay_taxi.onVehicleResetted(id) end

---Source : lua/ge/extensions/gameplay/taxi.lua:1519
---@param oldId any
---@param newId any
function gameplay_taxi.onVehicleSwitched(oldId, newId) end

---Source : lua/ge/extensions/gameplay/taxi.lua:1713
---@param lnk any
---@param actionValue any
---@param vehicleId any
function gameplay_taxi.onVehicleTriggersExecuteLink(lnk, actionValue, vehicleId) end

---Source : lua/ge/extensions/gameplay/taxi.lua:1665
---@param enabled any
function gameplay_taxi.setIdleCameraEnabled(enabled) end

---Source : lua/ge/extensions/gameplay/taxi.lua:1907
---@param enabled any
function gameplay_taxi.setUseBillboards(enabled) end

---Source : lua/ge/extensions/gameplay/taxi.lua:764
---@param skipWait any
function gameplay_taxi.startTaxiWithCurrentRoute(skipWait) end

---Source : lua/ge/extensions/gameplay/taxi.lua:833
function gameplay_taxi.taxiSettingChanged() end

