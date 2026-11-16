# `editor_waterObjectHelper`

*File: `lua/ge/extensions/editor/waterObjectHelper.lua` · VM: Game Engine (GE) · 20 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_waterObjectHelper`: `extensions.load("editor_waterObjectHelper")`, then the global `editor_waterObjectHelper`

Small world editor extension: when a texture field of a water object is modified in the inspector, it reloads the object's textures. It reacts only to the fields rippleTex, foamTex, depthGradientTex and cubemap, and only for objects of class WaterObject.

## Notes

- The code does not check that scenetree.findObjectById returns a non-nil object before calling object:isSubClassOf: an invalid id would cause an error.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_waterObjectHelper.onEditorInspectorFieldChanged(selectedIds, fieldName, fieldValue, arrayIndex)` | Editor hook called when an inspector field changes. For each selected id, if the field is rippleTex, foamTex, depthGradientTex or cubemap and the object is a WaterObject, calls object:reloadTextures(). *(internal)* *(hook)* | 7 |

### Parameter details

#### `editor_waterObjectHelper.onEditorInspectorFieldChanged(selectedIds, fieldName, fieldValue, arrayIndex)`

Editor hook called when an inspector field changes. For each selected id, if the field is rippleTex, foamTex, depthGradientTex or cubemap and the object is a WaterObject, calls object:reloadTextures().

- `selectedIds` (*table<integer, integer>*) : ids of the selected objects
- `fieldName` (*string*) : name of the modified field
- `fieldValue` (*any*) : new value (unused)
- `arrayIndex` (*integer|nil*) : array index for an array field (unused)

## Calls into the engine (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/waterObjectHelper.lua`.*
