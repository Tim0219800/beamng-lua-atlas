# `editor_dynamicDecals_layerTypes_linkedSet`

*File: `lua/ge/extensions/editor/dynamicDecals/layerTypes/linkedSet.lua` · VM: Game Engine (GE) · 220 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_dynamicDecals_layerTypes_linkedSet`: `extensions.load("editor_dynamicDecals_layerTypes_linkedSet")`, then the global `editor_dynamicDecals_layerTypes_linkedSet`

"Linked Set" layer type of the Dynamic Decals tool: behaves like a group, but you can add to it in the inspector properties (among api.properties) with a value. The "Apply" button recursively propagates these values to all child layers that have the property, whatever their type. The toolbar button (order 40) calls api.addLinkedSet.

## Notes

- Only children that already have a non-nil `property.id` field are modified.
- Special case decalGradientColor: a four-value property is spread over decalGradientColorTopLeft / TopRight / BottomLeft / BottomRight.
- Special case useSurfaceNormal: the child's decalPos and decalNorm are set to nil to force recomputation of the decal matrix (the code calls it a hack).
- Property types not handled by setProperty print "not yet implemented" in the console.
- layer.propertiesDirty becomes true on each modification; the inspector then displays a message asking to click "Apply".
- The delete button of a property does not mark propertiesDirty nor call api.setLayer.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_dynamicDecals_layerTypes_linkedSet.editorPreferenceValueChanged(path, value)` | Hook called when a preference changes. Does nothing here. *(internal)* | 184 |
| `editor_dynamicDecals_layerTypes_linkedSet.onGui(guiId)` | Empty function (unused section). *(internal)* *(hook)* | 174 |
| `editor_dynamicDecals_layerTypes_linkedSet.registerEditorPreferences(prefsRegistry)` | Declares no preference (body commented out). *(internal)* | 178 |
| `editor_dynamicDecals_layerTypes_linkedSet.setup(tool_in)` | Called by the tool: gets the related modules, registers the inspector GUI of the linkedSet type, the "linkedSet" toolbar item and the "Layer Types / Linked Set Layers" documentation page. *(internal)* | 202 |

### Parameter details

#### `editor_dynamicDecals_layerTypes_linkedSet.editorPreferenceValueChanged(path, value)`

Hook called when a preference changes. Does nothing here.

- `path` (*string*) : Preference path.
- `value` (*any*) : New value.

#### `editor_dynamicDecals_layerTypes_linkedSet.onGui(guiId)`

Empty function (unused section).

- `guiId` (*string*) : ImGui identifier suffix (unused).

#### `editor_dynamicDecals_layerTypes_linkedSet.registerEditorPreferences(prefsRegistry)`

Declares no preference (body commented out).

- `prefsRegistry` (*table*) : Editor preferences registry.

#### `editor_dynamicDecals_layerTypes_linkedSet.setup(tool_in)`

Called by the tool: gets the related modules, registers the inspector GUI of the linkedSet type, the "linkedSet" toolbar item and the "Layer Types / Linked Set Layers" documentation page.

- `tool_in` (*table*) : Reference to the editor_dynamicDecalsTool tool.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/dynamicDecals/layerTypes/linkedSet.lua`.*
