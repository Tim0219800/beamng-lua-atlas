---@meta
-- tim19Atlas stub generated from lua/common/libs/lua-luaepnf/epnf.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- lua-luaepnf: third-party library (Gerhard Lipp) that makes it easy to define LPeg grammars in an EBNF-like syntax, with an automatic syntax tree (AST) and parsing error messages. Here it relies on LuLPeg (libs/LuLPeg/lulpeg), a pure-Lua reimplementation of LPeg. Limited role for a modder: parsing a custom language or text format.
--- Access: global `epnf`
---@class epnf
epnf = {}

--- Prepares an environment where grammar rules are defined by simple assignment (name = pattern) with LPeg shortcuts (uppercase) and the helpers START, SUPPRESS, E, EOF, ID, W, WS. Each rule produces an AST node {id=name, pos=position, ...}.
---Source: lua/common/libs/lua-luaepnf/epnf.lua:108
---@param func function Definition function; receives the environment as argument (and its environment is replaced under Lua 5.1).
---@param g table|nil Existing grammar table to complete.
---@param e table|nil Fallback environment for unknown names (default: func's environment, or _G).
---@return table  Grammar usable with parse/parsestring/parsefile.
function epnf.define(func, g, e) end

--- Writes an indented representation of the AST to stderr (debugging).
---Source: lua/common/libs/lua-luaepnf/epnf.lua:208
---@param node table Root node.
function epnf.dumpast(node) end

--- Applies a grammar to a string and returns the AST.
---Source: lua/common/libs/lua-luaepnf/epnf.lua:158
---@param g table Grammar.
---@param name string Input name for error messages.
---@param input string Text to parse.
---@param ... any Extra arguments passed to the matching.
---@return table|nil  AST.
---@return string  name.
---@return string  input.
function epnf.parse(g, name, input, ...) end

--- Reads a whole file then applies the grammar. Raises an error if the file cannot be opened.
---Source: lua/common/libs/lua-luaepnf/epnf.lua:164
---@param g table Grammar.
---@param fname string File path.
---@param ... any Extra arguments.
---@return table|nil  AST.
---@return string  Name (the path).
---@return string  Content.
function epnf.parsefile(g, fname, ...) end

--- Like parse, with an input name generated from the first 20 characters of the text.
---Source: lua/common/libs/lua-luaepnf/epnf.lua:174
---@param g table Grammar.
---@param str string Text.
---@param ... any Extra arguments.
---@return table|nil  AST.
---@return string  Generated name.
---@return string  Text.
function epnf.parsestring(g, str, ...) end

--- Reports a semantic validation error of the AST: prints 'name:line: message', the faulty line and a marker under the position (assert p <= #s).
---Source: lua/common/libs/lua-luaepnf/epnf.lua:51
---@param n string Input name.
---@param msg string Message.
---@param s string Parsed text.
---@param p integer Position in the text.
function epnf.raise(n, msg, s, p) end

--- Table of helpers visible in the function passed to define (with START and SUPPRESS in addition).
---@class epnf_env_index
local epnf_env_index = {}

--- LPeg pattern that reports a parsing error with the given message.
---Source: lua/common/libs/lua-luaepnf/epnf.lua:91
---@param msg string Error message.
function epnf_env_index.E(msg) end

--- LPeg pattern: end of input, otherwise error with the given message.
---Source: lua/common/libs/lua-luaepnf/epnf.lua:94
---@param msg string Error message.
function epnf_env_index.EOF(msg) end

--- LPeg pattern: keyword s, not followed by a letter, digit or _ .
---Source: lua/common/libs/lua-luaepnf/epnf.lua:100
---@param s string Keyword.
function epnf_env_index.W(s) end

