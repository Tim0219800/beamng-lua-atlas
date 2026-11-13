---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/drag/rulesMenu.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `gameplay_drag_rulesMenu` : `extensions.load("gameplay_drag_rulesMenu")`, puis la globale `gameplay_drag_rulesMenu`
---@class gameplay_drag_rulesMenu
---@field dependencies table
gameplay_drag_rulesMenu = {}

--- Returns saved rules for strip so Vue can restore display. Called by Vue on Restore.
---Source : lua/ge/extensions/gameplay/drag/rulesMenu.lua:192
---@param levelId any
---@param stripId any
function gameplay_drag_rulesMenu.applyRulesRestore(levelId, stripId) end

--- Persists rules for strip. Called by Vue on Save.
---Source : lua/ge/extensions/gameplay/drag/rulesMenu.lua:186
---@param levelId any
---@param stripId any
---@param rules any
function gameplay_drag_rulesMenu.applyRulesSave(levelId, stripId, rules) end

--- Closes the rules context.
---Source : lua/ge/extensions/gameplay/drag/rulesMenu.lua:113
function gameplay_drag_rulesMenu.closeMenu() end

--- Returns current facility when opened from facility POI, or nil.
---Source : lua/ge/extensions/gameplay/drag/rulesMenu.lua:126
function gameplay_drag_rulesMenu.getCurrentFacility() end

--- Returns data for Vue rules screen. facility.id (e.g. "alderStripRules").
---Source : lua/ge/extensions/gameplay/drag/rulesMenu.lua:136
---@param facilityIdOrStripId any
function gameplay_drag_rulesMenu.getRulesScreenData(facilityIdOrStripId) end

--- Returns saved rules (dragType, treeType, importantTimerId) for strip. Used by general when starting from POI.
---Source : lua/ge/extensions/gameplay/drag/rulesMenu.lua:131
---@param levelId any
---@param stripId any
function gameplay_drag_rulesMenu.getSavedRulesForStrip(levelId, stripId) end

--- Returns true if rules context is active.
---Source : lua/ge/extensions/gameplay/drag/rulesMenu.lua:121
function gameplay_drag_rulesMenu.isMenuOpen() end

--- Called each frame. Auto-closes when player drives out of tether range.
---Source : lua/ge/extensions/gameplay/drag/rulesMenu.lua:197
---@param dtReal any
---@param dtSim any
---@param dtRaw any
function gameplay_drag_rulesMenu.onUpdate(dtReal, dtSim, dtRaw) end

--- Opens the rules context for a facility. Sets up tether for auto-close.
---Source : lua/ge/extensions/gameplay/drag/rulesMenu.lua:104
---@param facility any
function gameplay_drag_rulesMenu.openMenu(facility) end

