---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/missionEditor/conditions.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Sub-window for editing a mission condition.
---@class editor_missionEditor_conditions
local editor_missionEditor_conditions = {}

--- Draws the mission's condition (default {type='always'}) with its label, recursively for nested conditions.
---Source: lua/ge/extensions/editor/missionEditor/conditions.lua:228
function editor_missionEditor_conditions:draw() end

--- Calls setMission then returns the issues: no condition defined (error), or condition set to "never" (error).
---Source: lua/ge/extensions/editor/missionEditor/conditions.lua:46
---@param m table Mission data.
---@return table[]  Elements {label, severity}.
function editor_missionEditor_conditions:getMissionIssues(m) end

--- Constructor: remembers missionEditor, the edited field and the displayed label, then loads all the available conditions from gameplay/missions/unlocks/conditions/.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/missionEditor/conditions.lua:27
---@param missionEditor table editor_missionEditor module.
---@param field string Name of the mission field (for example 'startCondition' or 'visibleCondition').
---@param name string Label displayed in the left column.
function editor_missionEditor_conditions:init(missionEditor, field, name) end

--- Selects the mission to edit and clears the input fields cache.
---Source: lua/ge/extensions/editor/missionEditor/conditions.lua:41
---@param mission table Mission data.
function editor_missionEditor_conditions:setMission(mission) end

