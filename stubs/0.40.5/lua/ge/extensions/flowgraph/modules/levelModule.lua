---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/modules/levelModule.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph module (moduleOrder 100) that synchronizes a project's actions with level loading. It lets you defer a function until loading finishes (delayOrInstantFunction) and reload the collision (be:reloadCollision) after a level loads or at the end of the tick when a prefab is loaded.
--- Access: `require("extensions/flowgraph/modules/levelModule")` (file under extensions/ but not a regular extension)
---@class flowgraph_modules_levelModule
flowgraph_modules_levelModule = {}

--- Called after the graph tick: if reloadCollisionOnAfterTrigger is true, calls be:reloadCollision(). (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/modules/levelModule.lua:dyn
function flowgraph_modules_levelModule.afterTrigger() end

--- Intended to signal the start of a level load (empty body). (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/modules/levelModule.lua:dyn
function flowgraph_modules_levelModule.beginLoadingLevel() end

--- Clears the tables and sets the flags reloadCollisionOnLevelLoading / reloadCollisionOnAfterTrigger back to false. (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/modules/levelModule.lua:dyn
function flowgraph_modules_levelModule.clear() end

--- Runs fun immediately if no level is loading, otherwise queues it until finishedLevelLoading. (dynamically assigned)
---Source: lua/ge/extensions/flowgraph/modules/levelModule.lua:dyn
---@param fun function function with no arguments
function flowgraph_modules_levelModule.delayOrInstantFunction(fun) end

--- Called when the project stops: calls clear(). (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/modules/levelModule.lua:dyn
function flowgraph_modules_levelModule.executionStopped() end

--- To be called at the end of level loading: reloads the collision if requested, runs then clears the deferred functions. (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/modules/levelModule.lua:dyn
function flowgraph_modules_levelModule.finishedLevelLoading() end

--- Creates the tables funs, uniqueFuns and prefabs, initializes the collision reload flags then calls clear(). (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/modules/levelModule.lua:dyn
function flowgraph_modules_levelModule.init() end

--- Signals that a prefab was loaded: requests a collision reload (at the end of level loading if in progress, otherwise after the tick) and stores the id. (dynamically assigned)
---Source: lua/ge/extensions/flowgraph/modules/levelModule.lua:dyn
---@param id integer prefab object id
function flowgraph_modules_levelModule.prefabLoaded(id) end

--- Local class `C` of lua/ge/extensions/flowgraph/modules/levelModule.lua
---@class flowgraph_modules_levelModule_C
local flowgraph_modules_levelModule_C = {}

---Source: lua/ge/extensions/flowgraph/modules/levelModule.lua:41
function flowgraph_modules_levelModule_C:afterTrigger() end

---Source: lua/ge/extensions/flowgraph/modules/levelModule.lua:25
function flowgraph_modules_levelModule_C:beginLoadingLevel() end

---Source: lua/ge/extensions/flowgraph/modules/levelModule.lua:16
function flowgraph_modules_levelModule_C:clear() end

--- this function will delay another function until finishedLevelLoading is called, or will call it instantly if not level is being loaded.
---Source: lua/ge/extensions/flowgraph/modules/levelModule.lua:49
---@param fun any
function flowgraph_modules_levelModule_C:delayOrInstantFunction(fun) end

---Source: lua/ge/extensions/flowgraph/modules/levelModule.lua:66
function flowgraph_modules_levelModule_C:executionStopped() end

---Source: lua/ge/extensions/flowgraph/modules/levelModule.lua:29
function flowgraph_modules_levelModule_C:finishedLevelLoading() end

---Source: lua/ge/extensions/flowgraph/modules/levelModule.lua:7
function flowgraph_modules_levelModule_C:init() end

---Source: lua/ge/extensions/flowgraph/modules/levelModule.lua:57
---@param id any
function flowgraph_modules_levelModule_C:prefabLoaded(id) end

