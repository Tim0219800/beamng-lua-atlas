---@meta
-- tim19Atlas stub generated from lua/common/extensions/ui/imguiUtils.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- High-level ImGui toolbox (ui_imguiUtils): UI scale change, texture loading, dropdown menu buttons (DropdownButton/Selectable/Select), recursive display of a Lua table as a tree or in key/value columns, a small key/value app, and display of a sampled float with min/max (SampleFloatDisplay). Useful for a modder's ImGui debug tools. Everything goes through ui_imgui; some functions assume the editor is present (editor.uiIconImageButton).
--- Access: extension `ui_imguiUtils`: `extensions.load("ui_imguiUtils")`, then the global `ui_imguiUtils`
---@class ui_imguiUtils
---@field sampleFloatDisplayState table States of the sampled displays, keyed by ImGui id.
ui_imguiUtils = {}

--- Creates a simple ImGui window with a TreeNode that displays a Lua table key/value.
---Source: lua/common/extensions/ui/imguiUtils.lua:305
---@param window string Window title.
---@param section string TreeNode title.
---@param tbl table Table to display.
---@param callback function|nil Called when the TreeNode is open, before display.
function ui_imguiUtils.CreateKeyValApp(window, section, tbl, callback) end

--- Creates a sampled float display: the returned object has a draw(newValue) method that shows the value sampled every sampleTime seconds, with a tooltip (last, sampled, min, max).
---Source: lua/common/extensions/ui/imguiUtils.lua:548
---@param sampleTimeInSeconds number|nil Sampling interval, 1 by default.
---@param startingValue number|nil Initial value, 0 by default.
---@param precision integer|nil Decimals, 6 by default.
---@return table  ValueSampler with precision and draw.
function ui_imguiUtils.CreateSampleFloatDisplay(sampleTimeInSeconds, startingValue, precision) end

--- Displays a button (text or icon) that opens a popup listing DropdownItem items, to be placed below the button or to its right (horizontal).
---Source: lua/common/extensions/ui/imguiUtils.lua:61
---@param label string Button text.
---@param size ImVec2|nil Button size.
---@param items table List of DropdownItem items.
---@param icon any|nil Icon; otherwise text button.
---@param horizontal boolean|nil Popup to the right rather than below, items on one line.
---@return boolean  See the code: returns false in the observed paths.
function ui_imguiUtils.DropdownButton(label, size, items, icon, horizontal) end

--- Creates an item for DropdownButton.
---Source: lua/common/extensions/ui/imguiUtils.lua:43
---@param label string Text.
---@param icon any|nil Icon.
---@param func function Callback called on selection.
---@param tooltip string|nil Tooltip.
---@return table  {label, icon, func, tooltip}.
function ui_imguiUtils.DropdownItem(label, icon, func, tooltip) end

--- Dropdown list: the button shows the current item items[selectedItem[0]]; the popup lets you choose another.
---Source: lua/common/extensions/ui/imguiUtils.lua:194
---@param label string ImGui identifier (appended after ##).
---@param size ImVec2|nil Button size.
---@param selectedItem table Integer pointer (IntPtr), index [0] = selected item.
---@param items table List of items with label and icon.
---@param horizontal boolean|nil Popup to the right.
---@param excludeCurrent boolean|nil Hides the current item in the list (inferred from the name).
---@return boolean  See the code; false by default.
function ui_imguiUtils.DropdownSelect(label, size, selectedItem, items, horizontal, excludeCurrent) end

--- Button opening a popup of checkable items (DropdownSelectableItem); right click can open a second menu (itemsRMB).
---Source: lua/common/extensions/ui/imguiUtils.lua:114
---@param label string Button text.
---@param items table DropdownSelectableItem items.
---@param icon any|nil Icon, otherwise SmallButton.
---@param iconSize ImVec2|nil Icon size before UI scaling, 32x32 by default.
---@param popupWidth number|nil Popup width.
---@param onChangeFunc function|nil Change callback.
---@param tooltip string|nil Tooltip.
---@param itemsRMB table|nil Right-click menu items.
---@return boolean  false in the observed paths.
function ui_imguiUtils.DropdownSelectable(label, items, icon, iconSize, popupWidth, onChangeFunc, tooltip, itemsRMB) end

--- Creates an item for DropdownSelectable.
---Source: lua/common/extensions/ui/imguiUtils.lua:52
---@param label string Text.
---@param active boolean Selected state.
---@param func function Callback called on selection.
---@param tooltip string|nil Tooltip.
---@return table  {label, active, func, tooltip}.
function ui_imguiUtils.DropdownSelectableItem(label, active, func, tooltip) end

--- Tests whether the mouse is inside a given window rectangle (position + size).
---Source: lua/common/extensions/ui/imguiUtils.lua:276
---@param windowPos ImVec2 Position, e.g. im.GetWindowPos().
---@param windowSize table Size as a pointer: windowSize[0].x / .y are used.
---@return boolean  True if the mouse is strictly inside.
function ui_imguiUtils.IsWindowHovered(windowPos, windowSize) end

--- One-line version of CreateSampleFloatDisplay: creates the display on first use (key = imgui.GetID1(id)), then draws it with value.
---Source: lua/common/extensions/ui/imguiUtils.lua:607
---@param id string Unique identifier of the display.
---@param value number Current value.
---@param sampleTimeInSeconds number|nil Interval (first creation).
---@param precision integer|nil Decimals (first creation).
function ui_imguiUtils.SampleFloatDisplay(id, value, sampleTimeInSeconds, precision) end

--- Displays any Lua value: tables as a tree or in columns, colored booleans/numbers/strings, float3, functions (names of local variables), other types with tostring.
---Source: lua/common/extensions/ui/imguiUtils.lua:418
---@param data any Value to display.
---@param fullpath string Current path; the number of '/' gives the depth.
---@param noColumns boolean|nil Forces the tree instead of columns.
---@param highlightCallback function|nil Hover callback.
---@param itemCallback function|nil Per-entry begin/end callback.
function ui_imguiUtils.addRecursiveTreeTable(data, fullpath, noColumns, highlightCallback, itemCallback) end

--- Displays two texts in two column cells (Text then NextColumn twice).
---Source: lua/common/extensions/ui/imguiUtils.lua:487
---@param a string Column 1 text.
---@param b string Column 2 text.
function ui_imguiUtils.cell(a, b) end

--- Sets the ImGui UI scale (imgui.uiscale[0]) and the IO's FontGlobalScale, taking the window's DPI scaling into account according to the editor preference.
---Source: lua/common/extensions/ui/imguiUtils.lua:10
---@param uiscale number Desired scale (1 = 100%).
function ui_imguiUtils.changeUIScale(uiscale) end

--- Displays the key: value pairs of a Lua table; sub-tables become recursive TreeNodes.
---Source: lua/common/extensions/ui/imguiUtils.lua:286
---@param tbl table|nil Table to display.
function ui_imguiUtils.displayKeyValues(tbl) end

--- Draws a small red cross (8 px) at a screen position, by default the current ImGui cursor position; used to debug placement.
---Source: lua/common/extensions/ui/imguiUtils.lua:26
---@param posX number|nil Screen X; default: window position + cursor X.
---@param posY number|nil Screen Y; default: window position + cursor Y.
function ui_imguiUtils.drawCursorPos(posX, posY) end

--- Displays a table in two columns (sorted keys / recursive values).
---Source: lua/common/extensions/ui/imguiUtils.lua:351
---@param data table Table.
---@param fullpath string Current path (e.g. '/root'), used for ImGui ids.
---@param highlightCallback function|nil Called (path, key, value) when an item is hovered.
---@param itemCallback function|nil Called (begin, path, key, value) before (true) then after (false) each entry; the return value of the begin call decides whether the entry is displayed.
function ui_imguiUtils.keyValueTable(data, fullpath, highlightCallback, itemCallback) end

--- Loads a texture via ImTextureHandler and returns a table usable with ImGui.
---Source: lua/common/extensions/ui/imguiUtils.lua:33
---@param path string Image path, e.g. '/ui/...png'.
---@return table  {file = file name, path, tex = ImTextureHandler, texId (legacy, do not use), size = size}.
function ui_imguiUtils.texObj(path) end

--- Internal object returned by CreateSampleFloatDisplay: measures time, stores the sampled value st and the observed min/max.
---@class ui_imguiUtils_ValueSampler
local ui_imguiUtils_ValueSampler = {}

--- Adds the elapsed time, updates min/max with the sample, and returns the sampled value.
---Source: lua/common/extensions/ui/imguiUtils.lua:523
---@param sample number Current value.
---@return number  Sampled value (updated every sampleTime seconds).
---@return number  Observed minimum.
---@return number  Observed maximum.
function ui_imguiUtils_ValueSampler:get(sample) end

--- Resets min/max, sampled value and time to zero.
---Source: lua/common/extensions/ui/imguiUtils.lua:534
function ui_imguiUtils_ValueSampler:reset() end

