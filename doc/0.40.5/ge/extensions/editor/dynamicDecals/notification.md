# `editor_dynamicDecals_notification`

*File: `lua/ge/extensions/editor/dynamicDecals/notification.lua` · VM: Game Engine (GE) · 111 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_dynamicDecals_notification`: `extensions.load("editor_dynamicDecals_notification")`, then the global `editor_dynamicDecals_notification`

Notification window of the Dynamic Decals tool ("Dynamic Decals - Notifications"). Other modules call add(section, title, message, level); messages are grouped by section in collapsible headers, colored by level (log white, warning yellow, error red), deletable one by one or all together. The window opens by itself when a message is added and closes when the list is empty.

## Example

```lua
local n = extensions.editor_dynamicDecals_notification
n.add("Load/Save", "Titre", "Message", n.levels.warning)
```

## Notes

- `msg` can be a string or a function (called in the window to draw custom ImGui content).
- If the level is not provided, levels.log is used. A function-type message does not use the level color.
- If `msg` is neither a string nor a function, nothing is displayed for this entry (only the delete button appears).

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_dynamicDecals_notification.add(section, title, msg, level)` | Adds a notification in the given section and flags the window to open on the next frame. | 97 |
| `editor_dynamicDecals_notification.editorPreferenceValueChanged(path, value)` | Hook called when a preference changes. Does nothing here. *(internal)* | 84 |
| `editor_dynamicDecals_notification.onGui()` | Draws the notification window. Registered with the tool via tool.registerOnEditorGuiFn and called every editor UI frame. *(internal)* *(hook)* | 31 |
| `editor_dynamicDecals_notification.registerEditorPreferences(prefsRegistry)` | Declares no preference (body commented out). *(internal)* | 78 |
| `editor_dynamicDecals_notification.setup(tool_in)` | Called by the tool: registers onGui and declares the editor window (450x650). *(internal)* | 88 |

### Parameter details

#### `editor_dynamicDecals_notification.add(section, title, msg, level)`

Adds a notification in the given section and flags the window to open on the next frame.

- `section` (*string*) : Section name (grouping key).
- `title` (*string*) : Title displayed before the message.
- `msg` (*string|function*) : Text, or function that draws the content.
- `level` (*integer|nil*) : A value of levels; default levels.log.

#### `editor_dynamicDecals_notification.editorPreferenceValueChanged(path, value)`

Hook called when a preference changes. Does nothing here.

- `path` (*string*) : Preference path.
- `value` (*any*) : New value.

#### `editor_dynamicDecals_notification.registerEditorPreferences(prefsRegistry)`

Declares no preference (body commented out).

- `prefsRegistry` (*table*) : Editor preferences registry.

#### `editor_dynamicDecals_notification.setup(tool_in)`

Called by the tool: registers onGui and declares the editor window (450x650).

- `tool_in` (*table*) : Reference to the editor_dynamicDecalsTool tool.

## Fields

| Field | Type | Description |
|---|---|---|
| `levels` | table<string, integer> | Severity levels: log = 1, warning = 2, error = 3. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/dynamicDecals/notification.lua`.*
