---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/pause/providers/trafficControls.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Data provider for the pause menu "traffic controls" panel. It counts traffic vehicles (driving, parked, police, active/inactive) via gameplay_traffic, gameplay_parking and gameplay_police, computes the quantities to spawn from the settings (trafficAmount, trafficExtraAmount, trafficParkingAmount, trafficParkedVehicles) and builds the buttons (start, stop, delete, spawn normal traffic, police or parked vehicles, enable/disable). The buttons are executed by executeTrafficControlAction.
--- Access: extension `ui_pause_providers_trafficControls`: `extensions.load("ui_pause_providers_trafficControls")`, then the global `ui_pause_providers_trafficControls`
---@class ui_pause_providers_trafficControls
ui_pause_providers_trafficControls = {}

--- Executes a button's action by its identifier: start, stop or delete traffic, spawn normal, police or parked traffic, or toggle.
---Source: lua/ge/extensions/ui/pause/providers/trafficControls.lua:335
---@param buttonId any Button identifier, provided by getData.
---@param payload any Data passed to the button's callback.
---@return boolean  false if buttonId is nil, otherwise the callback result.
function ui_pause_providers_trafficControls.executeTrafficControlAction(buttonId, payload) end

--- Builds the traffic panel state: traffic state, parking active, enabled, canActivateExisting (more than one object in the scene), driving/parked/police/total counters ({total, active, inactive}) and action buttons (toggle, controls, spawn).
---Source: lua/ge/extensions/ui/pause/providers/trafficControls.lua:305
---@param payload table|nil requestId is returned as is; editable == false disables all buttons.
---@return table  {requestId, state, parkingActive, enabled, canActivateExisting, driving, parked, police, total, actions}.
function ui_pause_providers_trafficControls.getData(payload) end

