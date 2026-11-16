---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/util/normalizer.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Small text normalization utility for rally notes: successively applies a list of replacements (pattern, replacement) to a string.
--- Access: extension `gameplay_rally_util_normalizer`: `extensions.load("gameplay_rally_util_normalizer")`, then the global `gameplay_rally_util_normalizer`
---@class gameplay_rally_util_normalizer
gameplay_rally_util_normalizer = {}

--- Applies in order each {from, to} pair of word_map to the note via gsub and returns the transformed note. If note is nil, returns it as is.
---Source: lua/ge/extensions/gameplay/rally/util/normalizer.lua:7
---@param word_map table<integer, string[]> List of {pattern, replacement} pairs.
---@param note string|nil Text to normalize.
---@return string|nil  Text after replacements, or nil if note was nil.
function gameplay_rally_util_normalizer.replaceWords(word_map, note) end

