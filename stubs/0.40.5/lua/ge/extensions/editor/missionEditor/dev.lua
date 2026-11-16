---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/missionEditor/dev.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Dev notes sub-window.
---@class editor_missionEditor_dev
local editor_missionEditor_dev = {}

--- Draws the multiline text, the mode selector and the "Dev Mission" checkbox (tooltip: the mission only appears if dev mode is enabled).
---Source: lua/ge/extensions/editor/missionEditor/dev.lua:20
function editor_missionEditor_dev:draw() end

--- Constructor: remembers the reference to the missionEditor.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/missionEditor/dev.lua:9
---@param missionEditor table editor_missionEditor module.
function editor_missionEditor_dev:init(missionEditor) end

--- Selects the mission: creates the text buffer (2048 characters) and the devMission checkbox from mission.devNotes.
---Source: lua/ge/extensions/editor/missionEditor/dev.lua:14
---@param mission table Mission data with devNotes.
function editor_missionEditor_dev:setMission(mission) end

