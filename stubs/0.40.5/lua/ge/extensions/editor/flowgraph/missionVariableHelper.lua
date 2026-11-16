---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/flowgraph/missionVariableHelper.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Shared utility that applies to a flowgraph project the variables of the mission selected in the Mission Editor (missionTypeData), and checks whether a project matches the mission. Used by the Task Manager window and the main editor before launching a project.
--- Access: extension `editor_flowgraph_missionVariableHelper`: `extensions.load("editor_flowgraph_missionVariableHelper")`, then the global `editor_flowgraph_missionVariableHelper`
---@class editor_flowgraph_missionVariableHelper
editor_flowgraph_missionVariableHelper = {}

--- Copies the missionTypeData variables of the selected mission to the project, then injects the player vehicle ID into the variables with known names. Logs the match type (warning if the project does not belong to the mission, but applies anyway).
---Source: lua/ge/extensions/editor/flowgraph/missionVariableHelper.lua:77
---@param mgr table Target flowgraph manager.
---@param logTag string|nil Log label (default "missionVariableHelper").
---@return boolean  true if at least one variable was applied or injected; false otherwise (mission editor absent, no mission, no variable).
function editor_flowgraph_missionVariableHelper.applyMissionVariablesToManager(mgr, logTag) end

--- Compares the project's file path (savedDir + savedFilename, .flow.json appended if missing) to the mission's flowgraph path (fgPath, or that of the mission instance), after normalization (/, no leading /, lowercase).
---Source: lua/ge/extensions/editor/flowgraph/missionVariableHelper.lua:17
---@param mgr table|nil Flowgraph manager.
---@param selectedMission table|nil Selected mission (id, fgPath, missionType).
---@return string  "exact", "missionTypeMain" (main gameplay flowgraph gameplay/missiontypes/<type>/<type>.flow.json), "sameMissionType", "differentMissionType" or "noMission".
---@return string  Normalized project path.
---@return string  Normalized mission path.
function editor_flowgraph_missionVariableHelper.checkMissionMatch(mgr, selectedMission) end

