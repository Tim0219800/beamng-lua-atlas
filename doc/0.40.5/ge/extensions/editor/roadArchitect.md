# `editor_roadArchitect`

*File: `lua/ge/extensions/editor/roadArchitect.lua` · VM: Game Engine (GE) · 8144 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_roadArchitect`: `extensions.load("editor_roadArchitect")`, then the global `editor_roadArchitect`

Main window of the world editor's Road Architect editor: a tool for creating roads, profiles, prefab groups, junctions (including auto-junction), terraforming, OpenDRIVE (.xodr) import/export and conversion of DecalRoads to Road Architect roads. This file is mostly the ImGui interface and orchestration; the logic is delegated to the editor/roadArchitect/* modules (roads, profiles, groups, junctions, link, render, terraform, staticMeshMgr, utilities, openDriveImport, openDriveExport). It is only useful to a modder for understanding the lifecycle (edit mode registration, session serialization) or by opening the editor.

## Notes

- The module only exports 4 hooks (onEditorGui, onEditorInitialized, onSerialize, onDeserialized); all the logic is in local variables, not accessible from outside.
- The registered edit mode is called editor.editModes.roadArchitectEditMode (displayed name "Road Architect").
- onEditorGui does nothing as long as the mode is not active (isRoadArchitectActive).
- Serialization (extension/Lua reload) goes through the temporary file temp/roadArchitect.json; onSerialize only returns { d = { name = 'roadArchitectSerializationData' } } and the real data is in the file.
- onSerialize removes all roads, meshes and decals from the scene (roadMgr.unfinalise if finalized, then roadMgr.removeAll); onDeserialized rebuilds the data but reads the file without an existence check (jsonReadFile(...).data would crash if the file is missing).

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_roadArchitect.onDeserialized()` | Reads temp/roadArchitect.json back after a Lua reload and rebuilds profiles (first), roads, groups, junctions and the placed groups list; updates the road conditions, recomputes the render data and the lane flags of the selected road's profile. *(internal)* *(hook)* | 8073 |
| `editor_roadArchitect.onEditorGui()` | Editor render callback, called every frame by the world editor. Returns immediately if Road Architect is not active; otherwise reads the mouse state (position projected onto the map, left/right clicks, double-click) and draws the tool's ImGui windows and visual aids. *(internal)* *(hook)* | 7697 |
| `editor_roadArchitect.onEditorInitialized()` | Called when the world editor initializes. Registers the roadArchitectEditMode edit mode (autobahn icon), adds the "Convert to Road Architect" entry to the scene tree context menu, registers the tool's windows (main, materials, meshes, nodes, profiles, groups, import), fetches the terrain, and clears the roads/junctions if the level has changed since the last session. *(internal)* *(hook)* | 7947 |
| `editor_roadArchitect.onSerialize()` | Serializes the session (roads, profiles, groups, junctions, placed groups) to temp/roadArchitect.json before a Lua reload. First closes the profile/group list windows and the mesh selection window if open, then removes roads, meshes and decals from the scene. *(internal)* *(hook)* | 7993 |

### Parameter details

#### `editor_roadArchitect.onSerialize()`

Serializes the session (roads, profiles, groups, junctions, placed groups) to temp/roadArchitect.json before a Lua reload. First closes the profile/group list windows and the mesh selection window if open, then removes roads, meshes and decals from the scene.

- **returns**: table { d = { name = 'roadArchitectSerializationData' } } ; the data itself is written to the temporary file.

## Calls into the engine (C++)

- `Sim.` `getMaterialSet`
- `be:` `reloadCollision`
- `obj:` `getField`, `getName`
- `scenetree.` `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/roadArchitect.lua`.*
