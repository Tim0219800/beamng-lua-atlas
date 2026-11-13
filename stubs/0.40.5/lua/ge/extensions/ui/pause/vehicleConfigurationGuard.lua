---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/pause/vehicleConfigurationGuard.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `ui_pause_vehicleConfigurationGuard` : `extensions.load("ui_pause_vehicleConfigurationGuard")`, puis la globale `ui_pause_vehicleConfigurationGuard`
---@class ui_pause_vehicleConfigurationGuard
ui_pause_vehicleConfigurationGuard = {}

---Source : lua/ge/extensions/ui/pause/vehicleConfigurationGuard.lua:83
function ui_pause_vehicleConfigurationGuard.cancelExit() end

---Source : lua/ge/extensions/ui/pause/vehicleConfigurationGuard.lua:39
---@param route any
---@param params any
---@param context any
function ui_pause_vehicleConfigurationGuard.confirmExit(route, params, context) end

--- The pending parts tree and tuning values live in the UI, so it applies them and
---  then calls back into resumePendingExit()
---Source : lua/ge/extensions/ui/pause/vehicleConfigurationGuard.lua:94
function ui_pause_vehicleConfigurationGuard.confirmExitApplying() end

--- Unapplied changes only ever existed in the UI, so leaving the screen is the discard
---Source : lua/ge/extensions/ui/pause/vehicleConfigurationGuard.lua:88
function ui_pause_vehicleConfigurationGuard.confirmExitDiscarding() end

---Source : lua/ge/extensions/ui/pause/vehicleConfigurationGuard.lua:21
function ui_pause_vehicleConfigurationGuard.navigateBack() end

---Source : lua/ge/extensions/ui/pause/vehicleConfigurationGuard.lua:98
function ui_pause_vehicleConfigurationGuard.resumePendingExit() end

---Source : lua/ge/extensions/ui/pause/vehicleConfigurationGuard.lua:17
---@param value any
function ui_pause_vehicleConfigurationGuard.setHasPendingChanges(value) end

