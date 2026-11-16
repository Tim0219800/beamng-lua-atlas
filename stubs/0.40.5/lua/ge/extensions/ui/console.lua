---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/console.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "consoleNG" development console in ImGui ("beamng.consoleNG" window). It displays the game log (read every frame via Engine.getFrameLog) with filters by level (E, W, I, D, A), filter by origin as a Lua pattern, pause (Pause key), log statistics and auto-scroll. It also lets you run commands in four contexts: game engine Lua (GE), TorqueScript, interface JavaScript (CEF) or the Lua of a specific vehicle. A modder opens it with ui_console.toggle() to debug.
--- Access: extension `ui_console`: `extensions.load("ui_console")`, then the global `ui_console`
---@class ui_console
---@field dependencies string[] Extensions loaded before this one: ui_imgui.
---@field inputCallback nil Always nil: assigned from a nonexistent local variable (bug).
---@field onExtensionUnloaded nil Always nil: assigned from a nonexistent local variable (bug), so there is no unload hook.
ui_console = {}

--- Closes the console window.
---Source: lua/ge/extensions/ui/console.lua:172
function ui_console.hide() end

--- Hook called after a Lua reload: restores the state saved by onSerialize.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/console.lua:1215
---@param data table Table returned by onSerialize.
function ui_console.onDeserialized(data) end

--- Hook called when the extension loads: loads the settings and history, initializes the editor's ImGui theme and builds the list of execution contexts.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/console.lua:1230
function ui_console.onExtensionLoaded() end

--- Hook called when a watched file changes. Reloads the history if the file is /consoleHistory.json.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/console.lua:1239
---@param filename string Path of the modified file.
---@param type string Change type (not used).
function ui_console.onFileChanged(filename, type) end

--- Hook called before a Lua reload: saves the window state (open, origin filter, input in progress, level filter, fullscreen, position, scroll).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/console.lua:1199
---@return table  Data to hand back to onDeserialized.
function ui_console.onSerialize() end

--- Hook called every frame. If the window is open, reads the new log lines (except when paused), draws the ImGui console and processes the commands entered; on close, gives vehicle control back.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/console.lua:556
---@param dtReal number Real frame duration in seconds (not used).
---@param dtSim number Simulated frame duration in seconds (not used).
---@param dtRaw number Raw frame duration in seconds (not used).
function ui_console.onUpdate(dtReal, dtSim, dtRaw) end

--- Hook called when a vehicle becomes active or inactive: rebuilds the list of execution contexts (refreshCombo).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/console.lua:1178
function ui_console.onVehicleActiveChanged() end

--- Hook called when a vehicle is destroyed: rebuilds the list of execution contexts.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/console.lua:1178
function ui_console.onVehicleDestroyed() end

--- Hook called when a vehicle is spawned: rebuilds the list of execution contexts.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/console.lua:1178
function ui_console.onVehicleSpawned() end

--- Hook called when the player's vehicle changes: rebuilds the list of execution contexts.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/console.lua:1178
function ui_console.onVehicleSwitched() end

--- Opens the console window.
---Source: lua/ge/extensions/ui/console.lua:168
function ui_console.show() end

--- Opens the window if it is closed, closes it if it is open.
---Source: lua/ge/extensions/ui/console.lua:176
function ui_console.toggle() end

---Source: lua/ge/extensions/ui/console.lua:429
---@param data any
function ConsoleInputCallback(data) end

