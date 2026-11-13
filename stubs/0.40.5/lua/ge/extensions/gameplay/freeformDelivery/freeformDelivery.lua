---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/freeformDelivery/freeformDelivery.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `gameplay_freeformDelivery_freeformDelivery` : `extensions.load("gameplay_freeformDelivery_freeformDelivery")`, puis la globale `gameplay_freeformDelivery_freeformDelivery`
---@class gameplay_freeformDelivery_freeformDelivery
---@field debug table
---@field dependencies table
gameplay_freeformDelivery_freeformDelivery = {}

--- Legacy cleanup function _anon(now calls teardown for backwards compatibility)
---Source : lua/ge/extensions/gameplay/freeformDelivery/freeformDelivery.lua:666
function gameplay_freeformDelivery_freeformDelivery.cleanup() end

---Source : lua/ge/extensions/gameplay/freeformDelivery/freeformDelivery.lua:235
---@param failed any
---@param reason any
function gameplay_freeformDelivery_freeformDelivery.finish(failed, reason) end

---Source : lua/ge/extensions/gameplay/freeformDelivery/freeformDelivery.lua:174
function gameplay_freeformDelivery_freeformDelivery.getCurrentDelivery() end

--- Expose failReason
---Source : lua/ge/extensions/gameplay/freeformDelivery/freeformDelivery.lua:112
function gameplay_freeformDelivery_freeformDelivery.getFailReason() end

---Source : lua/ge/extensions/gameplay/freeformDelivery/freeformDelivery.lua:296
function gameplay_freeformDelivery_freeformDelivery.getProgress() end

---Source : lua/ge/extensions/gameplay/freeformDelivery/freeformDelivery.lua:305
function gameplay_freeformDelivery_freeformDelivery.getResults() end

---Source : lua/ge/extensions/gameplay/freeformDelivery/freeformDelivery.lua:183
function gameplay_freeformDelivery_freeformDelivery.getSetupPending() end

---Source : lua/ge/extensions/gameplay/freeformDelivery/freeformDelivery.lua:178
function gameplay_freeformDelivery_freeformDelivery.getStartTime() end

--- Expose isActive for quickAccess
---Source : lua/ge/extensions/gameplay/freeformDelivery/freeformDelivery.lua:97
function gameplay_freeformDelivery_freeformDelivery.isActive() end

--- Expose isFailed state
---Source : lua/ge/extensions/gameplay/freeformDelivery/freeformDelivery.lua:107
function gameplay_freeformDelivery_freeformDelivery.isFailed() end

--- Expose isFinished state
---Source : lua/ge/extensions/gameplay/freeformDelivery/freeformDelivery.lua:102
function gameplay_freeformDelivery_freeformDelivery.isFinished() end

---Source : lua/ge/extensions/gameplay/freeformDelivery/freeformDelivery.lua:170
function gameplay_freeformDelivery_freeformDelivery.isLoaded() end

--- Public API
---Source : lua/ge/extensions/gameplay/freeformDelivery/freeformDelivery.lua:117
---@param path any
function gameplay_freeformDelivery_freeformDelivery.load(path) end

---Source : lua/ge/extensions/gameplay/freeformDelivery/freeformDelivery.lua:505
function gameplay_freeformDelivery_freeformDelivery.onBeforeRadialOpened() end

---Source : lua/ge/extensions/gameplay/freeformDelivery/freeformDelivery.lua:674
function gameplay_freeformDelivery_freeformDelivery.onClientEndMission() end

---Source : lua/ge/extensions/gameplay/freeformDelivery/freeformDelivery.lua:670
function gameplay_freeformDelivery_freeformDelivery.onExtensionUnloaded() end

---Source : lua/ge/extensions/gameplay/freeformDelivery/freeformDelivery.lua:509
function gameplay_freeformDelivery_freeformDelivery.onQuickAccessLoaded() end

---Source : lua/ge/extensions/gameplay/freeformDelivery/freeformDelivery.lua:538
---@param dtReal any
---@param dtSim any
---@param dtRaw any
function gameplay_freeformDelivery_freeformDelivery.onUpdate(dtReal, dtSim, dtRaw) end

---Source : lua/ge/extensions/gameplay/freeformDelivery/freeformDelivery.lua:315
function gameplay_freeformDelivery_freeformDelivery.reset() end

---Source : lua/ge/extensions/gameplay/freeformDelivery/freeformDelivery.lua:187
function gameplay_freeformDelivery_freeformDelivery.start() end

--- Teardown: Actually removes vehicles, unloads delivery, etc.
---Source : lua/ge/extensions/gameplay/freeformDelivery/freeformDelivery.lua:624
---@param keepVehicles any
function gameplay_freeformDelivery_freeformDelivery.teardown(keepVehicles) end

