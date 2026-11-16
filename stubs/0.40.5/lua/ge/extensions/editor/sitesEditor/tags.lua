---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/sitesEditor/tags.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Object returned by the constructor. Fields: sitesEditor, key, sites, tag, tags, sortedTags, hasTag, noTag.
---@class editor_sitesEditor_tags
local editor_sitesEditor_tags = {}

--- Draws the tab (calls drawGeneralInfo). Called with mouseInfo by sitesEditor but the method ignores it.
---Source: lua/ge/extensions/editor/sitesEditor/tags.lua:35
function editor_sitesEditor_tags:draw() end

--- Draws the tag list and the two management columns of the chosen tag.
---Source: lua/ge/extensions/editor/sitesEditor/tags.lua:52
function editor_sitesEditor_tags:drawGeneralInfo() end

--- Constructor (called by the module).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/sitesEditor/tags.lua:9
---@param sitesEditor table editor_sitesEditor module.
---@param key string 'locations', 'zones' or 'parkingSpots'.
function editor_sitesEditor_tags:init(sitesEditor, key) end

--- Chooses a tag and splits the elements into hasTag and noTag.
---Source: lua/ge/extensions/editor/sitesEditor/tags.lua:39
---@param tag string Tag name.
function editor_sitesEditor_tags:selectTag(tag) end

--- Called when the tab becomes active: rereads and sorts all the tags of the elements.
---Source: lua/ge/extensions/editor/sitesEditor/tags.lua:18
function editor_sitesEditor_tags:selected() end

--- Sets the edited sites.
---Source: lua/ge/extensions/editor/sitesEditor/tags.lua:14
---@param sites table Sites object.
function editor_sitesEditor_tags:setSites(sites) end

--- Called when the tab is left; does nothing.
---Source: lua/ge/extensions/editor/sitesEditor/tags.lua:33
function editor_sitesEditor_tags:unselect() end

