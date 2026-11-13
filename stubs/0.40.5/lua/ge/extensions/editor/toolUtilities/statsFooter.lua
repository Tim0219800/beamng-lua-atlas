---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/statsFooter.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_toolUtilities_statsFooter` : `extensions.load("editor_toolUtilities_statsFooter")`, puis la globale `editor_toolUtilities_statsFooter`
---@class editor_toolUtilities_statsFooter
editor_toolUtilities_statsFooter = {}

--- One "Label N" stat: dull label, tinted number, dull bar in front of it. `lead` starts a fresh row, so no bar.
---Source : lua/ge/extensions/editor/toolUtilities/statsFooter.lua:16
---@param label any
---@param val any
---@param col any
---@param lead any
---@param tip any
function editor_toolUtilities_statsFooter.item(label, val, col, lead, tip) end

--- Drawn tris, range and drawing count for `instances` (triLive entries), with `unique` added in whole as it has no LODs.
--- `fresh` says the list changed since last time, so it may hold a shape never measured.
---Source : lua/ge/extensions/editor/toolUtilities/statsFooter.lua:26
---@param instances any
---@param unique any
---@param fresh any
function editor_toolUtilities_statsFooter.liveRow(instances, unique, fresh) end

