---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/dice.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Deterministic pseudo-random draw for editor tools: from a seed, a salt that distinguishes several decisions at the same address, and up to five numbers (a to e) that say "where" (volume, floor, piece index...), always returns the same value. Useful for reproducible variations (jitter) without state.
--- Access: extension `editor_toolUtilities_dice`: `extensions.load("editor_toolUtilities_dice")`, then the global `editor_toolUtilities_dice`
---@class editor_toolUtilities_dice
editor_toolUtilities_dice = {}

--- Deterministic draw in [0,1) for the address (seed, salt, a..e).
---Source: lua/ge/extensions/editor/toolUtilities/dice.lua:12
---@param seed number|nil Seed
---@param salt number|nil Salt distinguishing the decisions of a same address
---@param a number|nil Address component 1
---@param b number|nil Address component 2
---@param c number|nil Address component 3
---@param d number|nil Address component 4
---@param e number|nil Address component 5
---@return number  Value in [0,1).
function editor_toolUtilities_dice.roll(seed, salt, a, b, c, d, e) end

--- Same draw as roll, brought to the interval -1..1 (deviation in either direction, handy for jitter).
---Source: lua/ge/extensions/editor/toolUtilities/dice.lua:24
---@param seed number|nil Seed
---@param salt number|nil Salt
---@param a number|nil Address component 1
---@param b number|nil Address component 2
---@param c number|nil Address component 3
---@param d number|nil Address component 4
---@param e number|nil Address component 5
---@return number  Value in [-1,1).
function editor_toolUtilities_dice.spread(seed, salt, a, b, c, d, e) end

