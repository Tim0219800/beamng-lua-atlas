# `editor_rallyEditor_recceTab`

*File: `lua/ge/extensions/editor/rallyEditor/recceTab.lua` · VM: Game Engine (GE) · 174 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/editor/rallyEditor/recceTab")` (file under extensions/ but not a regular extension)

"Recce" tab of the rally editor. It loads the mission's recce recording (driveline + "cuts", via gameplay/rally/recce), displays the number of points and the length of the driveline, lets you downsample it (straightness threshold between 0.98 and 1.0) and import one pacenote per cut into the notebook. Can draw the driveline's timestamp labels in 3D. The module returns a class C constructor.

## Notes

- No exported function: you get an instance with require(...)(rallyEditor).
- The closer the straightness threshold is to 1, the more points are kept (UI tooltip).
- In drawSectionV3, self.originalDrivelineSize and self.recce.driveline are used without a check if refresh() failed: possible error in that case.

## Class `C`

Recce tab instance (windowDescription = 'Recce').

The module returns a constructor: `local obj = require("editor_rallyEditor_recceTab")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:downsample()` | Replaces the recce's driveline with a version downsampled according to straightnessThreshold. | 54 |
| `C:draw(mouseInfo)` | Draws the tab (does nothing without a notebook). | 156 |
| `C:drawDebugEntrypoint(mouseInfo)` | 3D debug drawing: calls recce:drawDebugRecce with the labels option. | 161 |
| `C:drawSectionV3()` | Draws the UI: refresh, labels, driveline/cuts info, Import button, Downsample button and threshold slider. | 59 |
| `C:formatDistance(dist)` | Formats a distance as "123.456m", or in km above 950 m. | 43 |
| `C:import()` | Creates the pacenote data from the cuts, adds them to the notebook (appendPacenotes) and displays the Pacenotes tab. | 147 |
| `C:init(rallyEditor)` | Constructor: stores rallyEditor; recce = nil, drawLabels = false. | 14 |
| `C:refresh()` | Recreates the Recce object for the mission folder and loads the driveline and cuts; stores the original size. Logs an error on failure. | 138 |
| `C:selected()` | Called when the tab is selected: reloads the recce (refresh) and emits onEditorEditModeChanged(nil, nil). | 29 |
| `C:setPath(path)` | Sets the current notebook. | 24 |
| `C:unselect()` | Called when the tab is left: emits onEditorEditModeChanged(nil, nil). | 37 |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onEditorEditModeChanged` — listened to by 1 module(s)

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/rallyEditor/recceTab.lua`.*
