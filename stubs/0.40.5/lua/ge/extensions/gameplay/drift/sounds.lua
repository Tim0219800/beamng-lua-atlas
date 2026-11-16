---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/drift/sounds.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Manages drift UI sounds (FMOD events UI>Career>Drift_*): a continuous sound during a drift whose pitch follows the performance factor, a sound on each new tier, on each combo change, when the drift is canceled (crash/spinout) and when points are validated. Also contains a "Drift audio" imgui window to simulate a drift in debug. Loaded by gameplay_drift_general as long as the drift display extension is loaded.
--- Access: extension `gameplay_drift_sounds`: `extensions.load("gameplay_drift_sounds")`, then the global `gameplay_drift_sounds`
---@class gameplay_drift_sounds
gameplay_drift_sounds = {}

--- Returns {default=false, canBeChanged=true} for the drift debug window.
---Source: lua/ge/extensions/gameplay/drift/sounds.lua:67
---@return table  {default = false, canBeChanged = true}
function gameplay_drift_sounds.getDriftDebugInfo() end

--- Hook: plays the points received sound.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/sounds.lua:186
---@param data table Scored drift data (unused).
function gameplay_drift_sounds.onDriftCompletedScored(data) end

--- Hook: plays the drift cancel sound.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/sounds.lua:172
function gameplay_drift_sounds.onDriftCrash() end

--- Hook: when debug is disabled, stops the drift simulation (gameplay_drift_drift.simulateADrift()).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/sounds.lua:180
---@param value boolean New debug state.
function gameplay_drift_sounds.onDriftDebugChanged(value) end

--- Hook: plays the 1x or 5x combo sound depending on the size of the change.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/sounds.lua:159
---@param data table {comboChange = number}.
function gameplay_drift_sounds.onDriftNewCombo(data) end

--- Hook: plays the drift cancel sound.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/sounds.lua:176
function gameplay_drift_sounds.onDriftSpinout() end

--- Hook: removes the audio source of the continuous sound on unload.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/sounds.lua:195
function gameplay_drift_sounds.onExtensionUnloaded() end

--- Hook: plays the new tier sound.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/sounds.lua:153
---@param tierData table Tier data; order is used for the volume.
function gameplay_drift_sounds.onNewDriftTierReached(tierData) end

--- Called every frame: on the first call creates the audio source of the continuous sound, displays the debug window, then plays/stops the continuous sound and updates its pitch parameter and its position (camera).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/sounds.lua:135
---@param dtReal number Real time delta (unused).
---@param _dtSim number Simulated delta time, stored for debug transitions.
---@param dtRaw number Raw time delta (unused).
function gameplay_drift_sounds.onUpdate(dtReal, _dtSim, dtRaw) end

