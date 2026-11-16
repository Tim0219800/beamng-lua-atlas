---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/modules/foreachModule.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph module (moduleOrder 1000, so executed last) reserved for child graphs created by a foreach loop. It contains only the fields parentGraphId, key and value, which the foreach node fills in for the child. All its execution methods are empty.
--- Access: `require("extensions/flowgraph/modules/foreachModule")` (file under extensions/ but not a regular extension)
---@class flowgraph_modules_foreachModule
flowgraph_modules_foreachModule = {}

--- Called after the graph tick (does nothing). (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/modules/foreachModule.lua:dyn
function flowgraph_modules_foreachModule.afterTrigger() end

--- Resets parentGraphId, key and value to nil. (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/modules/foreachModule.lua:dyn
function flowgraph_modules_foreachModule.clear() end

--- Called when the project starts (does nothing). (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/modules/foreachModule.lua:dyn
function flowgraph_modules_foreachModule.executionStarted() end

--- Called when the project stops (does nothing). (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/modules/foreachModule.lua:dyn
function flowgraph_modules_foreachModule.executionStopped() end

--- Called when the module is created: calls clear(). (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/modules/foreachModule.lua:dyn
function flowgraph_modules_foreachModule.init() end

--- Local class `C` of lua/ge/extensions/flowgraph/modules/foreachModule.lua
---@class flowgraph_modules_foreachModule_C
local flowgraph_modules_foreachModule_C = {}

---Source: lua/ge/extensions/flowgraph/modules/foreachModule.lua:18
function flowgraph_modules_foreachModule_C:afterTrigger() end

---Source: lua/ge/extensions/flowgraph/modules/foreachModule.lua:11
function flowgraph_modules_foreachModule_C:clear() end

---Source: lua/ge/extensions/flowgraph/modules/foreachModule.lua:26
function flowgraph_modules_foreachModule_C:executionStarted() end

---Source: lua/ge/extensions/flowgraph/modules/foreachModule.lua:22
function flowgraph_modules_foreachModule_C:executionStopped() end

---Source: lua/ge/extensions/flowgraph/modules/foreachModule.lua:7
function flowgraph_modules_foreachModule_C:init() end

