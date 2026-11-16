# `editor_toolUtilities_uiRows`

*File: `lua/ge/extensions/editor/toolUtilities/uiRows.lua` · VM: Game Engine (GE) · 121 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_toolUtilities_uiRows`: `extensions.load("editor_toolUtilities_uiRows")`, then the global `editor_toolUtilities_uiRows`

ImGui row shapes that the editor tool panels are made of: a slider preceded by its reset button, a label in front of a row of option buttons, and a sub-tab that closes with a separator line. Shared so the windows look alike (30 px column for the reset, labels 118 px wide). Uses the 'crystal' palette and util.beginSubTab/endSubTab.

## Example

```lua
local rows = require('editor/toolUtilities/uiRows')
rows.beginSliderRow('w', width == 4, function() width = 4 end)
im.SliderFloat('##w', widthPtr, 1, 10)
rows.endSliderRow()
```

## Notes

- beginSliderRow pushes a style (GrabMinSize 20), opens 2 columns and a PushItemWidth(-1); endSliderRow must always follow to close everything.
- optIcon falls back to the crop_square icon for an unknown name, because uiIconImageButton crashes on a nil icon.
- mixRow accepts rows { id, tip, icon } or positional arrays { id, tip, icon }.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_toolUtilities_uiRows.beginSliderRow(id, atDefault, onReset)` | Reset icon to the left of the slider (empty space if already at the default value). The caller draws the slider between beginSliderRow and endSliderRow. | 31 |
| `editor_toolUtilities_uiRows.beginSubTab(label, flags)` | Opens a sub-tab via util.beginSubTab and resets the separator memory. | 92 |
| `editor_toolUtilities_uiRows.endSliderRow()` | Closes the slider row (width, columns, style). | 45 |
| `editor_toolUtilities_uiRows.endSubTab()` | Closes a sub-tab with a separator line, unless the last thing drawn was already one or there is no vertical space left. | 99 |
| `editor_toolUtilities_uiRows.markSep()` | Draws the closing line of a list and remembers its position, so that the sub-tab containing it does not draw a second one just below. | 87 |
| `editor_toolUtilities_uiRows.mixRow(opts, id, has, offCol)` | Button row where several can be lit at the same time, for a choice that is a mix. `has(id)` tells which ones are lit. The tooltip says "In the mix" or not. | 70 |
| `editor_toolUtilities_uiRows.optIcon(name)` | Returns the editor icon of that name, or a plain square if it is unknown. | 63 |
| `editor_toolUtilities_uiRows.rowLabel(label, tip, col)` | Label to the left of a button row, followed by a SameLine at a fixed X (at least the label width). | 53 |

### Parameter details

#### `editor_toolUtilities_uiRows.beginSliderRow(id, atDefault, onReset)`

Reset icon to the left of the slider (empty space if already at the default value). The caller draws the slider between beginSliderRow and endSliderRow.

- `id` (*string*) : Base ImGui identifier.
- `atDefault` (*boolean*) : True: default value, no button.
- `onReset` (*function*) : Called when the reset button is clicked.

#### `editor_toolUtilities_uiRows.beginSubTab(label, flags)`

Opens a sub-tab via util.beginSubTab and resets the separator memory.

- `label` (*string*) : Title.
- `flags` (*integer|nil*) : ImGui flags passed to util.beginSubTab.
- **returns**: boolean True if the tab is open (inferred from code).

#### `editor_toolUtilities_uiRows.mixRow(opts, id, has, offCol)`

Button row where several can be lit at the same time, for a choice that is a mix. `has(id)` tells which ones are lit. The tooltip says "In the mix" or not.

- `opts` (*table*) : List of options { id, tip, icon } or positional triplets.
- `id` (*string*) : ImGui identifier prefix.
- `has` (*function*) : has(optId) returns true if the option is lit.
- `offCol` (*ImVec4*) : Color of the unlit button.
- **returns**: string|nil Identifier of the clicked option, nil otherwise.

#### `editor_toolUtilities_uiRows.optIcon(name)`

Returns the editor icon of that name, or a plain square if it is unknown.

- `name` (*string*) : Name in editor.icons.
- **returns**: any Icon.

#### `editor_toolUtilities_uiRows.rowLabel(label, tip, col)`

Label to the left of a button row, followed by a SameLine at a fixed X (at least the label width).

- `label` (*string*) : Text.
- `tip` (*string|nil*) : Tooltip.
- `col` (*ImVec4|nil*) : Color (greenB by default).

## Fields

| Field | Type | Description |
|---|---|---|
| `LABEL_COL_W` | number | Width of the label column (118), to align stacked button rows. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/toolUtilities/uiRows.lua`.*
