# `editor_api_material`

*File: `lua/ge/extensions/editor/api/material.lua` · VM: Game Engine (GE) · 388 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_api_material`: `extensions.load("editor_api_material")`, then the global `editor_api_material`

Editor API for manipulating materials (`Material` objects, materials.json files): creation, copy, move to another file, property modification, deletion. `initialize` installs the functions on the `editor` object. Disk writes go through the PersistenceManager `scenetree.matLuaEd_PersistMan`; deleting a JSON entry is done by text manipulation so as not to reorder the whole file (jsonWriteFile sorts the keys).

## Example

```lua
editor.createMaterial("mon_mat", "levels/mymap/art/materials.json", "mon_mat")
editor.setMaterialProperty("mon_mat", "diffuseColor", 0, "1 0 0 1")
```

## Notes

- The functions accept a Material object or its name (string), resolved by scenetree.findObject.
- Materials v1.5: 4 layers maximum (fields copied on layers 0 to 3).
- Fields not copied by copyMaterial/copyMaterialAsNew: name, mapTo, persistentId, parentGroup, internalName, class, className, superClass, hidden, locked, canSave, canSaveDynamicFields.
- Inconsistency: `initialize` creates the `materialPersistMan` object if missing, but all the functions use `scenetree.matLuaEd_PersistMan` (created elsewhere).
- The error messages use `logTag`, which is not defined in this file (nil unless a global elsewhere).
- `createMaterial` declares materialMapTo as `number` but treats it as a string (`#materialMapTo`); pass a string.
- `setMaterialProperty` and `deleteMaterial` crash if the name matches no object (nil material indexed).

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_api_material.initialize(editorInstance)` | Registers a 'materialPersistMan' PersistenceManager if it does not exist, remembers the editor and installs createMaterial, setMaterialProperty, removeMaterialFromJson, moveMaterial, copyMaterial, copyMaterialAsNew, deleteMaterial on it. *(internal)* | 369 |

### Parameter details

#### `editor_api_material.initialize(editorInstance)`

Registers a 'materialPersistMan' PersistenceManager if it does not exist, remembers the editor and installs createMaterial, setMaterialProperty, removeMaterialFromJson, moveMaterial, copyMaterial, copyMaterialAsNew, deleteMaterial on it.

- `editorInstance` (*table*) : `editor` object

## Class `editor`

Functions added to `editor` by initialize.

Object `editor` built inside the module (e.g. by `new`), with these methods:

| Method | Description | Line |
|---|---|---|
| `editor.copyMaterial(source, target)` | Copies all the parameters (all layers and dynamic fields) of a source material onto an existing target material, keeping the target's name, mapTo and file. The target must be in a .json; it is reloaded and saved. | 285 |
| `editor.copyMaterialAsNew(source, newName, newFilename)` | Copies a material into a new material (name and mapTo = newName) written to the given file. | 315 |
| `editor.createMaterial(materialName, materialFilename, materialMapTo)` | Creates a new Material (version 1.5) and writes it to disk. Fails if the name is empty, already taken, or if the folder does not exist. If mapTo is empty, the material name is used. | 12 |
| `editor.deleteMaterial(material)` | Deletes the Material object from the scene and its entry in its JSON file (via removeMaterialFromJson). | 351 |
| `editor.moveMaterial(material, newFilename)` | Moves a material to another file (saves it in the new one) then removes its entry from the old file if it was an existing .json. | 188 |
| `editor.removeMaterialFromJson(materialName, materialFilename)` | Deletes the top-level `materialName` entry of a materials.json file by text editing (handles commas, independent of indentation) and rewrites the file. Logs an error/warning and returns nothing if the file or the entry is not found. | 79 |
| `editor.setMaterialProperty(material, property, layer, value)` | Sets a material field on a layer then reloads the material (does not save to disk). | 60 |

## Calls into the engine (C++)

- `FS:` `directoryExists`, `fileExists`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/api/material.lua`.*
