---@meta
-- tim19Atlas stub generated from lua/common/libs/lua-luaepnf/epnf.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : globale `epnf`
---@class epnf
epnf = {}

--- setup an environment where you can easily define lpeg grammars
---  with lots of syntax sugar
---Source : lua/common/libs/lua-luaepnf/epnf.lua:108
---@param func any
---@param g any
---@param e any
function epnf.define(func, g, e) end

--- write a string representation of the given ast to stderr for
---  debugging
---Source : lua/common/libs/lua-luaepnf/epnf.lua:208
---@param node any
function epnf.dumpast(node) end

--- apply a given grammar to a string and return the ast. also allows
---  to set the name of the string for error messages
---Source : lua/common/libs/lua-luaepnf/epnf.lua:158
---@param g any
---@param name any
---@param input any
---@param ... any
function epnf.parse(g, name, input, ...) end

--- apply a given grammar to the contents of a file and return the ast
---Source : lua/common/libs/lua-luaepnf/epnf.lua:164
---@param g any
---@param fname any
---@param ... any
function epnf.parsefile(g, fname, ...) end

--- apply a given grammar to a string and return the ast. automatically
---  picks a sensible name for error messages
---Source : lua/common/libs/lua-luaepnf/epnf.lua:174
---@param g any
---@param str any
---@param ... any
function epnf.parsestring(g, str, ...) end

--- raise an error during semantic validation of the ast
---Source : lua/common/libs/lua-luaepnf/epnf.lua:51
---@param n any
---@param msg any
---@param s any
---@param p any
function epnf.raise(n, msg, s, p) end

--- Classe locale `env_index` de lua/common/libs/lua-luaepnf/epnf.lua
---@class epnf_env_index
local epnf_env_index = {}

---Source : lua/common/libs/lua-luaepnf/epnf.lua:91
---@param msg any
function epnf_env_index.E(msg) end

---Source : lua/common/libs/lua-luaepnf/epnf.lua:94
---@param msg any
function epnf_env_index.EOF(msg) end

---Source : lua/common/libs/lua-luaepnf/epnf.lua:100
---@param s any
function epnf_env_index.W(s) end

