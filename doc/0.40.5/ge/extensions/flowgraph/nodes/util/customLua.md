# `flowgraph_nodes_util_customLua`

*File: `lua/ge/extensions/flowgraph/nodes/util/customLua.lua` · VM: Game Engine (GE) · 320 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/util/customLua")` (file under extensions/ but not a regular extension)

Node "Custom Lua" (category repeat_instant, color debug). Lets you write Lua code directly in the flowgraph editor, with custom input/output pins (saved). Four code blocks: work (every frame if an input flow is active), _executionStarted, _executionStopped and onPreRender. The code is compiled with load in a restricted environment (buildBaseEnv) and run under pcall; errors are logged on the node. The editor allows naming the node and saving it to a library (preference flowgraph.general.customLuaNodes).

## Notes

- The code is executed without a useful argument: pcall receives debug.traceback as the chunk's argument.
- The environment exposes require, dofile, loadfile, load, io and os: the code is not sandboxed.
- The error log tag in exec contains a stray quote: 'Custom Lua Node: " .. code'.

## Class `C`

Flowgraph node class; each instance represents a node in a graph.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Compiles the four blocks then runs _executionStarted. | 131 |
| `C:_executionStopped()` | Runs _executionStopped then releases the environment. | 137 |
| `C:_onDeserialized(data)` | Restores name and code then recompiles. | 160 |
| `C:_onSerialize(data)` | Saves name and code. | 168 |
| `C:buildBaseEnv()` | Builds (once) and returns the environment table of the user code: self, map, be, FS, scenetree, extensions, vec3/quat, JSON and math tools, all loaded extensions, etc. Also provides refreshExtensions, loadExtension, unloadExtension, log (also logs to the manager). | 173 |
| `C:compile(code)` | Compiles the given code block with the base environment; stores the error message in self.status, otherwise the function in self.compiled (nop on error). | 44 |
| `C:drawCustomProperties()` | Draws the editor: loading from the library, name, save button, and a multiline field per block with a compile error indicator. Returns the description of the change or false. | 54 |
| `C:exec(code)` | Runs the compiled block under pcall; on error, logs, marks the node as in error and adds an event to the manager. | 145 |
| `C:init()` | Creates the four empty code blocks and allows custom input and output pins (savePins=true). | 29 |
| `C:onPreRender(dt, dtSim)` | Runs the onPreRender block (before rendering). | 141 |
| `C:work()` | Runs the work block. | 156 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/util/customLua.lua`.*
