# `editor_terrainMaterialsEditor`

*File: `lua/ge/extensions/editor/terrainMaterialsEditor.lua` · VM: Game Engine (GE) · 2296 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_terrainMaterialsEditor`: `extensions.load("editor_terrainMaterialsEditor")`, then the global `editor_terrainMaterialsEditor`

World Editor 'Terrain Material Library' window: lists, edits, duplicates, deletes and imports from another level the level's terrain materials (TerrainMaterial), with texture validation (PNG format, power-of-2 sizes, value ranges, distance order), undo through history for properties, bulk texture change and upgrade of the old file format (art/terrains/materials.json to art/terrain/main.materials.json). Depends on editor_terrainEditor (which provides the library and the material proxies). Publishes editor.showTerrainMaterialsEditor(internalName) to open the window on a given material.

## Example

```lua
editor.showTerrainMaterialsEditor("grass_01")
```

## Notes

- A PersistenceManager 'terrainMatEditor_PersistMan' is created when the module loads if it does not exist.
- The internal name of a material must not be empty, must not start with a digit and must not already exist (NotificationState_* notification states).
- Two material formats are handled: V0 (diffuse/normal/detail/macro map) and V1 (baseColor, normal, roughness, ao, height with texture sizes per slot: baseTexSize, macroTexSize, detailTexSize).
- Probable inconsistency in applyMtlChanges: the already-taken name check iterates editor_terrainEditor.getMaterialsInJson() with ipairs, whereas the table is traversed elsewhere with pairs (non-integer keys); the duplicate detection here might never trigger.
- The constant terrainMaterialTextureSetPath ('art/terrains/main.materials.json') is declared but does not seem to be used.

**Dependencies (loaded first):** `editor_terrainEditor`

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_terrainMaterialsEditor.onEditorActivated()` | Hook called when the editor is activated: if the window is visible, reloads the material library (editor_terrainEditor.updateMaterialLibrary) and invalidates the validation cache. *(internal)* *(hook)* | 2282 |
| `editor_terrainMaterialsEditor.onEditorGui()` | Editor render hook: draws the 'Terrain Material Library' window (material list, V0/V1 properties, validation, import/duplicate/delete/upgrade buttons) and the associated modal windows. *(internal)* *(hook)* | 1666 |
| `editor_terrainMaterialsEditor.onEditorInitialized()` | Editor initialization hook: registers the window (710x530), the modals (bulk texture change, upgrade, import) and publishes editor.showTerrainMaterialsEditor. *(internal)* *(hook)* | 2272 |

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | {"editor_terrainEditor"}: extensions to load before this one. |

## Calls into the engine (C++)

- `FS:` `directoryCreate`, `directoryExists`, `fileExists`, `findFiles`
- `obj:` `getField`, `getId`, `setField`
- `scenetree.` `findClassObjects`, `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/terrainMaterialsEditor.lua`.*
