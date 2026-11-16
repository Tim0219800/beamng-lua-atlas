---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/missionPlaybook/missionTreeViewer.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "Playbook Mission Tree Viewer" window associated with editor_missionPlaybook. It draws, with the flowgraph node editor (ui_flowgraph_editor), the career mission unlock tree: one node per mission (showInCareer), placed according to the forwardInfo.depth depth, linked to the missions it unlocks (forwardIds). The color indicates the state (green startable, yellow visible, red otherwise) and star icons show the stars unlocked at the current playbook step (full star, empty, or "stars" for unlocked at this step).
--- Access: extension `editor_missionPlaybook_missionTreeViewer`: `extensions.load("editor_missionPlaybook_missionTreeViewer")`, then the global `editor_missionPlaybook_missionTreeViewer`
---@class editor_missionPlaybook_missionTreeViewer
---@field nodes table[] Generated nodes: {id, name, missionId, pos}.
---@field nodesByMId table<string, table> Nodes keyed by mission id.
---@field onEditorRegisterPreferences any
editor_missionPlaybook_missionTreeViewer = {}

--- Editor hook called every frame: creates (once) a dedicated node editor context, draws the nodes and links then restores the previous context.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/missionPlaybook/missionTreeViewer.lua:183
function editor_missionPlaybook_missionTreeViewer.onEditorGui() end

--- Hook called at editor initialization: registers the window (500x500) and the "Missions" menu entry.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/missionPlaybook/missionTreeViewer.lua:229
function editor_missionPlaybook_missionTreeViewer.onEditorInitialized() end

--- Hook emitted after each playbook instruction: adds to resultData the stars unlocked per mission (unlockedStars) and those unlocked at this step (unlockedThisStep).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/missionPlaybook/missionTreeViewer.lua:234
---@param resultData table Result of the step, modified in place.
function editor_missionPlaybook_missionTreeViewer.onPlaybookLogAfterStep(resultData) end

--- Shows the "Mission Playbook" and "Playbook Mission Tree Viewer" windows.
---Source: lua/ge/extensions/editor/missionPlaybook/missionTreeViewer.lua:224
function editor_missionPlaybook_missionTreeViewer.show() end

