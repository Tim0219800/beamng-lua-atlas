---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/missionEditor/progressSingle.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Instance of the tab. Fields: missionEditor, tabName = 'Progress Single', mission, missionInstance, formattedSaveData, currentProgressKey.
---@class editor_missionEditor_progressSingle
local editor_missionEditor_progressSingle = {}

--- Draws the header (Raw checkbox, Reload button) then drawProgress or the raw JSON editor.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/missionEditor/progressSingle.lua:105
function editor_missionEditor_progressSingle:draw() end

--- Displays the number of unlocked stars, the default progress key, a key combo and the attempts table (or a raw dump if no attempt is available).
---Source: lua/ge/extensions/editor/missionEditor/progressSingle.lua:46
function editor_missionEditor_progressSingle:drawProgress() end

--- Constructor.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/missionEditor/progressSingle.lua:25
---@param missionEditor table Main editor_missionEditor module.
function editor_missionEditor_progressSingle:init(missionEditor) end

--- Sets the current mission, its instance and the formatted progress data.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/missionEditor/progressSingle.lua:34
---@param mission table Current mission.
function editor_missionEditor_progressSingle:setMission(mission) end

