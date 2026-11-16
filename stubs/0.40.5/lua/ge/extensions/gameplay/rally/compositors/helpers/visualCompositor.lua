---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/compositors/helpers/visualCompositor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Visual compositor returned by the module constructor.
---@class gameplay_rally_compositors_helpers_visualCompositor
local gameplay_rally_compositors_helpers_visualCompositor = {}

--- Maximum distance (threshold of the last link) below which two notes are chained ('into').
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/compositors/helpers/visualCompositor.lua:24
---@return number  Distance in meters.
function gameplay_rally_compositors_helpers_visualCompositor:_getMaxLinkDistance() end

--- Builds the list of visuals for a structured note.
---Source: lua/ge/extensions/gameplay/rally/compositors/helpers/visualCompositor.lua:204
---@param pacenote table Note (name, id) for the visuals' identifiers.
---@param structured table Structured content of the note (elements by slot).
---@param distBeforeMeters number|nil Distance from the previous note in meters.
---@param distAfterMeters number|nil Distance to the next note in meters (shown under the last visual).
---@return table[]  Visuals (4 at most).
function gameplay_rally_compositors_helpers_visualCompositor:compositeVisual(pacenote, structured, distBeforeMeters, distAfterMeters) end

--- Stores the text compositor whose configuration is read.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/compositors/helpers/visualCompositor.lua:20
---@param textCompositor table textCompositor instance.
function gameplay_rally_compositors_helpers_visualCompositor:init(textCompositor) end

