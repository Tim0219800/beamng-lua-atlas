# `editor_toolUtilities_meshStats`

*File: `lua/ge/extensions/editor/toolUtilities/meshStats.lua` · VM: Game Engine (GE) · 154 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_toolUtilities_meshStats`: `extensions.load("editor_toolUtilities_meshStats")`, then the global `editor_toolUtilities_meshStats`

Mesh weight diagnostic during an import (the editor's city/network importer). Distinguishes UNIQUE geometry (ProceduralMesh: buildings, bridge or tunnel decks, gantries, each with its own buffer and its own collision build) from INSTANCED geometry (TSStatics grouped by shape, Forest items). Generators call recordMesh during construction; the importer calls begin() at the start and report() at the end, which logs a summary per family.

## Example

```lua
local ms = require('editor/toolUtilities/meshStats')
ms.begin()
ms.recordMesh('bld_12', 'building', nVerts, nTris)
ms.recordParts('bridge.deck', nVerts, nTris)
ms.report('import')
```

## Notes

- Collection is active only between begin() and report(): outside this window, recordMesh and recordParts have no effect, so normal editing does not touch the counters.
- report() re-checks each recorded name in the scene (scenetree.findObject): a mesh renamed or deleted during the import is not counted; it also enumerates all TSStatics (grouped by shapeName file), the Forest's items and the WaterBlock/WaterPlane objects.
- The outputs are level I log lines prefixed '[mesh]' (per family: meshes, triangles, vertices; breakdown of merged parts; instanced props; HEADLINE line).

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_toolUtilities_meshStats.begin()` | Starts a collection window: enables collection and clears previous records. | 27 |
| `editor_toolUtilities_meshStats.recordMesh(name, family, nVerts, nTris)` | Records a ProceduralMesh by its NAME in the scene tree (a rebuild under the same name overwrites the entry). No effect outside collection or if name is nil. | 35 |
| `editor_toolUtilities_meshStats.recordParts(category, nVerts, nTris)` | Records the geometry of ONE part of a mesh merged by structural category (bridge.deck, tunnel.floor, tunnel.shell). Additive: values add up. It is a breakdown of the mesh totals, not a duplicate. | 43 |
| `editor_toolUtilities_meshStats.report(tag)` | Aggregates everything and logs the summary, then ends the collection window. Without an active collection, logs '[mesh] no active mesh-stats session' and returns. | 72 |

### Parameter details

#### `editor_toolUtilities_meshStats.recordMesh(name, family, nVerts, nTris)`

Records a ProceduralMesh by its NAME in the scene tree (a rebuild under the same name overwrites the entry). No effect outside collection or if name is nil.

- `name` (*string*) : Name of the object in the scene.
- `family` (*string|nil*) : Family for the summary (default 'other').
- `nVerts` (*integer|nil*) : Number of vertices (default 0).
- `nTris` (*integer|nil*) : Number of triangles (default 0).

#### `editor_toolUtilities_meshStats.recordParts(category, nVerts, nTris)`

Records the geometry of ONE part of a mesh merged by structural category (bridge.deck, tunnel.floor, tunnel.shell). Additive: values add up. It is a breakdown of the mesh totals, not a duplicate.

- `category` (*string*) : Category of the part.
- `nVerts` (*integer|nil*) : Vertices to add.
- `nTris` (*integer|nil*) : Triangles to add.

#### `editor_toolUtilities_meshStats.report(tag)`

Aggregates everything and logs the summary, then ends the collection window. Without an active collection, logs '[mesh] no active mesh-stats session' and returns.

- `tag` (*string|nil*) : Log tag; default 'meshStats'.

## Calls into the engine (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/toolUtilities/meshStats.lua`.*
