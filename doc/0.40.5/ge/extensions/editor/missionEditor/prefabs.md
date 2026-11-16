# `editor_missionEditor_prefabs`

*File: `lua/ge/extensions/editor/missionEditor/prefabs.lua` · VM: Game Engine (GE) · 101 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/editor/missionEditor/prefabs")` (file under extensions/ but not a regular extension)

"Prefabs" panel of the mission editor. It edits the mission.prefabs list (paths of .prefab / .prefab.json files) and the boolean prefabsRequireCollisionReload. Each row has a path field, a file picker, an existence indicator (FS:fileExists) and a "Spawn" button that instantiates the prefab in MissionGroup. The module returns a constructor: require(...)(missionEditor).

## Notes

- Spawn: spawnPrefab(unique name, file, "0 0 0", "0 0 1 0", "1 1 1"), loadMode = 0, added to scenetree.MissionGroup then selected in the editor.
- A new prefab added by "Add" is "/" until it is edited.
- The delete button uses originalPrefabName in its imgui id; the self.filenames list is parallel to mission.prefabs.

## Class `C`

Instance of the panel. Fields: missionEditor, mission, filenames (imgui buffers), prefabsRequireCollisionReload.

The module returns a constructor: `local obj = require("editor_missionEditor_prefabs")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:draw()` | Draws the prefabs list (deletion, path, picker, status, spawn), the "Add" button and the "Requires collision reload" checkbox. | 22 |
| `C:init(missionEditor)` | Constructor. | 7 |
| `C:setMission(mission)` | Sets the mission and recreates the text buffers from mission.prefabs. | 13 |

## Calls into the engine (C++)

- `FS:` `fileExists`
- `Sim.` `getUniqueName`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/missionEditor/prefabs.lua`.*
