---@meta
-- tim19Atlas stub generated from lua/common/jsonPrettyEncoderCustom.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Customizable 'pretty' JSON encoder: sorts keys by weight (tableWeights), and lets a callback decide which tables are folded onto a single line and which are indented. Used to write readable configuration files (e.g. controls/bindings files).
--- Access: `require("jsonPrettyEncoderCustom")`
---@class jsonPrettyEncoderCustom
local jsonPrettyEncoderCustom = {}

--- Encodes v to JSON text with keys sorted by weight and folding driven by foldingCallback. The last three arguments are optional; _levelPath is internal (recursion).
---Source: lua/common/jsonPrettyEncoderCustom.lua:76
---@param v any value to encode (nil -> 'null')
---@param lvl integer|nil starting indentation level, default 1
---@param numberPrecision integer|nil number of decimals for non-integers; nil = %.10g
---@param tableWeights table<string, number>|nil key sort weights (lowercase), default 50; a nil value causes an error in the sort because weights is indexed (provide at least {})
---@param foldingCallback fun(item: table, lvl: integer, path: string): boolean|nil returns true to fold the table onto one line, false to indent it
---@param _levelPath string|nil internal: current path
---@return string  JSON text
function jsonPrettyEncoderCustom.encode(v, lvl, numberPrecision, tableWeights, foldingCallback, _levelPath) end

return jsonPrettyEncoderCustom
