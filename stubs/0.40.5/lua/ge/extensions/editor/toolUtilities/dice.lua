---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/dice.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_toolUtilities_dice` : `extensions.load("editor_toolUtilities_dice")`, puis la globale `editor_toolUtilities_dice`
---@class editor_toolUtilities_dice
editor_toolUtilities_dice = {}

--- A draw in [0,1). Absent address slots count as zero, so a caller with two of them need not pass five.
---Source : lua/ge/extensions/editor/toolUtilities/dice.lua:12
---@param seed any
---@param salt any
---@param a any
---@param b any
---@param c any
---@param d any
---@param e any
function editor_toolUtilities_dice.roll(seed, salt, a, b, c, d, e) end

--- The same draw, mapped to -1 .. 1. What a jitter wants: how far out of place a thing was left, either way.
---Source : lua/ge/extensions/editor/toolUtilities/dice.lua:24
---@param seed any
---@param salt any
---@param a any
---@param b any
---@param c any
---@param d any
---@param e any
function editor_toolUtilities_dice.spread(seed, salt, a, b, c, d, e) end

