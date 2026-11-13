---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/util/damageAssessment.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `gameplay_util_damageAssessment` : `extensions.load("gameplay_util_damageAssessment")`, puis la globale `gameplay_util_damageAssessment`
---@class gameplay_util_damageAssessment
gameplay_util_damageAssessment = {}

---Source : lua/ge/extensions/gameplay/util/damageAssessment.lua:272
---@param tableNumbers any
---@param maxValue any
function gameplay_util_damageAssessment.calculateDamageVariation(tableNumbers, maxValue) end

---Source : lua/ge/extensions/gameplay/util/damageAssessment.lua:149
---@param vehId any
function gameplay_util_damageAssessment.getOverallDamageLevel(vehId) end

---Source : lua/ge/extensions/gameplay/util/damageAssessment.lua:182
---@param vehId any
function gameplay_util_damageAssessment.getSectionsDamageInfoRaw(vehId) end

--- used to know where damage on the vehicle happened
---Source : lua/ge/extensions/gameplay/util/damageAssessment.lua:408
---@param data any
function gameplay_util_damageAssessment.getTextualBeamDamageLocations(data) end

--- used to know where an impact happened
---Source : lua/ge/extensions/gameplay/util/damageAssessment.lua:403
---@param data any
function gameplay_util_damageAssessment.getTextualCollisionDamageLocations(data) end

---Source : lua/ge/extensions/gameplay/util/damageAssessment.lua:418
---@param data any
function gameplay_util_damageAssessment.onDeserialized(data) end

---Source : lua/ge/extensions/gameplay/util/damageAssessment.lua:412
function gameplay_util_damageAssessment.onSerialize() end

---Source : lua/ge/extensions/gameplay/util/damageAssessment.lua:422
function gameplay_util_damageAssessment.onUpdate() end

---Source : lua/ge/extensions/gameplay/util/damageAssessment.lua:428
---@param newDebug any
function gameplay_util_damageAssessment.setDebug(newDebug) end

