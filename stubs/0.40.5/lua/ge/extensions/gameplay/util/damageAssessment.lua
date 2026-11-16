---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/util/damageAssessment.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Assesses a vehicle's damage: overall level (none, light, moderate, severe) based on map.objects[id].damage, and per-zone breakdown. For the breakdown, the vehicle's oriented box is split into 27 cells (3x3x3) whose beam and collision damage is read; the cells are grouped into named zones (Front, Front Left, Rear, Top, Left...). Used by gameplay_util_crashDetection to tell where an impact occurred.
--- Access: extension `gameplay_util_damageAssessment`: `extensions.load("gameplay_util_damageAssessment")`, then the global `gameplay_util_damageAssessment`
---@class gameplay_util_damageAssessment
gameplay_util_damageAssessment = {}

--- Measures the heterogeneity of a damage series: standard deviation divided by half of maxValue, capped at 1.
---Source: lua/ge/extensions/gameplay/util/damageAssessment.lua:272
---@param tableNumbers number[] Damage per cell.
---@param maxValue number|nil Reference value (500000 by default).
---@return number  0 (uniform or fewer than 2 values) to 1.
function gameplay_util_damageAssessment.calculateDamageVariation(tableNumbers, maxValue) end

--- Returns a vehicle's overall damage level based on map.objects[vehId].damage.
---Source: lua/ge/extensions/gameplay/util/damageAssessment.lua:149
---@param vehId integer Vehicle id (must exist in map.objects).
---@return table  {damageName = "No damage"|"Minor"|"Moderate"|"Severe", damageSeverity = 0..3}
function gameplay_util_damageAssessment.getOverallDamageLevel(vehId) end

--- Reads the beam and collision damage of the vehicle's 27 cells.
---Source: lua/ge/extensions/gameplay/util/damageAssessment.lua:182
---@param vehId integer|nil Vehicle id; player 0 if nil.
---@return table<integer, table>  Indices 0 to 26 -> {sectionBeamDamage, sectionCollisionDamage}.
function gameplay_util_damageAssessment.getSectionsDamageInfoRaw(vehId) end

--- Same as getTextualCollisionDamageLocations but on beam damage (deformation), to know where the vehicle was damaged.
---Source: lua/ge/extensions/gameplay/util/damageAssessment.lua:408
---@param data table|nil Same format.
---@return table  Same format.
function gameplay_util_damageAssessment.getTextualBeamDamageLocations(data) end

--- Compares current collision damage to a previous state and returns, per named zone, total, maximum, average, variation, intensity and score. Used to know where an impact occurred.
---Source: lua/ge/extensions/gameplay/util/damageAssessment.lua:403
---@param data table|nil {vehId, oldSectionsDamageRaw (output of getSectionsDamageInfoRaw), newSectionsDamageInfoRaw (optional)}.
---@return table  {damagedLocations (by zone name), mostDamagedLocation, totalDamage, bestDamageLocation, bestDamageScore}
function gameplay_util_damageAssessment.getTextualCollisionDamageLocations(data) end

--- Hook called after reload: restores the debug flag.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/util/damageAssessment.lua:418
---@param data table onSerialize table.
function gameplay_util_damageAssessment.onDeserialized(data) end

--- Hook called when extensions are reloaded: saves the debug flag.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/util/damageAssessment.lua:412
---@return table  {debug}
function gameplay_util_damageAssessment.onSerialize() end

--- Hook called every frame; in debug mode, redraws the player vehicle's cells.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/util/damageAssessment.lua:422
function gameplay_util_damageAssessment.onUpdate() end

--- Enables or disables debug drawing of the damage cells.
---Source: lua/ge/extensions/gameplay/util/damageAssessment.lua:428
---@param newDebug boolean true to enable.
function gameplay_util_damageAssessment.setDebug(newDebug) end

