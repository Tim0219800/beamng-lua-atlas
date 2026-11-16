# `editor_dynamicDecals_colorPresets`

*File: `lua/ge/extensions/editor/dynamicDecals/colorPresets.lua` · VM: Game Engine (GE) · 186 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_dynamicDecals_colorPresets`: `extensions.load("editor_dynamicDecals_colorPresets")`, then the global `editor_dynamicDecals_colorPresets`

"Color Presets" section of the Dynamic Decals tool. List of named colors stored in the preference `dynamicDecalsTool.colorPresets.presets` (about 42 by default: "iconic oraNGe", Aquamarine, Burgundy, Jet Black...). Each entry {name, value={r,g,b,a}} can be edited, renamed, deleted, filtered by name, and applied as a decal or fill layer color.

## Notes

- Values are floats 0..1 (RGBA).
- The search field is labeled "Texture Filter" (copied from another section) although it filters color names.
- The "Add color preset" button inserts an orange color (1, 0.4, 0, 1) without a name; newPreset.name is not used.
- The table `newPreset.value` is shared between all added presets: they reference the same Lua table until the preference is read again.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_dynamicDecals_colorPresets.editorPreferenceValueChanged(path, value)` | Hook called when a preference changes. Does nothing here. *(internal)* | 152 |
| `editor_dynamicDecals_colorPresets.onGui(guiId)` | Draws the search filter, the preset list (color widget, name, buttons delete / apply as decal color via api.setDecalColor / apply as fill layer color via api.setFillLayerColor) and the add button. Serves both as section content and as the editor of the `presets` preference. *(internal)* *(hook)* | 30 |
| `editor_dynamicDecals_colorPresets.registerEditorPreferences(prefsRegistry)` | Registers the subcategory `dynamicDecalsTool.colorPresets` with the `presets` table (default list of named colors) and its graphical editor (onGui). *(internal)* | 101 |
| `editor_dynamicDecals_colorPresets.setup(tool_in)` | Called by the tool: gets the API and docs, registers the "Color Presets" section (order 121) and its documentation page. *(internal)* | 169 |

### Parameter details

#### `editor_dynamicDecals_colorPresets.editorPreferenceValueChanged(path, value)`

Hook called when a preference changes. Does nothing here.

- `path` (*string*) : Preference path.
- `value` (*any*) : New value.

#### `editor_dynamicDecals_colorPresets.onGui(guiId)`

Draws the search filter, the preset list (color widget, name, buttons delete / apply as decal color via api.setDecalColor / apply as fill layer color via api.setFillLayerColor) and the add button. Serves both as section content and as the editor of the `presets` preference.

- `guiId` (*string*) : Suffix for unique ImGui identifiers.

#### `editor_dynamicDecals_colorPresets.registerEditorPreferences(prefsRegistry)`

Registers the subcategory `dynamicDecalsTool.colorPresets` with the `presets` table (default list of named colors) and its graphical editor (onGui).

- `prefsRegistry` (*table*) : Editor preferences registry.

#### `editor_dynamicDecals_colorPresets.setup(tool_in)`

Called by the tool: gets the API and docs, registers the "Color Presets" section (order 121) and its documentation page.

- `tool_in` (*table*) : Reference to the editor_dynamicDecalsTool tool.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/dynamicDecals/colorPresets.lua`.*
