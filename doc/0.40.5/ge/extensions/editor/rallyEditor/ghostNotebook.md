# `editor_rallyEditor_ghostNotebook`

*File: `lua/ge/extensions/editor/rallyEditor/ghostNotebook.lua` · VM: Game Engine (GE) · 351 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/editor/rallyEditor/ghostNotebook")` (file under extensions/ but not a regular extension)

Manages the rally editor's "ghost notebook": a second notebook (or the active notebook's calibration metadata) whose notes are displayed as text in the 3D view, for comparison with the notebook being edited. The module returns a constructor (class C). It lists the notebooks available in the mission folder, loads one, and computes a short label per pacenote (legacy English text, composer output, structured elements, or name). Rendering is done by ghostRenderer.

## Example

```lua
local ghost = require('/lua/ge/extensions/editor/rallyEditor/ghostNotebook')(rallyEditor)
for _, c in ipairs(ghost:listChoices()) do print(c.label) end
if ghost:select('<metadata>') then print(ghost:getSelectedLabel()) end
```

## Notes

- Special choice '<metadata>': the ghost is then the pacenotes window's active notebook, and the label comes from pacenote.metadata.calibration (descriptor/intensity, direction, length, shape).
- Priority order of a pacenote's label: custom audio, legacy English text (notes.english), structured composer output, structured elements, then pacenote.name.
- Calls to the composer are protected by pcall: an error simply gives an empty or nil label.
- Labels are cached at select() in self.labels (keyed by pacenote.id); in '<metadata>' mode they are recomputed on every call.

## Class `C`

Object returned by the module constructor (new(rallyEditor)). Fields: rallyEditor, selectedFname, path (loaded notebook), labels (table id -> label), error (message or nil).

The module returns a constructor: `local obj = require("editor_rallyEditor_ghostNotebook")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:activeNotebook()` | Returns the notebook currently being edited (path field of the pacenotes window), or nil. | 282 |
| `C:clear()` | Forgets the selected ghost notebook, its path, labels and error. | 249 |
| `C:clearState()` | Alias of clear(), called by the editor on a state reset. | 256 |
| `C:getError()` | Returns the last load error message. | 333 |
| `C:getLabelForPacenote(pacenote)` | Returns the text to display for a ghost pacenote. In '<metadata>' mode, builds the label from the calibration metadata (empty string if absent); otherwise uses the cache then recomputes. | 337 |
| `C:getPath()` | Returns the loaded ghost notebook. | 320 |
| `C:getSelectedFname()` | Returns the selected file name (or '<metadata>'). | 324 |
| `C:getSelectedLabel()` | Returns the display label of the selected ghost, or '(none)' if nothing is selected. | 328 |
| `C:init(rallyEditor)` | Internal constructor: stores the editor and resets the state. | 244 |
| `C:listChoices()` | Lists the selectable ghosts: first the '<metadata>' entry, then each notebook in the mission folder. Returns an empty table if there is no current mission. | 260 |
| `C:select(fname)` | Loads the indicated ghost notebook ('<metadata>' = active notebook), refreshes its structured notes and precomputes the labels. An empty or nil name clears the selection. On failure, fills self.error and logs an error. | 287 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/rallyEditor/ghostNotebook.lua`.*
