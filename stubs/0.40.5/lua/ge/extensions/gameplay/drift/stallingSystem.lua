---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/drift/stallingSystem.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Anti-repetition system of the "Gymkhana" challenge mode: it keeps the history of figures (normal drifts and stunt zones) and computes a multiplier (stallingValue, between 0.5 and 1) that reduces the score when the player repeats the same figure. Loaded by gameplay_drift_general when the challenge mode is "Gymkhana". Also contains a debug imgui window.
--- Access: extension `gameplay_drift_stallingSystem`: `extensions.load("gameplay_drift_stallingSystem")`, then the global `gameplay_drift_stallingSystem`
---@class gameplay_drift_stallingSystem
---@field dependencies string[] gameplay_drift_general, loaded beforehand.
gameplay_drift_stallingSystem = {}

--- Applies the stalling multiplier to a score.
---Source: lua/ge/extensions/gameplay/drift/stallingSystem.lua:118
---@param score number Raw score.
---@return number  score * stallingValue.
function gameplay_drift_stallingSystem.calculateScore(score) end

--- Returns {default=true, canBeChanged=true} for the drift debug window.
---Source: lua/ge/extensions/gameplay/drift/stallingSystem.lua:173
---@return table  {default = true, canBeChanged = true}
function gameplay_drift_stallingSystem.getDriftDebugInfo() end

--- Hook: when the player starts drifting, adds a drift (stuntId 0) to the history and recomputes the multiplier.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/stallingSystem.lua:132
---@param isDrifting boolean true at the start of a drift.
function gameplay_drift_stallingSystem.onDriftStatusChanged(isDrifting) end

--- Called every frame: displays the "Drift stalling system" debug window if enabled.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/stallingSystem.lua:169
function gameplay_drift_stallingSystem.onUpdate() end

--- Adds a stunt zone to the history (type "stuntZone") and recomputes the multiplier.
---Source: lua/ge/extensions/gameplay/drift/stallingSystem.lua:122
---@param stuntZoneId integer Zone identifier; a non-zero value distinguishes it from normal drifts.
function gameplay_drift_stallingSystem.processStuntZone(stuntZoneId) end

--- Clears the history and resets the multiplier to 1.
---Source: lua/ge/extensions/gameplay/drift/stallingSystem.lua:40
function gameplay_drift_stallingSystem.reset() end

