---@meta
-- tim19Atlas stub generated from lua/ge/extensions/freeroam/specialTriggers.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Data-driven special triggers: links BeamNGTriggers (or zones) to showing/hiding scene objects (TSStatic, PointLight/SpotLight lights, SimGroup) with delays, random order and random steps, and to Lua commands (GE or vehicle VM) when a vehicle enters/exits. At level start it reads `triggers.json` in the level folder. A modder uses it to animate lighting or scenery when the player enters a zone, without writing Lua. Global: freeroam_specialTriggers.
--- Access: extension `freeroam_specialTriggers`: `extensions.load("freeroam_specialTriggers")`, then the global `freeroam_specialTriggers`
---@class freeroam_specialTriggers
---@field active boolean Master switch: if false, the trigger hooks are ignored.
---@field debugMode boolean Enables debug logs (state changes, delay ends).
freeroam_specialTriggers = {}

--- Creates a trigger (initial state inactive, enabled) with its linked objects, its aliases and its commands; computes for each object group the maximum number of children (maxIdx).
---Source: lua/ge/extensions/freeroam/specialTriggers.lua:109
---@param key string Trigger or zone name.
---@param data table|nil Data (see notes).
function freeroam_specialTriggers.addTrigger(key, data) end

--- Returns the internal table of all the triggers (including aliases).
---Source: lua/ge/extensions/freeroam/specialTriggers.lua:206
---@return table<string, table>  Triggers.
function freeroam_specialTriggers.getTriggers() end

--- Reads a triggers file (by default `triggers.json` in the current level folder, via getMissionFilename) and calls setupTriggers.
---Source: lua/ge/extensions/freeroam/specialTriggers.lua:195
---@param filePath string|nil JSON file path.
function freeroam_specialTriggers.loadTriggers(filePath) end

--- BeamNGTrigger hook: handles the enter/exit/tick event of a known trigger (useTrigger).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/freeroam/specialTriggers.lua:512
---@param data table {triggerName, event, subjectID}
function freeroam_specialTriggers.onBeamNGTrigger(data) end

--- End-of-level hook: reset(true).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/freeroam/specialTriggers.lua:399
function freeroam_specialTriggers.onClientEndMission() end

--- Level start hook: loads the level's triggers.json.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/freeroam/specialTriggers.lua:395
function freeroam_specialTriggers.onClientStartMission() end

--- After Lua reload: restores the triggers table.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/freeroam/specialTriggers.lua:525
---@param data table Table returned by onSerialize.
function freeroam_specialTriggers.onDeserialized(data) end

--- Before Lua reload: returns {triggers} (see the bug in the notes).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/freeroam/specialTriggers.lua:518
---@return table  {triggers = ...}
function freeroam_specialTriggers.onSerialize() end

--- Per-frame hook: advances the delays and random steps of each object group in simulated time, applies the states, and calls onTick (zones) every 0.25 s if a zone-type trigger exists.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/freeroam/specialTriggers.lua:403
---@param dt number Real duration (s).
---@param dtSim number Simulated duration (s).
function freeroam_specialTriggers.onUpdate(dt, dtSim) end

--- Hook: if a vehicle becomes inactive, removes it from the triggers.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/freeroam/specialTriggers.lua:387
---@param vehId integer Id.
---@param active boolean New active state.
function freeroam_specialTriggers.onVehicleActiveChanged(vehId, active) end

--- Hook: removes the vehicle from the occupant lists of all triggers.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/freeroam/specialTriggers.lua:377
---@param vehId integer Vehicle id.
function freeroam_specialTriggers.onVehicleDestroyed(vehId) end

--- Vehicle change hook: sends a valid "exit" event to the triggers for which the new vehicle is a valid subject (prevents a state from staying stuck).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/freeroam/specialTriggers.lua:362
---@param oldId integer Old vehicle.
---@param newId integer New vehicle.
function freeroam_specialTriggers.onVehicleSwitched(oldId, newId) end

--- Deletes a trigger and its aliases; restores the linked objects' original state if useOrigState.
---Source: lua/ge/extensions/freeroam/specialTriggers.lua:155
---@param key string Trigger name.
---@param useOrigState boolean|nil Restore the objects.
function freeroam_specialTriggers.removeTrigger(key, useOrigState) end

--- Resets: with useOrigState, deletes all the triggers while restoring the objects' original state; clears the memory of original states.
---Source: lua/ge/extensions/freeroam/specialTriggers.lua:170
---@param useOrigState boolean|nil true to restore the objects.
function freeroam_specialTriggers.reset(useOrigState) end

--- Manually enables/disables a trigger (simulates a valid enter/exit event with vehId 0, which keeps it active). With instant=true, applies the state to the objects immediately with no delay.
---Source: lua/ge/extensions/freeroam/specialTriggers.lua:313
---@param tName string Trigger name.
---@param active boolean|nil New state; nil = toggle.
---@param instant boolean|nil Apply with no delay.
function freeroam_specialTriggers.setTriggerActive(tName, active, instant) end

--- Resets everything (reset(true)) then creates one trigger per entry of the data table.
---Source: lua/ge/extensions/freeroam/specialTriggers.lua:184
---@param data table Table name -> trigger data (see notes).
function freeroam_specialTriggers.setupTriggers(data) end

