# `ui_console`

*File: `lua/ge/extensions/ui/console.lua` · VM: Game Engine (GE) · 1267 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_console`: `extensions.load("ui_console")`, then the global `ui_console`

"consoleNG" development console in ImGui ("beamng.consoleNG" window). It displays the game log (read every frame via Engine.getFrameLog) with filters by level (E, W, I, D, A), filter by origin as a Lua pattern, pause (Pause key), log statistics and auto-scroll. It also lets you run commands in four contexts: game engine Lua (GE), TorqueScript, interface JavaScript (CEF) or the Lua of a specific vehicle. A modder opens it with ui_console.toggle() to debug.

## Example

```lua
extensions.load('ui_console')
ui_console.show()   -- opens the window
ui_console.toggle() -- opens or closes
```

## Notes

- The window settings (font size, level filters, fullscreen, transparency, history wraparound, sandbox mode, focus on open, vehicle control) are saved in /settings/consoleNG.json; the command history (20 entries at most) is in /consoleHistory.json and reloaded if this file changes (onFileChanged).
- Execution contexts (drop-down list): 0 = GE Lua, 1 = TorqueScript (a ";" is added if missing), 2 = interface JS (be:queueJS), then "Current Vehicle" and one item per active vehicle (v:queueLuaCommand).
- In GE Lua, if the "Sandbox GE Commands" option is active, the command goes through executeLuaSandboxed(cmd, 'GEConsole'); otherwise it is sent by Lua:queueLuaCommand after a logged hex dump. The variable is true in the code, but settingsLoad sets it to false if the settings file does not contain it.
- When the window is open, the VehicleCommonActionMap and VehicleSpecificActionMap actions are disabled unless "enableVehicleControls" is true; they are re-enabled on close.
- The log filter uses Lua patterns (string.match), not regular expressions; an invalid pattern is detected by pcall and its error message is displayed.
- The log is a circular buffer bounded by logsLimit = 1000 lines.
- ConsoleInputCallback is a global function called by ImGui to navigate the history with the up and down arrows.
- Inconsistencies: M.inputCallback and M.onExtensionUnloaded are assigned from local variables that are never defined and are therefore nil; parseLogLine calls M.onConsoleLog, which no longer exists (hook removed, line commented out), which would cause an error for an unparseable log line; settingsLoad uses 0.64 as the default font size while the initial value is 0.95.

**Dependencies (loaded first):** `ui_imgui`

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_console.hide()` | Closes the console window. | 172 |
| `ui_console.onDeserialized(data)` | Hook called after a Lua reload: restores the state saved by onSerialize. *(internal)* *(hook)* | 1215 |
| `ui_console.onExtensionLoaded()` | Hook called when the extension loads: loads the settings and history, initializes the editor's ImGui theme and builds the list of execution contexts. *(internal)* *(hook)* | 1230 |
| `ui_console.onFileChanged(filename, type)` | Hook called when a watched file changes. Reloads the history if the file is /consoleHistory.json. *(internal)* *(hook)* | 1239 |
| `ui_console.onSerialize()` | Hook called before a Lua reload: saves the window state (open, origin filter, input in progress, level filter, fullscreen, position, scroll). *(internal)* *(hook)* | 1199 |
| `ui_console.onUpdate(dtReal, dtSim, dtRaw)` | Hook called every frame. If the window is open, reads the new log lines (except when paused), draws the ImGui console and processes the commands entered; on close, gives vehicle control back. *(internal)* *(hook)* | 556 |
| `ui_console.onVehicleActiveChanged()` | Hook called when a vehicle becomes active or inactive: rebuilds the list of execution contexts (refreshCombo). *(internal)* *(hook)* | 1178 |
| `ui_console.onVehicleDestroyed()` | Hook called when a vehicle is destroyed: rebuilds the list of execution contexts. *(internal)* *(hook)* | 1178 |
| `ui_console.onVehicleSpawned()` | Hook called when a vehicle is spawned: rebuilds the list of execution contexts. *(internal)* *(hook)* | 1178 |
| `ui_console.onVehicleSwitched()` | Hook called when the player's vehicle changes: rebuilds the list of execution contexts. *(internal)* *(hook)* | 1178 |
| `ui_console.show()` | Opens the console window. | 168 |
| `ui_console.toggle()` | Opens the window if it is closed, closes it if it is open. | 176 |

### Parameter details

#### `ui_console.onDeserialized(data)`

Hook called after a Lua reload: restores the state saved by onSerialize.

- `data` (*table*) : Table returned by onSerialize.

#### `ui_console.onFileChanged(filename, type)`

Hook called when a watched file changes. Reloads the history if the file is /consoleHistory.json.

- `filename` (*string*) : Path of the modified file.
- `type` (*string*) : Change type (not used).

#### `ui_console.onSerialize()`

Hook called before a Lua reload: saves the window state (open, origin filter, input in progress, level filter, fullscreen, position, scroll).

- **returns**: table Data to hand back to onDeserialized.

#### `ui_console.onUpdate(dtReal, dtSim, dtRaw)`

Hook called every frame. If the window is open, reads the new log lines (except when paused), draws the ImGui console and processes the commands entered; on close, gives vehicle control back.

- `dtReal` (*number*) : Real frame duration in seconds (not used).
- `dtSim` (*number*) : Simulated frame duration in seconds (not used).
- `dtRaw` (*number*) : Raw frame duration in seconds (not used).

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | Extensions loaded before this one: ui_imgui. |
| `inputCallback` | nil | Always nil: assigned from a nonexistent local variable (bug). ⚠ reference `inputCallback` not defined in the file (probably nil) |
| `onExtensionUnloaded` | nil | Always nil: assigned from a nonexistent local variable (bug), so there is no unload hook. ⚠ reference `onExtensionUnloaded` not defined in the file (probably nil) |

## Global functions defined here

| Function | Description | Line |
|---|---|---|
| `ConsoleInputCallback(data)` |  | 429 |

## Calls into the engine (C++)

- `Engine.` `getFrameLog`
- `Lua:` `getDevLogStats`, `queueLuaCommand`
- `be:` `getObject`, `getObjectCount`, `getPlayerVehicleID`, `queueJS`
- `scenetree.` `findObject`
- `ui_imgui.` `GetIO`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/console.lua`.*
