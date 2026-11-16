# `flowgraph_nodes_string_stringconcat`

*File: `lua/ge/extensions/flowgraph/nodes/string/stringconcat.lua` · VM: Game Engine (GE) · 123 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/string/stringconcat")` (file under extensions/ but not a regular extension)

Node "Concat" (simple, OBSOLETE: "Use the Format String node instead"). Concatenates all its inputs (converted by tostring) into a string. A new pin value<N+1> is added automatically when the last one is linked and the empty pins at the end of the list are removed. nil or false values are ignored.

## Notes

- false values are ignored: booleans must be converted manually (todo in the file).

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Empties the input cache. | 30 |
| `C:cleanupPins()` | Keeps exactly one empty pin at the end of the list (creates one or removes the excess). | 85 |
| `C:drawMiddle(builder, style)` | Empty. | 119 |
| `C:init()` | Output at '', empty input cache, savePins = true. | 23 |
| `C:onLink(link)` | Hook: when a link is created, cleans up the pins. | 72 |
| `C:onUnlink(link)` | Hook: when a link is deleted, cleans up the pins. | 77 |
| `C:updateCache()` | Rebuilds the string cache from the input pins and indicates whether it changed. | 36 |
| `C:work()` | Recomputes the output with table.concat(cache) if the cache changed. | 65 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/string/stringconcat.lua`.*
