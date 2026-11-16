# `editor_dynamicDecals_history`

*File: `lua/ge/extensions/editor/dynamicDecals/history.lua` · VM: Game Engine (GE) · 104 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_dynamicDecals_history`: `extensions.load("editor_dynamicDecals_history")`, then the global `editor_dynamicDecals_history`

"History" section of the Dynamic Decals tool. Displays the undo (Undo) and redo (Redo) stacks of the API's history object (api.getHistory()), lets you undo/redo up to a chosen entry, clear the history, and shows the content of an action in a tooltip (dump truncated to 20 lines of 100 characters).

## Notes

- "Delete All History" only clears the stacks: the changes already made remain, and the action is irreversible.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_dynamicDecals_history.editorPreferenceValueChanged(path, value)` | Hook called when a preference changes. Does nothing here. *(internal)* | 89 |
| `editor_dynamicDecals_history.registerEditorPreferences(prefsRegistry)` | Registers the float preference `dynamicDecalsTool.history.sectionHeight` (default 256, from 64 to 1024). *(internal)* | 83 |
| `editor_dynamicDecals_history.setup(tool_in)` | Called by the tool: gets the API and registers the "History" section (order 1045). *(internal)* | 93 |

### Parameter details

#### `editor_dynamicDecals_history.editorPreferenceValueChanged(path, value)`

Hook called when a preference changes. Does nothing here.

- `path` (*string*) : Preference path.
- `value` (*any*) : New value.

#### `editor_dynamicDecals_history.registerEditorPreferences(prefsRegistry)`

Registers the float preference `dynamicDecalsTool.history.sectionHeight` (default 256, from 64 to 1024).

- `prefsRegistry` (*table*) : Editor preferences registry.

#### `editor_dynamicDecals_history.setup(tool_in)`

Called by the tool: gets the API and registers the "History" section (order 1045).

- `tool_in` (*table*) : Reference to the editor_dynamicDecalsTool tool.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/dynamicDecals/history.lua`.*
