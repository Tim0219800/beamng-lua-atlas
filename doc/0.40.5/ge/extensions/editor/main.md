# `editor_main`

*File: `lua/ge/extensions/editor/main.lua` · VM: Game Engine (GE) · 794 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_main`: `extensions.load("editor_main")`, then the global `editor_main`

Core of the World Editor: defines the global `editor` (editor = M). It loads all the extensions in lua/ge/extensions/editor/ (those containing "M.onEditor" or "M.onExtension", except editor_main), initializes the editor/api/* modules, manages the preferences (settings/editor/preferences.json), the state (settings/editor/currentState.json) and the activation/deactivation of the editor (free camera, action maps, hidden CEF, layout, audio). The other editor extensions add their functions to the `editor` table.

## Example

```lua
editor_main.toggleActive()          -- opens/closes the editor
editor.logInfo("message")
local v = editor.getPreference("camera.general.freeCameraMoveSpeed")
```

## Notes

- setEditorActive does not toggle immediately: it sets a request processed in onUpdate after 3 frames of loading screen (splash).
- Closing the editor is refused (silent return) if editor.anyToolDirty() is true.
- Safe mode (safeMode): only the extensions in the safeModeExtensionNames list are loaded.
- An extension can be disabled via settings/editor/extensions.json (key = short name, field disabled).
- editor.setPreference and editor.getPreference are only defined after the first loadPreferences().
- The same script also handles the automatic launch with the -worldEditor argument (onFirstUpdate) and the reactivation after a Lua reload (onSerialize/onDeserialized).

**Dependencies (loaded first):** `core_camera`

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_main.initializeModules()` | Loads and initializes the editor/api/* modules (gui, core, assets, camera, dataBlock, decal, gizmo, material, navigation, object, roadRiver, sketch, terrain, forest, proceduralContentGenerator), then emits onEditorModulesInitialized. No effect if already done. *(internal)* | 294 |
| `editor_main.isEditorActive()` | Returns whether the editor is active. | 594 |
| `editor_main.loadEditorExtension(name)` | Hot-loads an editor extension: registers its preferences, then calls its onEditorRegisterApi, onEditorInitialized and onEditorActivated. | 140 |
| `editor_main.loadEditorExtensions(names)` | Loads several editor extensions at once (preferences registered first, then RegisterApi/Initialized/Activated hooks for each). | 171 |
| `editor_main.loadExtensionsSettings()` | Reads settings/editor/extensions.json into editor.extensionsSettings (empty table if absent). | 85 |
| `editor_main.loadPreferences()` | Reloads the preferences from settings/editor/preferences.json, defines editor.setPreference/getPreference and migrates the old preferences. | 74 |
| `editor_main.loadState(filePath)` | Reads the editor state file (warns if the format version differs). | 368 |
| `editor_main.log(msg)` | Writes an Info-level message to the log, tag "editor". | 50 |
| `editor_main.logDebug(msg)` | Debug-level message, tag "editor". | 54 |
| `editor_main.logError(msg)` | Error-level message, tag "editor". | 58 |
| `editor_main.logInfo(msg)` | Log alias (Info level, tag "editor"). | 50 |
| `editor_main.logWarn(msg)` | Warning-level message, tag "editor". | 62 |
| `editor_main.onClientEndMission()` | Called at the end of a level: saves the state, shows the apps again (ShowApps), offers to save if modified, then shutdown(). *(internal)* *(hook)* | 623 |
| `editor_main.onClientStartMission()` | Called when a level starts: sets initialized and modulesInitialized back to false and reapplies the current active state. *(internal)* *(hook)* | 608 |
| `editor_main.onDeserialized(data)` | Called after a Lua reload: restores active/dirty/headless/edit mode and exposes the data in editor_main.serializedData. *(internal)* *(hook)* | 733 |
| `editor_main.onExit()` | Called when the game exits: sets editor.active to false and saves the state. *(internal)* *(hook)* | 678 |
| `editor_main.onExtensionLoaded()` | Load hook. Empty body. *(internal)* *(hook)* | 683 |
| `editor_main.onExtensionUnloaded()` | Called on unload: editor.shutdown(). *(internal)* *(hook)* | 686 |
| `editor_main.onFirstUpdate()` | Called on the first update: reactivates the editor if it was active before the reload, and opens it automatically if the game was launched with -worldEditor. *(internal)* *(hook)* | 747 |
| `editor_main.onPreExit()` | Called before the game exits. Empty body. *(internal)* *(hook)* | 620 |
| `editor_main.onPreWindowClose()` | Called before the game window closes: editor.checkDirtyAndSave() if available. *(internal)* *(hook)* | 614 |
| `editor_main.onSerialize()` | Called before a Lua reload: saves the camera, active state, dirty, headless, edit mode, window positions and the cleanExit preference; deactivates the editor. *(internal)* *(hook)* | 690 |
| `editor_main.onUpdate()` | Called every frame: processes the activation/deactivation request (shows the editorSplash.png loading image for 3 frames, then applies). *(internal)* *(hook)* | 634 |
| `editor_main.saveExtensionsSettings()` | Writes editor.extensionsSettings to settings/editor/extensions.json. | 89 |
| `editor_main.savePreferences()` | Writes the preferences to settings/editor/preferences.json. | 81 |
| `editor_main.saveState(filePath)` | Saves the editor state: emits onEditorSaveState(state) then writes the JSON. No effect if the editor was not initialized in this session. | 356 |
| `editor_main.setEditorActive(activate, safeMode)` | Requests the activation or deactivation of the editor; applied in onUpdate after a few splash frames. | 587 |
| `editor_main.shutdown()` | Closes the editor, emits onEditorShutdown, unloads all the editor extensions and sets initialized/active back to false. | 598 |
| `editor_main.toggleActive(safeMode)` | Toggles the editor's active state (via setEditorActive). | 674 |
| `editor_main.unloadEditorExtension(extName)` | Unloads a loaded editor extension: calls its onEditorDeactivated then onEditorShutdown, then extensions.unload. | 213 |

### Parameter details

#### `editor_main.isEditorActive()`

Returns whether the editor is active.

- **returns**: boolean editor.active.

#### `editor_main.loadEditorExtension(name)`

Hot-loads an editor extension: registers its preferences, then calls its onEditorRegisterApi, onEditorInitialized and onEditorActivated.

- `name` (*string*) : Extension name, e.g. "editor_myTool".
- **returns**: table|nil The extension table, or nil if loading failed.

#### `editor_main.loadEditorExtensions(names)`

Loads several editor extensions at once (preferences registered first, then RegisterApi/Initialized/Activated hooks for each).

- `names` (*table<integer, string>*) : Extension names.

#### `editor_main.loadState(filePath)`

Reads the editor state file (warns if the format version differs).

- `filePath` (*string|nil*) : Source file; settings/editor/currentState.json by default.
- **returns**: table The state read, or an empty table.

#### `editor_main.log(msg)`

Writes an Info-level message to the log, tag "editor".

- `msg` (*string*) : Message.

#### `editor_main.logDebug(msg)`

Debug-level message, tag "editor".

- `msg` (*string*) : Message.

#### `editor_main.logError(msg)`

Error-level message, tag "editor".

- `msg` (*string*) : Message.

#### `editor_main.logInfo(msg)`

Log alias (Info level, tag "editor").

- `msg` (*string*) : Message.

#### `editor_main.logWarn(msg)`

Warning-level message, tag "editor".

- `msg` (*string*) : Message.

#### `editor_main.onDeserialized(data)`

Called after a Lua reload: restores active/dirty/headless/edit mode and exposes the data in editor_main.serializedData.

- `data` (*table*) : Table returned by onSerialize.

#### `editor_main.onSerialize()`

Called before a Lua reload: saves the camera, active state, dirty, headless, edit mode, window positions and the cleanExit preference; deactivates the editor.

- **returns**: table Data handed back to onDeserialized.

#### `editor_main.saveState(filePath)`

Saves the editor state: emits onEditorSaveState(state) then writes the JSON. No effect if the editor was not initialized in this session.

- `filePath` (*string|nil*) : Target file; settings/editor/currentState.json by default.

#### `editor_main.setEditorActive(activate, safeMode)`

Requests the activation or deactivation of the editor; applied in onUpdate after a few splash frames.

- `activate` (*boolean*) : true to open, false to close.
- `safeMode` (*boolean|nil*) : true to start in safe mode.

#### `editor_main.toggleActive(safeMode)`

Toggles the editor's active state (via setEditorActive).

- `safeMode` (*boolean|nil*) : Safe mode on opening.

#### `editor_main.unloadEditorExtension(extName)`

Unloads a loaded editor extension: calls its onEditorDeactivated then onEditorShutdown, then extensions.unload.

- `extName` (*string*) : Name of the loaded extension.

## Fields

| Field | Type | Description |
|---|---|---|
| `active` | boolean | True when the editor is active (open). |
| `additionalActionMaps` | table | Additional action maps pushed when the editor is activated and popped when it is deactivated. |
| `allExtensionNames` | table<integer, string> | Short names of all the editor extensions found on disk. |
| `dependencies` | table<integer, string> | {"core_camera"}. |
| `extensionNames` | table<integer, string> | Names (editor_xxx) of the editor extensions currently loaded. |
| `initialized` | boolean | True when the editor extensions are loaded and initialized. |
| `preferencesRegistry` | any | Preferences registry (editor/api/preferencesRegistry). |
| `safeMode` | boolean|nil | True if the editor was launched in safe mode. |

**Globals assigned:** `editor`

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onEditorActivated` — listened to by 29 module(s)
- `onEditorDeactivated` — listened to by 26 module(s)
- `onEditorInitialized` — listened to by 121 module(s)
- `onEditorLoadState` — listened to by 2 module(s)
- `onEditorModulesInitialized`
- `onEditorRegisterApi` — listened to by 1 module(s)
- `onEditorSaveState` — listened to by 2 module(s)
- `onEditorShutdown` — listened to by 1 module(s)

**UI events (guihooks.trigger):** `ShowApps`

## Calls into the engine (C++)

- `Engine.` `getNeedCollisionRebuild`
- `FS:` `findFiles`
- `obj:` `setSelected`
- `scenetree.` `findObject`, `findObjectById`
- `worldEditorCppApi.` `enableEditor`, `enableSimSetAndSimObjectSignals`, `hideIconForObject`, `mustOpenEditorOnStart`, `setHoveredObjectId`, `setOpenEditorOnStart`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/main.lua`.*
