# `editor_rallyEditor_pacenotes_calibrationWindow`

*File: `lua/ge/extensions/editor/rallyEditor/pacenotes/calibrationWindow.lua` · VM: Game Engine (GE) · 866 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_rallyEditor_pacenotes_calibrationWindow`: `extensions.load("editor_rallyEditor_pacenotes_calibrationWindow")`, then the global `editor_rallyEditor_pacenotes_calibrationWindow`

Floating "Pacenote Calibration" imgui window of the rally editor, with three tabs. "Calibration": editing of the corner intensity diameter bounds (thresholds) and arc lengths per intensity, on colored graduated lines, saved as mission overrides (calibrationOverrides) for the active composer style. "Analysis": compares the pacenotes' manual calibration labels (targets) with the intensities and lengths projected by the current measurements, with example tooltips. "Export": buttons "Export Analysis JSON" and "Export Analysis JSON v2" (see calibrationAnalysisExport). After the bounds are modified, the notebook's composer caches are invalidated and the structured notes recomputed.

## Notes

- Only displayed if openPtr[0] is true, a notebook is loaded in the Pacenotes tab and the mission folder and the active composer style are known.
- Only valid bounds (calibrationOverrides.validateBoundaries) are saved.
- The analysis functions are duplicated in calibrationAnalysisExport.lua (matchers, distributions); the two files may diverge.
- Non-dockable window (WindowFlags_NoDocking), initial size 620 x 720.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_rallyEditor_pacenotes_calibrationWindow.draw(rallyEditor, openPtr)` | Draws the calibration window (Calibration, Analysis, Export tabs). To be called every frame by the editor; does nothing if the window is closed or there is no notebook. | 832 |

### Parameter details

#### `editor_rallyEditor_pacenotes_calibrationWindow.draw(rallyEditor, openPtr)`

Draws the calibration window (Calibration, Analysis, Export tabs). To be called every frame by the editor; does nothing if the window is closed or there is no notebook.

- `rallyEditor` (*table*) : Rally editor extension (provides getPacenotesWindow).
- `openPtr` (*BoolPtr*) : Imgui pointer for the window's open/closed state; updated by the close cross.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/rallyEditor/pacenotes/calibrationWindow.lua`.*
