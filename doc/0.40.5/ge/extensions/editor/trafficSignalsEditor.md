# `editor_trafficSignalsEditor`

*File: `lua/ge/extensions/editor/trafficSignalsEditor.lua` · VM: Game Engine (GE) · 1926 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_trafficSignalsEditor`: `extensions.load("editor_trafficSignalsEditor")`, then the global `editor_trafficSignalsEditor`

Traffic light editor ("Traffic Signals Editor" window, menu Window > Gameplay, signalsEditMode edit mode). Lets you create and place signals (instances), controllers and phase sequences, edit controller definitions, simulate the lights in the level then save everything to the level's signals.json (editor.levelPath). Works on core_trafficSignals data (newSignal, newController, newSequence, setupSignals, loadSignals). Shift + left click creates a signal, left click selects.

## Example

```lua
local data = editor_trafficSignalsEditor.getCurrentSignals() -- {instances, controllers, sequences}
editor_trafficSignalsEditor.saveFile() -- writes <level>/signals.json
```

## Notes

- loadFile and saveFile default to editor.levelPath..'signals.json'; the File menu only handles this default file.
- loadFile: if the data contains the obsolete key 'intersections', it is rejected (warning "Obsolete signals data!") and the editor is emptied via setCurrentSignals({}).
- The simulation (local function simulate) forces the sequences into test mode, calls map.reset() to update the mapmgr signals ("temporary" solution according to the code) and sets trafficSignals.debugLevel back to 0 on stop, reloading the level's original signals.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_trafficSignalsEditor.getCurrentElements()` | Returns the table of editor elements (signals, controllers, sequences) keyed by id. | 257 |
| `editor_trafficSignalsEditor.getCurrentSignals()` | Returns the signal data being edited (live tables, not copied). | 261 |
| `editor_trafficSignalsEditor.loadFile(fileName)` | Loads a JSON signals file and applies it with setCurrentSignals (obsolete format rejected). | 295 |
| `editor_trafficSignalsEditor.onClientEndMission()` | End-of-mission hook: forces a re-initialization of the tables on the next opening. *(internal)* *(hook)* | 1879 |
| `editor_trafficSignalsEditor.onDeserialized(data)` | After Lua reload: restores the options and reapplies the signals with setCurrentSignals. *(internal)* *(hook)* | 1888 |
| `editor_trafficSignalsEditor.onEditorGui(dt)` | Editor frame hook: draws the window (File menu Load/Save/Clear, lists and properties of signals, controllers, sequences) and the signals' debug rendering. Initializes the tables on the first call. *(internal)* *(hook)* | 1735 |
| `editor_trafficSignalsEditor.onEditorInitialized()` | Editor initialization hook: registers the window (540x600), the signalsEditMode edit mode with its shortcuts and the menu entry in the Gameplay group. *(internal)* *(hook)* | 1900 |
| `editor_trafficSignalsEditor.onSerialize()` | Before Lua reload: returns {options, signals} (serialized signals). *(internal)* *(hook)* | 1883 |
| `editor_trafficSignalsEditor.onWindowMenuItem()` | Menu hook: initializes the tables if needed, clears the object selection and shows the window. *(internal)* *(hook)* | 1894 |
| `editor_trafficSignalsEditor.saveFile(fileName)` | Writes the serialized signals to a JSON file (jsonWriteFile) and displays "Signals saved!" for 3 s. | 308 |
| `editor_trafficSignalsEditor.setCurrentSignals(data)` | Replaces the editor data: resets, recreates instances (pos/dir converted to vec3), controllers and sequences via core_trafficSignals, then reselects the current elements. Without an argument, uses the level's signals (core_trafficSignals.getData()). | 265 |

### Parameter details

#### `editor_trafficSignalsEditor.getCurrentElements()`

Returns the table of editor elements (signals, controllers, sequences) keyed by id.

- **returns**: table<integer|string, table> Elements by id.

#### `editor_trafficSignalsEditor.getCurrentSignals()`

Returns the signal data being edited (live tables, not copied).

- **returns**: table {instances, controllers, sequences}.

#### `editor_trafficSignalsEditor.loadFile(fileName)`

Loads a JSON signals file and applies it with setCurrentSignals (obsolete format rejected).

- `fileName` (*string|nil*) : File path, default <level>/signals.json.

#### `editor_trafficSignalsEditor.onDeserialized(data)`

After Lua reload: restores the options and reapplies the signals with setCurrentSignals.

- `data` (*table*) : Value returned by onSerialize.

#### `editor_trafficSignalsEditor.onEditorGui(dt)`

Editor frame hook: draws the window (File menu Load/Save/Clear, lists and properties of signals, controllers, sequences) and the signals' debug rendering. Initializes the tables on the first call.

- `dt` (*number*) : Time delta.

#### `editor_trafficSignalsEditor.onSerialize()`

Before Lua reload: returns {options, signals} (serialized signals).

- **returns**: table {options, signals}.

#### `editor_trafficSignalsEditor.saveFile(fileName)`

Writes the serialized signals to a JSON file (jsonWriteFile) and displays "Signals saved!" for 3 s.

- `fileName` (*string|nil*) : File path, default <level>/signals.json.

#### `editor_trafficSignalsEditor.setCurrentSignals(data)`

Replaces the editor data: resets, recreates instances (pos/dir converted to vec3), controllers and sequences via core_trafficSignals, then reselects the current elements. Without an argument, uses the level's signals (core_trafficSignals.getData()).

- `data` (*table|nil*) : {instances, controllers, sequences}; missing fields treated as empty.

## Calls into the engine (C++)

- `be:` `getEnabled`
- `debugDrawer:` `drawSquarePrism`, `drawTextAdvanced`
- `obj:` `getId`, `getInternalName`, `getPosition`, `getTransform`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/trafficSignalsEditor.lua`.*
