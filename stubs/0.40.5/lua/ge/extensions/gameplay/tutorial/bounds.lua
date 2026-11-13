---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/tutorial/bounds.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `gameplay_tutorial_bounds` : `extensions.load("gameplay_tutorial_bounds")`, puis la globale `gameplay_tutorial_bounds`
---@class gameplay_tutorial_bounds
gameplay_tutorial_bounds = {}

---Source : lua/ge/extensions/gameplay/tutorial/bounds.lua:278
function gameplay_tutorial_bounds.cleanup() end

---Source : lua/ge/extensions/gameplay/tutorial/bounds.lua:188
function gameplay_tutorial_bounds.getActiveZoneNames() end

---Source : lua/ge/extensions/gameplay/tutorial/bounds.lua:205
function gameplay_tutorial_bounds.getDebugDrawBounds() end

---Source : lua/ge/extensions/gameplay/tutorial/bounds.lua:197
function gameplay_tutorial_bounds.getEnabledZones() end

---Source : lua/ge/extensions/gameplay/tutorial/bounds.lua:183
---@param zoneName any
function gameplay_tutorial_bounds.getZoneEnabled(zoneName) end

---Source : lua/ge/extensions/gameplay/tutorial/bounds.lua:209
function gameplay_tutorial_bounds.isInBounds() end

---Source : lua/ge/extensions/gameplay/tutorial/bounds.lua:271
---@param dtReal any
---@param dtSim any
---@param dtRaw any
function gameplay_tutorial_bounds.onPreRender(dtReal, dtSim, dtRaw) end

---Source : lua/ge/extensions/gameplay/tutorial/bounds.lua:170
---@param names any
function gameplay_tutorial_bounds.setActiveZones(names) end

---Source : lua/ge/extensions/gameplay/tutorial/bounds.lua:71
---@param newCallbacks any
function gameplay_tutorial_bounds.setCallbacks(newCallbacks) end

---Source : lua/ge/extensions/gameplay/tutorial/bounds.lua:63
---@param getter any
function gameplay_tutorial_bounds.setCurrentStepGetter(getter) end

---Source : lua/ge/extensions/gameplay/tutorial/bounds.lua:201
---@param enabled any
function gameplay_tutorial_bounds.setDebugDrawBounds(enabled) end

---Source : lua/ge/extensions/gameplay/tutorial/bounds.lua:55
---@param getter any
function gameplay_tutorial_bounds.setRuntimeActiveGetter(getter) end

---Source : lua/ge/extensions/gameplay/tutorial/bounds.lua:166
---@param newSites any
function gameplay_tutorial_bounds.setSites(newSites) end

---Source : lua/ge/extensions/gameplay/tutorial/bounds.lua:179
---@param zoneName any
---@param enabled any
function gameplay_tutorial_bounds.setZoneEnabled(zoneName, enabled) end

---Source : lua/ge/extensions/gameplay/tutorial/bounds.lua:214
---@param dtReal any
function gameplay_tutorial_bounds.update(dtReal) end

