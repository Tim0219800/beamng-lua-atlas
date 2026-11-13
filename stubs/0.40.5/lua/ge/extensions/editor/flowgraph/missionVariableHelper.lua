---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/flowgraph/missionVariableHelper.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_flowgraph_missionVariableHelper` : `extensions.load("editor_flowgraph_missionVariableHelper")`, puis la globale `editor_flowgraph_missionVariableHelper`
---@class editor_flowgraph_missionVariableHelper
editor_flowgraph_missionVariableHelper = {}

--- Helper function to apply mission variables from mission editor to a flowgraph manager
---Source : lua/ge/extensions/editor/flowgraph/missionVariableHelper.lua:77
---@param mgr any
---@param logTag any
function editor_flowgraph_missionVariableHelper.applyMissionVariablesToManager(mgr, logTag) end

--- Check if a manager's path matches a selected mission
---  Returns: matchType ("exact", "missionTypeMain", "sameMissionType", "differentMissionType", "noMission"), normalizedMgrPath, normalizedMissionPath
---Source : lua/ge/extensions/editor/flowgraph/missionVariableHelper.lua:17
---@param mgr any
---@param selectedMission any
function editor_flowgraph_missionVariableHelper.checkMissionMatch(mgr, selectedMission) end

