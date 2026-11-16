---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/missionEditor/progressMulti.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Instance of the tab. Fields: missionEditor, tabName = 'Progress Multi', mission, missionInstance, formattedSaveData, currentProgressKey.
---@class editor_missionEditor_progressMulti
local editor_missionEditor_progressMulti = {}

--- Displays the progress key combo and the aggregates table.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/missionEditor/progressMulti.lua:46
function editor_missionEditor_progressMulti:draw() end

--- Constructor.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/missionEditor/progressMulti.lua:25
---@param missionEditor table Main editor_missionEditor module.
function editor_missionEditor_progressMulti:init(missionEditor) end

--- Sets the current mission, reloads the formatted progress data and chooses the progress key (currentProgressKey, defaultProgressKey or 'default').
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/missionEditor/progressMulti.lua:34
---@param mission table Current mission.
function editor_missionEditor_progressMulti:setMission(mission) end

