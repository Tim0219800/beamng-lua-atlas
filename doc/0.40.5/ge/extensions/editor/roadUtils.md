# `editor_roadUtils`

*File: `lua/ge/extensions/editor/roadUtils.lua` · VM: Game Engine (GE) · 304 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_roadUtils`: `extensions.load("editor_roadUtils")`, then the global `editor_roadUtils`

Road template utilities of the editor. Reads the levels/<level>/roadtemplates/*.road.json files, stores the templates' materials and material names, then applies the template of each DecalRoad that references one: creates child roads, decorations and decals along the road. Everything is inactive as long as the roadTemplates.general.loadTemplates preference is false.

## Notes

- The dynamic fields read on the road are template, useTemplate, isChildRoad, childRoads, decorationIDs, decalIDs (strings of space-separated ids).
- Road resolution: one node every roadResolutionMetres = 2 m.
- Trap: `local roadDecorations = extensions.editor_roadDecorations` is read when the file loads; if this extension is not yet loaded at that moment, roadDecorations is nil and updateChildRoads crashes.
- M.onEditorInitialized = nil is exported explicitly: the field does not exist, it is not an active hook.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_roadUtils.getMaterialNames()` | Returns the material names of the templates, in the same order as getMaterials. | 287 |
| `editor_roadUtils.getMaterials()` | Returns the list of textures (editor.texObj objects) of the materials of the templates loaded by reloadTemplates. | 283 |
| `editor_roadUtils.getRoadTemplateFiles()` | Returns the paths of the *.road.json files found by the last reloadTemplates. | 291 |
| `editor_roadUtils.reloadDecals(road, template)` | Deletes the road's previous decals (decalIDs field) then recreates those defined by the template and stores their ids in the decalIDs dynamic field. | 97 |
| `editor_roadUtils.reloadDecorations(road)` | Deletes the road's old decorations (decorationIDs field) then recreates those of the template. Ignores child roads, roads without a template or with useTemplate different from "true". | 43 |
| `editor_roadUtils.reloadTemplates()` | Rereads the .road.json files of the current level, rebuilds the material lists (colorMap texture, or warnMat.dds if the material is not found) then reapplies to each DecalRoad using a template: child roads, decorations and decals. Finally reloads the collisions (be:reloadCollision). Returns immediately if the preference is off or if there is no level. | 234 |
| `editor_roadUtils.updateChildRoads(road)` | Deletes a road's child roads then recreates, according to its template, one child road per additional entry of template.roads (relative or absolute width, lateral offset horizPosRelative). The first entry of the template is pasted onto the road itself. | 172 |

### Parameter details

#### `editor_roadUtils.getMaterialNames()`

Returns the material names of the templates, in the same order as getMaterials.

- **returns**: string[] Material names.

#### `editor_roadUtils.getMaterials()`

Returns the list of textures (editor.texObj objects) of the materials of the templates loaded by reloadTemplates.

- **returns**: table Indexed array of ImGui textures.

#### `editor_roadUtils.getRoadTemplateFiles()`

Returns the paths of the *.road.json files found by the last reloadTemplates.

- **returns**: string[] File paths.

#### `editor_roadUtils.reloadDecals(road, template)`

Deletes the road's previous decals (decalIDs field) then recreates those defined by the template and stores their ids in the decalIDs dynamic field.

- `road` (*userdata*) : DecalRoad object.
- `template` (*table|nil*) : Template data already read; if nil, reread from the road's template field.

#### `editor_roadUtils.reloadDecorations(road)`

Deletes the road's old decorations (decorationIDs field) then recreates those of the template. Ignores child roads, roads without a template or with useTemplate different from "true".

- `road` (*userdata*) : DecalRoad object.

#### `editor_roadUtils.updateChildRoads(road)`

Deletes a road's child roads then recreates, according to its template, one child road per additional entry of template.roads (relative or absolute width, lateral offset horizPosRelative). The first entry of the template is pasted onto the road itself.

- `road` (*userdata*) : DecalRoad object carrying the template/useTemplate dynamic fields.

## Fields

| Field | Type | Description |
|---|---|---|
| `onEditorInitialized` | nil | Always nil: explicit assignment with no effect. |

## Calls into the engine (C++)

- `FS:` `findFiles`
- `be:` `reloadCollision`
- `scenetree.` `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/roadUtils.lua`.*
