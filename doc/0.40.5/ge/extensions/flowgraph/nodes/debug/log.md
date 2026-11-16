# `flowgraph_nodes_debug_log`

*File: `lua/ge/extensions/flowgraph/nodes/debug/log.lua` · VM: Game Engine (GE) · 64 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/debug/log")` (file under extensions/ but not a regular extension)

Flowgraph node "Log" (category dynamic_instant, tags util/print). Writes the received value to the game console (log) and to the graph event log (mgr:logEvent). Inputs: value (any; tables are converted by dumps), logTag (string, default "Node #<id>"), logType (I Info, D Debug, W Warning, E Error; default I). In 'repeat' dynamic mode, the message is written every frame.

## Example

```lua
-- the node is equivalent to: log('I', 'Node #12', msg)
```

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:createLogEntry()` | Converts the value to text (dumps for a table), calls log(type, tag, msg) and mgr:logEvent. | 49 |
| `C:drawMiddle(builder, style)` | Editor: displays ('type','tag',...). | 58 |
| `C:postInit()` | Prepares the templates of the logType pin, hides logType and logTag, and sets the default tag "Node #id". | 25 |
| `C:work()` | If dynamicMode is 'repeat', writes a log entry. | 43 |
| `C:workOnce()` | Writes a log entry. | 39 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/debug/log.lua`.*
