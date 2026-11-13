---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/stepHandler.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `util_stepHandler` : `extensions.load("util_stepHandler")`, puis la globale `util_stepHandler`
---@class util_stepHandler
util_stepHandler = {}

---Source : lua/ge/extensions/util/stepHandler.lua:246
---@param level any
function util_stepHandler.makeLoadLevelStep(level) end

---Source : lua/ge/extensions/util/stepHandler.lua:59
---@param duration any
function util_stepHandler.makeStepFadeFromBlack(duration) end

---Source : lua/ge/extensions/util/stepHandler.lua:49
---@param duration any
function util_stepHandler.makeStepFadeToBlack(duration) end

---Source : lua/ge/extensions/util/stepHandler.lua:124
---@param fun any
function util_stepHandler.makeStepReturnTrueFunction(fun) end

---Source : lua/ge/extensions/util/stepHandler.lua:204
---@param amount any
---@param active any
---@param generator any
function util_stepHandler.makeStepSpawnTrafficSimple(amount, active, generator) end

---Source : lua/ge/extensions/util/stepHandler.lua:160
---@param spawningOptions any
---@param callback any
function util_stepHandler.makeStepSpawnVehicle(spawningOptions, callback) end

---Source : lua/ge/extensions/util/stepHandler.lua:169
---@param model any
---@param config any
---@param callback any
function util_stepHandler.makeStepSpawnVehicleSimple(model, config, callback) end

---Source : lua/ge/extensions/util/stepHandler.lua:78
---@param seconds any
function util_stepHandler.makeStepWait(seconds) end

---Source : lua/ge/extensions/util/stepHandler.lua:97
---@param frames any
function util_stepHandler.makeStepWaitFrames(frames) end

---Source : lua/ge/extensions/util/stepHandler.lua:132
---@param message any
function util_stepHandler.makeUiMessageStep(message) end

---Source : lua/ge/extensions/util/stepHandler.lua:239
---@param state any
function util_stepHandler.onClientStartMission(state) end

---Source : lua/ge/extensions/util/stepHandler.lua:43
---@param state any
function util_stepHandler.onScreenFadeState(state) end

---Source : lua/ge/extensions/util/stepHandler.lua:282
---@param dtReal any
---@param dtSim any
---@param dtRaw any
function util_stepHandler.onUpdate(dtReal, dtSim, dtRaw) end

---Source : lua/ge/extensions/util/stepHandler.lua:176
---@param vehIds any
---@param groupId any
function util_stepHandler.onVehicleGroupSpawned(vehIds, groupId) end

---Source : lua/ge/extensions/util/stepHandler.lua:275
function util_stepHandler.skipToLastStepOrCallback() end

--- starting a sequence
---Source : lua/ge/extensions/util/stepHandler.lua:262
---@param steps any
---@param callbackWhenFinished any
function util_stepHandler.startStepSequence(steps, callbackWhenFinished) end

---Source : lua/ge/extensions/util/stepHandler.lua:218
---@param step any
function util_stepHandler.taskLoadLevelStep(step) end

--- vehicle spawning helper
---Source : lua/ge/extensions/util/stepHandler.lua:188
---@param step any
function util_stepHandler.taskSpawnTrafficStep(step) end

