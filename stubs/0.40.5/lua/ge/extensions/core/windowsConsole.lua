---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/windowsConsole.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Bridge between the native Windows console window (C++) and Lua. It fills the dropdown list of execution contexts (GE-Lua, current vehicle, each active vehicle, GE-TorqueScript, CEF/UI - JS) and executes the typed command in the chosen context. Everything is called by the engine; a modder can only listen to the onConsoleExecuteCommand hook.
--- Access: extension `core_windowsConsole`: `extensions.load("core_windowsConsole")`, then the global `core_windowsConsole`
---@class core_windowsConsole
core_windowsConsole = {}

--- Rebuilds the list of contexts available in the console (alias of refreshCombo). Called by C++ when the console window is activated.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/windowsConsole.lua:47
function core_windowsConsole.configure() end

--- Executes a command in a context and emits the onConsoleExecuteCommand(context, cmd) hook. 'GE-TorqueScript' goes through TorqueScript.eval, 'CEF/UI - JS' through be:queueJS, a vehicle name through queueLuaCommand on that vehicle.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/windowsConsole.lua:10
---@param context string Name of the context chosen in the console.
---@param cmd string Command text.
function core_windowsConsole.executeCommand(context, cmd) end

--- Hook called on load: enables the extension if the C++ console functions exist.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/windowsConsole.lua:77
---@return boolean|nil  false if the console is not available on the platform.
function core_windowsConsole.onExtensionLoaded() end

--- Hook called when a vehicle becomes active or inactive: refreshes the context list (same function as configure).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/windowsConsole.lua:47
function core_windowsConsole.onVehicleActiveChanged() end

--- Hook called when a vehicle is destroyed: refreshes the context list.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/windowsConsole.lua:47
function core_windowsConsole.onVehicleDestroyed() end

--- Hook called when a vehicle spawns: refreshes the context list.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/windowsConsole.lua:47
function core_windowsConsole.onVehicleSpawned() end

--- Hook called when the player vehicle changes: refreshes the context list.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/windowsConsole.lua:47
function core_windowsConsole.onVehicleSwitched() end

--- Executes Lua text in the GE VM: tries loadstring(cmd), otherwise loadstring('return ' .. cmd) to display the value of an expression, then dumps the result if it is not nil. Logs "syntax error" if nothing compiles.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/windowsConsole.lua:28
---@param cmd string Lua code or expression.
function core_windowsConsole.tryRunCommand(cmd) end

