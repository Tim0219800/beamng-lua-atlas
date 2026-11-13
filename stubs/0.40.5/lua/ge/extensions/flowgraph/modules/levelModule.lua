---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/modules/levelModule.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe locale `C` de lua/ge/extensions/flowgraph/modules/levelModule.lua
---@class flowgraph_modules_levelModule_C
local flowgraph_modules_levelModule_C = {}

---Source : lua/ge/extensions/flowgraph/modules/levelModule.lua:41
function flowgraph_modules_levelModule_C:afterTrigger() end

---Source : lua/ge/extensions/flowgraph/modules/levelModule.lua:25
function flowgraph_modules_levelModule_C:beginLoadingLevel() end

---Source : lua/ge/extensions/flowgraph/modules/levelModule.lua:16
function flowgraph_modules_levelModule_C:clear() end

--- this function will delay another function until finishedLevelLoading is called, or will call it instantly if not level is being loaded.
---Source : lua/ge/extensions/flowgraph/modules/levelModule.lua:49
---@param fun any
function flowgraph_modules_levelModule_C:delayOrInstantFunction(fun) end

---Source : lua/ge/extensions/flowgraph/modules/levelModule.lua:66
function flowgraph_modules_levelModule_C:executionStopped() end

---Source : lua/ge/extensions/flowgraph/modules/levelModule.lua:29
function flowgraph_modules_levelModule_C:finishedLevelLoading() end

---Source : lua/ge/extensions/flowgraph/modules/levelModule.lua:7
function flowgraph_modules_levelModule_C:init() end

---Source : lua/ge/extensions/flowgraph/modules/levelModule.lua:57
---@param id any
function flowgraph_modules_levelModule_C:prefabLoaded(id) end

