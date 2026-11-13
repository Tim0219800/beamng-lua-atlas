---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/drag/dragTypes/headsUpRace.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `gameplay_drag_dragTypes_headsUpRace` : `extensions.load("gameplay_drag_dragTypes_headsUpRace")`, puis la globale `gameplay_drag_dragTypes_headsUpRace`
---@class gameplay_drag_dragTypes_headsUpRace
---@field dependencies table
gameplay_drag_dragTypes_headsUpRace = {}

--- Determines winner by best (timer + reaction) for the important timer. DQ racers sort last.
---  dragData: current drag data with racers
---Source : lua/ge/extensions/gameplay/drag/dragTypes/headsUpRace.lua:134
---@param dragData any
function gameplay_drag_dragTypes_headsUpRace.generateWinData(dragData) end

--- Interface declarations
---Source : lua/ge/extensions/gameplay/drag/dragTypes/headsUpRace.lua:36
function gameplay_drag_dragTypes_headsUpRace.onExtensionLoaded() end

---Source : lua/ge/extensions/gameplay/drag/dragTypes/headsUpRace.lua:61
---@param dtReal any
---@param dtSim any
---@param dtRaw any
function gameplay_drag_dragTypes_headsUpRace.onUpdate(dtReal, dtSim, dtRaw) end

---Source : lua/ge/extensions/gameplay/drag/dragTypes/headsUpRace.lua:42
function gameplay_drag_dragTypes_headsUpRace.resetDragRace() end

---Source : lua/ge/extensions/gameplay/drag/dragTypes/headsUpRace.lua:46
function gameplay_drag_dragTypes_headsUpRace.startActivity() end

