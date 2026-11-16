---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/missionPlaybook/attributeViewer.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "Playbook Attribute Viewer" window associated with editor_missionPlaybook. At each playbook step, it records the player's attributes (career_modules_playerAttributes.getAllAttributes: value, branch level, progress toward the next level) in resultData.attributes. The window displays for the current page a Key / Value / Tier / Change table (green for an increase, red for a decrease) and a curve of the attributes' evolution (except "money") via plotHelperUtil.
--- Access: extension `editor_missionPlaybook_attributeViewer`: `extensions.load("editor_missionPlaybook_attributeViewer")`, then the global `editor_missionPlaybook_attributeViewer`
---@class editor_missionPlaybook_attributeViewer
---@field onEditorRegisterPreferences any
editor_missionPlaybook_attributeViewer = {}

--- Editor hook called every frame: draws the attributes table and graph for book.results[book.page].
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/missionPlaybook/attributeViewer.lua:17
---@param dt number Frame duration in seconds (passed to the plot).
function editor_missionPlaybook_attributeViewer.onEditorGui(dt) end

--- Hook called at editor initialization: registers the window (500x500), the "Missions" menu entry and creates the plot utility.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/missionPlaybook/attributeViewer.lua:97
function editor_missionPlaybook_attributeViewer.onEditorInitialized() end

--- Hook emitted by editor_missionPlaybook after each instruction: adds resultData.attributes = {key = {value, level, curLvlProgress, neededForNext}}.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/missionPlaybook/attributeViewer.lua:103
---@param resultData table Result of the step, modified in place.
function editor_missionPlaybook_attributeViewer.onPlaybookLogAfterStep(resultData) end

--- Shows the "Mission Playbook" and "Playbook Attribute Viewer" windows.
---Source: lua/ge/extensions/editor/missionPlaybook/attributeViewer.lua:87
function editor_missionPlaybook_attributeViewer.show() end

