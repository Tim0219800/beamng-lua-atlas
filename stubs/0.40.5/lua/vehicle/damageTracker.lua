---@meta
-- tim19Atlas stub generated from lua/vehicle/damageTracker.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Registry of vehicle damage states, organized by group then by name (e.g. group 'energyStorage', tank name). Each change is queued and sent to the UI every 1/3 s via the `DamageData` hook, with optional callbacks for other modules. A modder calls setDamage to report a failure and getDamage to read it.
--- Access: global `damageTracker`
---@class damageTracker
damageTracker = {}

--- Reads the damage state of a group/name pair.
---Source: lua/vehicle/damageTracker.lua:78
---@param group string Group.
---@param name string Name.
---@return any  The value, or false if absent.
function damageTracker.getDamage(group, name) end

--- Called at vehicle creation: clears data, deltas, callbacks and timeouts.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/damageTracker.lua:106
function damageTracker.init() end

--- Adds a callback called on each DamageData send with (damageData, damageDataDelta). Ignored if nil.
---Source: lua/vehicle/damageTracker.lua:91
---@param callback function function(damageData, damageDataDelta).
function damageTracker.registerDamageUpdateCallback(callback) end

--- Called at reset: clears data, deltas and timeouts (keeps the callbacks).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/damageTracker.lua:98
function damageTracker.reset() end

--- Forces the sending of the DamageData hook and callbacks on the next frame (resets the timer to 0).
---Source: lua/vehicle/damageTracker.lua:82
function damageTracker.sendNow() end

--- Sets the damage state of a group/name pair (cancels any ongoing timeout on this pair).
---Source: lua/vehicle/damageTracker.lua:46
---@param group string Damage group (e.g. 'energyStorage').
---@param name string Name in the group.
---@param value boolean|number|string Damage value (in practice true/false).
---@param notifyUI boolean|nil If true, displays an on-screen message.
function damageTracker.setDamage(group, name, value, notifyUI) end

--- Like setDamage but schedules a return to timeoutValue after timeout seconds.
---Source: lua/vehicle/damageTracker.lua:72
---@param group string Group.
---@param name string Name.
---@param value any Immediate value.
---@param timeoutValue any Value applied at expiry.
---@param timeout number Timeout in seconds.
---@param notifyUI boolean|nil Notify the UI on immediate application.
function damageTracker.setDamageTemporary(group, name, value, timeoutValue, timeout, notifyUI) end

--- Is nop at rest; becomes updateGFXDirty when a damage changes or must expire. Periodically sends DamageData and counts down temporary damages. Called every frame by the main loop. (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/damageTracker.lua:dyn
---@param dt number Time step in seconds.
function damageTracker.updateGFX(dt) end

--- Indicates whether a send has just been armed (timer at its full value) and a first player is seated.
---Source: lua/vehicle/damageTracker.lua:87
---@return boolean  true if the send is imminent.
function damageTracker.willSend() end

