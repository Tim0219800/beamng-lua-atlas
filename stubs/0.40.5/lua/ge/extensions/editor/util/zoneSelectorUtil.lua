---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/util/zoneSelectorUtil.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Instance bound to an editor `element`.
---@class editor_util_zoneSelectorUtil
local editor_util_zoneSelectorUtil = {}

--- Draws the interface: add combos, Select All / Remove All buttons, lists with Remove button, summary. Writes the lists into ctd.
---Source: lua/ge/extensions/editor/util/zoneSelectorUtil.lua:93
---@param ctd table Container data.
---@param container table Parent container (unused here).
---@param labelFn function Function called with the element to draw its label.
---@return boolean  true if a list was modified.
function editor_util_zoneSelectorUtil:draw(ctd, container, labelFn) end

--- Constructor: remembers the element.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/util/zoneSelectorUtil.lua:11
---@param element table UI element definition (fieldName, globalInfoFolderFieldName...).
function editor_util_zoneSelectorUtil:init(element) end

--- Loads the zone names from `<global folder>/garages.sites.json` (only once per file) into element.loadedZones.
---Source: lua/ge/extensions/editor/util/zoneSelectorUtil.lua:15
---@param ctd table Container data containing the global folder.
function editor_util_zoneSelectorUtil:loadZonesFromSitesFile(ctd) end

--- Reads initialZones/destinationZones from ctd and resets the loading state to force a reload.
---Source: lua/ge/extensions/editor/util/zoneSelectorUtil.lua:82
---@param ctd table Container data.
function editor_util_zoneSelectorUtil:setContainer(ctd) end

