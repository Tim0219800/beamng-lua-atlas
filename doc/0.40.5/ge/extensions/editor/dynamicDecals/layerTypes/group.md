# `editor_dynamicDecals_layerTypes_group`

*File: `lua/ge/extensions/editor/dynamicDecals/layerTypes/group.lua` · VM: Game Engine (GE) · 69 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_dynamicDecals_layerTypes_group`: `extensions.load("editor_dynamicDecals_layerTypes_group")`, then the global `editor_dynamicDecals_layerTypes_group`

"Group" layer type of the Dynamic Decals tool: a container layer that groups other layers; disabling it hides all its children. This module adds the "Add group" button to the toolbar (api.addGroup), registers an empty inspector GUI for this type and the "Layer Types / Group Layers" documentation page.

## Notes

- inspectLayerGui and sectionGui (exported under the name onGui) are empty functions: a group has no property of its own in the inspector beyond name and enabled.
- The registration of the "Group Properties" section is commented out.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_dynamicDecals_layerTypes_group.editorPreferenceValueChanged(path, value)` | Hook called when a preference changes. Does nothing here. *(internal)* | 37 |
| `editor_dynamicDecals_layerTypes_group.onGui(guiId)` | Empty function (unused section). *(internal)* *(hook)* | 27 |
| `editor_dynamicDecals_layerTypes_group.registerEditorPreferences(prefsRegistry)` | Declares no preference (body commented out). *(internal)* | 31 |
| `editor_dynamicDecals_layerTypes_group.setup(tool_in)` | Called by the tool: registers the inspector GUI of the group type, the "group" toolbar item (order 30) and the documentation page. *(internal)* | 52 |

### Parameter details

#### `editor_dynamicDecals_layerTypes_group.editorPreferenceValueChanged(path, value)`

Hook called when a preference changes. Does nothing here.

- `path` (*string*) : Preference path.
- `value` (*any*) : New value.

#### `editor_dynamicDecals_layerTypes_group.onGui(guiId)`

Empty function (unused section).

- `guiId` (*string*) : ImGui identifier suffix (unused).

#### `editor_dynamicDecals_layerTypes_group.registerEditorPreferences(prefsRegistry)`

Declares no preference (body commented out).

- `prefsRegistry` (*table*) : Editor preferences registry.

#### `editor_dynamicDecals_layerTypes_group.setup(tool_in)`

Called by the tool: registers the inspector GUI of the group type, the "group" toolbar item (order 30) and the documentation page.

- `tool_in` (*table*) : Reference to the editor_dynamicDecalsTool tool.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/dynamicDecals/layerTypes/group.lua`.*
