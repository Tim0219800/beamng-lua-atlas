---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/trafficDebug.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Editor window "Traffic Debug" (menu Window > Debug) to inspect and tune the gameplay_traffic traffic system. Two tabs: General (number of traffic and parking vehicles, global settings via gameplay_traffic.setTrafficVars: activeAmount, spawnValue, spawnDirBias, baseAggression, speedLimit, aiAware, enableRandomEvents; debugMode checkbox; disperse button) and Vehicles (per-vehicle data: general, road, respawn, pursuit, timers, role, action log, forced teleport). Enables gameplay_traffic.debugMode on open and turns it off when the editor is deactivated.
--- Access: extension `editor_trafficDebug`: `extensions.load("editor_trafficDebug")`, then the global `editor_trafficDebug`
---@class editor_trafficDebug
editor_trafficDebug = {}

--- Hook called when the editor is closed: turns off gameplay_traffic.debugMode and forgets the traffic data.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/trafficDebug.lua:461
function editor_trafficDebug.onEditorDeactivated() end

--- Hook called every editor interface frame: draws the window, enables gameplay_traffic.debugMode on first display, reads gameplay_traffic.getTrafficData() and draws the current tab.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/trafficDebug.lua:471
function editor_trafficDebug.onEditorGui() end

--- Editor hook: registers the 'Traffic Debug' window (400x600) and its menu entry Window > Debug.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/trafficDebug.lua:466
function editor_trafficDebug.onEditorInitialized() end

--- Traffic hook: adds a line to the log of vehicle `id`, with the received timestamp, the action and its data, displayed in the Vehicles tab.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/trafficDebug.lua:500
---@param id integer Id of the traffic vehicle.
---@param action string Name of the traffic action.
---@param data any Associated data, displayed in parentheses if present.
function editor_trafficDebug.onTrafficAction(id, action, data) end

