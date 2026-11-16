# `editor_dynamicDecals_vehicleColorPalette`

*File: `lua/ge/extensions/editor/dynamicDecals/vehicleColorPalette.lua` · VM: Game Engine (GE) · 465 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_dynamicDecals_vehicleColorPalette`: `extensions.load("editor_dynamicDecals_vehicleColorPalette")`, then the global `editor_dynamicDecals_vehicleColorPalette`

"Vehicle Color Palette" section of the Dynamic Decals tool: lets you change the player vehicle's colors (color, colorPalette0, colorPalette1) and its metallic paint data (metallicPaintData: Metallic, Roughness, Clear Coat, Clear Coat Roughness, via getField/setField) to see the effect on a design. Also registers a "palettes" preference with 19 predefined palettes of 3 colors (BeamNG, Camouflage, Chocolate, Dunes, Fast Car, France, Icy, Italy, Lilac, Midnight, Moss, Neptune, Pastelle, Retro Handheld Console, Sunset, Tape Deck, The 80's, Vintage, Watermelon). The vehicle colors are serialized with the tool state and restored after 5 frames.

## Notes

- Colors are RGB triplets 0..1; Point4F for the vehicle colors (the 4th component keeps the existing or stored value).
- The palette management UI in the preferences is entirely commented out in the code: only the default list is registered.
- If no vehicle exists, the section displays "No vehicle".
- Color restoration: if the vehicle is missing when the counter reaches 0, a warning is logged and the restoration is retried every frame.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_dynamicDecals_vehicleColorPalette.editorPreferenceValueChanged(path, value)` | Empty preference hook. *(internal)* | 394 |
| `editor_dynamicDecals_vehicleColorPalette.onDeserialized(data)` | Deserialization hook: schedules the restoration of the saved colors in 5 frames. *(internal)* *(hook)* | 454 |
| `editor_dynamicDecals_vehicleColorPalette.onGui(guiId)` | Draws the section content (player vehicle colors and metallic settings). Called by the tool in the section and in its dedicated window. *(internal)* *(hook)* | 66 |
| `editor_dynamicDecals_vehicleColorPalette.onSerialize()` | Serialization hook: returns {colors = {{color}, {colorPalette0}, {colorPalette1}}} (4 components each) of the player vehicle, or colors = nil without a vehicle. *(internal)* *(hook)* | 438 |
| `editor_dynamicDecals_vehicleColorPalette.registerEditorPreferences(prefsRegistry)` | Registers in the subcategory dynamicDecalsTool.vehicleColorPalette the palettes preference (table of {name, values = 3 RGB triplets}). *(internal)* | 322 |
| `editor_dynamicDecals_vehicleColorPalette.setup(tool_in)` | Initializes the module with the parent tool: registers the section (order 120, closed by default, help button), the color restoration update function and the documentation page. *(internal)* | 426 |

### Parameter details

#### `editor_dynamicDecals_vehicleColorPalette.editorPreferenceValueChanged(path, value)`

Empty preference hook.

- `path` (*string*) : Preference path
- `value` (*any*) : New value

#### `editor_dynamicDecals_vehicleColorPalette.onDeserialized(data)`

Deserialization hook: schedules the restoration of the saved colors in 5 frames.

- `data` (*table*) : Data returned by onSerialize

#### `editor_dynamicDecals_vehicleColorPalette.onGui(guiId)`

Draws the section content (player vehicle colors and metallic settings). Called by the tool in the section and in its dedicated window.

- `guiId` (*string*) : imgui identifier suffix to avoid collisions between section and window

#### `editor_dynamicDecals_vehicleColorPalette.onSerialize()`

Serialization hook: returns {colors = {{color}, {colorPalette0}, {colorPalette1}}} (4 components each) of the player vehicle, or colors = nil without a vehicle.

- **returns**: table {colors = table|nil}

#### `editor_dynamicDecals_vehicleColorPalette.registerEditorPreferences(prefsRegistry)`

Registers in the subcategory dynamicDecalsTool.vehicleColorPalette the palettes preference (table of {name, values = 3 RGB triplets}).

- `prefsRegistry` (*table*) : Preferences registry

#### `editor_dynamicDecals_vehicleColorPalette.setup(tool_in)`

Initializes the module with the parent tool: registers the section (order 120, closed by default, help button), the color restoration update function and the documentation page.

- `tool_in` (*table*) : Module editor_dynamicDecalsTool

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/dynamicDecals/vehicleColorPalette.lua`.*
