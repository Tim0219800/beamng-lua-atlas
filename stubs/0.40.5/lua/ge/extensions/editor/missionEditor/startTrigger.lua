---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/missionEditor/startTrigger.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Instance of the panel. Fields: missionEditor, name = 'StartTrigger', mission, fields, sortedLevels (sorted levels).
---@class editor_missionEditor_startTrigger
local editor_missionEditor_startTrigger = {}

--- Draws the trigger type combo then the editor of the chosen type (level, position, radius).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/missionEditor/startTrigger.lua:158
function editor_missionEditor_startTrigger:draw() end

--- Returns the transform helper if the current level is the trigger's level.
---Source: lua/ge/extensions/editor/missionEditor/startTrigger.lua:203
---@return table|nil  transformUtil helper (pos, rot, scl), or nil in another level.
function editor_missionEditor_startTrigger:getStartTriggerTransform() end

--- Constructor: lists and sorts the levels (getAllLevelIdentifiers).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/missionEditor/startTrigger.lua:136
---@param missionEditor table Main editor_missionEditor module.
function editor_missionEditor_startTrigger:init(missionEditor) end

--- Sets the mission, resets the fields, stops the gizmo and repositions it if the trigger is of type coordinates.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/missionEditor/startTrigger.lua:147
---@param mission table Current mission.
function editor_missionEditor_startTrigger:setMission(mission) end

