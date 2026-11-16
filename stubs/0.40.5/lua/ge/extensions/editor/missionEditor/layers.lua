---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/missionEditor/layers.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Instance of the Layers panel. Fields: missionEditor, mission, inputs (imgui text buffers per layer).
---@class editor_missionEditor_layers
local editor_missionEditor_layers = {}

--- Recreates the imgui text buffers (im.ArrayChar of 1024) from layer.dir for each layer.
---Source: lua/ge/extensions/editor/missionEditor/layers.lua:19
function editor_missionEditor_layers:createInputFields() end

--- Draws the list of layers with up/down buttons, path field, folder, picker, deletion and addition. Applies the moves at the end of the frame and sets mission._dirty to true.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/missionEditor/layers.lua:29
function editor_missionEditor_layers:draw() end

--- Constructor: remembers missionEditor.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/missionEditor/layers.lua:10
---@param missionEditor table Main editor_missionEditor module.
function editor_missionEditor_layers:init(missionEditor) end

--- Sets the current mission and recreates the input fields.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/missionEditor/layers.lua:14
---@param mission table Mission whose mission.layers is edited.
function editor_missionEditor_layers:setMission(mission) end

