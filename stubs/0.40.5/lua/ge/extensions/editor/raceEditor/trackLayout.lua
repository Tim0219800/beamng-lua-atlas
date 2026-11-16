---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/raceEditor/trackLayout.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Track Layout window (windowDescription = 'Track Layout'). Instantiated with init(raceEditor).
---@class editor_raceEditor_trackLayout
local editor_raceEditor_trackLayout = {}

--- If the new value differs from path[field], commits a history action that modifies this path field.
---Source: lua/ge/extensions/editor/raceEditor/trackLayout.lua:27
---@param field string Path field (defaultLaps, startNode, endNode, defaultStartPosition, simplifyAiPath...).
---@param new any New value (object ID, -1 for none, number or boolean).
function editor_raceEditor_trackLayout:changeField(field, new) end

--- Displays a "name" line with a check or cross icon depending on classification[field].
---Source: lua/ge/extensions/editor/raceEditor/trackLayout.lua:78
---@param classification table Result of path:classify().
---@param name string Label.
---@param field string Key tested (reversible, allowRollingStart, closed, branching).
---@param tt string|nil Tooltip.
function editor_raceEditor_trackLayout:displayClassification(classification, name, field, tt) end

--- Called every frame: draws the form, the stop zone and the splits.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/raceEditor/trackLayout.lua:20
function editor_raceEditor_trackLayout:draw() end

--- Draws the form (laps, nodes, start positions, classification, AI simplification option) then the stop zone and the splits.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/raceEditor/trackLayout.lua:35
function editor_raceEditor_trackLayout:drawGeneralInfo() end

--- Draws "Split N" on each useAsSplit pathnode (except the last node of the sorted list).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/raceEditor/trackLayout.lua:107
function editor_raceEditor_trackLayout:drawSplits() end

--- Looks for a start position named STOP_ZONE, SS_stop_control or TC_out and draws the text "Stop Control" there.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/raceEditor/trackLayout.lua:89
function editor_raceEditor_trackLayout:drawStopZone() end

--- Stores raceEditor.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/raceEditor/trackLayout.lua:10
---@param raceEditor table Module editor_raceEditor.
function editor_raceEditor_trackLayout:init(raceEditor) end

--- Called when the tab becomes active; does nothing.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/raceEditor/trackLayout.lua:17
function editor_raceEditor_trackLayout:selected() end

--- Dropdown to choose a node or a position for a path field (None = -1), with a label drawn in the world and a preview of the hovered name.
---Source: lua/ge/extensions/editor/raceEditor/trackLayout.lua:120
---@param name string Label.
---@param objects table Collection (objects, sorted): path.pathnodes or path.startPositions.
---@param fieldName string Path field containing the chosen ID.
---@param clrI ColorI|nil Background color of the in-world text.
---@param tt string|nil Tooltip.
function editor_raceEditor_trackLayout:selector(name, objects, fieldName, clrI, tt) end

--- Sets the race path being edited.
---Source: lua/ge/extensions/editor/raceEditor/trackLayout.lua:14
---@param path table gameplay/race/path object.
function editor_raceEditor_trackLayout:setPath(path) end

--- Called when the tab is left; does nothing.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/raceEditor/trackLayout.lua:18
function editor_raceEditor_trackLayout:unselect() end

