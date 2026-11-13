---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/tutorial.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `career_modules_tutorial` : `extensions.load("career_modules_tutorial")`, puis la globale `career_modules_tutorial`
---@class career_modules_tutorial
---@field dependencies table
---@field sharedTutorialData any
career_modules_tutorial = {}

---Source : lua/ge/extensions/career/modules/tutorial.lua:164
---@param stepId any
function career_modules_tutorial.activateStep(stepId) end

---Source : lua/ge/extensions/career/modules/tutorial.lua:180
function career_modules_tutorial.advanceToNextStep() end

---Source : lua/ge/extensions/career/modules/tutorial.lua:172
---@param stepId any
function career_modules_tutorial.completeStep(stepId) end

---Source : lua/ge/extensions/career/modules/tutorial.lua:188
function career_modules_tutorial.endTutorial() end

---Source : lua/ge/extensions/career/modules/tutorial.lua:204
function career_modules_tutorial.getCompletedSteps() end

---Source : lua/ge/extensions/career/modules/tutorial.lua:144
function career_modules_tutorial.getCurrentStep() end

---Source : lua/ge/extensions/career/modules/tutorial.lua:152
---@param index any
function career_modules_tutorial.getStepIdByIndex(index) end

---Source : lua/ge/extensions/career/modules/tutorial.lua:148
function career_modules_tutorial.getStepOrder() end

---Source : lua/ge/extensions/career/modules/tutorial.lua:140
function career_modules_tutorial.isActive() end

---Source : lua/ge/extensions/career/modules/tutorial.lua:132
function career_modules_tutorial.onCareerActive() end

---Source : lua/ge/extensions/career/modules/tutorial.lua:94
function career_modules_tutorial.onExtensionLoaded() end

---Source : lua/ge/extensions/career/modules/tutorial.lua:120
function career_modules_tutorial.onExtensionUnloaded() end

---Source : lua/ge/extensions/career/modules/tutorial.lua:209
---@param elements any
function career_modules_tutorial.onGetRawPoiListForTutorial(elements) end

---Source : lua/ge/extensions/career/modules/tutorial.lua:200
---@param dtReal any
---@param dtSim any
---@param dtRaw any
function career_modules_tutorial.onPreRender(dtReal, dtSim, dtRaw) end

---Source : lua/ge/extensions/career/modules/tutorial.lua:126
---@param currentSavePath any
function career_modules_tutorial.onSaveCurrentProfile(currentSavePath) end

---Source : lua/ge/extensions/career/modules/tutorial.lua:196
---@param dtReal any
---@param dtSim any
---@param dtRaw any
function career_modules_tutorial.onUpdate(dtReal, dtSim, dtRaw) end

---Source : lua/ge/extensions/career/modules/tutorial.lua:156
function career_modules_tutorial.start() end

