---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/drift/general.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Conductor of the drift gameplay. Keeps the current context (inFreeroam, inChallenge, inFreeroamChallenge, inAnotherMissionType, inFreeroamCruising, inSplitscreen), the challenge mode (None, A to B, A to B with stunt zones, Gymkhana, Competition), the pause/freeze states and the debug flag. On every context or mode change, it loads or unloads the other gameplay_drift_* extensions according to the variableExtensions table. A modder uses it to read the drift context or change it, and to reset the whole system.
--- Access: extension `gameplay_drift_general`: `extensions.load("gameplay_drift_general")`, then the global `gameplay_drift_general`
---@class gameplay_drift_general
---@field dependencies string[] gameplay_drift_drift, gameplay_drift_scoring, gameplay_drift_statistics, gameplay_drift_saveLoad, gameplay_util_groundContact.
gameplay_drift_general = {}

--- Calls reset() of all the loaded drift extensions (except general), sets frozen back to false then empties the cascade zones (gameplay_drift_stuntZones.clear).
---Source: lua/ge/extensions/gameplay/drift/general.lua:73
function gameplay_drift_general.clear() end

--- Returns the current challenge mode.
---Source: lua/ge/extensions/gameplay/drift/general.lua:196
---@return string|nil  Challenge mode, nil as long as it has never been set.
function gameplay_drift_general.getChallengeMode() end

--- Returns the current drift context.
---Source: lua/ge/extensions/gameplay/drift/general.lua:179
---@return string|nil  Current context.
function gameplay_drift_general.getContext() end

--- Returns {default=true, canBeChanged=false} for the drift debug window.
---Source: lua/ge/extensions/gameplay/drift/general.lua:183
---@return table  {default = true, canBeChanged = false}
function gameplay_drift_general.getDriftDebugInfo() end

--- Indicates whether debug is enabled for a given drift extension (general debug active, extension known, checkbox ticked).
---Source: lua/ge/extensions/gameplay/drift/general.lua:187
---@param extName string Extension name, e.g. "gameplay_drift_scoreboard".
---@return boolean  true if debug of this extension is active.
function gameplay_drift_general.getExtensionDebug(extName) end

--- Indicates whether drift scoring and detection are frozen (out of bounds, wrong way, concluding phase).
---Source: lua/ge/extensions/gameplay/drift/general.lua:192
---@return boolean  Freeze state.
function gameplay_drift_general.getFrozen() end

--- Indicates whether general debug is active.
---Source: lua/ge/extensions/gameplay/drift/general.lua:171
---@return boolean  Debug flag.
function gameplay_drift_general.getGeneralDebug() end

--- Returns a truthy value only if a multiplayer session is in progress and multiplayer drift is allowed.
---Source: lua/ge/extensions/gameplay/drift/general.lua:200
---@return any  True/false value (can be nil or a boolean).
function gameplay_drift_general.getMultiplayerEnabled() end

--- Indicates whether the drift system is paused.
---Source: lua/ge/extensions/gameplay/drift/general.lua:175
---@return boolean  Pause state.
function gameplay_drift_general.getPaused() end

--- Hook: called when a mission starts or stops. Does clear(); when a non-drift mission starts switches to "inAnotherMissionType"; when it stops sets pause/freeze back to false and the context to "inFreeroam".
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/general.lua:204
---@param status string "started" or "stopped".
---@param mission table Mission concerned (missionType is read).
function gameplay_drift_general.onAnyMissionChanged(status, mission) end

--- Hook: level end, puts the context back to "inFreeroam".
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/general.lua:427
function gameplay_drift_general.onClientEndMission() end

--- Hook: called when the level is loaded; if no mission is in the foreground, switches to "inFreeroam" and does reset().
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/general.lua:393
function gameplay_drift_general.onClientPostStartMission() end

--- Hook: restores debugFlag, context and challengeMode after a Lua reload.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/general.lua:409
---@param data table Table returned by onSerialize.
function gameplay_drift_general.onDeserialized(data) end

--- Hook: lists the lua files of /lua/ge/extensions/gameplay/drift for the tracking of extensions and debug.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/general.lua:415
function gameplay_drift_general.onExtensionLoaded() end

--- Hook: loads gameplay_drift_multiplayer when entering a multiplayer session and unloads it when leaving.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/general.lua:419
---@param old any Old session (nil if none).
---@param new any New session (nil if none).
function gameplay_drift_general.onMPSessionChanged(old, new) end

--- Hook: saves debugFlag, context and challengeMode before a Lua reload.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/general.lua:401
---@return table  {debugFlag, context, challengeMode}
function gameplay_drift_general.onSerialize() end

--- Called every frame: debug window, loading/unloading of the sounds and cruising, recomputation of the frozen state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/general.lua:385
function gameplay_drift_general.onUpdate() end

--- Hook: if the vehicle put back in place is tracked by gameplay_drift_drift, emits onDriftPlVehReset(vid).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/general.lua:217
---@param vid integer Vehicle id.
function gameplay_drift_general.onVehicleResetted(vid) end

--- Calls reset() of all the loaded drift extensions (except general), sets frozen back to false then resets the cascade zones (gameplay_drift_stuntZones.reset).
---Source: lua/ge/extensions/gameplay/drift/general.lua:78
function gameplay_drift_general.reset() end

--- Changes the challenge mode and loads/unloads the extensions concerned. No effect if the mode is identical.
---Source: lua/ge/extensions/gameplay/drift/general.lua:136
---@param newChallengeMode string "None", "A to B", "A to B with stunt zones", "Gymkhana" or "Competition".
function gameplay_drift_general.setChallengeMode(newChallengeMode) end

--- Changes the drift context, emits onDriftContextChanged(newContext, oldContext) and updates the loaded extensions.
---Source: lua/ge/extensions/gameplay/drift/general.lua:147
---@param newContext string "inFreeroam", "inChallenge", "inFreeroamChallenge", "inAnotherMissionType", "inFreeroamCruising" or "inSplitscreen".
function gameplay_drift_general.setContext(newContext) end

--- Enables/disables drift debug mode (imgui window "Drift general") and emits onDriftDebugChanged(value).
---Source: lua/ge/extensions/gameplay/drift/general.lua:163
---@param value boolean true to enable debug.
function gameplay_drift_general.setDebug(value) end

--- Pauses the drift system (or resumes it).
---Source: lua/ge/extensions/gameplay/drift/general.lua:143
---@param newPaused boolean true to pause.
function gameplay_drift_general.setPaused(newPaused) end

