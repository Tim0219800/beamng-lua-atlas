---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/tutorial/step06dragStripBasics.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `career_modules_tutorial_step06dragStripBasics` : `extensions.load("career_modules_tutorial_step06dragStripBasics")`, puis la globale `career_modules_tutorial_step06dragStripBasics`
---@class career_modules_tutorial_step06dragStripBasics
career_modules_tutorial_step06dragStripBasics = {}

---Source : lua/ge/extensions/career/modules/tutorial/step06dragStripBasics.lua:609
function career_modules_tutorial_step06dragStripBasics.cleanup() end

--- Drag hook from gameplay_drag_utils when player reaches race end timer.
---Source : lua/ge/extensions/career/modules/tutorial/step06dragStripBasics.lua:506
---@param vehId any
function career_modules_tutorial_step06dragStripBasics.dragRaceEndLineReached(vehId) end

--- Drag hook from gameplay_drag_utils/general when race actually starts (green).
---Source : lua/ge/extensions/career/modules/tutorial/step06dragStripBasics.lua:493
---@param vehId any
function career_modules_tutorial_step06dragStripBasics.dragRaceStarted(vehId) end

---Source : lua/ge/extensions/career/modules/tutorial/step06dragStripBasics.lua:412
function career_modules_tutorial_step06dragStripBasics.onCareerTutorialLeftBounds() end

---Source : lua/ge/extensions/career/modules/tutorial/step06dragStripBasics.lua:626
---@param im any
function career_modules_tutorial_step06dragStripBasics.onDebugMenu(im) end

--- Drag hook fired when racers are set up for a new staging attempt.
---Source : lua/ge/extensions/career/modules/tutorial/step06dragStripBasics.lua:594
---@param data any
function career_modules_tutorial_step06dragStripBasics.onDragRacersSetup(data) end

---Source : lua/ge/extensions/career/modules/tutorial/step06dragStripBasics.lua:416
---@param id any
function career_modules_tutorial_step06dragStripBasics.onIntroPopupCareerClosed(id) end

--- Drag hook from gameplay_drag_utils: phase transition for a specific racer.
---  We use this to complete the staging goal once the player moves from stage to countdown.
---Source : lua/ge/extensions/career/modules/tutorial/step06dragStripBasics.lua:477
---@param vehId any
---@param oldPhase any
---@param newPhase any
---@param newPhaseName any
function career_modules_tutorial_step06dragStripBasics.onRacerPhaseTransition(vehId, oldPhase, newPhase, newPhaseName) end

---Source : lua/ge/extensions/career/modules/tutorial/step06dragStripBasics.lua:543
---@param dtReal any
---@param dtSim any
---@param dtRaw any
function career_modules_tutorial_step06dragStripBasics.onUpdate(dtReal, dtSim, dtRaw) end

---Source : lua/ge/extensions/career/modules/tutorial/step06dragStripBasics.lua:359
---@param stepData any
function career_modules_tutorial_step06dragStripBasics.setup(stepData) end

