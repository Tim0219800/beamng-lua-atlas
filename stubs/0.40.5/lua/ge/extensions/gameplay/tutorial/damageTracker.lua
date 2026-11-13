---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/tutorial/damageTracker.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `gameplay_tutorial_damageTracker` : `extensions.load("gameplay_tutorial_damageTracker")`, puis la globale `gameplay_tutorial_damageTracker`
---@class gameplay_tutorial_damageTracker
---@field dependencies table
gameplay_tutorial_damageTracker = {}

---Source : lua/ge/extensions/gameplay/tutorial/damageTracker.lua:162
function gameplay_tutorial_damageTracker.claimNextDamagePopup() end

---Source : lua/ge/extensions/gameplay/tutorial/damageTracker.lua:202
function gameplay_tutorial_damageTracker.cleanup() end

---Source : lua/ge/extensions/gameplay/tutorial/damageTracker.lua:195
function gameplay_tutorial_damageTracker.debugTriggerCrash() end

---Source : lua/ge/extensions/gameplay/tutorial/damageTracker.lua:388
function gameplay_tutorial_damageTracker.getHadCrash() end

---Source : lua/ge/extensions/gameplay/tutorial/damageTracker.lua:315
function gameplay_tutorial_damageTracker.onCareerTutorialOutOfBoundsEnded() end

---Source : lua/ge/extensions/gameplay/tutorial/damageTracker.lua:307
function gameplay_tutorial_damageTracker.onCareerTutorialOutOfBoundsStarted() end

---Source : lua/ge/extensions/gameplay/tutorial/damageTracker.lua:347
---@param levelPath any
function gameplay_tutorial_damageTracker.onClientStartMission(levelPath) end

---Source : lua/ge/extensions/gameplay/tutorial/damageTracker.lua:368
---@param buttonId any
function gameplay_tutorial_damageTracker.onRecoveryPromptButtonPressed(buttonId) end

---Source : lua/ge/extensions/gameplay/tutorial/damageTracker.lua:353
---@param invVehId any
function gameplay_tutorial_damageTracker.onRecoveryPromptRepairHereUsed(invVehId) end

---Source : lua/ge/extensions/gameplay/tutorial/damageTracker.lua:278
---@param dtReal any
---@param dtSim any
---@param dtRaw any
function gameplay_tutorial_damageTracker.onUpdate(dtReal, dtSim, dtRaw) end

---Source : lua/ge/extensions/gameplay/tutorial/damageTracker.lua:294
---@param crashData any
function gameplay_tutorial_damageTracker.onVehicleCrashEnded(crashData) end

---Source : lua/ge/extensions/gameplay/tutorial/damageTracker.lua:360
---@param invVehId any
function gameplay_tutorial_damageTracker.onVehicleRepaired(invVehId) end

---Source : lua/ge/extensions/gameplay/tutorial/damageTracker.lua:379
---@param vehicleId any
function gameplay_tutorial_damageTracker.onVehicleResetted(vehicleId) end

---Source : lua/ge/extensions/gameplay/tutorial/damageTracker.lua:86
---@param handler any
function gameplay_tutorial_damageTracker.setDamagePopupHandler(handler) end

---Source : lua/ge/extensions/gameplay/tutorial/damageTracker.lua:85
function gameplay_tutorial_damageTracker.setDefaultRepairGoal() end

---Source : lua/ge/extensions/gameplay/tutorial/damageTracker.lua:181
---@param value any
function gameplay_tutorial_damageTracker.setEnabled(value) end

---Source : lua/ge/extensions/gameplay/tutorial/damageTracker.lua:84
---@param goal any
function gameplay_tutorial_damageTracker.setRepairGoal(goal) end

---Source : lua/ge/extensions/gameplay/tutorial/damageTracker.lua:158
---@param vehicleId any
function gameplay_tutorial_damageTracker.setTrackedVehicleId(vehicleId) end

---Source : lua/ge/extensions/gameplay/tutorial/damageTracker.lua:169
function gameplay_tutorial_damageTracker.showRepairTask() end

