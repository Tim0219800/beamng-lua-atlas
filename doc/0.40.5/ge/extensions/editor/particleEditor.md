# `editor_particleEditor`

*File: `lua/ge/extensions/editor/particleEditor.lua` · VM: Game Engine (GE) · 578 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_particleEditor`: `extensions.load("editor_particleEditor")`, then the global `editor_particleEditor`

Particle editor ("Particle Editor" edit mode) of the world editor. It adds a header to the inspector with an Emitter tab (choose, create, save, delete a ParticleEmitterData) and a tab for the attached ParticleData. It also registers two custom field editors: "particles" (up to 4 ParticleData, separated by tabs) for ParticleEmitterData and "textureName" (file picker) for ParticleData. The datablocks are saved in art/shapes/particles/managedParticleEmitterData.json and managedParticleData.json, either in their original file or in the current level's folder.

## Notes

- The module only exports hooks; all the logic (undo/redo of creation and deletion, saving, confirmation of unsaved change) is local.
- An emitter named "DefaultEmitter" is protected: the editing buttons are disabled for it.
- The windows only act if editor.editMode is the particleEditMode mode.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_particleEditor.onEditorInitialized()` | Called once the editor is initialized. Declares the edit mode editor.editModes.particleEditMode (name "Particle Editor") and registers the custom field editors for ParticleEmitterData.particles and ParticleData.textureName. *(internal)* *(hook)* | 544 |
| `editor_particleEditor.onEditorInspectorFieldChanged(selectedIds, fieldName, fieldValue, arrayIndex)` | Called when an inspector field is modified. If the modified object (selectedIds[1]) is the current emitter or particle, the datablock is marked dirty, reloaded (reload) and the datablocks list is rebuilt. *(internal)* *(hook)* | 457 |
| `editor_particleEditor.onEditorInspectorHeaderGui()` | Called every frame at the start of the Inspector window. Draws the Emitter / Particle tabs, the new, save, save in level, delete buttons, and the confirmation box for a selection change with unsaved modifications. Does nothing outside Particle Editor mode. *(internal)* *(hook)* | 291 |
| `editor_particleEditor.onExtensionLoaded()` | Called when the extension loads; only writes "initialized" to the log (level D). *(internal)* *(hook)* | 561 |
| `editor_particleEditor.onExtensionUnloaded()` | Called on unload; deletes the preview emitter node (editableEmitterNode) if it exists. *(internal)* *(hook)* | 565 |

### Parameter details

#### `editor_particleEditor.onEditorInspectorFieldChanged(selectedIds, fieldName, fieldValue, arrayIndex)`

Called when an inspector field is modified. If the modified object (selectedIds[1]) is the current emitter or particle, the datablock is marked dirty, reloaded (reload) and the datablocks list is rebuilt.

- `selectedIds` (*table<integer, integer>*) : Ids of the selected objects; only the first is used.
- `fieldName` (*string*) : Name of the modified field (unused).
- `fieldValue` (*any*) : New value (unused).
- `arrayIndex` (*integer*) : Index in an array field (unused).

## Calls into the engine (C++)

- `Sim.` `getDataBlockSet`, `getUniqueName`, `upcast`
- `scenetree.` `findObject`, `findObjectById`
- `worldEditorCppApi.` `createObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/particleEditor.lua`.*
