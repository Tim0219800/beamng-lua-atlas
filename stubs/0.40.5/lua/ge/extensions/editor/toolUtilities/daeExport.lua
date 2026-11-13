---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/daeExport.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_toolUtilities_daeExport` : `extensions.load("editor_toolUtilities_daeExport")`, puis la globale `editor_toolUtilities_daeExport`
---@class editor_toolUtilities_daeExport
---@field procRoot string
---@field wipRoot string
editor_toolUtilities_daeExport = {}

--- Start a bake run, so the next prepDir on each folder empties it again.
---Source : lua/ge/extensions/editor/toolUtilities/daeExport.lua:380
function editor_toolUtilities_daeExport.beginBake() end

--- Length -> filesystem/id-safe tag: 16.0 -> "16", 0.5 -> "0_5", 0.125 -> "0_125".
---Source : lua/ge/extensions/editor/toolUtilities/daeExport.lua:33
---@param L any
function editor_toolUtilities_daeExport.lenTag(L) end

--- Where one kit's baked shapes live, released root or working root. Takes the folder name alone.
---Source : lua/ge/extensions/editor/toolUtilities/daeExport.lua:407
---@param folder any
function editor_toolUtilities_daeExport.outDir(folder) end

---Source : lua/ge/extensions/editor/toolUtilities/daeExport.lua:390
---@param dir any
function editor_toolUtilities_daeExport.prepDir(dir) end

--- Serialize `part` and write it to the VFS `path` as a plain static shape. Returns true on success.
---Source : lua/ge/extensions/editor/toolUtilities/daeExport.lua:342
---@param path any
---@param part any
---@param matName any
---@param gid any
function editor_toolUtilities_daeExport.writeDae(path, part, matName, gid) end

--- Serialize a multi-LOD + collision shape (see colladaDocLODs) and write it to the VFS `path`. Returns true on success.
---Source : lua/ge/extensions/editor/toolUtilities/daeExport.lua:365
---@param path any
---@param lods any
---@param colParts any
---@param gid any
---@param ox any
---@param oy any
---@param oz any
---@param nullSize any
function editor_toolUtilities_daeExport.writeDaeLODs(path, lods, colParts, gid, ox, oy, oz, nullSize) end

--- Serialize a list of material `parts` (each with .material) and write them to the VFS `path` as one multi-material static
---  shape. gid is the geometry/node id base. (ox,oy,oz) (optional) is a local origin subtracted from every vertex so the shape
---  stays near its own origin (place the TSStatic at that origin). Returns true on success.
---Source : lua/ge/extensions/editor/toolUtilities/daeExport.lua:373
---@param path any
---@param parts any
---@param gid any
---@param ox any
---@param oy any
---@param oz any
function editor_toolUtilities_daeExport.writeDaeParts(path, parts, gid, ox, oy, oz) end

