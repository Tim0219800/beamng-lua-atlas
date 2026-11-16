---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/missionEditor/prefabs.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Instance of the panel. Fields: missionEditor, mission, filenames (imgui buffers), prefabsRequireCollisionReload.
---@class editor_missionEditor_prefabs
local editor_missionEditor_prefabs = {}

--- Draws the prefabs list (deletion, path, picker, status, spawn), the "Add" button and the "Requires collision reload" checkbox.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/missionEditor/prefabs.lua:22
function editor_missionEditor_prefabs:draw() end

--- Constructor.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/missionEditor/prefabs.lua:7
---@param missionEditor table Main editor_missionEditor module.
function editor_missionEditor_prefabs:init(missionEditor) end

--- Sets the mission and recreates the text buffers from mission.prefabs.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/missionEditor/prefabs.lua:13
---@param mission table Current mission.
function editor_missionEditor_prefabs:setMission(mission) end

