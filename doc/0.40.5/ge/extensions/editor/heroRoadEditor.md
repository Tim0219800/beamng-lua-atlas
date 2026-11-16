# `editor_heroRoadEditor`

*File: `lua/ge/extensions/editor/heroRoadEditor.lua` · VM: Game Engine (GE) · 2905 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_heroRoadEditor`: `extensions.load("editor_heroRoadEditor")`, then the global `editor_heroRoadEditor`

"Hero Road" editor: creation and editing of roads by splines (road groups with nodes, profiles, layers, mesh, sidewalks, barriers, lighting and placed objects, terraforming, painting, export). The associated modules are in editor/heroRoadEditor/ (groupMgr, layerMgr, profile, mesh, exportMgr, sidewalkMgr, barrierMgr, placeablesUI, import) and editor/toolUtilities/. It registers the "Hero Road" edit mode and a scene tree context menu "Convert to Hero Road" to import selected DecalRoads. The roads' state survives a Lua reload via onSerialize/onDeserialized.

## Notes

- The displayName of the edit mode ("Hero Road") must equal groupMgr.getToolPrefixStr(): splineInput recognizes a node's owner by comparing bestHit.toolName to editor.editMode.displayName; otherwise the tool reactivates on every click.
- Hardcoded constants: default spline width 10 m, RDP simplification tolerance 9.0, layer edge offset from -5 to 5 m.
- The setters setSelectedSplineIdx/setSelectedNodeIdx have no bounds checking: they write the index directly.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_heroRoadEditor.onClientEndMission()` | Hook called when leaving the map: deletes all road groups and recomputes the id to index table. *(internal)* *(hook)* | 2888 |
| `editor_heroRoadEditor.onDeserialized(data)` | Deserialization hook after Lua reload: recreates the road groups from the data and recomputes the id to index table. Accepts the old format (bare array of groups). *(internal)* *(hook)* | 270 |
| `editor_heroRoadEditor.onEditorGui()` | Hook called every frame by the editor: the tool's main callback. Handles hiding during drags (node, crosswalk, corner handle, "live" cursor), rebuilding of modified groups, rendering of the splines and the tool window. *(internal)* *(hook)* | 2618 |
| `editor_heroRoadEditor.onEditorInitialized()` | Hook called at editor initialization: registers the "Hero Road" edit mode, the tool window, the material selection window and the "Convert to Hero Road" scene tree menu entry. *(internal)* *(hook)* | 2862 |
| `editor_heroRoadEditor.onSerialize()` | Hook called before a Lua reload: serializes all road groups, then deletes them (removeAllGroups). *(internal)* *(hook)* | 258 |
| `editor_heroRoadEditor.setSelectedNodeIdx(idx)` | Sets the index of the selected node (selection shared between tools). | 233 |
| `editor_heroRoadEditor.setSelectedSplineIdx(idx)` | Sets the index of the selected spline (road group) (selection shared between tools). | 230 |

### Parameter details

#### `editor_heroRoadEditor.onDeserialized(data)`

Deserialization hook after Lua reload: recreates the road groups from the data and recomputes the id to index table. Accepts the old format (bare array of groups).

- `data` (*table*) : Table {groups = {...}} returned by onSerialize, or old array of groups

#### `editor_heroRoadEditor.onSerialize()`

Hook called before a Lua reload: serializes all road groups, then deletes them (removeAllGroups).

- **returns**: table {groups = <serialized groups>}

#### `editor_heroRoadEditor.setSelectedNodeIdx(idx)`

Sets the index of the selected node (selection shared between tools).

- `idx` (*integer|nil*) : Index of the node in the selected spline

#### `editor_heroRoadEditor.setSelectedSplineIdx(idx)`

Sets the index of the selected spline (road group) (selection shared between tools).

- `idx` (*integer|nil*) : Index of the group in the group list

## Calls into the engine (C++)

- `be:` `reloadCollision`
- `obj:` `getClassName`
- `scenetree.` `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/heroRoadEditor.lua`.*
