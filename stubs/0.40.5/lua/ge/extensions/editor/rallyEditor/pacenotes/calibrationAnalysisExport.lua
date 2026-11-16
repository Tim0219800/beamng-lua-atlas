---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/rallyEditor/pacenotes/calibrationAnalysisExport.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Exports a rally notebook's corner calibration data to a JSON file intended for analysis (for example by an LLM) to adjust the corner intensity and length thresholds. For each non-TODO pacenote, it remeasures the corner on the snaproad and serializes the measurements, the manual labels (calibration metadata), the adjustments, the composed preview and the waypoint context, with the current calibration, the active overrides and analysis instructions. Two formats: v1 (full, calibrationAnalysis.json) and v2 (compact with target/projected comparisons by intensity and length, calibrationAnalysis.v2.json). Used by the Export tab of the calibration window.
--- Access: extension `editor_rallyEditor_pacenotes_calibrationAnalysisExport`: `extensions.load("editor_rallyEditor_pacenotes_calibrationAnalysisExport")`, then the global `editor_rallyEditor_pacenotes_calibrationAnalysisExport`
---@class editor_rallyEditor_pacenotes_calibrationAnalysisExport
editor_rallyEditor_pacenotes_calibrationAnalysisExport = {}

--- Builds the v1 export table in memory (version = 1): notebook identity, active composer style, current calibration, overrides, instructions, schema, context, pacenotes and summary.
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes/calibrationAnalysisExport.lua:478
---@param path table|nil Notebook.
---@param pacenotesWindow table|nil Pacenotes tab (for the snaproad).
---@return table|nil  Export data, or nil on error.
---@return string|nil  Error message (no notebook, no active corner calibration, snaproad not loaded).
function editor_rallyEditor_pacenotes_calibrationAnalysisExport.build(path, pacenotesWindow) end

--- Builds the compact v2 export (version = 2) from build(): calibration ranges, active overrides, analysis (target/projected distributions) and instructions.
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes/calibrationAnalysisExport.lua:964
---@param path table|nil Notebook.
---@param pacenotesWindow table|nil Pacenotes tab.
---@return table|nil  v2 data, or nil.
---@return string|nil  Error message.
function editor_rallyEditor_pacenotes_calibrationAnalysisExport.buildV2(path, pacenotesWindow) end

--- Builds the v1 export, writes it to disk and checks the re-read.
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes/calibrationAnalysisExport.lua:546
---@param path table|nil Notebook.
---@param pacenotesWindow table|nil Pacenotes tab.
---@return boolean  Success.
---@return string|nil  File path on success, otherwise error message.
---@return table|string|nil  Exported data on success; on write failure, file path.
function editor_rallyEditor_pacenotes_calibrationAnalysisExport.export(path, pacenotesWindow) end

--- Path of the v1 export file for a mission.
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes/calibrationAnalysisExport.lua:20
---@param missionDir string|nil Mission folder.
---@return string|nil  <missionDir>/rally/calibrationAnalysis.json, or nil without a folder.
function editor_rallyEditor_pacenotes_calibrationAnalysisExport.exportFile(missionDir) end

--- Builds the v2 export, writes it to disk and checks the re-read. Same return values as export().
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes/calibrationAnalysisExport.lua:991
---@param path table|nil Notebook.
---@param pacenotesWindow table|nil Pacenotes tab.
---@return boolean  Success.
---@return string|nil  File path on success, otherwise error message.
---@return table|string|nil  Exported data, or path on write failure.
function editor_rallyEditor_pacenotes_calibrationAnalysisExport.exportV2(path, pacenotesWindow) end

--- Path of the v2 export file for a mission.
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes/calibrationAnalysisExport.lua:26
---@param missionDir string|nil Mission folder.
---@return string|nil  <missionDir>/rally/calibrationAnalysis.v2.json, or nil without a folder.
function editor_rallyEditor_pacenotes_calibrationAnalysisExport.exportV2File(missionDir) end

