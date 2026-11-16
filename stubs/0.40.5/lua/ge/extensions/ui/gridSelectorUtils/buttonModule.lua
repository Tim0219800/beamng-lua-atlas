---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/gridSelectorUtils/buttonModule.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Small grid selector utility: manages a registry of action buttons. Each button gets an incremental numeric identifier and a callback; the UI sends the identifier back to trigger the action. `create()` returns an independent instance.
--- Access: extension `ui_gridSelectorUtils_buttonModule`: `extensions.load("ui_gridSelectorUtils_buttonModule")`, then the global `ui_gridSelectorUtils_buttonModule`
---@class ui_gridSelectorUtils_buttonModule
ui_gridSelectorUtils_buttonModule = {}

--- Creates a button management instance with its own counter and its own table.
---Source: lua/ge/extensions/ui/gridSelectorUtils/buttonModule.lua:4
---@return table  Instance with getFreeButtonId, clearButtonFunctions, addButton, executeButton, getButtonInfo, getAllButtonInfos.
function ui_gridSelectorUtils_buttonModule.create() end

--- Object returned by create().
---@class ui_gridSelectorUtils_buttonModule_instance
local ui_gridSelectorUtils_buttonModule_instance = {}

--- Registers a callback and returns its meta enriched with `buttonId`.
---Source: lua/ge/extensions/ui/gridSelectorUtils/buttonModule.lua:dyn
---@param callback function Called with additionalData on execution.
---@param meta table|nil Button metadata (label, etc.).
---@return table  meta with buttonId.
function ui_gridSelectorUtils_buttonModule_instance:addButton(callback, meta) end

--- Empties the button table (the counter is not reset).
---Source: lua/ge/extensions/ui/gridSelectorUtils/buttonModule.lua:dyn
function ui_gridSelectorUtils_buttonModule_instance:clearButtonFunctions() end

--- Executes the button's callback and returns its result.
---Source: lua/ge/extensions/ui/gridSelectorUtils/buttonModule.lua:dyn
---@param buttonId integer Button identifier.
---@param additionalData any Passed to the callback.
---@return any  Value returned by the callback, nil if the button is unknown.
function ui_gridSelectorUtils_buttonModule_instance:executeButton(buttonId, additionalData) end

--- Returns the full button table keyed by identifier.
---Source: lua/ge/extensions/ui/gridSelectorUtils/buttonModule.lua:dyn
---@return table<integer, table>  All buttons.
function ui_gridSelectorUtils_buttonModule_instance:getAllButtonInfos() end

--- Returns { callback, meta } of a button.
---Source: lua/ge/extensions/ui/gridSelectorUtils/buttonModule.lua:dyn
---@param buttonId integer Button identifier.
---@return table|nil  Button info.
function ui_gridSelectorUtils_buttonModule_instance:getButtonInfo(buttonId) end

--- Increments the counter and returns a new identifier.
---Source: lua/ge/extensions/ui/gridSelectorUtils/buttonModule.lua:dyn
---@return integer  New identifier.
function ui_gridSelectorUtils_buttonModule_instance:getFreeButtonId() end

