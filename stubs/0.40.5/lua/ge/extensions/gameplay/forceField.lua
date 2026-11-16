---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/forceField.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "Force field" mode of the Fun Stuff radial menu: creates a gravity "planet" (obj:setPlanets) around player 0's vehicle, sent to all other vehicles, which are thus pushed away (multiplier > 0) or attracted (< 0). Updated every 0.05 s of simulated time. Disables itself on vehicle change, at level end, when switching to career and before serialization.
--- Access: extension `gameplay_forceField`: `extensions.load("gameplay_forceField")`, then the global `gameplay_forceField`
---@class gameplay_forceField
gameplay_forceField = {}

--- Activates the force field (no effect if already active) and displays a UI message indicating repulsion or attraction depending on the sign of forceMultiplier.
---Source: lua/ge/extensions/gameplay/forceField.lua:17
function gameplay_forceField.activate() end

--- Deactivates the field: sends obj:setPlanets({}) to all vehicles and displays a "deactivated" message unless silent. No effect if inactive.
---Source: lua/ge/extensions/gameplay/forceField.lua:24
---@param silent boolean|nil true to not display a message.
function gameplay_forceField.deactivate(silent) end

--- Returns the current force multiplier.
---Source: lua/ge/extensions/gameplay/forceField.lua:95
---@return number  Multiplier.
function gameplay_forceField.getForceMultiplier() end

--- Returns whether the force field is active.
---Source: lua/ge/extensions/gameplay/forceField.lua:74
---@return boolean|nil  true if active, false or nil otherwise.
function gameplay_forceField.isActive() end

--- Hook: career activation; deactivates the field if enabled is true.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/forceField.lua:85
---@param enabled boolean Career enabled.
function gameplay_forceField.onCareerActive(enabled) end

--- Hook: level end; deactivates the field.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/forceField.lua:66
function gameplay_forceField.onClientEndMission() end

--- Hook: after a Lua reload; does nothing.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/forceField.lua:82
function gameplay_forceField.onDeserialized() end

--- Hook: before a Lua reload; deactivates the field (returns nothing).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/forceField.lua:78
function gameplay_forceField.onSerialize() end

--- Called every frame: if active, every 0.05 s (dtSim) computes the planet from the bounding box of player 0's vehicle and sends it to the other vehicles.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/forceField.lua:45
---@param dtReal number Real time delta (unused).
---@param dtSim number Simulated delta time, accumulated for the rate.
---@param dtRaw number Raw time delta (unused).
function gameplay_forceField.onUpdate(dtReal, dtSim, dtRaw) end

--- Hook: player vehicle change; deactivates the field.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/forceField.lua:70
function gameplay_forceField.onVehicleSwitched() end

--- Sets the force multiplier: positive = repulsion, negative = attraction. Taken into account at the next update.
---Source: lua/ge/extensions/gameplay/forceField.lua:91
---@param factor number Multiplier (1 by default).
function gameplay_forceField.setForceMultiplier(factor) end

--- Toggles between active and inactive.
---Source: lua/ge/extensions/gameplay/forceField.lua:36
function gameplay_forceField.toggleActive() end

