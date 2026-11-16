---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/policeInfo.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- GE extension that feeds the police pursuit UI: it reads gameplay_police.getPursuitData every GUI frame and publishes the 'policePursuit' stream (level, visibility, arrest and evade gauges, duration, flags). It also pushes alerts (PoliceAlertPush / PoliceAlertClear) for offenses and for the end of a pursuit. By default it follows the player's vehicle, unless M.targetId is set.
--- Access: extension `ui_policeInfo`: `extensions.load("ui_policeInfo")`, then the global `ui_policeInfo`
---@class ui_policeInfo
---@field enabled boolean Default true. Set to false to disable the automatic updates and alerts.
---@field showFinalStats boolean Default true. Set to false to not show the summary (score, offenses, units) at the end of a pursuit.
---@field targetId integer|nil If set, uses the pursuit data of this vehicle instead of the player's.
ui_policeInfo = {}

--- Indicates whether a pursuit is or has been active (liveData state > 0, including the end screen).
---Source: lua/ge/extensions/ui/policeInfo.lua:40
---@return boolean  true if state > 0.
function ui_policeInfo.isPursuit() end

--- Hook called every GUI frame: reads the pursuit data, updates level, visibility, gauges, duration (format m:ss or h:mm:ss) and flags, then publishes 'policePursuit'. Does nothing if be:getEnabled() is false or if the extension is disabled.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/policeInfo.lua:154
---@param dt number Time delta in seconds (unused).
function ui_policeInfo.onGuiUpdate(dt) end

--- Hook called for a pursuit action. On 'arrest' or 'evade': switches to state 2, sets the corresponding gauge to 1, clears the alerts and shows either the summary (score, number of offenses, roadblocks or police units), or a simple failure/success depending on showFinalStats.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/policeInfo.lua:77
---@param vehId integer Vehicle concerned.
---@param action string 'arrest' or 'evade' (other actions are ignored).
---@param data table Not used.
function ui_policeInfo.onPursuitAction(vehId, action, data) end

--- Hook called when an offense is committed during a pursuit; pushes a 3 s alert (text ui.apps.police.offenseAlert with the translated name ui.traffic.infractions.<name>) if the vehicle is the target or the player.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/policeInfo.lua:64
---@param vehId integer Offending vehicle.
---@param name string Offense name.
---@param data table Additional data (unused).
function ui_policeInfo.onPursuitOffense(vehId, name, data) end

--- Hook called when the pursuit end statistics are finished; resets the table if in state 2.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/policeInfo.lua:144
function ui_policeInfo.onPursuitStatsEnded() end

--- Hook called when the UI changes state; resets the table.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/policeInfo.lua:150
function ui_policeInfo.onUiChangedState() end

--- Hook called when the controlled vehicle changes; resets the table if the extension is enabled and without targetId.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/policeInfo.lua:58
---@param _ any Ignored (inferred from code).
---@param id integer Id of the new vehicle (unused).
function ui_policeInfo.onVehicleSwitched(_, id) end

--- Resets all numbers and flags of liveData to zero, clears the alerts (PoliceAlertClear) and republishes the 'policePursuit' stream.
---Source: lua/ge/extensions/ui/policeInfo.lua:44
function ui_policeInfo.resetPursuitTable() end

