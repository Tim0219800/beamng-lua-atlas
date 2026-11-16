# `editor_api_decal`

*File: `lua/ge/extensions/editor/api/decal.lua` · VM: Game Engine (GE) · 162 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_api_decal`: `extensions.load("editor_api_decal")`, then the global `editor_api_decal`

Editor API for terrain/object decals (Engine.Render.DecalMgr): creation and deletion of templates (DecalData), adding/removing instances, lookup and saving. initialize(editor) creates the decalPersistMan PersistenceManager and adds the functions to editor. Templates are saved in art/decals/managedDecalData.json of the mission folder, instances in main.decals.json.

## Notes

- If the mission name cannot be found, getDecalDataFilePath logs an error and falls back to the default relative path.
- getDecalInstance and getDecalInstanceByUid return nil if the instance has no valid id/uid fields.
- In getDecalInstanceByUid, the uid is passed to DecalMgr.getDecalInstance (same call as for an index): the engine handles both (inferred from code).
- Deleted templates are queued and only actually removed from the file by saveDecals.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_api_decal.initialize(editorInstance)` | Creates decalPersistMan if it does not exist and installs the functions on the editor object. *(internal)* | 133 |

### Parameter details

#### `editor_api_decal.initialize(editorInstance)`

Creates decalPersistMan if it does not exist and installs the functions on the editor object.

- `editorInstance` (*table*) : editor object

## Class `editor`

Functions added to the editor object by initialize.

Object `editor` built inside the module (e.g. by `new`), with these methods:

| Method | Description | Line |
|---|---|---|
| `editor.addDecalInstance(pos, normal, rotAroundNormal, template, decalScale, decalTexIndex, flags, initialAlpha)` | Adds a decal instance oriented by a normal and a rotation around it. | 55 |
| `editor.addDecalInstanceWithTan(pos, normal, tangent, template, decalScale, decalTexIndex, flags, initialAlpha)` | Like addDecalInstance but oriented by a tangent vector. | 62 |
| `editor.addDecalInstanceWithTanForceId(pos, normal, tangent, template, decalScale, decalTexIndex, flags, initialAlpha, index)` | Like addDecalInstanceWithTan but forcing the instance index. | 69 |
| `editor.createDecalTemplate()` | Creates a DecalData with the unique name NewTemplate (WarningMaterial material) and marks it as modified for the decals file. | 18 |
| `editor.deleteDecalInstance(instance)` | Deletes an instance and marks the editor as modified. | 94 |
| `editor.deleteDecalTemplate(template)` | Deletes all instances using this template, removes the template from the set and queues it for deletion at the next saveDecals. | 34 |
| `editor.getClosestDecal(pos)` | Returns the decal closest to a position. | 99 |
| `editor.getDecalDataFilePath()` | Path of the templates file: mission folder + art/decals/managedDecalData.json. | 10 |
| `editor.getDecalInstance(index)` | Returns the instance with the given index, or nil if invalid. | 76 |
| `editor.getDecalInstanceByUid(uid)` | Returns the instance with the given uid, or nil if invalid. | 83 |
| `editor.getDecalInstanceVecSize()` | Number of slots in the instances array. | 90 |
| `editor.getDecalTemplates()` | Returns the set of templates (DecalMgr.getSet()). | 47 |
| `editor.hasDirtyDecalTemplates()` | Returns whether any templates have unsaved changes. | 51 |
| `editor.isDecalDirty(decal)` | Returns whether the decal/template has unsaved changes. | 108 |
| `editor.notifyDecalModified(instance)` | Tells the engine that an instance has changed and marks the editor as modified. | 103 |
| `editor.saveDecal(template)` | Saves a modified template. | 112 |
| `editor.saveDecals()` | Purges the templates queued for deletion, saves the modified templates and writes the instances to main.decals.json in the mission folder. | 116 |

## Calls into the engine (C++)

- `Sim.` `getUniqueName`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/api/decal.lua`.*
