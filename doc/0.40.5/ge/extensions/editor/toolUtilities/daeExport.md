# `editor_toolUtilities_daeExport`

*File: `lua/ge/extensions/editor/toolUtilities/daeExport.lua` · VM: Game Engine (GE) · 422 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_toolUtilities_daeExport`: `extensions.load("editor_toolUtilities_daeExport")`, then the global `editor_toolUtilities_daeExport`

COLLADA exporter (.dae 1.4.1) for the 'baked' kit pieces of the editor tools. Serializes meshParts ({ verts, normals, uvs, faces, material, tint? }) into documents that BeamNG's Torque loader reads as a static shape, to place them as TSStatic. Handles: simple shape, multi-material, and multi-LOD with collision mesh ('<gid>_p<i>_L<size>', 'Colmesh-1', 'nulldetail<size>' nodes under a base00/start01 hierarchy required by the importer). Shapes go either in the published root /assets/procedural_meshes/ or in the working root /assets/procedural_meshes_wip/ (filtered out of the build).

## Notes

- Files are written via writeFile (VFS path); the functions return the result of writeFile.
- prepDir EMPTIES the folder: it refuses (E log) any path that is not under procRoot or wipRoot, and also empties /temp<dir>. It acts only once per folder and per run (reset by beginBake).
- (ox,oy,oz) is a local origin subtracted from all vertices: place the TSStatic at this origin; avoids exceeding the engine's 2048 m range.
- If only one part has a tint, all parts are whitened (tint = {1,1,1}) to get consistent colors; writeDaeLODs and writeDaeParts both do this.
- Two consecutive identical LODs are merged (kept at the smallest size).
- In the RELEASED table (empty for now), outDir tests RELEASED[folder]: so RELEASED['kitName'] = true must be set; adding the name as a list element as the comment suggests would not work.
- The date written in <created>/<modified> is fixed (2020-01-01).

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_toolUtilities_daeExport.beginBake()` | Starts a bake run: the next prepDir of each folder empties it again. | 380 |
| `editor_toolUtilities_daeExport.lenTag(L)` | Converts a length into a label safe for file names/ids: 16.0 -> "16", 0.5 -> "0_5", 0.125 -> "0_125". | 33 |
| `editor_toolUtilities_daeExport.outDir(folder)` | Folder where a kit's baked shapes live: published root if RELEASED[folder] is true, otherwise working root. Takes the folder name alone. | 407 |
| `editor_toolUtilities_daeExport.prepDir(dir)` | Prepares an output folder: empties it if it exists, otherwise creates it, and empties its equivalent under /temp. Only once per folder and per run. Refuses (error log) a folder outside procRoot/wipRoot; no effect if FS is absent. | 390 |
| `editor_toolUtilities_daeExport.writeDae(path, part, matName, gid)` | Serializes `part` and writes it to the VFS path `path` as a simple static shape (one node, material linked by name). | 342 |
| `editor_toolUtilities_daeExport.writeDaeLODs(path, lods, colParts, gid, ox, oy, oz, nullSize)` | Writes a multi-LOD shape with collision. lods = { {size=S, parts={...}}, ... } by decreasing S (LOD0 = largest S); colParts = pieces of the collision mesh ('Colmesh-1' node); nullSize adds an empty node 'nulldetail<nullSize>' under which the shape disappears. | 365 |
| `editor_toolUtilities_daeExport.writeDaeParts(path, parts, gid, ox, oy, oz)` | Writes a list of parts (each with .material) into a single multi-material .dae (one effect/material/geometry/node per part). | 373 |

### Parameter details

#### `editor_toolUtilities_daeExport.lenTag(L)`

Converts a length into a label safe for file names/ids: 16.0 -> "16", 0.5 -> "0_5", 0.125 -> "0_125".

- `L` (*number*) : Length
- **returns**: string Label.

#### `editor_toolUtilities_daeExport.outDir(folder)`

Folder where a kit's baked shapes live: published root if RELEASED[folder] is true, otherwise working root. Takes the folder name alone.

- `folder` (*string*) : Kit folder name
- **returns**: string Path ending with '/'.

#### `editor_toolUtilities_daeExport.prepDir(dir)`

Prepares an output folder: empties it if it exists, otherwise creates it, and empties its equivalent under /temp. Only once per folder and per run. Refuses (error log) a folder outside procRoot/wipRoot; no effect if FS is absent.

- `dir` (*string*) : VFS folder under procRoot or wipRoot

#### `editor_toolUtilities_daeExport.writeDae(path, part, matName, gid)`

Serializes `part` and writes it to the VFS path `path` as a simple static shape (one node, material linked by name).

- `path` (*string*) : VFS path of the .dae
- `part` (*table*) : meshPart { verts, normals, uvs, faces, tint? }
- `matName` (*string*) : Name of the game material
- `gid` (*string*) : Geometry/node id (also the base name of the file)
- **returns**: boolean true on success.

#### `editor_toolUtilities_daeExport.writeDaeLODs(path, lods, colParts, gid, ox, oy, oz, nullSize)`

Writes a multi-LOD shape with collision. lods = { {size=S, parts={...}}, ... } by decreasing S (LOD0 = largest S); colParts = pieces of the collision mesh ('Colmesh-1' node); nullSize adds an empty node 'nulldetail<nullSize>' under which the shape disappears.

- `path` (*string*) : VFS path
- `lods` (*table*) : List { size, parts } decreasing
- `colParts` (*table|nil*) : Collision parts (without chamfer)
- `gid` (*string*) : Base id
- `ox` (*number|nil*) : Local origin x
- `oy` (*number|nil*) : Local origin y
- `oz` (*number|nil*) : Local origin z
- `nullSize` (*number|nil*) : Null detail size (nothing rendered below)
- **returns**: boolean true on success.

#### `editor_toolUtilities_daeExport.writeDaeParts(path, parts, gid, ox, oy, oz)`

Writes a list of parts (each with .material) into a single multi-material .dae (one effect/material/geometry/node per part).

- `path` (*string*) : VFS path
- `parts` (*table*) : List of meshParts with .material
- `gid` (*string*) : Base of the geometry/node ids
- `ox` (*number|nil*) : Local origin x subtracted from the vertices (default 0)
- `oy` (*number|nil*) : Local origin y
- `oz` (*number|nil*) : Local origin z
- **returns**: boolean true on success.

## Fields

| Field | Type | Description |
|---|---|---|
| `procRoot` | string | Published root of the generated shapes: '/assets/procedural_meshes/'. |
| `wipRoot` | string | Working root: '/assets/procedural_meshes_wip/' (excluded from the build). |

## Calls into the engine (C++)

- `FS:` `directoryCreate`, `directoryExists`, `findFiles`, `removeFile`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/toolUtilities/daeExport.lua`.*
