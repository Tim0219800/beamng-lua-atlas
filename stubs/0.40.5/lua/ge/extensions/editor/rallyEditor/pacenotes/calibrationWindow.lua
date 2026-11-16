---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/rallyEditor/pacenotes/calibrationWindow.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Floating "Pacenote Calibration" imgui window of the rally editor, with three tabs. "Calibration": editing of the corner intensity diameter bounds (thresholds) and arc lengths per intensity, on colored graduated lines, saved as mission overrides (calibrationOverrides) for the active composer style. "Analysis": compares the pacenotes' manual calibration labels (targets) with the intensities and lengths projected by the current measurements, with example tooltips. "Export": buttons "Export Analysis JSON" and "Export Analysis JSON v2" (see calibrationAnalysisExport). After the bounds are modified, the notebook's composer caches are invalidated and the structured notes recomputed.
--- Access: extension `editor_rallyEditor_pacenotes_calibrationWindow`: `extensions.load("editor_rallyEditor_pacenotes_calibrationWindow")`, then the global `editor_rallyEditor_pacenotes_calibrationWindow`
---@class editor_rallyEditor_pacenotes_calibrationWindow
editor_rallyEditor_pacenotes_calibrationWindow = {}

--- Draws the calibration window (Calibration, Analysis, Export tabs). To be called every frame by the editor; does nothing if the window is closed or there is no notebook.
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes/calibrationWindow.lua:832
---@param rallyEditor table Rally editor extension (provides getPacenotesWindow).
---@param openPtr BoolPtr Imgui pointer for the window's open/closed state; updated by the close cross.
function editor_rallyEditor_pacenotes_calibrationWindow.draw(rallyEditor, openPtr) end

