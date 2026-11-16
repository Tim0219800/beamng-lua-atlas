---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/daeExport.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- COLLADA exporter (.dae 1.4.1) for the 'baked' kit pieces of the editor tools. Serializes meshParts ({ verts, normals, uvs, faces, material, tint? }) into documents that BeamNG's Torque loader reads as a static shape, to place them as TSStatic. Handles: simple shape, multi-material, and multi-LOD with collision mesh ('<gid>_p<i>_L<size>', 'Colmesh-1', 'nulldetail<size>' nodes under a base00/start01 hierarchy required by the importer). Shapes go either in the published root /assets/procedural_meshes/ or in the working root /assets/procedural_meshes_wip/ (filtered out of the build).
--- Access: extension `editor_toolUtilities_daeExport`: `extensions.load("editor_toolUtilities_daeExport")`, then the global `editor_toolUtilities_daeExport`
---@class editor_toolUtilities_daeExport
---@field procRoot string Published root of the generated shapes: '/assets/procedural_meshes/'.
---@field wipRoot string Working root: '/assets/procedural_meshes_wip/' (excluded from the build).
editor_toolUtilities_daeExport = {}

--- Starts a bake run: the next prepDir of each folder empties it again.
---Source: lua/ge/extensions/editor/toolUtilities/daeExport.lua:380
function editor_toolUtilities_daeExport.beginBake() end

--- Converts a length into a label safe for file names/ids: 16.0 -> "16", 0.5 -> "0_5", 0.125 -> "0_125".
---Source: lua/ge/extensions/editor/toolUtilities/daeExport.lua:33
---@param L number Length
---@return string  Label.
function editor_toolUtilities_daeExport.lenTag(L) end

--- Folder where a kit's baked shapes live: published root if RELEASED[folder] is true, otherwise working root. Takes the folder name alone.
---Source: lua/ge/extensions/editor/toolUtilities/daeExport.lua:407
---@param folder string Kit folder name
---@return string  Path ending with '/'.
function editor_toolUtilities_daeExport.outDir(folder) end

--- Prepares an output folder: empties it if it exists, otherwise creates it, and empties its equivalent under /temp. Only once per folder and per run. Refuses (error log) a folder outside procRoot/wipRoot; no effect if FS is absent.
---Source: lua/ge/extensions/editor/toolUtilities/daeExport.lua:390
---@param dir string VFS folder under procRoot or wipRoot
function editor_toolUtilities_daeExport.prepDir(dir) end

--- Serializes `part` and writes it to the VFS path `path` as a simple static shape (one node, material linked by name).
---Source: lua/ge/extensions/editor/toolUtilities/daeExport.lua:342
---@param path string VFS path of the .dae
---@param part table meshPart { verts, normals, uvs, faces, tint? }
---@param matName string Name of the game material
---@param gid string Geometry/node id (also the base name of the file)
---@return boolean  true on success.
function editor_toolUtilities_daeExport.writeDae(path, part, matName, gid) end

--- Writes a multi-LOD shape with collision. lods = { {size=S, parts={...}}, ... } by decreasing S (LOD0 = largest S); colParts = pieces of the collision mesh ('Colmesh-1' node); nullSize adds an empty node 'nulldetail<nullSize>' under which the shape disappears.
---Source: lua/ge/extensions/editor/toolUtilities/daeExport.lua:365
---@param path string VFS path
---@param lods table List { size, parts } decreasing
---@param colParts table|nil Collision parts (without chamfer)
---@param gid string Base id
---@param ox number|nil Local origin x
---@param oy number|nil Local origin y
---@param oz number|nil Local origin z
---@param nullSize number|nil Null detail size (nothing rendered below)
---@return boolean  true on success.
function editor_toolUtilities_daeExport.writeDaeLODs(path, lods, colParts, gid, ox, oy, oz, nullSize) end

--- Writes a list of parts (each with .material) into a single multi-material .dae (one effect/material/geometry/node per part).
---Source: lua/ge/extensions/editor/toolUtilities/daeExport.lua:373
---@param path string VFS path
---@param parts table List of meshParts with .material
---@param gid string Base of the geometry/node ids
---@param ox number|nil Local origin x subtracted from the vertices (default 0)
---@param oy number|nil Local origin y
---@param oz number|nil Local origin z
---@return boolean  true on success.
function editor_toolUtilities_daeExport.writeDaeParts(path, parts, gid, ox, oy, oz) end

