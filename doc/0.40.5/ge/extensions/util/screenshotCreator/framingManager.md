# `util_screenshotCreator_framingManager`

*File: `lua/ge/extensions/util/screenshotCreator/framingManager.lua` · VM: Game Engine (GE) · 124 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `util_screenshotCreator_framingManager`: `extensions.load("util_screenshotCreator_framingManager")`, then the global `util_screenshotCreator_framingManager`

Registry of the screenshot creator's framing modes. It collects the modes by broadcasting the onScreenshotCreatorCollectFramingModes hook (each mode is a table {id, label, order, resolve, ...}), keeps the chosen mode (default "procedural") and delegates the camera computation to mode.resolve(context). It serializes the chosen mode to survive extension reloads.

## Notes

- A mode is kept only if it is a table with a non-empty string id, a resolve function and a unique id; modes are sorted by order (missing = last) then by id.
- Modes are recollected (hook broadcast) on every call to list, getSelected, set or resolve: no cache.
- If the chosen mode no longer exists, getSelected falls back to "procedural".
- list/get/set/getSelected/setSelected/listModes/getSelectedModeId/setSelectedModeId are aliases of the same functions; migrateLegacyState is an alias of deserialize.
- deserialize accepts an old format: skipCustomCameras == false gives "configured", otherwise "procedural".

## Functions

| Function | Description | Line |
|---|---|---|
| `util_screenshotCreator_framingManager.deserialize(data)` | Restores the selected mode from a saved state (keys selectedModeId, framingModeId or old skipCustomCameras); falls back to "procedural" if invalid. Aliases: migrateLegacyState, onDeserialized. | 88 |
| `util_screenshotCreator_framingManager.get()` | Alias of getSelected. | 54 |
| `util_screenshotCreator_framingManager.getSelected()` | Returns the id of the selected mode ("procedural" if the stored mode no longer exists). Aliases: get, getSelectedModeId. | 54 |
| `util_screenshotCreator_framingManager.getSelectedModeId()` | Alias of getSelected. | 54 |
| `util_screenshotCreator_framingManager.list()` | Returns the sorted list of valid framing modes collected by the hook. Alias: listModes. | 50 |
| `util_screenshotCreator_framingManager.listModes()` | Alias of list. | 50 |
| `util_screenshotCreator_framingManager.migrateLegacyState(data)` | Alias of deserialize (migration of old states). | 88 |
| `util_screenshotCreator_framingManager.onDeserialized(data)` | Hook called after reload with the serialized state; identical to deserialize. *(internal)* *(hook)* | 88 |
| `util_screenshotCreator_framingManager.onSerialize()` | Serialization hook before extension reload; identical to serialize. *(internal)* *(hook)* | 84 |
| `util_screenshotCreator_framingManager.resolve(modeId, context)` | Computes the framing camera with the given mode (or the selected mode). resolve(context) can be called with modeId omitted: if the first argument is a table and the second is nil, it is taken as the context. | 66 |
| `util_screenshotCreator_framingManager.serialize()` | Returns the state to save: {selectedModeId = ...}. Alias of onSerialize. | 84 |
| `util_screenshotCreator_framingManager.set(modeId)` | Alias of setSelected. | 58 |
| `util_screenshotCreator_framingManager.setSelected(modeId)` | Selects the framing mode by its id. Aliases: set, setSelectedModeId. | 58 |
| `util_screenshotCreator_framingManager.setSelectedModeId(modeId)` | Alias of setSelected. | 58 |

### Parameter details

#### `util_screenshotCreator_framingManager.deserialize(data)`

Restores the selected mode from a saved state (keys selectedModeId, framingModeId or old skipCustomCameras); falls back to "procedural" if invalid. Aliases: migrateLegacyState, onDeserialized.

- `data` (*table|nil*) : Saved state.

#### `util_screenshotCreator_framingManager.get()`

Alias of getSelected.

- **returns**: string Mode id.

#### `util_screenshotCreator_framingManager.getSelected()`

Returns the id of the selected mode ("procedural" if the stored mode no longer exists). Aliases: get, getSelectedModeId.

- **returns**: string Mode id.

#### `util_screenshotCreator_framingManager.getSelectedModeId()`

Alias of getSelected.

- **returns**: string Mode id.

#### `util_screenshotCreator_framingManager.list()`

Returns the sorted list of valid framing modes collected by the hook. Alias: listModes.

- **returns**: table[] Modes {id, label, order, resolve, ...}.

#### `util_screenshotCreator_framingManager.listModes()`

Alias of list.

- **returns**: table[] Framing modes.

#### `util_screenshotCreator_framingManager.migrateLegacyState(data)`

Alias of deserialize (migration of old states).

- `data` (*table|nil*) : Saved state.

#### `util_screenshotCreator_framingManager.onDeserialized(data)`

Hook called after reload with the serialized state; identical to deserialize.

- `data` (*table|nil*) : Saved state.

#### `util_screenshotCreator_framingManager.onSerialize()`

Serialization hook before extension reload; identical to serialize.

- **returns**: table {selectedModeId}.

#### `util_screenshotCreator_framingManager.resolve(modeId, context)`

Computes the framing camera with the given mode (or the selected mode). resolve(context) can be called with modeId omitted: if the first argument is a table and the second is nil, it is taken as the context.

- `modeId` (*string|table|nil*) : Mode id, or the context directly.
- `context` (*table*) : Framing context passed to mode.resolve (vehicle, resolution, fov…).
- **returns**: table|nil Mode result (pos, rot, ...).
- **returns**: string|nil Error: unknown mode or context that is not a table.

#### `util_screenshotCreator_framingManager.serialize()`

Returns the state to save: {selectedModeId = ...}. Alias of onSerialize.

- **returns**: table {selectedModeId = string}.

#### `util_screenshotCreator_framingManager.set(modeId)`

Alias of setSelected.

- `modeId` (*string*) : Mode id.
- **returns**: boolean Success.
- **returns**: string|nil Error.

#### `util_screenshotCreator_framingManager.setSelected(modeId)`

Selects the framing mode by its id. Aliases: set, setSelectedModeId.

- `modeId` (*string*) : Id of a registered mode.
- **returns**: boolean true if the mode was selected.
- **returns**: string|nil "Unknown framing mode: …" on failure.

#### `util_screenshotCreator_framingManager.setSelectedModeId(modeId)`

Alias of setSelected.

- `modeId` (*string*) : Mode id.
- **returns**: boolean Success.
- **returns**: string|nil Error.

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onScreenshotCreatorCollectFramingModes` — listened to by 4 module(s)

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/util/screenshotCreator/framingManager.lua`.*
