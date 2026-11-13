---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/pause/providers/vehicleTabInteractions.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `ui_pause_providers_vehicleTabInteractions` : `extensions.load("ui_pause_providers_vehicleTabInteractions")`, puis la globale `ui_pause_providers_vehicleTabInteractions`
---@class ui_pause_providers_vehicleTabInteractions
---@field dependencies table
ui_pause_providers_vehicleTabInteractions = {}

---Source : lua/ge/extensions/ui/pause/providers/vehicleTabInteractions.lua:1607
---@param buttonId any
---@param payload any
function ui_pause_providers_vehicleTabInteractions.executeVehicleTabInteractionAction(buttonId, payload) end

---Source : lua/ge/extensions/ui/pause/providers/vehicleTabInteractions.lua:1650
function ui_pause_providers_vehicleTabInteractions.getAsyncHydrationDebugDelay() end

---Source : lua/ge/extensions/ui/pause/providers/vehicleTabInteractions.lua:1662
---@param context any
function ui_pause_providers_vehicleTabInteractions.getSpawnedSelectedVehicleData(context) end

---Source : lua/ge/extensions/ui/pause/providers/vehicleTabInteractions.lua:1629
---@param context any
function ui_pause_providers_vehicleTabInteractions.getSpawnedSelectedVehicleShellData(context) end

---Source : lua/ge/extensions/ui/pause/providers/vehicleTabInteractions.lua:1612
---@param context any
function ui_pause_providers_vehicleTabInteractions.getSpawnedVehiclesData(context) end

---Source : lua/ge/extensions/ui/pause/providers/vehicleTabInteractions.lua:1616
---@param context any
function ui_pause_providers_vehicleTabInteractions.getSpawnedVehiclesShellData(context) end

---Source : lua/ge/extensions/ui/pause/providers/vehicleTabInteractions.lua:1654
---@param context any
function ui_pause_providers_vehicleTabInteractions.getSpawnedVehiclesSummaryData(context) end

---Source : lua/ge/extensions/ui/pause/providers/vehicleTabInteractions.lua:1666
---@param routeName any
function ui_pause_providers_vehicleTabInteractions.onPauseRouteLifecycle(routeName) end

---Source : lua/ge/extensions/ui/pause/providers/vehicleTabInteractions.lua:1697
---@param dtReal any
---@param dtSim any
---@param dtRaw any
function ui_pause_providers_vehicleTabInteractions.onUpdate(dtReal, dtSim, dtRaw) end

---Source : lua/ge/extensions/ui/pause/providers/vehicleTabInteractions.lua:1685
function ui_pause_providers_vehicleTabInteractions.onVehicleDestroyed() end

---Source : lua/ge/extensions/ui/pause/providers/vehicleTabInteractions.lua:1693
---@param vehicleId any
function ui_pause_providers_vehicleTabInteractions.onVehicleHoverEnd(vehicleId) end

---Source : lua/ge/extensions/ui/pause/providers/vehicleTabInteractions.lua:1689
---@param vehicleId any
function ui_pause_providers_vehicleTabInteractions.onVehicleHoverStart(vehicleId) end

---Source : lua/ge/extensions/ui/pause/providers/vehicleTabInteractions.lua:1680
function ui_pause_providers_vehicleTabInteractions.onVehicleSpawned() end

---Source : lua/ge/extensions/ui/pause/providers/vehicleTabInteractions.lua:1675
function ui_pause_providers_vehicleTabInteractions.onVehicleSwitchPerformendByUser() end

---Source : lua/ge/extensions/ui/pause/providers/vehicleTabInteractions.lua:1670
function ui_pause_providers_vehicleTabInteractions.onVehicleSwitched() end

---Source : lua/ge/extensions/ui/pause/providers/vehicleTabInteractions.lua:1633
---@param payload any
function ui_pause_providers_vehicleTabInteractions.requestSpawnedSelectedVehiclePayload(payload) end

---Source : lua/ge/extensions/ui/pause/providers/vehicleTabInteractions.lua:1620
---@param payload any
function ui_pause_providers_vehicleTabInteractions.requestSpawnedVehiclesPayload(payload) end

---Source : lua/ge/extensions/ui/pause/providers/vehicleTabInteractions.lua:1642
---@param delaySec any
function ui_pause_providers_vehicleTabInteractions.setAsyncHydrationDebugDelay(delaySec) end

