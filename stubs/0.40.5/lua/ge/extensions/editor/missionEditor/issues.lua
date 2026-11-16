---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/missionEditor/issues.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Instance of the Issues panel. Fields: missionEditor, mission, issues = {list = {...}}.
---@class editor_missionEditor_issues
local editor_missionEditor_issues = {}

--- Recomputes all the issues: for each mission, calls setMission on missionTypeWindow then getMissionIssues(mission) on each window that defines it. Fills issue.label, severity, idx, missionId, missionType, level, availability, and for the mission _issueList (importantCount, highestSeverity, icon, color).
---Source: lua/ge/extensions/editor/missionEditor/issues.lua:188
---@param missionList table[] List of missions.
---@param windows table[] Editor panels that may have getMissionIssues.
---@param missionTypeWindow table genericTypeData panel, whose setMission is called for each mission.
function editor_missionEditor_issues:calculateMissionIssues(missionList, windows, missionTypeWindow) end

--- Displays, for the current mission, the bulleted list of issue labels (or "No Issues!"). Does nothing if mission._issueList does not exist.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/missionEditor/issues.lua:22
function editor_missionEditor_issues:draw() end

--- Draws the "mission_issues" window: bulk action menu and 7-column table (#, Type, Mission, MissionType, Level, Availability, Label). Clicking a mission opens it in the editor (setMissionById). Respects the preference missionEditor.general.shortIds.
---Source: lua/ge/extensions/editor/missionEditor/issues.lua:107
function editor_missionEditor_issues:drawIssuesWindow() end

--- Constructor: remembers missionEditor and initializes issues.list.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/missionEditor/issues.lua:13
---@param missionEditor table Main editor_missionEditor module.
function editor_missionEditor_issues:init(missionEditor) end

--- Sets the current mission.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/missionEditor/issues.lua:18
---@param mission table Displayed mission.
function editor_missionEditor_issues:setMission(mission) end

--- Shows the "mission_issues" editor window.
---Source: lua/ge/extensions/editor/missionEditor/issues.lua:182
function editor_missionEditor_issues:showIssuesWindow() end

