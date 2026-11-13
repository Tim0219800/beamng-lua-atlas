---@meta
-- tim19Atlas stub generated from lua/common/extensions/ui/imguiUtils.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `ui_imguiUtils` : `extensions.load("ui_imguiUtils")`, puis la globale `ui_imguiUtils`
---@class ui_imguiUtils
---@field sampleFloatDisplayState table
ui_imguiUtils = {}

--- Creates a simple Key/Value app with a lua table
---Source : lua/common/extensions/ui/imguiUtils.lua:305
---@param window any
---@param section any
---@param tbl any
---@param callback any
function ui_imguiUtils.CreateKeyValApp(window, section, tbl, callback) end

--- local flag = false
---Source : lua/common/extensions/ui/imguiUtils.lua:548
---@param sampleTimeInSeconds any
---@param startingValue any
---@param precision any
function ui_imguiUtils.CreateSampleFloatDisplay(sampleTimeInSeconds, startingValue, precision) end

---Source : lua/common/extensions/ui/imguiUtils.lua:61
---@param label any
---@param size any
---@param items any
---@param icon any
---@param horizontal any
function ui_imguiUtils.DropdownButton(label, size, items, icon, horizontal) end

---Source : lua/common/extensions/ui/imguiUtils.lua:43
---@param label any
---@param icon any
---@param func any
---@param tooltip any
function ui_imguiUtils.DropdownItem(label, icon, func, tooltip) end

---Source : lua/common/extensions/ui/imguiUtils.lua:194
---@param label any
---@param size any
---@param selectedItem any
---@param items any
---@param horizontal any
---@param excludeCurrent any
function ui_imguiUtils.DropdownSelect(label, size, selectedItem, items, horizontal, excludeCurrent) end

---Source : lua/common/extensions/ui/imguiUtils.lua:114
---@param label any
---@param items any
---@param icon any
---@param iconSize any
---@param popupWidth any
---@param onChangeFunc any
---@param tooltip any
---@param itemsRMB any
function ui_imguiUtils.DropdownSelectable(label, items, icon, iconSize, popupWidth, onChangeFunc, tooltip, itemsRMB) end

---Source : lua/common/extensions/ui/imguiUtils.lua:52
---@param label any
---@param active any
---@param func any
---@param tooltip any
function ui_imguiUtils.DropdownSelectableItem(label, active, func, tooltip) end

--- check if a window with given pos and size is hovered
---  local windowPos = im.GetWindowPos()
---  local windowSize = im.GetWindowSize()
---Source : lua/common/extensions/ui/imguiUtils.lua:276
---@param windowPos any
---@param windowSize any
function ui_imguiUtils.IsWindowHovered(windowPos, windowSize) end

--- imguiUtils.SampleFloatDisplay('engineLoad' .. device.name, device.engineLoad, 0.8)
---Source : lua/common/extensions/ui/imguiUtils.lua:607
---@param id any
---@param value any
---@param sampleTimeInSeconds any
---@param precision any
function ui_imguiUtils.SampleFloatDisplay(id, value, sampleTimeInSeconds, precision) end

---Source : lua/common/extensions/ui/imguiUtils.lua:418
---@param data any
---@param fullpath any
---@param noColumns any
---@param highlightCallback any
---@param itemCallback any
function ui_imguiUtils.addRecursiveTreeTable(data, fullpath, noColumns, highlightCallback, itemCallback) end

---Source : lua/common/extensions/ui/imguiUtils.lua:487
---@param a any
---@param b any
function ui_imguiUtils.cell(a, b) end

---Source : lua/common/extensions/ui/imguiUtils.lua:10
---@param uiscale any
function ui_imguiUtils.changeUIScale(uiscale) end

--- displays key/values aof a lua table
---Source : lua/common/extensions/ui/imguiUtils.lua:286
---@param tbl any
function ui_imguiUtils.displayKeyValues(tbl) end

---Source : lua/common/extensions/ui/imguiUtils.lua:26
---@param posX any
---@param posY any
function ui_imguiUtils.drawCursorPos(posX, posY) end

---Source : lua/common/extensions/ui/imguiUtils.lua:351
---@param data any
---@param fullpath any
---@param highlightCallback any
---@param itemCallback any
function ui_imguiUtils.keyValueTable(data, fullpath, highlightCallback, itemCallback) end

---Source : lua/common/extensions/ui/imguiUtils.lua:33
---@param path any
function ui_imguiUtils.texObj(path) end

--- Classe locale `ValueSampler` de lua/common/extensions/ui/imguiUtils.lua
---@class ui_imguiUtils_ValueSampler
local ui_imguiUtils_ValueSampler = {}

---Source : lua/common/extensions/ui/imguiUtils.lua:523
---@param sample any
function ui_imguiUtils_ValueSampler:get(sample) end

---Source : lua/common/extensions/ui/imguiUtils.lua:534
function ui_imguiUtils_ValueSampler:reset() end

