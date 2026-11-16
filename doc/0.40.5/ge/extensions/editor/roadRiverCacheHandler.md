# `editor_roadRiverCacheHandler`

*File: `lua/ge/extensions/editor/roadRiverCacheHandler.lua` · VM: Game Engine (GE) · 26 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_roadRiverCacheHandler`: `extensions.load("editor_roadRiverCacheHandler")`, then the global `editor_roadRiverCacheHandler`

Small editor manager that maintains the DecalRoad vertex cache: it initializes it for all the level's DecalRoads when the editor starts, and updates it when a prefab is "exploded" (unpacked) in the scene. No function is meant to be called by a modder.

## Notes

- Calls editor.initializeLevelRoadsVertices() and editor.updateRoadVertices(object), functions provided by the editor (C++/Lua).

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_roadRiverCacheHandler.onEditorInitialized()` | Hook called when the editor initializes: initializes the vertices of all the level's roads (editor.initializeLevelRoadsVertices). *(internal)* *(hook)* | 18 |
| `editor_roadRiverCacheHandler.onEditorPrefabExploded(groups)` | Hook called when one or more prefabs are exploded in the editor. For each object of each group, if it is a DecalRoad, recomputes its vertices with editor.updateRoadVertices. *(internal)* *(hook)* | 7 |

### Parameter details

#### `editor_roadRiverCacheHandler.onEditorPrefabExploded(groups)`

Hook called when one or more prefabs are exploded in the editor. For each object of each group, if it is a DecalRoad, recomputes its vertices with editor.updateRoadVertices.

- `groups` (*table*) : List of groups (SimGroup) coming from the prefab; each group exposes getObjects() (inferred from code).

## Calls into the engine (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/roadRiverCacheHandler.lua`.*
