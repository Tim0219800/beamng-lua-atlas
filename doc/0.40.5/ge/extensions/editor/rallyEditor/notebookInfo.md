# `editor_rallyEditor_notebookInfo`

*File: `lua/ge/extensions/editor/rallyEditor/notebookInfo.lua` · VM: Game Engine (GE) · 242 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/editor/rallyEditor/notebookInfo")` (file under extensions/ but not a regular extension)

"Notebook" tab of the rally editor. It displays the current notebook's information (id, file, validation issues) and lets you change its name, authors, description and default audio mode, each change going through the editor's undo history. It also contains the "Calibration Metadata Fields" section (definition of calibration fields at notebook level) and the "Ghost Notebook" selector. The module returns a constructor (class C).

## Notes

- The calibration fields initialized by the "Initialize Calibration Fields" button are: cornerIntensity, cornerDescriptor, direction, cornerLength, shape (stored in notebook.metadata.calibrationFields).
- The offered audio mode excludes 'auto' and the hidden modes (RallyEnums.pacenoteAudioModeHidden).
- Inconsistency: in selected(), the description field is recreated with a 1024-character buffer whereas clearState() and the initial declaration use 2048.
- The text field variables are file locals (shared by all instances).

## Class `C`

Tab object returned by the constructor (new(rallyEditor)). Fields: rallyEditor, path (edited notebook), valid, windowDescription = 'Notebook'.

The module returns a constructor: `local obj = require("editor_rallyEditor_notebookInfo")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:clearState()` | Forgets the notebook and empties the text fields. | 34 |
| `C:draw(mouseInfo)` | Draws the tab (delegates to drawNotebook). | 78 |
| `C:drawCalibrationMetadataFields()` | Displays the calibration fields defined in the notebook, or a button to initialize them if they do not exist. | 142 |
| `C:drawGhostNotebook()` | Draws the ghost notebook selector (list of choices, "(none)" option, error message) by calling the rally editor's ghostNotebook functions. | 96 |
| `C:drawNotebook()` | Validates then draws the notebook information (any errors, id, file), the editable fields with undo/redo, the audio mode, then the calibration and ghost sections. | 165 |
| `C:init(rallyEditor)` | Internal constructor: stores the editor, valid = true. | 29 |
| `C:isValid()` | Returns the result of the last validation. | 42 |
| `C:selected()` | Called by the editor when the tab is selected: copies the notebook's name, authors and description into the fields, then emits onEditorEditModeChanged(nil, nil) to redraw the shortcut legend. | 60 |
| `C:setPath(path)` | Sets the notebook edited by the tab. | 55 |
| `C:unselect()` | Called when the tab is left: emits onEditorEditModeChanged(nil, nil). | 72 |
| `C:validate()` | Runs path:validate() and updates valid according to path:is_valid(). The issues are in path.validation_issues. | 46 |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onEditorEditModeChanged` — listened to by 1 module(s)

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/rallyEditor/notebookInfo.lua`.*
