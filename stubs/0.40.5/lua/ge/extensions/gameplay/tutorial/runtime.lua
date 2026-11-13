---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/tutorial/runtime.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `gameplay_tutorial_runtime` : `extensions.load("gameplay_tutorial_runtime")`, puis la globale `gameplay_tutorial_runtime`
---@class gameplay_tutorial_runtime
---@field dependencies table
---@field sharedTutorialData table
gameplay_tutorial_runtime = {}

---Source : lua/ge/extensions/gameplay/tutorial/runtime.lua:150
---@param stepId any
function gameplay_tutorial_runtime.activateStep(stepId) end

---Source : lua/ge/extensions/gameplay/tutorial/runtime.lua:200
function gameplay_tutorial_runtime.advanceToNextStep() end

---Source : lua/ge/extensions/gameplay/tutorial/runtime.lua:192
---@param stepId any
function gameplay_tutorial_runtime.completeStep(stepId) end

---Source : lua/ge/extensions/gameplay/tutorial/runtime.lua:57
---@param opts any
function gameplay_tutorial_runtime.configure(opts) end

---Source : lua/ge/extensions/gameplay/tutorial/runtime.lua:227
function gameplay_tutorial_runtime.endTutorial() end

---Source : lua/ge/extensions/gameplay/tutorial/runtime.lua:103
function gameplay_tutorial_runtime.getCurrentStep() end

---Source : lua/ge/extensions/gameplay/tutorial/runtime.lua:95
function gameplay_tutorial_runtime.getProgressData() end

---Source : lua/ge/extensions/gameplay/tutorial/runtime.lua:111
---@param index any
function gameplay_tutorial_runtime.getStepIdByIndex(index) end

---Source : lua/ge/extensions/gameplay/tutorial/runtime.lua:107
function gameplay_tutorial_runtime.getStepOrder() end

---Source : lua/ge/extensions/gameplay/tutorial/runtime.lua:99
function gameplay_tutorial_runtime.isActive() end

---Source : lua/ge/extensions/gameplay/tutorial/runtime.lua:293
---@param dtReal any
---@param dtSim any
---@param dtRaw any
function gameplay_tutorial_runtime.onPreRender(dtReal, dtSim, dtRaw) end

---Source : lua/ge/extensions/gameplay/tutorial/runtime.lua:277
---@param dtReal any
---@param dtSim any
---@param dtRaw any
function gameplay_tutorial_runtime.onUpdate(dtReal, dtSim, dtRaw) end

---Source : lua/ge/extensions/gameplay/tutorial/runtime.lua:88
---@param data any
function gameplay_tutorial_runtime.setProgressData(data) end

---Source : lua/ge/extensions/gameplay/tutorial/runtime.lua:115
function gameplay_tutorial_runtime.start() end

--- Unloads the active step without marking the tutorial completed
---Source : lua/ge/extensions/gameplay/tutorial/runtime.lua:262
function gameplay_tutorial_runtime.stop() end

