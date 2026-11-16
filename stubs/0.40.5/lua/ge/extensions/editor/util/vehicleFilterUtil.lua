---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/util/vehicleFilterUtil.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Instance bound to an editor `element`.
---@class editor_util_vehicleFilterUtil
local editor_util_vehicleFilterUtil = {}

--- Draws the full filter editor (eligibility options, base filter, probability settings, manual additions/removals, preview of the resulting vehicles).
---Source: lua/ge/extensions/editor/util/vehicleFilterUtil.lua:785
---@param ctd table Container data.
---@param container table Parent container.
---@param labelFn function Function called with the element to draw its label.
---@return boolean  true if a value was modified.
function editor_util_vehicleFilterUtil:draw(ctd, container, labelFn) end

--- Constructor: remembers the element and loads (once) the configListGenerator module.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/util/vehicleFilterUtil.lua:565
---@param element table UI element definition (fieldName, _id, ...).
function editor_util_vehicleFilterUtil:init(element) end

--- Prepares the filter data only once (filterByProp, filterUiData), initializes baseFilter/probabilitySettings and generates the initial list of vehicle options.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/util/vehicleFilterUtil.lua:581
function editor_util_vehicleFilterUtil:initialize() end

--- Restores the filter from ctd[element.fieldName] (deep copy) or the default values, then clears all caches for regeneration.
---Source: lua/ge/extensions/editor/util/vehicleFilterUtil.lua:727
---@param ctd table Container data.
---@param container table Parent container (unused).
function editor_util_vehicleFilterUtil:setContainer(ctd, container) end

