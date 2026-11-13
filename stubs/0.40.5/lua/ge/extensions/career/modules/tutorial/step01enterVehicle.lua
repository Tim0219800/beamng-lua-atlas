---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/tutorial/step01enterVehicle.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `career_modules_tutorial_step01enterVehicle` : `extensions.load("career_modules_tutorial_step01enterVehicle")`, puis la globale `career_modules_tutorial_step01enterVehicle`
---@class career_modules_tutorial_step01enterVehicle
career_modules_tutorial_step01enterVehicle = {}

--- Called when step completes or tutorial ends
---Source : lua/ge/extensions/career/modules/tutorial/step01enterVehicle.lua:131
function career_modules_tutorial_step01enterVehicle.cleanup() end

---Source : lua/ge/extensions/career/modules/tutorial/step01enterVehicle.lua:59
function career_modules_tutorial_step01enterVehicle.onCareerTutorialLeftBounds() end

--- Debug menu for this step
---Source : lua/ge/extensions/career/modules/tutorial/step01enterVehicle.lua:226
---@param im any
function career_modules_tutorial_step01enterVehicle.onDebugMenu(im) end

--- Called when intro popup is closed (once per page; tasklist runs only after the last page, approachVehicle)
---Source : lua/ge/extensions/career/modules/tutorial/step01enterVehicle.lua:142
---@param id any
function career_modules_tutorial_step01enterVehicle.onIntroPopupCareerClosed(id) end

--- Called from GearboxSelect.vue when user confirms shift mode (lua.extensions.hook)
---Source : lua/ge/extensions/career/modules/tutorial/step01enterVehicle.lua:183
---@param data any
function career_modules_tutorial_step01enterVehicle.onShiftModeSelectedViaPopup(data) end

--- Called every frame while step is active (via extension system)
---Source : lua/ge/extensions/career/modules/tutorial/step01enterVehicle.lua:70
---@param dtReal any
---@param dtSim any
---@param dtRaw any
function career_modules_tutorial_step01enterVehicle.onUpdate(dtReal, dtSim, dtRaw) end

--- Called when step becomes active
---Source : lua/ge/extensions/career/modules/tutorial/step01enterVehicle.lua:36
---@param stepData any
function career_modules_tutorial_step01enterVehicle.setup(stepData) end

