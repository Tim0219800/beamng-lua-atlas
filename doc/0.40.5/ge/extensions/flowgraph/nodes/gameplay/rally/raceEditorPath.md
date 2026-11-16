# `flowgraph_nodes_gameplay_rally_raceEditorPath`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/rally/raceEditorPath.lua` · VM: Game Engine (GE) · 64 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/rally/raceEditorPath")` (file under extensions/ but not a regular extension)

Flowgraph node "Rally Mode Race Editor Path" (category once_instant, tag rally). Returns the race file name to use in the fname pin: 'race.race.json' (source "Mission") if a Mission Manager mission identifier is detected, otherwise the file opened in editor_raceEditor (source "Editor") if it is not a blank file (/gameplay/races/new.path.json or NewRace.race.json). In the editor, displays the source and the file.

## Notes

- If editor_raceEditor exists but the opened file is blank, loadCurrentRaceFileState returns nothing (nil); fname is then nil.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:drawCustomProperties()` | Displays the race file and its source in the properties panel. | 50 |
| `C:drawMiddle(builder, style)` | Displays "Source: ..." in the node body. | 44 |
| `C:workOnce()` | Determines the race file, logs it (level D) and writes it to the fname pin. | 57 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/rally/raceEditorPath.lua`.*
