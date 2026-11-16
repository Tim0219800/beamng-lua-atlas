# `editor_dynamicDecals_layerTypes_decal`

*File: `lua/ge/extensions/editor/dynamicDecals/layerTypes/decal.lua` · VM: Game Engine (GE) · 1254 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_dynamicDecals_layerTypes_decal`: `extensions.load("editor_dynamicDecals_layerTypes_decal")`, then the global `editor_dynamicDecals_layerTypes_decal`

"Decal" layer type of the Dynamic Decals tool, the most important one: a single decal with color, textures (color, alpha, metallic, normal, roughness), scale, rotation, skew, UV, alpha mask, mirror, gradient and SDF (Signed Distance Fields: outlines, softening) properties. Provides the "Decal Properties" section (settings of the current decal, order 60), the inspector GUI of the decal type, the SDF introduction window, the font character picker window and the documentation pages (Decal Layers, Properties, SDF).

## Notes

- A texture is "SDF-compatible" if its sidecar file (texturesApi.readSidecarFile) contains isSdfCompatible = true.
- The SDF intro window opens when an SDF-compatible color texture appears, as long as the preference `dynamicDecalsTool.decalProperties.doNotShowSdfIntroAgain` is false and the window has not been closed during the session.
- In the inspector, the update of decalScale only writes .x and .z (not .y); widget changes go through widgets.draw then api.setLayer(layer, true) when editing is finished.
- The preference `dynamicDecalsTool.inspector.applyMirroredPropertyToChildren` (default true) propagates mirrored and flipMirroredDecal to child layers (via setPropertyInChildrenRec).
- The file also registers two locally added properties: "mirroredDebug" (traces the mirror plane line on the shape) and "mirrorOffsetProperty" (offsets the plane, from -1 to 1).

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_dynamicDecals_layerTypes_decal.checkColorDecalTexturesSdfCompatible()` | If the current color texture is SDF-compatible, displays the SDF introduction window (unless it was closed or the doNotShowSdfIntroAgain preference is true). | 77 |
| `editor_dynamicDecals_layerTypes_decal.editModeUpdate(dtReal, dtSim, dtRaw)` | Called every frame by the edit mode (via tool.registerEditorOnUpdateFn): counts down the timer of the SDF property highlight. *(internal)* | 1154 |
| `editor_dynamicDecals_layerTypes_decal.editorPreferenceValueChanged(path, value)` | Hook called when a preference changes. Does nothing here. *(internal)* | 1146 |
| `editor_dynamicDecals_layerTypes_decal.hideSdfIntroWindow()` | Closes the SDF introduction window. | 1247 |
| `editor_dynamicDecals_layerTypes_decal.isTexturesSdfCompatible(texturePath)` | Indicates whether the given texture is SDF-compatible, based on its metadata file. | 67 |
| `editor_dynamicDecals_layerTypes_decal.registerEditorPreferences(prefsRegistry)` | Registers `dynamicDecalsTool.decalProperties`: scaleStep (float 0.025, from 0.001 to 0.25), rotationStep (float 15 degrees, from 1 to 360), texturePreviewSize (float 128, from 32 to 512), doNotShowSdfIntroAgain (bool false); and `dynamicDecalsTool.inspector.applyMirroredPropertyToChildren` (bool true). *(internal)* | 1134 |
| `editor_dynamicDecals_layerTypes_decal.setup(tool_in)` | Called by the tool: gets the related modules, registers the windows (SDF 400x400, font character 550x550), the "Decal Properties" section, the update and GUI callbacks, the inspector GUI of the decal type, the documentation pages and the list of blend modes. *(internal)* | 1211 |
| `editor_dynamicDecals_layerTypes_decal.showSdfIntroWindow()` | Opens the "Dynamic Decals - SDF Introduction" window. | 1246 |

### Parameter details

#### `editor_dynamicDecals_layerTypes_decal.editModeUpdate(dtReal, dtSim, dtRaw)`

Called every frame by the edit mode (via tool.registerEditorOnUpdateFn): counts down the timer of the SDF property highlight.

- `dtReal` (*number*) : Real time delta (s).
- `dtSim` (*number*) : Simulation time delta (s).
- `dtRaw` (*number*) : Raw time delta (s).

#### `editor_dynamicDecals_layerTypes_decal.editorPreferenceValueChanged(path, value)`

Hook called when a preference changes. Does nothing here.

- `path` (*string*) : Preference path.
- `value` (*any*) : New value.

#### `editor_dynamicDecals_layerTypes_decal.isTexturesSdfCompatible(texturePath)`

Indicates whether the given texture is SDF-compatible, based on its metadata file.

- `texturePath` (*string|nil*) : Texture path; defaults to the decal's current color texture (api.getDecalTexturePath("color")).
- **returns**: boolean true if the isSdfCompatible metadata is true.

#### `editor_dynamicDecals_layerTypes_decal.registerEditorPreferences(prefsRegistry)`

Registers `dynamicDecalsTool.decalProperties`: scaleStep (float 0.025, from 0.001 to 0.25), rotationStep (float 15 degrees, from 1 to 360), texturePreviewSize (float 128, from 32 to 512), doNotShowSdfIntroAgain (bool false); and `dynamicDecalsTool.inspector.applyMirroredPropertyToChildren` (bool true).

- `prefsRegistry` (*table*) : Editor preferences registry.

#### `editor_dynamicDecals_layerTypes_decal.setup(tool_in)`

Called by the tool: gets the related modules, registers the windows (SDF 400x400, font character 550x550), the "Decal Properties" section, the update and GUI callbacks, the inspector GUI of the decal type, the documentation pages and the list of blend modes.

- `tool_in` (*table*) : Reference to the editor_dynamicDecalsTool tool.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/dynamicDecals/layerTypes/decal.lua`.*
