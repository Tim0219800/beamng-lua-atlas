# `editor_api_navigation`

*File: `lua/ge/extensions/editor/api/navigation.lua` · VM: Game Engine (GE) · 59 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_api_navigation`: `extensions.load("editor_api_navigation")`, then the global `editor_api_navigation`

Editor API module intended to manage navigation meshes (NavMesh), off-mesh links and covers for AI. In 0.40.5 it is an empty shell: all the functions are `--TODO` with no body. `initialize` attaches them to the `editor` object (editor.createNavMesh, etc.).

## Notes

- All the functions installed on `editor` do nothing and return nil (body = TODO).
- The `navMeshInfo`, `linkInfo`, `coverInfo` parameters have no structure defined in the code.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_api_navigation.initialize(editorInstance)` | Remembers the editor instance and installs the nine navmesh/cover/offmeshlink functions on it (not implemented). *(internal)* | 43 |

### Parameter details

#### `editor_api_navigation.initialize(editorInstance)`

Remembers the editor instance and installs the nine navmesh/cover/offmeshlink functions on it (not implemented).

- `editorInstance` (*table*) : `editor` object on which to place the functions

## Class `editor`

Functions added to the `editor` object by `initialize`. All are empty stubs (TODO).

Object `editor` built inside the module (e.g. by `new`), with these methods:

| Method | Description | Line |
|---|---|---|
| `editor.createCover(coverInfo)` | Stub: should create a cover. | 23 |
| `editor.createNavMesh(navMeshInfo)` | Stub: should create a navmesh. | 7 |
| `editor.createOffMeshLink(navMeshObjectId, linkInfo)` | Stub: should create an off-mesh link. | 15 |
| `editor.deleteCover(coverObjectId)` | Stub: should delete a cover. | 27 |
| `editor.deleteNavMesh(navMeshObjectId)` | Stub: should delete a navmesh. | 11 |
| `editor.deleteOffMeshLink(linkId)` | Stub: should delete an off-mesh link. | 19 |
| `editor.getCovers(navMeshObjectId)` | Stub: should list the covers of a navmesh. | 35 |
| `editor.getNavMeshes()` | Stub: should list the navmeshes. | 31 |
| `editor.getOffMeshLinks()` | Stub: should list the off-mesh links. | 39 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/api/navigation.lua`.*
