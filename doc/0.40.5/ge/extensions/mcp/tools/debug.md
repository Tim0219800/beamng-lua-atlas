# `mcp_tools_debug`

*File: `lua/ge/extensions/mcp/tools/debug.lua` · VM: Game Engine (GE) · 91 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `mcp_tools_debug`: `extensions.load("mcp_tools_debug")`, then the global `mcp_tools_debug`

MCP tools for debug drawing in the world: persistent spheres, lines and texts, redrawn every frame with debugDrawer until cleared or expired (ttl). Used to flag a position or a problem in the scene. Module loaded by mcp_tools.

## Notes

- Shapes are drawn in onPreRender; the ttl uses os.clockhp (real seconds).
- Default color red {1,0,0,1}; components 0..1, accepted as {r,g,b,a} or array {r,g,b,a}. Positions accepted as {x,y,z} or {x,y,z} indexed [1..3].
- If kind is omitted, it is a line when 'from' is given, otherwise a sphere.

## Functions

| Function | Description | Line |
|---|---|---|
| `mcp_tools_debug.debug_clear(args)` | Clears a shape by id, or all of them if no id is given. | 62 |
| `mcp_tools_debug.debug_draw(args)` | Adds or replaces a persistent debug shape and returns its id (auto-generated "sN" if not provided). | 41 |
| `mcp_tools_debug.onPreRender(dtReal)` | Called before each render: removes expired shapes and draws the others (line, text or sphere, with optional label). *(internal)* *(hook)* | 32 |

### Parameter details

#### `mcp_tools_debug.debug_clear(args)`

Clears a shape by id, or all of them if no id is given.

- `args` (*table|nil*) : {id?: string}
- **returns**: string Confirmation.
- **returns**: boolean always false.

#### `mcp_tools_debug.debug_draw(args)`

Adds or replaces a persistent debug shape and returns its id (auto-generated "sN" if not provided).

- `args` (*table*) : {kind?: 'sphere'|'line'|'text', pos?: {x,y,z}, from?: {x,y,z}, to?: {x,y,z}, radius?: number m (default 0.5), label?|text?: string, color?: {r,g,b,a}, ttl?: number s (0/absent = permanent), id?: string}. line requires from+to; sphere/text require pos; text requires a label.
- **returns**: string Shape id, or error message.
- **returns**: boolean true on error.

#### `mcp_tools_debug.onPreRender(dtReal)`

Called before each render: removes expired shapes and draws the others (line, text or sphere, with optional label).

- `dtReal` (*number*) : Real duration (s), unused.

## Fields

| Field | Type | Description |
|---|---|---|
| `schemas` | table<string, table> | Schemas of debug_draw and debug_clear. |

## Calls into the engine (C++)

- `debugDrawer:` `drawLine`, `drawSphere`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/mcp/tools/debug.lua`.*
