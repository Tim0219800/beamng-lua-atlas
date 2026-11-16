# `ui_imguiUtils`

*File: `lua/common/extensions/ui/imguiUtils.lua` · VM: Common (GE + vehicle) · 616 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_imguiUtils`: `extensions.load("ui_imguiUtils")`, then the global `ui_imguiUtils`

High-level ImGui toolbox (ui_imguiUtils): UI scale change, texture loading, dropdown menu buttons (DropdownButton/Selectable/Select), recursive display of a Lua table as a tree or in key/value columns, a small key/value app, and display of a sampled float with min/max (SampleFloatDisplay). Useful for a modder's ImGui debug tools. Everything goes through ui_imgui; some functions assume the editor is present (editor.uiIconImageButton).

## Example

```lua
local iu = ui_imguiUtils
-- in an ImGui callback:
iu.SampleFloatDisplay('rpm', electrics.values.rpm, 0.5, 1)
iu.addRecursiveTreeTable(myTable, '/my', false)
```

## Notes

- DropdownButton, DropdownSelectable and DropdownSelect call editor.uiIconImageButton when an icon is provided: this requires the editor (global editor) to be loaded.
- DropdownSelectable uses imgui.tooltip, defined in imgui_custom_luaintf.
- SampleFloatDisplay stores a state per ImGui id (GetID1) in sampleFloatDisplayState and feeds dataTbl on every call without ever emptying it: slow memory leak if used continuously.
- CreateSampleFloatDisplay: the PlotLines graph is commented out; only the text is displayed. Right click = reset, PageUp/PageDown = interval ±0.05 s (hover only).
- addRecursiveTreeTable: sub-tables with more than 3 elements at depth > 2 are collapsed in a CollapsingHeader. float3 userdata are displayed as float3(x,y,z), functions list their local variables.
- renderSubTree uses the global variable noColumns (not defined in the local scope, hence nil): the noColumns option is not propagated to sub-levels.
- keyValueTable calls imgui.Columns(2, tostring(k)) with a variable k not defined at that point (nil): the columns id is therefore "nil".
- IsWindowHovered expects windowSize as an ImVec2 pointer (windowSize[0].x), not as a plain ImVec2.
- changeUIScale multiplies the scale by GetWindowDpiScale() unless the editor is present with the preference ui.general.dpiAware set to false; it writes imgui.uiscale[0] and FontGlobalScale.
- The local functions pointToLine, getlocal, testTableRecursive etc. are not exported.

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_imguiUtils.CreateKeyValApp(window, section, tbl, callback)` | Creates a simple ImGui window with a TreeNode that displays a Lua table key/value. | 305 |
| `ui_imguiUtils.CreateSampleFloatDisplay(sampleTimeInSeconds, startingValue, precision)` | Creates a sampled float display: the returned object has a draw(newValue) method that shows the value sampled every sampleTime seconds, with a tooltip (last, sampled, min, max). | 548 |
| `ui_imguiUtils.DropdownButton(label, size, items, icon, horizontal)` | Displays a button (text or icon) that opens a popup listing DropdownItem items, to be placed below the button or to its right (horizontal). | 61 |
| `ui_imguiUtils.DropdownItem(label, icon, func, tooltip)` | Creates an item for DropdownButton. | 43 |
| `ui_imguiUtils.DropdownSelect(label, size, selectedItem, items, horizontal, excludeCurrent)` | Dropdown list: the button shows the current item items[selectedItem[0]]; the popup lets you choose another. | 194 |
| `ui_imguiUtils.DropdownSelectable(label, items, icon, iconSize, popupWidth, onChangeFunc, tooltip, itemsRMB)` | Button opening a popup of checkable items (DropdownSelectableItem); right click can open a second menu (itemsRMB). | 114 |
| `ui_imguiUtils.DropdownSelectableItem(label, active, func, tooltip)` | Creates an item for DropdownSelectable. | 52 |
| `ui_imguiUtils.IsWindowHovered(windowPos, windowSize)` | Tests whether the mouse is inside a given window rectangle (position + size). | 276 |
| `ui_imguiUtils.SampleFloatDisplay(id, value, sampleTimeInSeconds, precision)` | One-line version of CreateSampleFloatDisplay: creates the display on first use (key = imgui.GetID1(id)), then draws it with value. | 607 |
| `ui_imguiUtils.addRecursiveTreeTable(data, fullpath, noColumns, highlightCallback, itemCallback)` | Displays any Lua value: tables as a tree or in columns, colored booleans/numbers/strings, float3, functions (names of local variables), other types with tostring. | 418 |
| `ui_imguiUtils.cell(a, b)` | Displays two texts in two column cells (Text then NextColumn twice). | 487 |
| `ui_imguiUtils.changeUIScale(uiscale)` | Sets the ImGui UI scale (imgui.uiscale[0]) and the IO's FontGlobalScale, taking the window's DPI scaling into account according to the editor preference. | 10 |
| `ui_imguiUtils.displayKeyValues(tbl)` | Displays the key: value pairs of a Lua table; sub-tables become recursive TreeNodes. | 286 |
| `ui_imguiUtils.drawCursorPos(posX, posY)` | Draws a small red cross (8 px) at a screen position, by default the current ImGui cursor position; used to debug placement. | 26 |
| `ui_imguiUtils.keyValueTable(data, fullpath, highlightCallback, itemCallback)` | Displays a table in two columns (sorted keys / recursive values). | 351 |
| `ui_imguiUtils.texObj(path)` | Loads a texture via ImTextureHandler and returns a table usable with ImGui. | 33 |

### Parameter details

#### `ui_imguiUtils.CreateKeyValApp(window, section, tbl, callback)`

Creates a simple ImGui window with a TreeNode that displays a Lua table key/value.

- `window` (*string*) : Window title.
- `section` (*string*) : TreeNode title.
- `tbl` (*table*) : Table to display.
- `callback` (*function|nil*) : Called when the TreeNode is open, before display.

#### `ui_imguiUtils.CreateSampleFloatDisplay(sampleTimeInSeconds, startingValue, precision)`

Creates a sampled float display: the returned object has a draw(newValue) method that shows the value sampled every sampleTime seconds, with a tooltip (last, sampled, min, max).

- `sampleTimeInSeconds` (*number|nil*) : Sampling interval, 1 by default.
- `startingValue` (*number|nil*) : Initial value, 0 by default.
- `precision` (*integer|nil*) : Decimals, 6 by default.
- **returns**: table ValueSampler with precision and draw.

#### `ui_imguiUtils.DropdownButton(label, size, items, icon, horizontal)`

Displays a button (text or icon) that opens a popup listing DropdownItem items, to be placed below the button or to its right (horizontal).

- `label` (*string*) : Button text.
- `size` (*ImVec2|nil*) : Button size.
- `items` (*table*) : List of DropdownItem items.
- `icon` (*any|nil*) : Icon; otherwise text button.
- `horizontal` (*boolean|nil*) : Popup to the right rather than below, items on one line.
- **returns**: boolean See the code: returns false in the observed paths.

#### `ui_imguiUtils.DropdownItem(label, icon, func, tooltip)`

Creates an item for DropdownButton.

- `label` (*string*) : Text.
- `icon` (*any|nil*) : Icon.
- `func` (*function*) : Callback called on selection.
- `tooltip` (*string|nil*) : Tooltip.
- **returns**: table {label, icon, func, tooltip}.

#### `ui_imguiUtils.DropdownSelect(label, size, selectedItem, items, horizontal, excludeCurrent)`

Dropdown list: the button shows the current item items[selectedItem[0]]; the popup lets you choose another.

- `label` (*string*) : ImGui identifier (appended after ##).
- `size` (*ImVec2|nil*) : Button size.
- `selectedItem` (*table*) : Integer pointer (IntPtr), index [0] = selected item.
- `items` (*table*) : List of items with label and icon.
- `horizontal` (*boolean|nil*) : Popup to the right.
- `excludeCurrent` (*boolean|nil*) : Hides the current item in the list (inferred from the name).
- **returns**: boolean See the code; false by default.

#### `ui_imguiUtils.DropdownSelectable(label, items, icon, iconSize, popupWidth, onChangeFunc, tooltip, itemsRMB)`

Button opening a popup of checkable items (DropdownSelectableItem); right click can open a second menu (itemsRMB).

- `label` (*string*) : Button text.
- `items` (*table*) : DropdownSelectableItem items.
- `icon` (*any|nil*) : Icon, otherwise SmallButton.
- `iconSize` (*ImVec2|nil*) : Icon size before UI scaling, 32x32 by default.
- `popupWidth` (*number|nil*) : Popup width.
- `onChangeFunc` (*function|nil*) : Change callback.
- `tooltip` (*string|nil*) : Tooltip.
- `itemsRMB` (*table|nil*) : Right-click menu items.
- **returns**: boolean false in the observed paths.

#### `ui_imguiUtils.DropdownSelectableItem(label, active, func, tooltip)`

Creates an item for DropdownSelectable.

- `label` (*string*) : Text.
- `active` (*boolean*) : Selected state.
- `func` (*function*) : Callback called on selection.
- `tooltip` (*string|nil*) : Tooltip.
- **returns**: table {label, active, func, tooltip}.

#### `ui_imguiUtils.IsWindowHovered(windowPos, windowSize)`

Tests whether the mouse is inside a given window rectangle (position + size).

- `windowPos` (*ImVec2*) : Position, e.g. im.GetWindowPos().
- `windowSize` (*table*) : Size as a pointer: windowSize[0].x / .y are used.
- **returns**: boolean True if the mouse is strictly inside.

#### `ui_imguiUtils.SampleFloatDisplay(id, value, sampleTimeInSeconds, precision)`

One-line version of CreateSampleFloatDisplay: creates the display on first use (key = imgui.GetID1(id)), then draws it with value.

- `id` (*string*) : Unique identifier of the display.
- `value` (*number*) : Current value.
- `sampleTimeInSeconds` (*number|nil*) : Interval (first creation).
- `precision` (*integer|nil*) : Decimals (first creation).

#### `ui_imguiUtils.addRecursiveTreeTable(data, fullpath, noColumns, highlightCallback, itemCallback)`

Displays any Lua value: tables as a tree or in columns, colored booleans/numbers/strings, float3, functions (names of local variables), other types with tostring.

- `data` (*any*) : Value to display.
- `fullpath` (*string*) : Current path; the number of '/' gives the depth.
- `noColumns` (*boolean|nil*) : Forces the tree instead of columns.
- `highlightCallback` (*function|nil*) : Hover callback.
- `itemCallback` (*function|nil*) : Per-entry begin/end callback.

#### `ui_imguiUtils.cell(a, b)`

Displays two texts in two column cells (Text then NextColumn twice).

- `a` (*string*) : Column 1 text.
- `b` (*string*) : Column 2 text.

#### `ui_imguiUtils.changeUIScale(uiscale)`

Sets the ImGui UI scale (imgui.uiscale[0]) and the IO's FontGlobalScale, taking the window's DPI scaling into account according to the editor preference.

- `uiscale` (*number*) : Desired scale (1 = 100%).

#### `ui_imguiUtils.displayKeyValues(tbl)`

Displays the key: value pairs of a Lua table; sub-tables become recursive TreeNodes.

- `tbl` (*table|nil*) : Table to display.

#### `ui_imguiUtils.drawCursorPos(posX, posY)`

Draws a small red cross (8 px) at a screen position, by default the current ImGui cursor position; used to debug placement.

- `posX` (*number|nil*) : Screen X; default: window position + cursor X.
- `posY` (*number|nil*) : Screen Y; default: window position + cursor Y.

#### `ui_imguiUtils.keyValueTable(data, fullpath, highlightCallback, itemCallback)`

Displays a table in two columns (sorted keys / recursive values).

- `data` (*table*) : Table.
- `fullpath` (*string*) : Current path (e.g. '/root'), used for ImGui ids.
- `highlightCallback` (*function|nil*) : Called (path, key, value) when an item is hovered.
- `itemCallback` (*function|nil*) : Called (begin, path, key, value) before (true) then after (false) each entry; the return value of the begin call decides whether the entry is displayed.

#### `ui_imguiUtils.texObj(path)`

Loads a texture via ImTextureHandler and returns a table usable with ImGui.

- `path` (*string*) : Image path, e.g. '/ui/...png'.
- **returns**: table {file = file name, path, tex = ImTextureHandler, texId (legacy, do not use), size = size}.

## Fields

| Field | Type | Description |
|---|---|---|
| `sampleFloatDisplayState` | table | States of the sampled displays, keyed by ImGui id. |

## Class `ValueSampler`

Internal object returned by CreateSampleFloatDisplay: measures time, stores the sampled value st and the observed min/max.

| Method | Description | Line |
|---|---|---|
| `ValueSampler:get(sample)` | Adds the elapsed time, updates min/max with the sample, and returns the sampled value. | 523 |
| `ValueSampler:reset()` | Resets min/max, sampled value and time to zero. | 534 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/extensions/ui/imguiUtils.lua`.*
