---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/rallyEditor/pacenotes/calibrationMetadataForm.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "Calibration Metadata" imgui form displayed in the pacenote editor. It lets you choose, for the selected pacenote, five calibration values (intensity, descriptor, direction, length, shape) via dropdowns fed by the notebook's text composer configuration (componentTypes.corner). The choices are stored in pacenote.metadata.calibration. Nothing is displayed if the notebook has no metadata.calibrationFields.
--- Access: extension `editor_rallyEditor_pacenotes_calibrationMetadataForm`: `extensions.load("editor_rallyEditor_pacenotes_calibrationMetadataForm")`, then the global `editor_rallyEditor_pacenotes_calibrationMetadataForm`
---@class editor_rallyEditor_pacenotes_calibrationMetadataForm
editor_rallyEditor_pacenotes_calibrationMetadataForm = {}

--- Draws the calibration metadata section for a pacenote. Does nothing if the pacenote has no notebook, if the notebook has no calibrationFields, or if the composer has no corner configuration.
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes/calibrationMetadataForm.lua:140
---@param pacenote table Edited pacenote (accesses pacenote.notebook and pacenote.metadata).
---@param pacenoteToolsWindow table Pacenote tools window (not used in the code).
function editor_rallyEditor_pacenotes_calibrationMetadataForm.draw(pacenote, pacenoteToolsWindow) end

