---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/drift/quickMessages.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Detects the drift "quick messages" (small bonuses shown during the drift: big angle, reverse drift, long drift, close call, long chain, precision drift) and gives them a reward that is added to the cached score. Each message is described by primary conditions (all to be met at the same time), possibly confirmation conditions (e.g. no crash afterwards) and reset conditions. Emits onDriftQuickMessageDisplay for the interface and onDriftQuickMessageReached for the scoreboard.
--- Access: extension `gameplay_drift_quickMessages`: `extensions.load("gameplay_drift_quickMessages")`, then the global `gameplay_drift_quickMessages`
---@class gameplay_drift_quickMessages
---@field dependencies string[] gameplay_drift_general, gameplay_drift_drift, gameplay_drift_scoring.
gameplay_drift_quickMessages = {}

--- Returns {default=false, canBeChanged=true} for the drift debug window.
---Source: lua/ge/extensions/gameplay/drift/quickMessages.lua:422
---@return table  {default = false, canBeChanged = true}
function gameplay_drift_quickMessages.getDriftDebugInfo() end

--- Returns the amount of garbage measured by the profiler at the last frame (0 outside debug).
---Source: lua/ge/extensions/gameplay/drift/quickMessages.lua:426
---@return number  Garbage of the "Drift quick messages" section.
function gameplay_drift_quickMessages.getGC() end

--- Re-translates then returns the quick messages table (used by the scoreboard and the end screen).
---Source: lua/ge/extensions/gameplay/drift/quickMessages.lua:416
---@return table<string, {msg:string, reward:number, primaryConditions:table}>  Quick messages keyed by id (precisionDrifting, bigAngle, reverseDrift, longDrift, closeCall, longDriftChain).
function gameplay_drift_quickMessages.getQuickMessages() end

--- Hook: an individual drift just ended (triggers the onDriftEnd type resets).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/quickMessages.lua:402
function gameplay_drift_quickMessages.onDriftActiveDataFinished() end

--- Hook: a drift chain has ended (triggers the onChainEnd type resets).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/quickMessages.lua:412
function gameplay_drift_quickMessages.onDriftCompleted() end

--- Hook: crash, calls reset().
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/quickMessages.lua:434
function gameplay_drift_quickMessages.onDriftCrash() end

--- Hook: the player's drift vehicle was put back in place; calls reset().
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/quickMessages.lua:407
function gameplay_drift_quickMessages.onDriftPlVehReset() end

--- Hook: spinout, calls reset().
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/quickMessages.lua:438
function gameplay_drift_quickMessages.onDriftSpinout() end

--- Called every frame: reads the tracked vehicle's drift state, checks primary conditions, confirmations and resets, handles idle mode.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/quickMessages.lua:345
---@param dt number Time delta (first argument of onUpdate, dtReal).
function gameplay_drift_quickMessages.onUpdate(dt) end

--- Empties the messages awaiting confirmation and already triggered, resets the close call counter and idle mode to zero.
---Source: lua/ge/extensions/gameplay/drift/quickMessages.lua:393
function gameplay_drift_quickMessages.reset() end

