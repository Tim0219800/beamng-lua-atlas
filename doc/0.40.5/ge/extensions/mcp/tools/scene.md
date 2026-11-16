# `mcp_tools_scene`

*File: `lua/ge/extensions/mcp/tools/scene.lua` · VM: Game Engine (GE) · 226 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `mcp_tools_scene`: `extensions.load("mcp_tools_scene")`, then the global `mcp_tools_scene`

MCP tools for the scenetree: find objects (by class or name), inspect them like the editor inspector, modify their fields, delete them, serialize them, list objects visible in the camera's field of view and cast a raycast.

## Notes

- set_object_field converts all values to strings (setField) then calls postApply; a position is written '1 2 3'. delete_object is permanent for the session.
- find_objects returns at most 500 objects; view_objects too (sorted by distance, maxDist default 1000 m).
- view_objects: class accepts a keyword (vehicles default, static, item, player, terrain, water) or an exact class name; a raw `mask` takes precedence. Uses sceneGetVisibleObjectIds (C++ frustum query).
- raycast: by default from the camera in its direction, length 1000; includeTerrain true by default, renderGeometry false; returns pt, norm and the scalar fields of the castRay result.

## Functions

| Function | Description | Line |
|---|---|---|
| `mcp_tools_scene.delete_object(args)` | Deletes an object from the scene (obj:deleteObject()). | 86 |
| `mcp_tools_scene.find_objects(args)` | Finds objects by exact name or by class (with optional substring filter). | 20 |
| `mcp_tools_scene.get_object(args)` | Inspects an object: id, name, class, non-empty static fields, dynamic fields, position. | 43 |
| `mcp_tools_scene.raycast(args)` | Casts a ray and returns the first hit. | 139 |
| `mcp_tools_scene.serialize_object(args)` | Serializes the object as JSON/text as in a level or prefab file (obj:serialize). | 95 |
| `mcp_tools_scene.set_object_field(args)` | Writes one or more fields of an object then calls postApply. | 70 |
| `mcp_tools_scene.view_objects(args)` | Lists the objects in the camera's field of view, sorted by distance. | 113 |

### Parameter details

#### `mcp_tools_scene.delete_object(args)`

Deletes an object from the scene (obj:deleteObject()).

- `args` (*table*) : {id?: integer, name?: string}
- **returns**: string Message.
- **returns**: boolean true if not found.

#### `mcp_tools_scene.find_objects(args)`

Finds objects by exact name or by class (with optional substring filter).

- `args` (*table*) : {class?: string, pattern?: string, name?: string}
- **returns**: string JSON {count, objects:[{id, name, class}]}.
- **returns**: boolean true if neither class nor name.

#### `mcp_tools_scene.get_object(args)`

Inspects an object: id, name, class, non-empty static fields, dynamic fields, position.

- `args` (*table*) : {id?: integer, name?: string}
- **returns**: string JSON.
- **returns**: boolean true if not found.

#### `mcp_tools_scene.raycast(args)`

Casts a ray and returns the first hit.

- `args` (*table|nil*) : {from?: {x,y,z}, to?: {x,y,z}, dir?: {x,y,z}, length?: number m, includeTerrain?: boolean, renderGeometry?: boolean}
- **returns**: string JSON {hit=false, from, to} or {hit=true, pt, norm, …}.
- **returns**: boolean true if no origin.

#### `mcp_tools_scene.serialize_object(args)`

Serializes the object as JSON/text as in a level or prefab file (obj:serialize).

- `args` (*table*) : {id?|name?, pretty?: boolean (default true)}
- **returns**: string Serialized text.
- **returns**: boolean true if not found.

#### `mcp_tools_scene.set_object_field(args)`

Writes one or more fields of an object then calls postApply.

- `args` (*table*) : {id?|name?, field?: string, value?: any, fields?: table<string, any>, index?: string (default '0')}
- **returns**: string Summary message.
- **returns**: boolean true on error.

#### `mcp_tools_scene.view_objects(args)`

Lists the objects in the camera's field of view, sorted by distance.

- `args` (*table|nil*) : {class?: string, mask?: integer, maxDist?: number m}
- **returns**: string JSON {count, objects:[{id, name, class, dist, pos, jbeam?}]}.
- **returns**: boolean true if sceneGetVisibleObjectIds is absent.

## Fields

| Field | Type | Description |
|---|---|---|
| `schemas` | table<string, table> | Schemas of the scene tools. |

## Calls into the engine (C++)

- `obj:` `deleteObject`, `getClassName`, `getDynamicFields`, `getField`, `getFields`, `getID`, `getName`, `getPosition`, `postApply`, `serialize`, `setField`
- `scenetree.` `findClassObjects`, `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/mcp/tools/scene.lua`.*
