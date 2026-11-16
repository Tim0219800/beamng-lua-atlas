# `editor_dynamicDecals_widgets`

*File: `lua/ge/extensions/editor/dynamicDecals/widgets.lua` · VM: Game Engine (GE) · 1592 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_dynamicDecals_widgets`: `extensions.load("editor_dynamicDecals_widgets")`, then the global `editor_dynamicDecals_widgets`

ImGui widget library of the Dynamic Decals tool. draw() displays a property (name, description tooltip, optional widget type choice) then the widget suited to its type: bool (checkbox), int (Input/Slider/Drag/Combo), float (Input/Slider/Drag), Point2F (Input/Slider/Drag), Point3F and Point4F (Slider/Color), string (Input/InputMultiline), Texture (File/ImageButton), File, ColorI and MultiColor (gradient). The properties come from the dynamicDecals API (api.propertiesMap, api.types, api.widgetTypes). Also handles the temporary highlighting of a property with automatic scrolling.

## Notes

- An unknown property type is displayed in red with the property name.
- Most widgets offer a reset-to-default button (refresh icon) if property.default is defined; the new value is written to property.value.
- If property.widgetType is absent, the default widget of the type is used. If api.widgetTypes[type] exists, a "Widget Type" button opens a popup to change property.widgetType.
- In the tool's debug mode (preference dynamicDecalsTool.general.debug), the tooltip adds the widget identifier.
- Registered preferences: texturePreviewSize (float, 128, 32 to 512) and multiColorWidgetWidth (float, 128, 32 to 512).

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_dynamicDecals_widgets.defaultButton(widgetId, cbFunc, tooltipMsg)` | Draws a "refresh" icon button followed by SameLine; calls cbFunc on click. | 59 |
| `editor_dynamicDecals_widgets.draw(value, property, guiId, editEnded, widgetOptions)` | Draws a property and its widget. Returns true if the value was modified this frame; editEnded[0] is updated to indicate the end of an edit (mouse release, validation). | 1325 |
| `editor_dynamicDecals_widgets.editorPreferenceValueChanged(path, value)` | Empty preference hook. *(internal)* | 1582 |
| `editor_dynamicDecals_widgets.highlight(id, time)` | Highlights a property (frame in the BeamNG color) and scrolls the window to it. Replaces any previous highlight. | 1553 |
| `editor_dynamicDecals_widgets.registerEditorPreferences(prefsRegistry)` | Registers the preferences texturePreviewSize and multiColorWidgetWidth. *(internal)* | 1575 |
| `editor_dynamicDecals_widgets.setup(tool_in)` | Initializes with the parent tool, gets the dynamicDecals API and the helper, and registers the update that expires the highlights. *(internal)* | 1567 |

### Parameter details

#### `editor_dynamicDecals_widgets.defaultButton(widgetId, cbFunc, tooltipMsg)`

Draws a "refresh" icon button followed by SameLine; calls cbFunc on click.

- `widgetId` (*string*) : Widget identifier (the button is "widgetId_resetButton")
- `cbFunc` (*function*) : Function called on click
- `tooltipMsg` (*string|nil*) : Optional tooltip

#### `editor_dynamicDecals_widgets.draw(value, property, guiId, editEnded, widgetOptions)`

Draws a property and its widget. Returns true if the value was modified this frame; editEnded[0] is updated to indicate the end of an edit (mouse release, validation).

- `value` (*any*) : Current value of the property (type according to property.type)
- `property` (*table*) : Property {id, name?, description?, type?, widgetType?, default?, value, ...}; id is used to find api.propertiesMap
- `guiId` (*string*) : imgui identifier suffix to make the widget unique (widgetId = "##guiId_property.id")
- `editEnded` (*table|nil*) : imgui boolean pointer ([0]) set to true at the end of the edit
- `widgetOptions` (*table|nil*) : Rendering options, for example widthMod (width adjustment in pixels)
- **returns**: boolean|nil true if modified, otherwise nil

#### `editor_dynamicDecals_widgets.editorPreferenceValueChanged(path, value)`

Empty preference hook.

- `path` (*string*) : Path
- `value` (*any*) : Value

#### `editor_dynamicDecals_widgets.highlight(id, time)`

Highlights a property (frame in the BeamNG color) and scrolls the window to it. Replaces any previous highlight.

- `id` (*string*) : Full widget identifier, in the format "##guiId_propertyId"
- `time` (*number*) : Duration in seconds (decremented with dtReal)

#### `editor_dynamicDecals_widgets.registerEditorPreferences(prefsRegistry)`

Registers the preferences texturePreviewSize and multiColorWidgetWidth.

- `prefsRegistry` (*table*) : Preferences registry

#### `editor_dynamicDecals_widgets.setup(tool_in)`

Initializes with the parent tool, gets the dynamicDecals API and the helper, and registers the update that expires the highlights.

- `tool_in` (*table*) : Module editor_dynamicDecalsTool

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/dynamicDecals/widgets.lua`.*
