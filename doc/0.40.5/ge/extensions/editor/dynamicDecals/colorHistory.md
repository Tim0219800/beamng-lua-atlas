# `editor_dynamicDecals_colorHistory`

*File: `lua/ge/extensions/editor/dynamicDecals/colorHistory.lua` · VM: Game Engine (GE) · 93 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_dynamicDecals_colorHistory`: `extensions.load("editor_dynamicDecals_colorHistory")`, then the global `editor_dynamicDecals_colorHistory`

"Color History" section of the Dynamic Decals tool. Keeps in an editor preference (`dynamicDecalsTool.colorHistory.history`) the list of the last used colors (RGBA) and lets you reapply them as a decal or fill layer color, or delete them. The maximum size is the `maxHistoryCount` preference (default 10, from 2 to 128).

## Example

```lua
extensions.editor_dynamicDecals_colorHistory.addColorToHistory(Point4F(1, 0, 0, 1))
```

## Notes

- addColorToHistory reads color.x/.y/.z/.w: it needs a Point4F/vec4-type value, not an {r,g,b,a} table.
- In addColorToHistory, table.remove is called during ipairs: at most one duplicate is handled correctly.
- Deleting a color in onGui modifies the table during ipairs; harmless since the loop continues on the shortened table.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_dynamicDecals_colorHistory.addColorToHistory(color)` | Adds the color at the head of the history (first removes an identical entry), truncates to maxHistoryCount and saves the preference. | 15 |
| `editor_dynamicDecals_colorHistory.editorPreferenceValueChanged(path, value)` | Hook called when a preference changes. Does nothing here. *(internal)* | 61 |
| `editor_dynamicDecals_colorHistory.onGui(guiId)` | Draws the list: a widget for each color, the buttons "Set as decal color" (api.setDecalColor), "Set as fill layer color" (api.setFillLayerColor) and a delete icon. Used as the section content and as the editor of the `history` preference. *(internal)* *(hook)* | 29 |
| `editor_dynamicDecals_colorHistory.registerEditorPreferences(prefsRegistry)` | Registers the subcategory `dynamicDecalsTool.colorHistory`: `history` (table, edited by onGui) and `maxHistoryCount` (int, default 10, min 2, max 128). *(internal)* | 52 |
| `editor_dynamicDecals_colorHistory.setup(tool_in)` | Called by the tool: gets the API and docs, registers the "Color History" section (order 122) and its documentation page. *(internal)* | 76 |

### Parameter details

#### `editor_dynamicDecals_colorHistory.addColorToHistory(color)`

Adds the color at the head of the history (first removes an identical entry), truncates to maxHistoryCount and saves the preference.

- `color` (*Point4F*) : Color with fields x, y, z, w (RGBA).

#### `editor_dynamicDecals_colorHistory.editorPreferenceValueChanged(path, value)`

Hook called when a preference changes. Does nothing here.

- `path` (*string*) : Preference path.
- `value` (*any*) : New value.

#### `editor_dynamicDecals_colorHistory.onGui(guiId)`

Draws the list: a widget for each color, the buttons "Set as decal color" (api.setDecalColor), "Set as fill layer color" (api.setFillLayerColor) and a delete icon. Used as the section content and as the editor of the `history` preference.

- `guiId` (*string*) : Suffix to make ImGui identifiers unique.

#### `editor_dynamicDecals_colorHistory.registerEditorPreferences(prefsRegistry)`

Registers the subcategory `dynamicDecalsTool.colorHistory`: `history` (table, edited by onGui) and `maxHistoryCount` (int, default 10, min 2, max 128).

- `prefsRegistry` (*table*) : Editor preferences registry.

#### `editor_dynamicDecals_colorHistory.setup(tool_in)`

Called by the tool: gets the API and docs, registers the "Color History" section (order 122) and its documentation page.

- `tool_in` (*table*) : Reference to the editor_dynamicDecalsTool tool.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/dynamicDecals/colorHistory.lua`.*
