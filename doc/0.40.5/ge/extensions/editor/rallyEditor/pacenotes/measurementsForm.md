# `editor_rallyEditor_pacenotes_measurementsForm`

*File: `lua/ge/extensions/editor/rallyEditor/pacenotes/measurementsForm.lua` · VM: Game Engine (GE) · 259 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_rallyEditor_pacenotes_measurementsForm`: `extensions.load("editor_rallyEditor_pacenotes_measurementsForm")`, then the global `editor_rallyEditor_pacenotes_measurementsForm`

"Measurements" section of the rally pacenote editor: collapsible by clicking its title. For the selected pacenote it displays the summary of the corner's geometric measurement (fit type, intensity, direction, diameter, arc, chord, angle, fit quality, hairpin candidate) and a "Measurement Type" dropdown. A "Details" button opens a window with the full pacenote.measurements tree, and a button opens/closes the calibration window.

## Notes

- Distances in meters, rounded to the unit; angle in degrees.
- The default measurement type is not stored in the notebook (corner.measurementType is reset to nil).
- Changing the type reruns the pacenote's measurement (measureSelectedPacenote(true)) if a snaproad is available, otherwise applyMeasurements or refreshStructured.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_rallyEditor_pacenotes_measurementsForm.clear()` | State reset called by the editor; does nothing in this module. *(internal)* | 256 |
| `editor_rallyEditor_pacenotes_measurementsForm.draw(pacenote, pacenoteToolsState, pacenoteToolsWindow)` | Draws the Measurements section. Sets pacenoteToolsState.showMeasurements to true when the section is expanded, false otherwise. | 222 |

### Parameter details

#### `editor_rallyEditor_pacenotes_measurementsForm.draw(pacenote, pacenoteToolsState, pacenoteToolsWindow)`

Draws the Measurements section. Sets pacenoteToolsState.showMeasurements to true when the section is expanded, false otherwise.

- `pacenote` (*table*) : Selected pacenote.
- `pacenoteToolsState` (*table|nil*) : Shared state of the pacenote tools (showMeasurements field written).
- `pacenoteToolsWindow` (*table|nil*) : Pacenote tools window (rallyEditor, measureSelectedPacenote, markValidationDirty).

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/rallyEditor/pacenotes/measurementsForm.lua`.*
