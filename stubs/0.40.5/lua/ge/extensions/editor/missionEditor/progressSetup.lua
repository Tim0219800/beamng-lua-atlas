---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/missionEditor/progressSetup.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Instance of the tab. Fields: missionEditor, mission, progressSetup, rawEditPerMission.
---@class editor_missionEditor_progressSetup
local editor_missionEditor_progressSetup = {}

--- Draws the header with the Raw checkbox then the progress view or the raw JSON editor (Edit / Finish Editing / Cancel).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/missionEditor/progressSetup.lua:45
function editor_missionEditor_progressSetup:draw() end

--- Constructor.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/missionEditor/progressSetup.lua:24
---@param missionEditor table Main editor_missionEditor module.
function editor_missionEditor_progressSetup:init(missionEditor) end

--- Sets the current mission and loads progressSetup for its type.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/missionEditor/progressSetup.lua:33
---@param mission table Current mission.
function editor_missionEditor_progressSetup:setMission(mission) end

