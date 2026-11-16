# `editor_rallyEditor_pacenotes_calibrationMetadataForm`

*File: `lua/ge/extensions/editor/rallyEditor/pacenotes/calibrationMetadataForm.lua` · VM: Game Engine (GE) · 160 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_rallyEditor_pacenotes_calibrationMetadataForm`: `extensions.load("editor_rallyEditor_pacenotes_calibrationMetadataForm")`, then the global `editor_rallyEditor_pacenotes_calibrationMetadataForm`

"Calibration Metadata" imgui form displayed in the pacenote editor. It lets you choose, for the selected pacenote, five calibration values (intensity, descriptor, direction, length, shape) via dropdowns fed by the notebook's text composer configuration (componentTypes.corner). The choices are stored in pacenote.metadata.calibration. Nothing is displayed if the notebook has no metadata.calibrationFields.

## Notes

- Choosing "-" removes the key; when the calibration table becomes empty, pacenote.metadata.calibration is reset to nil.
- The values saved for descriptor, direction, length and shape are the labels (text), not identifiers; only the intensity stores the identifier.
- Modifications do not use the editor's undo history.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_rallyEditor_pacenotes_calibrationMetadataForm.draw(pacenote, pacenoteToolsWindow)` | Draws the calibration metadata section for a pacenote. Does nothing if the pacenote has no notebook, if the notebook has no calibrationFields, or if the composer has no corner configuration. | 140 |

### Parameter details

#### `editor_rallyEditor_pacenotes_calibrationMetadataForm.draw(pacenote, pacenoteToolsWindow)`

Draws the calibration metadata section for a pacenote. Does nothing if the pacenote has no notebook, if the notebook has no calibrationFields, or if the composer has no corner configuration.

- `pacenote` (*table*) : Edited pacenote (accesses pacenote.notebook and pacenote.metadata).
- `pacenoteToolsWindow` (*table*) : Pacenote tools window (not used in the code).

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/rallyEditor/pacenotes/calibrationMetadataForm.lua`.*
