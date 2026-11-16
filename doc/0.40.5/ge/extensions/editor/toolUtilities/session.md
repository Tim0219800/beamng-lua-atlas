# `editor_toolUtilities_session`

*File: `lua/ge/extensions/editor/toolUtilities/session.lua` · VM: Game Engine (GE) · 387 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_toolUtilities_session`: `extensions.load("editor_toolUtilities_session")`, then the global `editor_toolUtilities_session`

Shared session save and load helper for the editor's custom spline and zone tools. It handles what is identical for all tools: the portable JSON envelope (version, tool, mapName, items or state, globals, records), file reading/writing, the load loop in replace or merge mode, the Save / Save As / Load buttons at the top of the window and the Replace/Merge modal window. Everything tool-specific goes through a spec table. Wiring reference: heroRoadEditor and roadSpline.

## Example

```lua
local session = extensions.editor_toolUtilities_session
local spec = {toolId = 'myTool', displayName = 'My Tool', itemNoun = 'zones', getItems = getItems,
  serializeItem = function(it) return session.itemToTable(it, nil, {'runtimeHandle'}) end,
  deserializeItem = deserializeItem, clearAll = clearAll, deepCopyAll = deepCopyAll,
  transUndo = undoFn, transRedo = redoFn}
-- in the window rendering:
session.renderButtons(spec)
-- from the rebuild pass:
session.markEdited('myTool')
```

## Notes

- Required spec fields: toolId, getItems, serializeItem + deserializeItem (or getState + loadWhole for a global-state tool), clearAll, deepCopyAll, transUndo, transRedo.
- Optional spec fields: displayName, itemNoun, refreshIdMap, onLoaded, logTag, version (default 1), noMerge (single document: a Load always replaces), altItemsKey (old array key accepted), iconColor, iconSize (default 36x36), saveIcon/saveAsIcon/loadIcon, getGlobals/applyGlobals (the tool's global settings, applied only in Replace), getRecords/applyRecords (large records, never set the modified state), loadJson, loadOptions, noLoadGuard.
- The state (bound path, modified flag, load guard, globals baseline) is kept per toolId; the tables are local to the module and specific to the run.
- A merge gives a new identifier (Engine.generateUUID) to an incoming item whose id already exists.
- After a Load in Replace (except keepUnbound), the tool is bound to the file: subsequent Saves overwrite it without asking. Terrain changes are not saved.
- markEdited: the load guard swallows exactly one call, that of the forced rebuild caused by a Load.
- Load errors are logged with log('E', ...); the file is written by jsonWriteFile and read by jsonReadFile.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_toolUtilities_session.attachment(toolId)` | Returns the file the document is attached to and whether it has unsaved changes. | 109 |
| `editor_toolUtilities_session.boundPath(toolId)` | Returns only the bound path, for per-frame calls that must not allocate a table. | 114 |
| `editor_toolUtilities_session.itemToTable(item, emptyKeys, nilKeys)` | Deep copy of an item via the string.buffer codec (encode then decode), optionally with keys replaced by {} or removed. Used to write serializeItem without mutating the live item. | 138 |
| `editor_toolUtilities_session.loadFromFile(path, spec, replace)` | Reads the JSON file then applies spec.loadJson if it exists, otherwise the module's loadJson. | 209 |
| `editor_toolUtilities_session.loadJson(j, spec, replace)` | Applies an already decoded session JSON. replace first clears the current items (and applies globals/records); otherwise the loaded items are merged, an id already in use receiving a new UUID. For a global-state tool, passes state to spec.loadWhole. | 183 |
| `editor_toolUtilities_session.markEdited(toolId)` | Marks a tool's document as modified (unsaved). To be called from the tool's rebuild pass, once per pass. The load guard swallows one call after a Load. | 92 |
| `editor_toolUtilities_session.reattach(toolId, at)` | Restores the file binding and the modified state from a table returned by attachment (for example after an extension reload). | 131 |
| `editor_toolUtilities_session.rehydrateVec3Array(arr)` | Converts in place an array of positions loaded from JSON (plain {x,y,z}) into vec3. Idempotent (existing vec3s, which have a distance method, are left as is); safe on nil or a non-table. | 147 |
| `editor_toolUtilities_session.renderButtons(spec)` | Inline variant: draws Save (once a file is known), Save As (if the tool is not empty) and Load side by side, then the Replace/Merge modal window. | 345 |
| `editor_toolUtilities_session.renderButtonsColumns(spec)` | Column variant: draws Save, Save As and Load as three grid cells. | 357 |
| `editor_toolUtilities_session.saveIfEdited(spec)` | Rewrites the modified document to the file it is bound to, for a tool whose work must never wait for a Save press. Returns false if there is no bound file or no modification. | 173 |
| `editor_toolUtilities_session.saveToFile(path, spec)` | Writes all items to path as portable session JSON: version, tool, mapName (current level), items or state, globals, records. | 156 |
| `editor_toolUtilities_session.unbind(toolId)` | Detaches a tool from its file: the next Save will have to ask where to write instead of silently overwriting the last loaded file. | 104 |
| `editor_toolUtilities_session.windowTitle(toolId, label, id, newName)` | Window title naming the bound file (or newName before there is one, "New Session" by default). The id follows "###" so that ImGui keeps the docking and size. Cached per tool. | 121 |

### Parameter details

#### `editor_toolUtilities_session.attachment(toolId)`

Returns the file the document is attached to and whether it has unsaved changes.

- `toolId` (*string*) : Tool identifier.
- **returns**: table { path = string|nil, dirty = true|nil }

#### `editor_toolUtilities_session.boundPath(toolId)`

Returns only the bound path, for per-frame calls that must not allocate a table.

- `toolId` (*string*) : Tool identifier.
- **returns**: string|nil Path of the bound file.

#### `editor_toolUtilities_session.itemToTable(item, emptyKeys, nilKeys)`

Deep copy of an item via the string.buffer codec (encode then decode), optionally with keys replaced by {} or removed. Used to write serializeItem without mutating the live item.

- `item` (*table*) : Item to copy.
- `emptyKeys` (*string[]|nil*) : Keys to replace with an empty table.
- `nilKeys` (*string[]|nil*) : Keys to remove.
- **returns**: table Clean copy.

#### `editor_toolUtilities_session.loadFromFile(path, spec, replace)`

Reads the JSON file then applies spec.loadJson if it exists, otherwise the module's loadJson.

- `path` (*string*) : File path.
- `spec` (*table*) : Tool specification.
- `replace` (*boolean*) : true to replace, false to merge.
- **returns**: boolean ok.
- **returns**: integer|string Number of items or error.
- **returns**: boolean|nil keepUnbound (partial file) when spec.loadJson returns it.

#### `editor_toolUtilities_session.loadJson(j, spec, replace)`

Applies an already decoded session JSON. replace first clears the current items (and applies globals/records); otherwise the loaded items are merged, an id already in use receiving a new UUID. For a global-state tool, passes state to spec.loadWhole.

- `j` (*table*) : Decoded JSON.
- `spec` (*table*) : Tool specification.
- `replace` (*boolean*) : true to replace, false to merge.
- **returns**: boolean ok.
- **returns**: integer|string Number of items loaded, or error message ("not a valid <toolId> session file").

#### `editor_toolUtilities_session.markEdited(toolId)`

Marks a tool's document as modified (unsaved). To be called from the tool's rebuild pass, once per pass. The load guard swallows one call after a Load.

- `toolId` (*string*) : Tool identifier.

#### `editor_toolUtilities_session.reattach(toolId, at)`

Restores the file binding and the modified state from a table returned by attachment (for example after an extension reload).

- `toolId` (*string*) : Tool identifier.
- `at` (*table*) : { path, dirty }; ignored if it is not a table.

#### `editor_toolUtilities_session.rehydrateVec3Array(arr)`

Converts in place an array of positions loaded from JSON (plain {x,y,z}) into vec3. Idempotent (existing vec3s, which have a distance method, are left as is); safe on nil or a non-table.

- `arr` (*table|nil*) : Array of positions.

#### `editor_toolUtilities_session.renderButtons(spec)`

Inline variant: draws Save (once a file is known), Save As (if the tool is not empty) and Load side by side, then the Replace/Merge modal window.

- `spec` (*table*) : Tool specification.

#### `editor_toolUtilities_session.renderButtonsColumns(spec)`

Column variant: draws Save, Save As and Load as three grid cells.

- `spec` (*table*) : Tool specification.

#### `editor_toolUtilities_session.saveIfEdited(spec)`

Rewrites the modified document to the file it is bound to, for a tool whose work must never wait for a Save press. Returns false if there is no bound file or no modification.

- `spec` (*table*) : Tool specification.
- **returns**: boolean true if saved.

#### `editor_toolUtilities_session.saveToFile(path, spec)`

Writes all items to path as portable session JSON: version, tool, mapName (current level), items or state, globals, records.

- `path` (*string*) : File path.
- `spec` (*table*) : Tool specification.
- **returns**: boolean ok (always true).
- **returns**: integer Number of items from getItems().

#### `editor_toolUtilities_session.unbind(toolId)`

Detaches a tool from its file: the next Save will have to ask where to write instead of silently overwriting the last loaded file.

- `toolId` (*string*) : Tool identifier.

#### `editor_toolUtilities_session.windowTitle(toolId, label, id, newName)`

Window title naming the bound file (or newName before there is one, "New Session" by default). The id follows "###" so that ImGui keeps the docking and size. Cached per tool.

- `toolId` (*string*) : Tool identifier.
- `label` (*string*) : Displayed label.
- `id` (*string*) : Stable ImGui identifier.
- `newName` (*string|nil*) : Name displayed as long as no file is bound.
- **returns**: string Title "label - [name]###id".

## Calls into the engine (C++)

- `Engine.` `generateUUID`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/toolUtilities/session.lua`.*
