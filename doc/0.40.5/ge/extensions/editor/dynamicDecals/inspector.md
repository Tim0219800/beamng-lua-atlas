# `editor_dynamicDecals_inspector`

*File: `lua/ge/extensions/editor/dynamicDecals/inspector.lua` · VM: Game Engine (GE) · 144 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_dynamicDecals_inspector`: `extensions.load("editor_dynamicDecals_inspector")`, then the global `editor_dynamicDecals_inspector`

Inspector of the Dynamic Decals tool: displays and lets you edit all properties of the selected layers (`editor.selection["dynamicDecalLayer"]`) or of the selected brush (`editor.selection["dynamicDecalBrush"]`). Common fields (uid, name, type, enabled) are drawn here; the rest is delegated to a GUI function registered per layer type via registerLayerGui (by the layerTypes/* modules).

## Notes

- If no GUI is registered for a layer type, a text "No layerGui available for '<type>'" is displayed.
- With multiple selection, each layer is in a TreeNode "uid - name".
- The "Dump" button calls dump(layer); a second button dumpz(layer, 3) appears if the preference `dynamicDecalsTool.general.debug` is enabled.
- The tooltip of the uid field says "Read-only type" (copy-paste).

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_dynamicDecals_inspector.editorPreferenceValueChanged(path, value)` | Hook called when a preference changes. Does nothing here. *(internal)* | 104 |
| `editor_dynamicDecals_inspector.inspectorGuiBrush(inspectorInfo)` | If a brush is selected, calls brushes.inspectorGui(brush). *(internal)* | 91 |
| `editor_dynamicDecals_inspector.inspectorGuiLayer(inspectorInfo)` | Draws the inspector of the selected layers (a single one directly, several in TreeNodes). Does nothing if the selection is nil. *(internal)* | 64 |
| `editor_dynamicDecals_inspector.registerEditorPreferences(prefsRegistry)` | Registers the float preference `dynamicDecalsTool.inspector.texturePreviewSize` (default 128, from 32 to 512). *(internal)* | 98 |
| `editor_dynamicDecals_inspector.registerLayerGui(layerTypeId, guiFn)` | Registers the function that draws the specific properties of a layer type; it is called with (layer, guiId). | 133 |
| `editor_dynamicDecals_inspector.setup(tool_in)` | Called by the tool: gets API, brushes, docs, widgets and helper, installs a default GUI for each layer type of api.layerTypes and registers the "Inspector" doc page. *(internal)* | 118 |

### Parameter details

#### `editor_dynamicDecals_inspector.editorPreferenceValueChanged(path, value)`

Hook called when a preference changes. Does nothing here.

- `path` (*string*) : Preference path.
- `value` (*any*) : New value.

#### `editor_dynamicDecals_inspector.inspectorGuiBrush(inspectorInfo)`

If a brush is selected, calls brushes.inspectorGui(brush).

- `inspectorInfo` (*table*) : Inspector information (not used).

#### `editor_dynamicDecals_inspector.inspectorGuiLayer(inspectorInfo)`

Draws the inspector of the selected layers (a single one directly, several in TreeNodes). Does nothing if the selection is nil.

- `inspectorInfo` (*table*) : Editor inspector information (not used here).

#### `editor_dynamicDecals_inspector.registerEditorPreferences(prefsRegistry)`

Registers the float preference `dynamicDecalsTool.inspector.texturePreviewSize` (default 128, from 32 to 512).

- `prefsRegistry` (*table*) : Editor preferences registry.

#### `editor_dynamicDecals_inspector.registerLayerGui(layerTypeId, guiFn)`

Registers the function that draws the specific properties of a layer type; it is called with (layer, guiId).

- `layerTypeId` (*integer*) : Layer type identifier (value of api.layerTypes).
- `guiFn` (*function*) : function(layer, guiId) that draws the UI.

#### `editor_dynamicDecals_inspector.setup(tool_in)`

Called by the tool: gets API, brushes, docs, widgets and helper, installs a default GUI for each layer type of api.layerTypes and registers the "Inspector" doc page.

- `tool_in` (*table*) : Reference to the editor_dynamicDecalsTool tool.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/dynamicDecals/inspector.lua`.*
