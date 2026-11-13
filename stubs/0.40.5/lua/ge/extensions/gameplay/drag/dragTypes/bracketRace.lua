---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/drag/dragTypes/bracketRace.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `gameplay_drag_dragTypes_bracketRace` : `extensions.load("gameplay_drag_dragTypes_bracketRace")`, puis la globale `gameplay_drag_dragTypes_bracketRace`
---@class gameplay_drag_dragTypes_bracketRace
---@field dependencies table
gameplay_drag_dragTypes_bracketRace = {}

--- Determines bracket winner by dial difference. Positive diff (slower than dial) before negative (broke out). DQ last.
---  dragData: current drag data with racers
---Source : lua/ge/extensions/gameplay/drag/dragTypes/bracketRace.lua:127
---@param dragData any
function gameplay_drag_dragTypes_bracketRace.generateWinData(dragData) end

--- Interface declarations
---Source : lua/ge/extensions/gameplay/drag/dragTypes/bracketRace.lua:34
function gameplay_drag_dragTypes_bracketRace.onExtensionLoaded() end

---Source : lua/ge/extensions/gameplay/drag/dragTypes/bracketRace.lua:59
---@param dtReal any
---@param dtSim any
---@param dtRaw any
function gameplay_drag_dragTypes_bracketRace.onUpdate(dtReal, dtSim, dtRaw) end

---Source : lua/ge/extensions/gameplay/drag/dragTypes/bracketRace.lua:40
function gameplay_drag_dragTypes_bracketRace.resetDragRace() end

---Source : lua/ge/extensions/gameplay/drag/dragTypes/bracketRace.lua:44
function gameplay_drag_dragTypes_bracketRace.startActivity() end

