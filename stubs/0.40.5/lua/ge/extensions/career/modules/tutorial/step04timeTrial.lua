---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/tutorial/step04timeTrial.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `career_modules_tutorial_step04timeTrial` : `extensions.load("career_modules_tutorial_step04timeTrial")`, puis la globale `career_modules_tutorial_step04timeTrial`
---@class career_modules_tutorial_step04timeTrial
career_modules_tutorial_step04timeTrial = {}

---Source : lua/ge/extensions/career/modules/tutorial/step04timeTrial.lua:280
function career_modules_tutorial_step04timeTrial.cleanup() end

---Source : lua/ge/extensions/career/modules/tutorial/step04timeTrial.lua:185
---@param state any
---@param mission any
function career_modules_tutorial_step04timeTrial.onAnyMissionChanged(state, mission) end

--- Called from OptionalChallengeSelect.vue when user confirms (lua.extensions.hook)
---Source : lua/ge/extensions/career/modules/tutorial/step04timeTrial.lua:257
---@param choice any
function career_modules_tutorial_step04timeTrial.onCareerTutorialAdvancedOrDragSelection(choice) end

---Source : lua/ge/extensions/career/modules/tutorial/step04timeTrial.lua:276
function career_modules_tutorial_step04timeTrial.onCareerTutorialLeftBounds() end

---Source : lua/ge/extensions/career/modules/tutorial/step04timeTrial.lua:211
function career_modules_tutorial_step04timeTrial.onCareerTutorialOutOfBoundsTimedOut() end

--- Skip step 4
---Source : lua/ge/extensions/career/modules/tutorial/step04timeTrial.lua:298
---@param im any
function career_modules_tutorial_step04timeTrial.onDebugMenu(im) end

---Source : lua/ge/extensions/career/modules/tutorial/step04timeTrial.lua:146
---@param id any
function career_modules_tutorial_step04timeTrial.onIntroPopupCareerClosed(id) end

---Source : lua/ge/extensions/career/modules/tutorial/step04timeTrial.lua:234
---@param data any
function career_modules_tutorial_step04timeTrial.onRacePathnodeReached(data) end

---Source : lua/ge/extensions/career/modules/tutorial/step04timeTrial.lua:224
---@param data any
function career_modules_tutorial_step04timeTrial.onRaceStarted(data) end

---Source : lua/ge/extensions/career/modules/tutorial/step04timeTrial.lua:242
---@param state any
function career_modules_tutorial_step04timeTrial.onScreenFadeState(state) end

---Source : lua/ge/extensions/career/modules/tutorial/step04timeTrial.lua:171
---@param dtReal any
---@param dtSim any
---@param dtRaw any
function career_modules_tutorial_step04timeTrial.onUpdate(dtReal, dtSim, dtRaw) end

--- Called when step becomes active
---Source : lua/ge/extensions/career/modules/tutorial/step04timeTrial.lua:124
---@param stepData any
function career_modules_tutorial_step04timeTrial.setup(stepData) end

