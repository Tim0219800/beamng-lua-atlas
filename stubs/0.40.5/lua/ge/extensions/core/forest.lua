---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/forest.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- GE extension `core_forest`: provides cached access to the scene's `Forest` object (the level's instanced forest/vegetation). A modder uses it to get this object without searching the scene again.
--- Access: extension `core_forest`: `extensions.load("core_forest")`, then the global `core_forest`
---@class core_forest
core_forest = {}

--- Returns the scene's Forest object (first of class 'Forest'), with its id cached.
---Source: lua/ge/extensions/core/forest.lua:9
---@return userdata|nil  Forest object, nil if there is none in the level.
function core_forest.getForestObject() end

