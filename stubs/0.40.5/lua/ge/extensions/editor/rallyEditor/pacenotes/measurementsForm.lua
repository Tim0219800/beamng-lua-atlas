---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/rallyEditor/pacenotes/measurementsForm.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "Measurements" section of the rally pacenote editor: collapsible by clicking its title. For the selected pacenote it displays the summary of the corner's geometric measurement (fit type, intensity, direction, diameter, arc, chord, angle, fit quality, hairpin candidate) and a "Measurement Type" dropdown. A "Details" button opens a window with the full pacenote.measurements tree, and a button opens/closes the calibration window.
--- Access: extension `editor_rallyEditor_pacenotes_measurementsForm`: `extensions.load("editor_rallyEditor_pacenotes_measurementsForm")`, then the global `editor_rallyEditor_pacenotes_measurementsForm`
---@class editor_rallyEditor_pacenotes_measurementsForm
editor_rallyEditor_pacenotes_measurementsForm = {}

--- State reset called by the editor; does nothing in this module.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes/measurementsForm.lua:256
function editor_rallyEditor_pacenotes_measurementsForm.clear() end

--- Draws the Measurements section. Sets pacenoteToolsState.showMeasurements to true when the section is expanded, false otherwise.
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes/measurementsForm.lua:222
---@param pacenote table Selected pacenote.
---@param pacenoteToolsState table|nil Shared state of the pacenote tools (showMeasurements field written).
---@param pacenoteToolsWindow table|nil Pacenote tools window (rallyEditor, measureSelectedPacenote, markValidationDirty).
function editor_rallyEditor_pacenotes_measurementsForm.draw(pacenote, pacenoteToolsState, pacenoteToolsWindow) end

