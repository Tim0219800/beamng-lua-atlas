# `editor_rallyEditor_pacenotes_calibrationAnalysisExport`

*File: `lua/ge/extensions/editor/rallyEditor/pacenotes/calibrationAnalysisExport.lua` · VM: Game Engine (GE) · 1021 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_rallyEditor_pacenotes_calibrationAnalysisExport`: `extensions.load("editor_rallyEditor_pacenotes_calibrationAnalysisExport")`, then the global `editor_rallyEditor_pacenotes_calibrationAnalysisExport`

Exports a rally notebook's corner calibration data to a JSON file intended for analysis (for example by an LLM) to adjust the corner intensity and length thresholds. For each non-TODO pacenote, it remeasures the corner on the snaproad and serializes the measurements, the manual labels (calibration metadata), the adjustments, the composed preview and the waypoint context, with the current calibration, the active overrides and analysis instructions. Two formats: v1 (full, calibrationAnalysis.json) and v2 (compact with target/projected comparisons by intensity and length, calibrationAnalysis.v2.json). Used by the Export tab of the calibration window.

## Notes

- Files written: <missionDir>/rally/calibrationAnalysis.json and <missionDir>/rally/calibrationAnalysis.v2.json (rally folder created if needed). After writing, the file is re-read to check that the JSON parses.
- Pacenotes with todo == true are ignored (counted in skippedTodoPacenoteCount). The file's exportFilters.note field says "todo == false": same meaning.
- Numbers are rounded to 3 decimals; descriptors (square, hairpin...) are excluded from the v2 numeric analysis. Intensity = diameter in meters; length = arcMeters.
- The snaproad is taken from pacenotesWindow.snaproad, otherwise from path:getSnaproad(). In the Pacenotes tab the snaproad is stored in pacenoteToolsState.snaproad, so the pacenotesWindow.snaproad field is in practice nil and the path:getSnaproad() fallback is what is used.
- The snaproad partition (selected pacenote) is restored at the end of build().

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_rallyEditor_pacenotes_calibrationAnalysisExport.build(path, pacenotesWindow)` | Builds the v1 export table in memory (version = 1): notebook identity, active composer style, current calibration, overrides, instructions, schema, context, pacenotes and summary. | 478 |
| `editor_rallyEditor_pacenotes_calibrationAnalysisExport.buildV2(path, pacenotesWindow)` | Builds the compact v2 export (version = 2) from build(): calibration ranges, active overrides, analysis (target/projected distributions) and instructions. | 964 |
| `editor_rallyEditor_pacenotes_calibrationAnalysisExport.export(path, pacenotesWindow)` | Builds the v1 export, writes it to disk and checks the re-read. | 546 |
| `editor_rallyEditor_pacenotes_calibrationAnalysisExport.exportFile(missionDir)` | Path of the v1 export file for a mission. | 20 |
| `editor_rallyEditor_pacenotes_calibrationAnalysisExport.exportV2(path, pacenotesWindow)` | Builds the v2 export, writes it to disk and checks the re-read. Same return values as export(). | 991 |
| `editor_rallyEditor_pacenotes_calibrationAnalysisExport.exportV2File(missionDir)` | Path of the v2 export file for a mission. | 26 |

### Parameter details

#### `editor_rallyEditor_pacenotes_calibrationAnalysisExport.build(path, pacenotesWindow)`

Builds the v1 export table in memory (version = 1): notebook identity, active composer style, current calibration, overrides, instructions, schema, context, pacenotes and summary.

- `path` (*table|nil*) : Notebook.
- `pacenotesWindow` (*table|nil*) : Pacenotes tab (for the snaproad).
- **returns**: table|nil Export data, or nil on error.
- **returns**: string|nil Error message (no notebook, no active corner calibration, snaproad not loaded).

#### `editor_rallyEditor_pacenotes_calibrationAnalysisExport.buildV2(path, pacenotesWindow)`

Builds the compact v2 export (version = 2) from build(): calibration ranges, active overrides, analysis (target/projected distributions) and instructions.

- `path` (*table|nil*) : Notebook.
- `pacenotesWindow` (*table|nil*) : Pacenotes tab.
- **returns**: table|nil v2 data, or nil.
- **returns**: string|nil Error message.

#### `editor_rallyEditor_pacenotes_calibrationAnalysisExport.export(path, pacenotesWindow)`

Builds the v1 export, writes it to disk and checks the re-read.

- `path` (*table|nil*) : Notebook.
- `pacenotesWindow` (*table|nil*) : Pacenotes tab.
- **returns**: boolean Success.
- **returns**: string|nil File path on success, otherwise error message.
- **returns**: table|string|nil Exported data on success; on write failure, file path.

#### `editor_rallyEditor_pacenotes_calibrationAnalysisExport.exportFile(missionDir)`

Path of the v1 export file for a mission.

- `missionDir` (*string|nil*) : Mission folder.
- **returns**: string|nil <missionDir>/rally/calibrationAnalysis.json, or nil without a folder.

#### `editor_rallyEditor_pacenotes_calibrationAnalysisExport.exportV2(path, pacenotesWindow)`

Builds the v2 export, writes it to disk and checks the re-read. Same return values as export().

- `path` (*table|nil*) : Notebook.
- `pacenotesWindow` (*table|nil*) : Pacenotes tab.
- **returns**: boolean Success.
- **returns**: string|nil File path on success, otherwise error message.
- **returns**: table|string|nil Exported data, or path on write failure.

#### `editor_rallyEditor_pacenotes_calibrationAnalysisExport.exportV2File(missionDir)`

Path of the v2 export file for a mission.

- `missionDir` (*string|nil*) : Mission folder.
- **returns**: string|nil <missionDir>/rally/calibrationAnalysis.v2.json, or nil without a folder.

## Calls into the engine (C++)

- `FS:` `directoryCreate`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/rallyEditor/pacenotes/calibrationAnalysisExport.lua`.*
