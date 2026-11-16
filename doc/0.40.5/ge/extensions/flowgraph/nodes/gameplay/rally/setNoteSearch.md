# `flowgraph_nodes_gameplay_rally_setNoteSearch`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/rally/setNoteSearch.lua` · VM: Game Engine (GE) · 42 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/rally/setNoteSearch")` (file under extensions/ but not a regular extension)

Flowgraph node "Rally Mode Set NoteSearch" (tag rally, no category). Intended to search for the nearest pacenotes rather than the next one. Inputs: noteSearch (pulse) and recoveredTo (table, recovery point).

## Notes

- Unfinished node: on pulse it only logs "setNoteSearch" and does dump(recoveredTo) if provided; it does not modify any state.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:work()` | On the noteSearch pulse: dump of recoveredTo and debug log, with no other effect. | 31 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/rally/setNoteSearch.lua`.*
