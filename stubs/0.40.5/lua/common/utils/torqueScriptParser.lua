---@meta
-- tim19Atlas stub generated from lua/common/utils/torqueScriptParser.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Proof of concept of a parser (PEG parser, via libs/lua-luaepnf/epnf) for TorqueScript files: 'new/singleton/datablock' declarations, properties, functions (body ignored). The file itself states 'not completely functional, far from ready'. Loaded with require('utils/torqueScriptParser').
--- Access: `require("utils/torqueScriptParser")`
---@class utils_torqueScriptParser
local utils_torqueScriptParser = {}

--- Parses TorqueScript text with the internal grammar (epnf.parsestring) in a pcall.
---Source: lua/common/utils/torqueScriptParser.lua:95
---@param s string TorqueScript text
---@return boolean  true if parsing succeeded
---@return table|string  Syntax tree on success, error message otherwise
function utils_torqueScriptParser.parse(s) end

return utils_torqueScriptParser
