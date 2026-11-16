# `utils_calltracer`

*File: `lua/common/utils/calltracer.lua` · VM: Common (GE + vehicle) · 97 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("utils/calltracer")`

Profiling/diagnostic tool: using a debug.sethook hook on function calls, records who calls whom during a period, then exports the call graph in TGF format (openable in yEd). Loaded with require('utils/calltracer'). Debugging only.

## Example

```lua
local calltracer = require('utils/calltracer')
calltracer.reset()
calltracer.start()
-- code to examine
calltracer.stop()
calltracer.save('callgraph.tgf')
```

## Notes

- C functions and unnamed functions (debug.getinfo().name nil) are ignored.
- Each node is identified by name + source + definition line; an edge links the caller's caller (s2) to the immediate caller (s1).
- The hook replaces any existing debug hook (debug.sethook / debug.sethook() with no argument to stop).
- save() writes via the global writeFile; the node table is not cleared after saving, use reset().

## Functions

| Function | Description | Line |
|---|---|---|
| `utils_calltracer.reset()` | Clears all recorded nodes and edges. | 86 |
| `utils_calltracer.save(filename)` | Writes the recorded call graph in TGF format (list of numbered nodes, '#' line, then the edges) to a file. | 61 |
| `utils_calltracer.start()` | Installs the call hook (debug.sethook(trace, 'c')): calls are recorded from that moment. | 52 |
| `utils_calltracer.stop()` | Removes the hook (debug.sethook()). Nodes already recorded are kept. | 56 |

### Parameter details

#### `utils_calltracer.save(filename)`

Writes the recorded call graph in TGF format (list of numbered nodes, '#' line, then the edges) to a file.

- `filename` (*string*) : Output file, e.g. 'callgraph.tgf'

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/utils/calltracer.lua`.*
