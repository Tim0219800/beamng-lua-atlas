---@meta
-- tim19Atlas stub generated from lua/ge/extensions/mcp/tools/scene.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- MCP tools for the scenetree: find objects (by class or name), inspect them like the editor inspector, modify their fields, delete them, serialize them, list objects visible in the camera's field of view and cast a raycast.
--- Access: extension `mcp_tools_scene`: `extensions.load("mcp_tools_scene")`, then the global `mcp_tools_scene`
---@class mcp_tools_scene
---@field schemas table<string, table> Schemas of the scene tools.
mcp_tools_scene = {}

--- Deletes an object from the scene (obj:deleteObject()).
---Source: lua/ge/extensions/mcp/tools/scene.lua:86
---@param args table {id?: integer, name?: string}
---@return string  Message.
---@return boolean  true if not found.
function mcp_tools_scene.delete_object(args) end

--- Finds objects by exact name or by class (with optional substring filter).
---Source: lua/ge/extensions/mcp/tools/scene.lua:20
---@param args table {class?: string, pattern?: string, name?: string}
---@return string  JSON {count, objects:[{id, name, class}]}.
---@return boolean  true if neither class nor name.
function mcp_tools_scene.find_objects(args) end

--- Inspects an object: id, name, class, non-empty static fields, dynamic fields, position.
---Source: lua/ge/extensions/mcp/tools/scene.lua:43
---@param args table {id?: integer, name?: string}
---@return string  JSON.
---@return boolean  true if not found.
function mcp_tools_scene.get_object(args) end

--- Casts a ray and returns the first hit.
---Source: lua/ge/extensions/mcp/tools/scene.lua:139
---@param args table|nil {from?: {x,y,z}, to?: {x,y,z}, dir?: {x,y,z}, length?: number m, includeTerrain?: boolean, renderGeometry?: boolean}
---@return string  JSON {hit=false, from, to} or {hit=true, pt, norm, …}.
---@return boolean  true if no origin.
function mcp_tools_scene.raycast(args) end

--- Serializes the object as JSON/text as in a level or prefab file (obj:serialize).
---Source: lua/ge/extensions/mcp/tools/scene.lua:95
---@param args table {id?|name?, pretty?: boolean (default true)}
---@return string  Serialized text.
---@return boolean  true if not found.
function mcp_tools_scene.serialize_object(args) end

--- Writes one or more fields of an object then calls postApply.
---Source: lua/ge/extensions/mcp/tools/scene.lua:70
---@param args table {id?|name?, field?: string, value?: any, fields?: table<string, any>, index?: string (default '0')}
---@return string  Summary message.
---@return boolean  true on error.
function mcp_tools_scene.set_object_field(args) end

--- Lists the objects in the camera's field of view, sorted by distance.
---Source: lua/ge/extensions/mcp/tools/scene.lua:113
---@param args table|nil {class?: string, mask?: integer, maxDist?: number m}
---@return string  JSON {count, objects:[{id, name, class, dist, pos, jbeam?}]}.
---@return boolean  true if sceneGetVisibleObjectIds is absent.
function mcp_tools_scene.view_objects(args) end

