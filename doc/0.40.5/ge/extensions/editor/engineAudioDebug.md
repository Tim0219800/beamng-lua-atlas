# `editor_engineAudioDebug`

*File: `lua/ge/extensions/editor/engineAudioDebug.lua` · VM: Game Engine (GE) · 329 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_engineAudioDebug`: `extensions.load("editor_engineAudioDebug")`, then the global `editor_engineAudioDebug`

Editor window "Engine Audio Debug" (Audio menu) to tune the player vehicle's engine sound live. It fetches the engine sound data on the vehicle side (sounds.getEngineSoundData via queueLuaCommand), offers a list of engines/sounds and sliders (main gain, on/off-load, low/high shelves, low/high EQ, fundamental frequency per cylinder count, muffling), displays the exhaust direction, and lets you copy the values as JSON to the clipboard or reset everything to 0. Frequencies in Hz are converted to FMOD values (table 20 Hz to 22 kHz).

## Example

```lua
extensions.load('editor_engineAudioDebug'); editor_engineAudioDebug.open()
```

## Notes

- M.onUpdate is nop by default; it is only replaced by the real function when the window is shown (onEditorToolWindowShow) and reset to nop when it is closed, with extensions.hookUpdate("onUpdate") to rebuild the hook list.
- M.onDebugDrawActive is exported but the local variable onDebugDrawActive is never defined in the file: the field is nil.
- The engine data is written by the vehicle into editor_engineAudioDebug.engine (engineSoundData, engineNameStrings) via queueGameEngineLua: it arrives with a slight delay.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_engineAudioDebug.onEditorActivated()` | Hook: reloads the engine data on entering the editor. *(internal)* *(hook)* | 297 |
| `editor_engineAudioDebug.onEditorDeactivated()` | Hook: hides the display of the exhaust direction of the selected engine. *(internal)* *(hook)* | 290 |
| `editor_engineAudioDebug.onEditorInitialized()` | Registers the window (500x200) and the menu entry (Audio group). *(internal)* *(hook)* | 279 |
| `editor_engineAudioDebug.onEditorToolWindowHide(windowName)` | Hook called when a tool window is hidden; if it is the module's window, resets onUpdate to nop. *(internal)* *(hook)* | 301 |
| `editor_engineAudioDebug.onEditorToolWindowShow(windowName)` | Hook called when a tool window is shown; if it is the module's window, enables onUpdate. *(internal)* *(hook)* | 308 |
| `editor_engineAudioDebug.onExtensionLoaded()` | Hook called on load: reads the engine sound data of the player vehicle. *(internal)* *(hook)* | 275 |
| `editor_engineAudioDebug.onVehicleSwitched(oldVehicle, newVehicle, player)` | Hook called on vehicle switch; reloads the data if the editor is active. *(internal)* *(hook)* | 284 |
| `editor_engineAudioDebug.open()` | Displays the "Engine Audio Debug" window and forces a refresh of the values. | 269 |

### Parameter details

#### `editor_engineAudioDebug.onEditorToolWindowHide(windowName)`

Hook called when a tool window is hidden; if it is the module's window, resets onUpdate to nop.

- `windowName` (*string*) : Window name

#### `editor_engineAudioDebug.onEditorToolWindowShow(windowName)`

Hook called when a tool window is shown; if it is the module's window, enables onUpdate.

- `windowName` (*string*) : Window name

#### `editor_engineAudioDebug.onVehicleSwitched(oldVehicle, newVehicle, player)`

Hook called on vehicle switch; reloads the data if the editor is active.

- `oldVehicle` (*any*) : Old vehicle
- `newVehicle` (*any*) : New vehicle
- `player` (*any*) : Player concerned

## Fields

| Field | Type | Description |
|---|---|---|
| `onDebugDrawActive` | nil | Exported but always nil (undefined local variable). ⚠ reference `onDebugDrawActive` not defined in the file (probably nil) |
| `onUpdate` | function | nop while the window is closed; draw/update function when it is open. |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onUpdate` — listened to by 186 module(s)

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/engineAudioDebug.lua`.*
