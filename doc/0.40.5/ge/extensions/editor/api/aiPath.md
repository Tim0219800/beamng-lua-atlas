# `editor_api_aiPath`

*File: `lua/ge/extensions/editor/api/aiPath.lua` · VM: Game Engine (GE) · 15 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_api_aiPath`: `extensions.load("editor_api_aiPath")`, then the global `editor_api_aiPath`

Editor API module "aiPath": empty shell. It only stores the editor instance received at initialization and defines no other function in this version.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_api_aiPath.initialize(editorInstance)` | Called by the editor when loading the API modules: stores the editor instance (local variable); does nothing else. *(internal)* | 8 |

### Parameter details

#### `editor_api_aiPath.initialize(editorInstance)`

Called by the editor when loading the API modules: stores the editor instance (local variable); does nothing else.

- `editorInstance` (*table*) : Editor instance.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/api/aiPath.lua`.*
