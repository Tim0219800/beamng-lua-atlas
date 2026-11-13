---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rallyStartClock.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `gameplay_rallyStartClock` : `extensions.load("gameplay_rallyStartClock")`, puis la globale `gameplay_rallyStartClock`
---@class gameplay_rallyStartClock
gameplay_rallyStartClock = {}

---Source : lua/ge/extensions/gameplay/rallyStartClock.lua:525
function gameplay_rallyStartClock.getClockTypes() end

---Source : lua/ge/extensions/gameplay/rallyStartClock.lua:524
function gameplay_rallyStartClock.isRenderViewAvailable() end

---Source : lua/ge/extensions/gameplay/rallyStartClock.lua:69
function gameplay_rallyStartClock.onExtensionLoaded() end

---Source : lua/ge/extensions/gameplay/rallyStartClock.lua:426
function gameplay_rallyStartClock.onExtensionUnloaded() end

--- drawn after every onUpdate, so the display matches this frame's rally countdown whichever extension updates first
---Source : lua/ge/extensions/gameplay/rallyStartClock.lua:499
---@param dtReal any
---@param dtSim any
function gameplay_rallyStartClock.onPreRender(dtReal, dtSim) end

---Source : lua/ge/extensions/gameplay/rallyStartClock.lua:440
---@param data any
function gameplay_rallyStartClock.onRallyDataUpdated(data) end

---Source : lua/ge/extensions/gameplay/rallyStartClock.lua:426
function gameplay_rallyStartClock.onRallySessionEnd() end

---Source : lua/ge/extensions/gameplay/rallyStartClock.lua:476
---@param dtReal any
---@param dtSim any
function gameplay_rallyStartClock.onUpdate(dtReal, dtSim) end

