# `editor_textEditor`

*File: `lua/ge/extensions/editor/textEditor.lua` · VM: Game Engine (GE) · 107 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_textEditor`: `extensions.load("editor_textEditor")`, then the global `editor_textEditor`

Editor extension that provides a multiline 'Text Editor' window to modify the text content of a scene object field (e.g. a long field of an object). It registers by exposing editor.newTextEditorInstance(objIds, fieldName). The Ok button applies the value via objectHistoryActions.changeObjectFieldWithUndo (undoable), Cancel closes without changing anything.

## Example

```lua
editor.newTextEditorInstance({ obj:getID() }, "myField")
```

## Notes

- Maximum text size: 16384 characters (textInputSize).
- If several objects are passed, the initial field is empty (the text is only prefilled for a single object); the entered value is then applied to all the ids.
- A new instance deletes any existing instance that shares an object id.
- The declared logTag is 'editor_scene_tree' (copied from another module, no visible effect).

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_textEditor.onDeserialize(state)` | Hook called after reload: recreates one instance per entry of the saved state. *(internal)* *(hook)* | 84 |
| `editor_textEditor.onEditorGui()` | Hook called every frame of the editor interface: creates/displays each open Text Editor window, with a multiline input area and Cancel/Ok buttons. Removes the instance when the window is no longer visible. *(internal)* *(hook)* | 28 |
| `editor_textEditor.onEditorInitialized()` | Hook called at editor initialization: publishes editor.newTextEditorInstance. *(internal)* *(hook)* | 98 |
| `editor_textEditor.onSerialize()` | Serialization hook (Lua reload): returns a copy of the open instances without the text buffer (textInput). *(internal)* *(hook)* | 90 |

### Parameter details

#### `editor_textEditor.onDeserialize(state)`

Hook called after reload: recreates one instance per entry of the saved state.

- `state` (*table*) : Result of onSerialize.

#### `editor_textEditor.onSerialize()`

Serialization hook (Lua reload): returns a copy of the open instances without the text buffer (textInput).

- **returns**: table Instances (objIds, fieldName) without textInput.

## Calls into the engine (C++)

- `obj:` `getField`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/textEditor.lua`.*
