---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/rallyEditor/pacenotes/pacenoteForm.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Pacenote form instance.
---@class editor_rallyEditor_pacenotes_pacenoteForm
local editor_rallyEditor_pacenotes_pacenoteForm = {}

--- Resets the editing state (ongoing edit, deletion confirmation) and removes the pacenote.
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes/pacenoteForm.lua:50
function editor_rallyEditor_pacenotes_pacenoteForm:clearState() end

--- Draws the form in an imgui child area, or "No pacenote selected".
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes/pacenoteForm.lua:440
function editor_rallyEditor_pacenotes_pacenoteForm:draw() end

--- Constructor: stores the tools window and its state, with no pacenote.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes/pacenoteForm.lua:37
---@param pacenoteToolsWindow table Pacenote tools window (provides pacenoteToolsState).
function editor_rallyEditor_pacenotes_pacenoteForm:init(pacenoteToolsWindow) end

--- Sets the edited pacenote and resets StructuredForm, CustomForm and MeasurementsForm.
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes/pacenoteForm.lua:43
---@param pacenote table|nil Pacenote to edit, or nil.
function editor_rallyEditor_pacenotes_pacenoteForm:setPacenote(pacenote) end

