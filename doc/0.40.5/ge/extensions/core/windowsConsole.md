# `core_windowsConsole`

*File: `lua/ge/extensions/core/windowsConsole.lua` · VM: Game Engine (GE) · 96 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_windowsConsole`: `extensions.load("core_windowsConsole")`, then the global `core_windowsConsole`

Bridge between the native Windows console window (C++) and Lua. It fills the dropdown list of execution contexts (GE-Lua, current vehicle, each active vehicle, GE-TorqueScript, CEF/UI - JS) and executes the typed command in the chosen context. Everything is called by the engine; a modder can only listen to the onConsoleExecuteCommand hook.

## Notes

- If the C++ functions consoleClearAvailableContexts etc. do not exist (other platform), onExtensionLoaded returns false and the extension stays inactive (refreshCombo does nothing).
- The 'GE-Lua' context is not handled in executeCommand: it is executed on the C++ side (tryRunCommand is the callback used).
- Vehicle contexts are named after mainPartName; two vehicles of the same model share the same name, so nameVidMap only keeps one.

## Functions

| Function | Description | Line |
|---|---|---|
| `core_windowsConsole.configure()` | Rebuilds the list of contexts available in the console (alias of refreshCombo). Called by C++ when the console window is activated. *(internal)* | 47 |
| `core_windowsConsole.executeCommand(context, cmd)` | Executes a command in a context and emits the onConsoleExecuteCommand(context, cmd) hook. 'GE-TorqueScript' goes through TorqueScript.eval, 'CEF/UI - JS' through be:queueJS, a vehicle name through queueLuaCommand on that vehicle. *(internal)* | 10 |
| `core_windowsConsole.onExtensionLoaded()` | Hook called on load: enables the extension if the C++ console functions exist. *(internal)* *(hook)* | 77 |
| `core_windowsConsole.onVehicleActiveChanged()` | Hook called when a vehicle becomes active or inactive: refreshes the context list (same function as configure). *(internal)* *(hook)* | 47 |
| `core_windowsConsole.onVehicleDestroyed()` | Hook called when a vehicle is destroyed: refreshes the context list. *(internal)* *(hook)* | 47 |
| `core_windowsConsole.onVehicleSpawned()` | Hook called when a vehicle spawns: refreshes the context list. *(internal)* *(hook)* | 47 |
| `core_windowsConsole.onVehicleSwitched()` | Hook called when the player vehicle changes: refreshes the context list. *(internal)* *(hook)* | 47 |
| `core_windowsConsole.tryRunCommand(cmd)` | Executes Lua text in the GE VM: tries loadstring(cmd), otherwise loadstring('return ' .. cmd) to display the value of an expression, then dumps the result if it is not nil. Logs "syntax error" if nothing compiles. *(internal)* | 28 |

### Parameter details

#### `core_windowsConsole.executeCommand(context, cmd)`

Executes a command in a context and emits the onConsoleExecuteCommand(context, cmd) hook. 'GE-TorqueScript' goes through TorqueScript.eval, 'CEF/UI - JS' through be:queueJS, a vehicle name through queueLuaCommand on that vehicle.

- `context` (*string*) : Name of the context chosen in the console.
- `cmd` (*string*) : Command text.

#### `core_windowsConsole.onExtensionLoaded()`

Hook called on load: enables the extension if the C++ console functions exist.

- **returns**: boolean|nil false if the console is not available on the platform.

#### `core_windowsConsole.tryRunCommand(cmd)`

Executes Lua text in the GE VM: tries loadstring(cmd), otherwise loadstring('return ' .. cmd) to display the value of an expression, then dumps the result if it is not nil. Logs "syntax error" if nothing compiles.

- `cmd` (*string*) : Lua code or expression.

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onConsoleExecuteCommand` — listened to by 1 module(s)

## Calls into the engine (C++)

- `be:` `getObject`, `getObjectCount`, `queueJS`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/windowsConsole.lua`.*
