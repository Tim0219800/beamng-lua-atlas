# `flowgraph_nodes_career_logbookEntry`

*File: `lua/ge/extensions/flowgraph/nodes/career/logbookEntry.lua` · VM: Game Engine (GE) · 32 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/career/logbookEntry")` (file under extensions/ but not a regular extension)

Flowgraph node "Logbook Entry" (category once_instant, career color/icon). Adds an entry to the career logbook (career_modules_logbook.genericInfoUnlocked) with a title and a text. Inputs: title, text (string). Does nothing outside career. Copies the input flow to the output.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:workOnce()` | If career is active and the logbook module is present, adds the entry; copies flow to the output. | 24 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/career/logbookEntry.lua`.*
