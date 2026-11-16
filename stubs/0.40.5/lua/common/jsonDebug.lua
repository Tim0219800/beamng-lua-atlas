---@meta
-- tim19Atlas stub generated from lua/common/jsonDebug.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Variant of ljson (pure-Lua SJSON parser) that, in addition to decoding, returns a list of warnings, notably duplicate keys with line number. Used to validate data files (jbeam, config) during development; an extension can pass a context name to label these warnings.
--- Access: `require("jsonDebug")`
---@class jsonDebug
local jsonDebug = {}

--- Decodes SJSON and returns the value with the list of warnings (duplicate keys).
---Source: lua/common/jsonDebug.lua:250
---@param si string|nil SJSON text
---@param context string|nil label (e.g. file name) prefixed to the warnings
---@return table|nil  decoded value
---@return string[]  warnings
function jsonDebug.decode(si, context) end

return jsonDebug
