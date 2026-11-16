# `editor_decalSpline_populate`

*File: `lua/ge/extensions/editor/decalSpline/populate.lua` · VM: Game Engine (GE) · 379 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_decalSpline_populate`: `extensions.load("editor_decalSpline_populate")`, then the global `editor_decalSpline_populate`

Module that populates a spline with decal instances (DecalData + engine instances) along its length, for the Decal Spline tool. It samples the spline by arc length with a step of (4.0 m decal length + spline.spacing), distributes the components (materials) alternately or randomly according to their probability, orients each decal with the Frenet frame, Z jitter and pre-rotation, and places it in the middle of its cell. It maintains the shared DecalData templates in a "DecalSpline - Templates ..." SimGroup under MissionGroup, with instance counters to delete a template that has become unused.

## Notes

- Assumed length of a decal: 4.0 m (decalLength constant). Decals are centered quads.
- The templates are registered with scenetree.decalPersistMan (file editor.getDecalDataFilePath()) to be saved.
- Instances are created with editor.addDecalInstanceWithTan(position, up, tangent, template, scale, frame, 3, 1).
- If the templates folder no longer exists, populateDecalSpline recreates it and first clears the decals of all splines passed in splines, then resets the internal tables.
- A spline with fewer than 2 divPoints is not populated.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_decalSpline_populate.adopt(spline, kept)` | Takes back the decals released by release() that are still present in the scene (found by uid via Engine.Render.DecalMgr), with their templates and their folder, and restores the counters. | 291 |
| `editor_decalSpline_populate.hasAny(spline)` | Indicates whether the tool holds decals for this spline. | 265 |
| `editor_decalSpline_populate.populateDecalSpline(spline, splines)` | Creates the decal instances along the spline, creating the DecalData templates as needed (texRows, texCols, material). | 171 |
| `editor_decalSpline_populate.propagateRowsCols(spline, componentIdx)` | When rows/columns (numRows/numCols) change for a component, copies these values to the other components that use the same material and clamps their frame to numRows*numCols-1. | 313 |
| `editor_decalSpline_populate.release(spline)` | For a Lua reload: lets go of the decals of a locked spline without deleting them and returns their uids by material, with the templates used and the folder id, so that adopt() can take them back. Their templates stay counted. | 275 |
| `editor_decalSpline_populate.removeFolder()` | Deletes the folder (SimGroup) of the shared templates, unless decals kept by a locked spline during a Lua reload still use it. | 160 |
| `editor_decalSpline_populate.tryRemove(spline)` | Removes the spline's decal instances from the scene (editor.deleteDecalInstance), decrements the counters then deletes the templates whose counter drops below 1. | 129 |

### Parameter details

#### `editor_decalSpline_populate.adopt(spline, kept)`

Takes back the decals released by release() that are still present in the scene (found by uid via Engine.Render.DecalMgr), with their templates and their folder, and restores the counters.

- `spline` (*table*) : spline taking back its decals
- `kept` (*table*) : table returned by release()

#### `editor_decalSpline_populate.hasAny(spline)`

Indicates whether the tool holds decals for this spline.

- `spline` (*table*) : spline tested
- **returns**: boolean true if at least one instance exists

#### `editor_decalSpline_populate.populateDecalSpline(spline, splines)`

Creates the decal instances along the spline, creating the DecalData templates as needed (texRows, texCols, material).

- `spline` (*table*) : decal spline (divPoints, tangents, normals, spacing, jitter, components 1 to 4...)
- `splines` (*table[]*) : all splines, cleaned if the templates folder must be recreated

#### `editor_decalSpline_populate.propagateRowsCols(spline, componentIdx)`

When rows/columns (numRows/numCols) change for a component, copies these values to the other components that use the same material and clamps their frame to numRows*numCols-1.

- `spline` (*table*) : modified spline
- `componentIdx` (*integer*) : number of the modified component, from 1 to 4

#### `editor_decalSpline_populate.release(spline)`

For a Lua reload: lets go of the decals of a locked spline without deleting them and returns their uids by material, with the templates used and the folder id, so that adopt() can take them back. Their templates stay counted.

- `spline` (*table*) : locked spline
- **returns**: table {folderId, uids = {material = uid[]}, templates = {material = id}}

#### `editor_decalSpline_populate.tryRemove(spline)`

Removes the spline's decal instances from the scene (editor.deleteDecalInstance), decrements the counters then deletes the templates whose counter drops below 1.

- `spline` (*table*) : spline whose decals are removed

## Calls into the engine (C++)

- `Engine.` `generateUUID`
- `Sim.` `getUniqueName`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/decalSpline/populate.lua`.*
