# `editor_flowgraph_garbageDebug`

*File: `lua/ge/extensions/editor/flowgraph/garbageDebug.lua` · VM: Game Engine (GE) · 308 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/editor/flowgraph/garbageDebug")` (file under extensions/ but not a regular extension)

"Garbage Debug" window (fg_garbage) of the Flowgraph editor: analyzes memory allocation (garbage) per graph and per node of a project after execution, from mgr.garbageData. It computes total, average per active frame, maximum, quantiles (25/50/75/90 %), number of active frames, sorts according to the flowgraph.debug.garbageSort preference and plots curves. Displays "Info only shows after running." as long as there is no data.

## Notes

- Quantile statistics are only computed if there are more than 10 history entries.
- The unit is "Bytes" except for activeCount ("Frames").
- "Debug Garbage" checkbox: preference flowgraph.debug.debugGarbage.

## Class `C`

Garbage Debug window class (windowName = 'fg_garbage').

| Method | Description | Line |
|---|---|---|
| `C:_onDeserialized(data)` | Deserialization (empty). | 303 |
| `C:_onSerialize(data)` | Serialization (empty). | 299 |
| `C:attach(mgr)` | Associates the flowgraph manager. | 12 |
| `C:computeAllStats()` | Computes once the stats of all graphs/nodes and their sum, then sorts them by descending value. | 95 |
| `C:computeStats(entry)` | Completes and computes the statistics of an entry (histories, average, quantiles, min/max, activity percentage). | 26 |
| `C:draw()` | Draws the window: Debug Garbage checkbox, sort, whole project, graphs then nodes. | 244 |
| `C:drawStats(label, entry)` | Draws the statistics block and curves of an entry; skips entries with no value or inactive. | 151 |
| `C:handleMeta(e)` | Displays a "View Node" or "View Graph" button that selects and centers the element. | 220 |
| `C:init()` | Registers the window and prepares a color palette by magnitude (20 levels). | 18 |
| `C:setSortingValue(entry)` | Sets entry.value (according to the current sort key) and its magnitude as a power of 2. | 71 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/flowgraph/garbageDebug.lua`.*
