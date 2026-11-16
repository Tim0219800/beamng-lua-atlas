---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/drag/rulesMenu.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Context of the drag rules screen (Vue interface "mission.dragRules"). It finds the track associated with a facility (facility.id, with the "Rules" suffix removed), provides the UI with the options (heads-up/bracket dragType, .400/.500 tree, available timers, default and saved values) and saves or restores the chosen rules for a track. It also places a 12 m tether around the facility's door: the menu closes by itself if the player's vehicle moves away.
--- Access: extension `gameplay_drag_rulesMenu`: `extensions.load("gameplay_drag_rulesMenu")`, then the global `gameplay_drag_rulesMenu`
---@class gameplay_drag_rulesMenu
---@field dependencies string[] Empty list.
gameplay_drag_rulesMenu = {}

--- Returns the saved rules of a track so that the UI can restore them (Restore button).
---Source: lua/ge/extensions/gameplay/drag/rulesMenu.lua:192
---@param levelId string Level identifier.
---@param stripId string Track identifier.
---@return table|nil  {dragType, treeType, importantTimerId} or nil.
function gameplay_drag_rulesMenu.applyRulesRestore(levelId, stripId) end

--- Saves the rules of a track (UI Save button). Does nothing if an argument is missing.
---Source: lua/ge/extensions/gameplay/drag/rulesMenu.lua:186
---@param levelId string Level identifier.
---@param stripId string Track identifier.
---@param rules table {dragType, treeType, importantTimerId}.
function gameplay_drag_rulesMenu.applyRulesSave(levelId, stripId, rules) end

--- Closes the rules context: removes the tether, forgets the facility and the track data.
---Source: lua/ge/extensions/gameplay/drag/rulesMenu.lua:113
function gameplay_drag_rulesMenu.closeMenu() end

--- Facility opened via a facility POI.
---Source: lua/ge/extensions/gameplay/drag/rulesMenu.lua:126
---@return table|nil  Facility or nil.
function gameplay_drag_rulesMenu.getCurrentFacility() end

--- Data for the Vue rules screen: levelId, stripId, stripName, location (level title), numLanes, timers (id, label, labelKey, shortLabel, type, distance), dragTypeOptions, treeTypeOptions, defaults (from the track) and saved (saved or created preset).
---Source: lua/ge/extensions/gameplay/drag/rulesMenu.lua:136
---@param facilityIdOrStripId string Facility identifier (e.g. 'alderStripRules') or track identifier.
---@return table|nil  Data, nil if the track is not found in the current level.
function gameplay_drag_rulesMenu.getRulesScreenData(facilityIdOrStripId) end

--- Saved rules of a track (dragType, treeType, importantTimerId), used by poi.applyUserRulesToData when starting from a POI.
---Source: lua/ge/extensions/gameplay/drag/rulesMenu.lua:131
---@param levelId string Level identifier.
---@param stripId string Track identifier.
---@return table|nil  Rules or nil.
function gameplay_drag_rulesMenu.getSavedRulesForStrip(levelId, stripId) end

--- True if the rules context is active.
---Source: lua/ge/extensions/gameplay/drag/rulesMenu.lua:121
---@return boolean  Whether the menu is open.
function gameplay_drag_rulesMenu.isMenuOpen() end

--- Per-frame hook: closes the menu if the player's vehicle (player 0) leaves the 12 m tether (or no longer exists).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drag/rulesMenu.lua:197
---@param dtReal number Real time delta (s).
---@param dtSim number Simulated time delta (s).
---@param dtRaw number Raw delta (s).
function gameplay_drag_rulesMenu.onUpdate(dtReal, dtSim, dtRaw) end

--- Opens the rules context for a facility: loads the data of the matching track and places the tether on the nearest door (freeroam_facilities).
---Source: lua/ge/extensions/gameplay/drag/rulesMenu.lua:104
---@param facility table Facility (id field).
function gameplay_drag_rulesMenu.openMenu(facility) end

