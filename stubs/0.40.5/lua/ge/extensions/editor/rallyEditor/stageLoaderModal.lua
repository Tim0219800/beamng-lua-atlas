---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/rallyEditor/stageLoaderModal.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "Open Rally Stage" modal window of the rally editor. It lists the rallyStage missions of the current level (gameplay_missions_missions.getFilesData), sorted by name, with dev missions marked [DEV]. The Open button loads the chosen mission's notebook (rallyEditor.loadForMissionEditor) and shows the tool (showRallyTool).
--- Access: extension `editor_rallyEditor_stageLoaderModal`: `extensions.load("editor_rallyEditor_stageLoaderModal")`, then the global `editor_rallyEditor_stageLoaderModal`
---@class editor_rallyEditor_stageLoaderModal
editor_rallyEditor_stageLoaderModal = {}

--- To be called every frame. Opens the popup when openPtr[0] becomes true (refreshing the list), draws the list and the details, and resets openPtr[0] to false on close (Open or Cancel).
---Source: lua/ge/extensions/editor/rallyEditor/stageLoaderModal.lua:140
---@param rallyEditor table Rally editor module (must provide loadForMissionEditor and showRallyTool).
---@param openPtr table Imgui boolean pointer (BoolPtr) indicating whether the modal should be opened.
function editor_rallyEditor_stageLoaderModal.draw(rallyEditor, openPtr) end

