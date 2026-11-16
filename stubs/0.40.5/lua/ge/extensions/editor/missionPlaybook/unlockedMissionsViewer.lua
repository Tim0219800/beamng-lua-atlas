---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/missionPlaybook/unlockedMissionsViewer.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "Playbook Unlocked Missions Viewer" window associated with editor_missionPlaybook. After each playbook step, it sorts the career missions into three lists (startable, visible, invisible) according to gameplay_missions_unlocks.isMissionStartable / isMissionVisible and stores them in resultData.unlockedMissions. The window displays three columns for the current page and colors green the missions that became startable at this step (unlockChange.byId).
--- Access: extension `editor_missionPlaybook_unlockedMissionsViewer`: `extensions.load("editor_missionPlaybook_unlockedMissionsViewer")`, then the global `editor_missionPlaybook_unlockedMissionsViewer`
---@class editor_missionPlaybook_unlockedMissionsViewer
---@field onEditorRegisterPreferences any
editor_missionPlaybook_unlockedMissionsViewer = {}

--- Editor hook called every frame: draws the three mission columns for book.results[book.page].
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/missionPlaybook/unlockedMissionsViewer.lua:13
function editor_missionPlaybook_unlockedMissionsViewer.onEditorGui() end

--- Hook called at editor initialization: registers the window (500x500) and the "Missions" menu entry.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/missionPlaybook/unlockedMissionsViewer.lua:54
function editor_missionPlaybook_unlockedMissionsViewer.onEditorInitialized() end

--- Hook emitted after each playbook instruction: adds resultData.unlockedMissions = {startable, visible, invisible} (lists of ids).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/missionPlaybook/unlockedMissionsViewer.lua:59
---@param resultData table Result of the step, modified in place.
function editor_missionPlaybook_unlockedMissionsViewer.onPlaybookLogAfterStep(resultData) end

--- Shows the "Mission Playbook" and "Playbook Unlocked Missions Viewer" windows.
---Source: lua/ge/extensions/editor/missionPlaybook/unlockedMissionsViewer.lua:49
function editor_missionPlaybook_unlockedMissionsViewer.show() end

