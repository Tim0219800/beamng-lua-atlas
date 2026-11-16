---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/missionEditor/general.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- General section sub-window, created by the constructor returned by the module.
---@class editor_missionEditor_general
local editor_missionEditor_general = {}

--- Draws the Name and Description fields and their translation icons; saves the modifications into the mission at the end of the edit.
---Source: lua/ge/extensions/editor/missionEditor/general.lua:52
function editor_missionEditor_general:draw() end

--- Calls setMission then returns the issues: missing name (error), missing description (error), name without translation (warning), description without translation (warning).
---Source: lua/ge/extensions/editor/missionEditor/general.lua:22
---@param m table Mission data.
---@return table[]  Elements {label, severity}.
function editor_missionEditor_general:getMissionIssues(m) end

--- Constructor: remembers the reference to the missionEditor and prepares the recommended fields (recommended attributes of gameplay_missions_missions).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/missionEditor/general.lua:11
---@param missionEditor table editor_missionEditor module.
function editor_missionEditor_general:init(missionEditor) end

--- Selects the mission to edit: creates the name and description buffers and clears the cached translations.
---Source: lua/ge/extensions/editor/missionEditor/general.lua:40
---@param mission table Mission data.
function editor_missionEditor_general:setMission(mission) end

